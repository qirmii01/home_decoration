<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String filePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
%>
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>用户注册</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <link href="<%=basePath%>css/reg/global.css" rel="stylesheet">
    <link href="<%=basePath%>css/reg/index.css" rel="stylesheet">
    <link href="<%=basePath%>css/reg/style.1.4.8.css" rel="stylesheet">
    <link href="<%=basePath%>css/reg/validform.css" rel="stylesheet">
    <style type="text/css">
    	#verifyImg{display: block;position: absolute;right: 21px;top: 4px;}
    </style>
<body>
<!--头部 start-->
<header class="reg-header">
    <div class="w1">
        <div class="header-logo fl"><a href="<%=basePath%>"><img src="<%=basePath%>images/reg_logo.png"></a><em>欢迎成为透明家装用户</em></div>
        <div class="header-item fr">已有账号？<a href="<%=basePath%>/user?login=1" target="_blank">请登录&gt;</a></div>
    </div>
</header>
<!--头部 end-->

<div class="reg-nav">
    <div class="reg-bg01"><img src="<%=basePath%>images/reg_bg.jpg"></div>
    <div class="w1">
        <div class="reg-nav-con">
            <div class="reg-nav-l">
                <form method="post" class="reg_form" id="regForm" action="register">
                    <div>
                        <label>用户名</label>
                        <input type="text" id="username" name="telphone" datatype="uname" onkeyup="value=value.replace(/[^\d]/g,&#39;&#39;);" maxlength="11" sucmsg="" errormsg="请输入正确手机号" placeholder="请输入常用手机号">
                    	<span class="Validform_checktip"></span>
                    </div>
                    <div>
                        <label>设置密码</label>
                        <input type="password" name="password" datatype="*6-20" sucmsg=" " nullmsg="请输入密码" errormsg="密码最少6个字符，最多20个字符！" placeholder="请输入6-20字符的密码">
                    	<span class="Validform_checktip"></span>
                    </div>
                    <div>
                        <label>确认密码</label>
                        <input type="password" name="repeat" datatype="*6-20" sucmsg=" " nullmsg="请输入确认密码"  placeholder="请输入6-20字符的密码">
                        <span class="Validform_checktip"></span>
                    </div>
                    <div style="position:relative;">
                        <label>验证码</label>
                        <input type="text" id="verify_code" name="code" class="passw" value="" maxlength="6" placeholder="请输入验证码" nullmsg="请填写校验码" errormsg="请填写6位校验码">
                        <img src="<%=basePath%>/user/getVerificationCode" id="verifyImg" style="cursor:pointer;" title="点击刷新"/>
                        <span class="Validform_checktip"></span>
                    </div>
                    <div>
                    	<input type="hidden" name="role" value="1">
                        <button type="button" id="subBtn" class="reg-submit" tabindex="10">立即注册成为透明家装用户</button>
                    </div>
                    <input type="hidden" name="type" value="0">
                	<div class="geetest_form">
                		<input type="hidden" name="geetest_challenge">
                		<input type="hidden" name="geetest_validate">
                		<input type="hidden" name="geetest_seccode">
                	</div>
               	</form>
            </div>
        </div>
    </div>
</div>

<div class="footer">
    <div class="box">
        <div class="icon">
            <div class="list">
                <a href="javascript:void(0);" rel="nofollow"><i class="icon1"></i>免费量房<em></em></a>
                <a href="javascript:void(0);" rel="nofollow"><i class="icon2"></i>免费设计<em></em></a>
                <a href="javascript:void(0);" rel="nofollow"><i class="icon3"></i>免费报价<em></em></a>
                <a href="javascript:void(0);" rel="nofollow"><i class="icon4"></i>先行赔付<em></em></a>
                <a href="javascript:void(0);"><i class="icon5"></i>业主监督<em></em></a>
                <a href="javascript:void(0);" rel="nofollow"><i class="icon6"></i>装修保障</a>
            </div>
        </div>
        <div class="copyright">
            <ul>
                <li>免责声明：本网站部分内容由用户自行上传，如权利人发现存在误传其作品情形，请及时与本站联系</li>
                <li>透明家装 保留所有权利 ©2005- 2017 jiazhuang.com</li>
                <li>透明家装 <a href="javascript:<%=basePath%>;">闽ICP备1234567号-1</a></li>
            </ul>
        </div>
    </div>
</div>
<!-- end footer -->
<script type="text/javascript" src="<%=basePath%>js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/register.js"></script>
<script type="text/javascript" src="<%=basePath%>js/Validform_v5.3.2.js"></script>
<script type="text/javascript" src="<%=basePath%>js/gt.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/layui/lay/modules/layer.js"></script>
<script type="text/javascript">
    $('#verifyImg').on('click', function() {
        $(this).attr("src",'getVerificationCode?abc='+Math.random());
    });

    $('#username').blur(function(){
    	$.ajax({
    		url:"userExist",
    		data:{"telphone":$('#username').val()},
			success:function(data){
				if(data.code == '0'){
					if(data.data+"" == 'false'){
						$("#username").next().addClass("Validform_right").removeClass("Validform_wrong").text("");
					}else if(data.data+"" == 'true'){
						$("#username").next().addClass("Validform_wrong").removeClass("Validform_right").text("该账号已注册");
					}
				}
			},
			error:function(err){
				console.log(err);
			}
    	});
    	
    });
    
    $('input[name="repeat"]').blur(function(){
    	if(!/^\s*$/.test($(this).val()) && $(this).val() != $('input[name="password"]').val()){
    		$(this).next().addClass("Validform_wrong").removeClass("Validform_right").text("两次密码输入不一致");
    	}
    });
    
    $('#verify_code').blur(function(){
    	var img =$(this).next();
    	var validform = $(this).next().next();
    	$.ajax({
    		url:"verifyMatch",
    		data:{code:$(this).val()},
    		success:function(data){
    			if(data.code == '1'){
    				validform.addClass("Validform_wrong").removeClass("Validform_right").text("验证码错误");
    				img.click();
    			}else{
    				validform.addClass("Validform_right").removeClass("Validform_wrong").text("");
    			}
    		}
    		
    	})
    });
    
    $(function(){
        $("#regForm").Validform({
            btnSubmit:'#subBtn',
            tiptype:3,
            postonce:true,
            ajaxPost:true,
            datatype:{
                "uname":/^13[0-9]{9}$|14[57][0-9]{8}$|166[0-9]{8}$|15[0-9]{9}$|17[0-9]{9}$|18[0-9]{9}$/
            },
            beforeSubmit:function(curform){
            	console.log(curform)
            },
            callback: function (data) {
            	console.log(data)
                $.Hidemsg();
                if (data.code == '0') {
                    layer.confirm("注册成功，是否去完善个人信息？",{btn:["是，完善个人信息","否，进入网站主页"]},function(index){
                    	layer.close(index);
                    	location.href="<%=basePath%>user/personalCenter/"+data.data.id;
                    },function(index){
                    	location.href="<%=basePath%>user";
                    	layer.close(index);
                    });
                } else {
                    layer.alert(data.msg,{time:1500});
                }
            }
        });
    });
</script>