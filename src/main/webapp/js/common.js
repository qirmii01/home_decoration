$(function () {
    $('#header_select').hover(function () {
        $(this).children('ul').show();
        $('#header_select ul li').on('click', function () {
            var tips = $(this).children('a').data('tips');
            var type = $(this).children('a').data('type');
            var val = $(this).children('a').text();
            $(this).parents('ul').hide();
            $('#header_select').siblings('.input').attr('placeholder', tips).focus();
            $(this).parents('#header_select').children('.h_select_a').find('span').text(val);
            $('[name="type"]').val(type);
        })
    }, function () {
        $(this).children('ul').hide();
    });

    /****** 菜单 *****/
    $('[name="item"]').hover(function () {
        $(this).addClass('on').find('.nav-dropdown').show();
    }, function () {
        $(this).removeClass('on').find('.nav-dropdown').hide();
    });
});


function gt(objID) {
    return document.getElementById(objID);
}
function set_tag(obj, num, no) {
    if (!no)no = 3;
    var endi = 1 + no;
    for (i = 1; i < endi; i++) {
        if (i == num) {
            gt(obj + '_' + i).className = 'on';
            gt(obj + '_content_' + i).style.display = 'block';
        } else {
            gt(obj + '_' + i).className = '';
            gt(obj + '_content_' + i).style.display = 'none';
        }
    }
}
function set_tabs(obj, num, no) {
    if (!no)no = 4;
    var endi = 1 + no;
    for (i = 1; i < endi; i++) {
        if (i == num) {
            gt(obj + '_' + i).className = 'tab';
            gt(obj + '_content_' + i).style.display = 'block';
        } else {
            gt(obj + '_' + i).className = '';
            gt(obj + '_content_' + i).style.display = 'none';
        }
    }
}
function set_tags(obj, num, no) {
    if (!no)no = 3;
    var endi = 1 + no;
    for (i = 1; i < endi; i++) {
        if (i == num) {
            gt(obj + '_' + i).className = 'cur';
            gt(obj + '_content_' + i).style.display = 'block';
        } else {
            gt(obj + '_' + i).className = '';
            gt(obj + '_content_' + i).style.display = 'none';
        }
    }
}
function set_tab(thisObj, Num,className) {
    if (thisObj.className == className)return;
    var tabObj = thisObj.parentNode.id;
    var tabList = document.getElementById(tabObj).getElementsByTagName("a");
    for (i = 0; i < tabList.length; i++) {
        if (i == Num) {
            thisObj.className = className;
            document.getElementById(tabObj + "_c" + i).style.display = "block";
        } else {
            tabList[i].className = "";
            document.getElementById(tabObj + "_c" + i).style.display = "none";
        }
    }
}

function set_zcb(obj, num, no) {
    if (!no)no = 7;
    var endi = 1 + no;
    for (i = 1; i < endi; i++) {
        if (i == num) {
            gt(obj + '_' + i).className = 'z_a';
            gt(obj + '_content_' + i).style.display = 'block';
        } else {
            gt(obj + '_' + i).className = '';
            gt(obj + '_content_' + i).style.display = 'none';
        }
    }
}




$(function(){
	    changeTab('.tabbox599_1');
		changeTab('.tabbox599_2');
		changeTab('.tabbox599_3');
		changeTab('.tabbox599_4');
		changeTab('.tabbox599_5');
		changeTab('.tabbox599_6');
		changeTab('.tabbox1');
		changeTab('.tabbox2');
		changeTab('.tabbox3');
		changeTab('.tabbox4');
});
	
function changeTab (id) {
	var $li = $(id).find('.z_tab14 li');
	var cont = $(id).find('.custom');
	$li.off().on('mouseover', function(){
		var idx = $li.index(this);
		$li.removeClass('z_b');
		$li.eq(idx).addClass('z_b')
		cont.hide();
		cont.eq(idx).show()
	});
	
}

var MyUtil={};
MyUtil.upload = function (options,callback){
    // 上传方法
	$.upload({
        // 上传地址
        url: 'upload',
        // 文件域名字
        fileName: 'uploadFile',
        // 其他表单数据
        // 上传完成后, 返回json, text
        dataType: 'json',
        // 上传之前回调,return true表示可继续上传

        // 上传之后回调
        onComplate: function(data) {
        	var url;
        	if(data.code == '0'){
        		console.log("上传成功");
        		url = data.body.path;
        		if(options.show){
        			$(options.target).attr("src",data.body.path);
        		}
        		$(options.target).attr("data-url",data.body.path);
        		$(options.target).attr("data-id",data.body.id);
        	}else{
        		layer.msg(data.msg);
        	}
        	if(callback){
        		callback(url);
        	}
        }
    });
}

function setCookie(c_name,value,expiredays)
{
	var exdate=new Date();
	exdate.setDate(exdate.getDate()+expiredays);
	document.cookie=c_name+ "=" +escape(value)+
	((expiredays==null) ? "" : ";expires="+exdate.toGMTString());
}

function getCookie(c_name)
{
	if (document.cookie.length>0)
	{
		c_start=document.cookie.indexOf(c_name + "=");
		if (c_start!=-1)
		{ 
			c_start=c_start + c_name.length+1 ;
			c_end=document.cookie.indexOf(";",c_start);
			if (c_end==-1){
				c_end=document.cookie.length;
			}
			
			return unescape(document.cookie.substring(c_start,c_end));
		} 
	}
	return ""
}

function removeCookie(c_name)
{
	if (document.cookie.length>0)
	{
		c_start=document.cookie.indexOf(c_name + "=")
		if (c_start!=-1)
		{ 
			c_start=c_start + c_name.length+1 
			c_end=document.cookie.indexOf(";",c_start)
		if (c_end==-1) c_end=document.cookie.length
			return unescape(document.cookie.substring(c_start,c_end))
		} 
	}
	return ""
}