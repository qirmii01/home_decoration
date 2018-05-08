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
            <input type="number" id="area">
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
	    		$('.show ul').append('<li class="atts"><a target="_blank"></a></li>')
    		}
	    	MyUtil.upload({"url":"<%=basePath%>/admin/upload","target":'.show li:last'},function(url){
	    		var id= $('.show li:last').attr("data-id");
	    		var url = $('.show li:last').attr("data-url");
	    		
	    		if(id){
	    			$('.show li:last>a').text("文件id："+id);
	    			$('.show li:last>a').attr("href","${filePath}"+url);
	    		}
	    	})
    	});
    	
    	$('#sumbit').click(function(){
    		var load = layer.load();
    		var budget = $('.budget').val();
    		var type = $('.type').val();
    		var area = $('#area').val();
    		if(area == ''){
    			layer.close(load);
    			layer.msg("装修面积不能为空")
    			return ;
    		}

    		var applyId = '${applyId}';
    		if(!applyId){
	    		//新增
	   			$.ajax({
	   				url:"<%=basePath%>decoration/addDecorationApply",
	   				data:{"status":"0","budgetAmount":budget,"type":type,"area":area},
	   				success:function(data){
	   					if(data.code != '0'){
		   					layer.close(load);
	   						layer.msg(data.msg);
	   					}else{
	   						var applyId = data.data;
	   						var attachments=[];
	   						$('.show ul li').each(function(index){
	   							var attachment={};
	   							attachment.sourceId = $(this).attr("data-id");
	   			    			attachment.applyId = applyId;
	   			    			attachment.attachmentName='申请附件'+index;
	   			    			attachment.type = '0';
								attachments.push(attachment);
	   						});
	   			    			
			    			$.ajax({
			    				url:"<%=basePath%>decoration/addAttachment",
			    				data:{applyAttachments:JSON.stringify(attachments)},
			    				success:function(data){
			    					layer.close(load);
			    					if(data.code != '0'){
			    						var result = data.data;
										var re="";
										for(var i=0 ; i<result.length; i++){
											re +=result[i]+";";
										}
										layer.alert(re);
			    					}else{
			    						layer.msg("申请完成",{time:1600},function(){
			   								parent.location.reload();
			   							})
			    					}
			    				},
			    				error:function(err){
			    					console.log(err);
			    					layer.msg("系统错误");
			    				}
			    			});
	   					}
	   				},
	   				error:function(err){
	   					layer.close(load);
	   					layer.msg("系统错误");
	   				}
	   			});
	    	}else{
	    		//更新
	    		$.ajax({
	   				url:"<%=basePath%>decoration/updateDecorationApply",
	   				data:{"id": applyId,"budgetAmount":budget,"type":type,"area":area},
	   				success:function(data){
	   					if(data.code != '0'){
		   					layer.close(load);
	   						layer.msg(data.msg);
	   					}
	   					
	   					var attachments=[];
	   					$('.show ul li').each(function(index){
	   						if($(this).children().length = 1){
	   							var attachment={};
	   							attachment.sourceId = $(this).attr("data-id");
	   			    			attachment.applyId = applyId;
	   			    			attachment.attachmentName='修改添加申请附件';
	   			    			attachment.type = '0';
	   						attachments.push(attachment);
	   						}
	   					});
	   		    		
	   					if(attachments.length >0){
	   		    			$.ajax({
	   		    				url:"<%=basePath%>decoration/addAttachment",
	   		    				data:{applyAttachments:JSON.stringify(attachments)},
	   		    				success:function(data){
	   		    					layer.close(load);
	   		    					if(data.code != '0'){
	   		    						var result = data.data;
	   									var re="";
	   									for(var i=0 ; i<result.length; i++){
	   										re +=result[i]+";";
	   									}
	   									layer.alert(re);
	   		    					}else{
	   		    						layer.msg("申请完成",{time:1600},function(){
	   		   								parent.location.reload();
	   		   							})
	   		    					}
	   		    				},
	   		    				error:function(err){
	   		    					layer.close(load);
	   		    					layer.msg("系统错误");
	   		    				}
	   		    			});
	   					}
	   				},
	   				error:function(err){
	   					layer.close(load);
	   					layer.msg("系统错误");
	   				}
	   			});
	    	}
    	});
    	
		$('#cancel').click(function(){
    		parent.location.reload();
    	});
		$(function(){
			var applyId = '${applyId}';
			if(applyId){
				$.ajax({
					url:"${basePath}decoration/userDecorationApply",
					data:{id:applyId,status:'0'},
					success:function(data){
						if(data.code != '0'){
							layer.msg(data.msg);
						}else{
							var re = data.data;
							$('.budget').val(re.budgetAmount);
							$('.type').val(re.type);
							$('#area').val(re.area);
							if(re.applyAttachments.length > 0){
								attachment = re.applyAttachments;
								for(var i=0; i<attachment.length; i++){
									var html = '<li class="atts" data-url="'+attachment[i].sourcePath+'" data-id="'+attachment[i].sourceId
									+'"><a target="_blank" href="${basePath}'+attachment[i].sourcePath+'">文件id：'+attachment[i].sourceId+'</a><a href="javascript:void(0);" class="del" data-id="'+attachment[i].id+'">删除</a></li>';
									$('.show ul').append(html);
								}
								
								$('.del').click(function(){
									var load = layer.load();
									var id = $(this).attr("data-id");
									$(this).parent().remove();
									$.ajax({
										url:"${basePath}decoration/delAttachment?id="+id,
										success:function(data){
											layer.close(load);
											if(data.code != '0'){
												layer.msg(data.msg);
											}else{
												layer.msg("删除成功");
											}
										},
										error:function(err){
											layer.close(load);
											layer.msg("系统异常");
										}
									});
								});
							}
						}
					},
					error:function(err){
						layer.msg("系统异常");
					}
					
				});
			}
		});
    </script>
</body>
</html>