/*//验证码刷新
 function fresh_verify(e) {    $("#" + e).attr("src", "/Public/verify/" + Math.random());    $("#" + e).show();    if (arguments[1] != undefined) {        var obj = arguments[1];        $(obj).removeAttr("onclick");    }}*/

var times = 300;
//倒计时
function send_time(obj) {
    times = times - 1;
    if (times > 0) {
        setTimeout("send_time('" + obj + "')", 1000);
        $("#" + obj).val(times + '秒后获取');
        $("#" + obj).attr('disabled', true);
    } else {
        $("#" + obj).val('重新获取');
        $("#" + obj).removeAttr('disabled');
        times = 300;
    }
}
function send_code_register(e_name_id, element) {
    var challenge = $('[name="geetest_challenge"]').val();
    var validate = $('[name="geetest_validate"]').val();
    var seccode = $('[name="geetest_seccode"]').val();
    var name = $('#' + e_name_id).val();
    if($(element).data('dismiss')==0){
        return false;
    }
    if (challenge && validate && seccode && name) {
        $.ajax({
            type: "POST",
            url: "/Ajax/sendCodeRegister/",
            processData: true,
            data: "name=" + name + '&seccode=' + seccode + '&validate=' + validate + '&challenge=' + challenge,
            dataType: 'json',
            async: false,
            cache: false,
            success: function (data) {
                if (data.status) {
                    layer.alert(data.msg, {
                        title: '提示信息', time: 1500, end: function () {
                            $('#phone_code').focus();
                        }
                    });
                    send_time('send_sms');
                } else {
                    layer.alert(data.msg, {title: '提示信息', time: 1500});
                }
            }
        });
    } else {
        var moReg =/^((13|15|17|18)[0-9]{9}|14[57][0-9]{8})$/;
        if (moReg.test(name) == false) {
            layer.alert('请填写正确的手机号！', {title: '提示信息', time: 1500});
        }
        if(!challenge || !validate || !seccode){
            layer.alert('请先点击按钮进行验证！', {title: '提示信息', time: 1500});
        }

    }
}