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
        url: options.url,
        // 文件域名字
        fileName: 'uploadFile',
        // 其他表单数据
        // 上传完成后, 返回json, text
        dataType: 'json',
        // 上传之前回调,return true表示可继续上传

        // 上传之后回调
        onComplate: function(data) {
        	var url,id;
        	if(data.code == '0'){
        		console.log("上传成功");
        		url = data.data.path;
        		id = data.data.id;
        		if(options.show){
        			$(options.target).attr("src",data.data.path);
        		}
        		$(options.target).attr("data-url",data.data.path);
        		$(options.target).attr("data-id",data.data.id);
        	}else{
        		layer.msg(data.msg);
        	}
        	if(callback){
        		callback(url,id);
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

//毫秒时间按格式转化
function millisDateFormat(millis,format){
	if(!(typeof millis) == 'number' || !format){
		return;
	}
	var d = new Date(millis);
	if(!d) return;
	
	var year = d.getFullYear();
	var month = d.getMonth()+1;
	var date = d.getDate();
	var hour = d.getHours();
	var minutes = d.getMinutes();
	var seconds = d.getSeconds();
	
	format = format.trim();
	if(/-/.test(format)){
		if(format.length > 11){
			return year+"-"+month+"-"+date+" "+hour+":"+minutes+":"+seconds;
		}else{
			return year+"-"+month+"-"+date;
		}
	}else if(/年/.test(format)){
		if(format.length > 11){
			return year+"年"+month+"月"+date+"日"+hour+"点"+minutes+"分"+seconds+"秒";
		}else{
			return year+"年"+month+"月"+date+"日";
		}
	}else if(/\//.test(format)){
		if(format.length > 11){
			return year+"/"+month+"/"+date+" "+hour+"/"+minutes+"/"+seconds;
		}else{
			return year+"/"+month+"/"+date;
		}
	}
}

MyUtil.docUpload = function(options,callback){
	var html;
	var boxId = new Date().getTime();
	html='<div class="upload-box" id="'+boxId+'">'
		+'<div class="add-doc layui-form-item"><div style="text-align:center;">'
		+'<button type="button" class="layui-btn upload">上传文件</button><button type="button" class="layui-btn submit">提交</button>'
		+'</div></div><div class="doc-menu"><ul class="docList"></ul></div></div>';
	
	layer.open({
		title:"<center>添加文件</center>",
		area:'888px',
		type:1,
		maxHeight:"500px",
		content:html,
		success:function(){
			$('#'+boxId+' .add-doc button.upload').click(function(){
				if($("#"+boxId+" .docList li").length ==0 || $("#"+boxId+" .docList li:last-child .doc-url").attr("href")){
					var newline = '<li class="layui-form-item"><label class="layui-form-label">文件名：</label><div class="layui-input-block">'
						+'<input type="text" name="title" required="" lay-verify="required" placeholder="请输入文件名" autocomplete="off" class="layui-input title-items">'
						+'<p>文件地址:<a class="doc-url" target="_blank"><a></p></div></li>';
					$('#'+boxId+' .docList').append(newline);
				}        
				
				MyUtil.upload({
					url:options.uploadUrl,
					target:"#"+boxId+" .docList li:last-child input.title-items"
				},function(url,id){
					$("#"+boxId+" .docList li:last-child .doc-url").attr("href",options.filePath+url);
					$("#"+boxId+" .docList li:last-child .doc-url").text(options.filePath+url);
					$("#"+boxId+" .docList li:last-child .doc-url").attr("title",options.filePath+url);
				});
			});
			
			if(callback){
				callback($("#"+boxId));
			}
		},
		cancel:function(index){
			layer.closeAll();
		}
	});
}