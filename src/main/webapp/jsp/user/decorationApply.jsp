<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>装修申请</title>
<style type="text/css">
body{min-width:auto;}
.title,.content{margin-top:20px;}
.title{text-align:center;width:840px;}
.title h3{font-size:22px;}
.content{padding-left:310px;width:530px;}
.content .items{margin-bottom:10px;}
#upload{margin-left:74px;}
.btns{padding-left:74px;margin-top:16px;}
.btns input{width:65px;}
.btns input:first-child{margin-right:24px;}
.atts:hover{cursor:pointer;}
.atts{text-decoration:underline;}
</style>
</head>
<body>
    <div class="title"><h3>装修申请</h3></div>
    <div class="content">
        <div class="items">
            <span>预算金额：</span>
            <select class="budget">
                <option value="-1">面议</option>
                <option value="0">三万以下</option>
                <option value="1">3~5万</option>
                <option value="2">5~8万</option>
                <option value="3">8~10万</option>
                <option value="4">10~12万</option>
                <option value="5">12~15万</option>
                <option value="6">15~30万</option>
                <option value="7">30万以上</option>
            </select>
        </div>
        <div class="items">
            <span>装修类型：</span>
            <select class="type">
                <option value="0">面议</option>
                <option value="1">半包</option>
                <option value="2">全包</option>
            </select>
        </div>
        <div class="items">
            <span>装修面积：</span>
            <input type="text" id="area">
            <span>单位：平方米</span>
        </div>
        <div class="items">
            <input type="button" id="upload" value="点击上传附件">
            <div class="show"><ul></ul></div>
        </div>
        <div class="itmes btns">
			<input id="sumbit" type="button" value="提交">
			<input id="cancel" type="button" value="取消">        
        </div>
    </div>
    <script type="text/javascript" src="../js/jquery.upload.js"></script>
    <script type="text/javascript">
    	$('#upload').click(function(){
    		var la=$('.show li:last');
    		if(la.attr("data-id") || !la[0]){
	    		$('.show ul').append('<li class="atts"></li>')
    		}
	    	MyUtil.upload({"url":"<%=basePath%>/admin/upload","target":'.show li:last'},function(url){
	    		var id= $('.show li:last').attr("data-id");
	    		var url = $('.show li:last').attr("data-url");
	    		
	    		console.log(url)
	    		if(id){
	    			$('.show li:last').text("文件id："+id);
	    			$('.show li:last').attr("onclick","see(\""+id+"\")");
	    		}
	    	})
    	});
    	var d;
    	$(function(){
    		$.ajax({
    			url:'<%=basePath%>decoration/userDecorationApply',
    			data:{"userId":"${sessionScope.userInfo.id}","status":"0"},
    			success:function(data){
    				console.log(data)
    				if(data.code != '0'){
    					layer.msg(data.msg);
    				}else{
    					d = data.data;
    					if(d.length ==0){
    						d = null;
    						return;
    					}else if(d.length != 1){
    						layer.msg("系统错误")
    					}else{
    						d = d[0];
    					}
    					
    					if(d.budgetAmount){
    						$('.budget option[value='+d.budgetAmount+']').attr("selected","selected");
    					}
    					
    					if(d.type){
    						$('.budget option[value='+d.type+']').attr("selected","selected");
    					}
    					
    					if(d.area){
    						$('#area').val(d.area);
    					}
    					
    					if(d.applyAttachments && d.applyAttachments.length != 0){
    						var html="";
    						for(var i = 0; i<d.applyAttachments.length; i++){
    							html+='<li>'+d.applyAttachments.path+'</li>';
    						}	
    						$('.show ul').html(html);
    					}
    				}
    			},
    			error:function(err){
    				console.log(err);
    				layer.msg("系统错误");
    			}
    		});
    		
    	});
    	
    	$('#sumbit').click(function(){
    		var budget = $('.budget').val();
    		var type = $('.type').val();
    		var area = $('#area').val();
    		//新增
    		if(!d){
    			$.ajax({
    				url:"<%=basePath%>decoration/addDecorationApply",
    				data:{"status":"0","budgetAmount":budget,"type":type,"area":area},
    				success:function(data){
    					if(data.code != '0'){
    						layer.msg(data.msg);
    					}else{
    						var applyId = data.data;
    						var end= true;
    						$('.show ul li').each(function(index){
    			    			var sourceId = $(this).attr("data-id");
    			    			$.ajax({
    			    				url:"<%=basePath%>decoration/addAttachment",
    			    				data:{"applyId":applyId,"sourceId":sourceId},
    			    				success:function(data){
    			    					if(data.code != '0'){
    			    						end =false;
    			    					}			
    			    				},
    			    				error:function(err){
    			    					console.log(err);
    			    					layer.msg("系统错误");
    			    				}
    			    			});
    						});
    						if(end){
    							layer.msg("申请完成",{time:1600},function(){
    								parent.location.reload();
    							})
    						}
    					}
    				},
    				error:function(err){
    					console.log(err);
    					layer.msg("系统错误");
    				}
    			});
    		}else{
	    		if(budget != d.budget || type != d.type || area != d.area){
	    			$.ajax({
	    				url:"<%=basePath%>decoration/updateDecorationApply",
	    				data:{"status":"0","budgetAmount":budget,"type":type,"area":area,"id":d.id},
	    				success:function(data){
	    					if(data.code != '0'){
	    						layer.msg(data.msg);	
	    					}else{
	    						layer.msg("修改成功")
	    					}			
	    				},
	    				error:function(err){
	    					console.log(err);
	    					layer.msg("系统错误");
	    				}
	    			});
	    		}
    		}
    	});
    	
		$('#cancel').click(function(){
    		parent.location.reload();
    	});
		
		function see(id){
			$.get("<%=basePath%>user/seeSource",{"id":id},function(d){
				if(d.code!='0'){
					layer.msg(d.msg);
				}else{
					window.open("<%=filePath%>"+d.data.path);
				}
			});
		}
    </script>
</body>
</html>