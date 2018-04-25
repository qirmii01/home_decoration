<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=basePath%>plugins/layui/css/layui.css" rel="stylesheet">
<link href="<%=basePath%>css/admin.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=basePath%>js/jquery.upload.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/layui/layui.js"></script>
<style type="text/css">
	.line{margin:0 auto;width:980px;margin-bottom:10px;}
	.line:first-child{margin-top:20px;}
	#acti-title{margin-left:10px;}
</style>
</head>
<body>
	<div class="admin-box">
		<div class="content">
			<div class="line">
				<label>
					<span>标题</span><input type="text" id="acti-title" class="search_txt">
				</label>
			</div>
			<div class="line">	
				<div class="expe-cont">
					<textarea id="cont-area" style="display:none;"></textarea>
				</div>
			</div>
			<div class="btns">
				<div class="line">
					<input type="button" id="submit" value="提&nbsp;&nbsp;&nbsp;交">
				</div>
			</div>
		</div>
	</div>
	
	<script>
		layui.use('layedit', function(){
			var layedit = layui.layedit;
			var index =layedit.build('cont-area',{
			 tool:['strong', 'italic', 'underline', 'del', 'left', 'center', 'image'],
			 uploadImage:{url:'uploadImage'}
			}); //建立编辑器
			
			$('#submit').click(function(){
				var title = $('#acti-title').val();
				var content=layedit.getContent(index);
				if(title.trim() == ''){
					layer.msg("标题不能为空");
					return ;
				}
				if(content.trim() == ''){
					layer.msg("内容不能为空");
					return;
				}
				var activities={};
				activities.title =title;
				activities.content = content;
				$.ajax({
					url:"<%=basePath%>admin/addPreferentialActivities",
					data:activities,
					method:"POST",
					success:function(r){
						if(r.code =='0'){
							layer.msg(r.data,{time:1500},function(){
								location.reload();
							});
							
						}else{
							layer.msg(r.msg);
						}
					},
					error:function(err){
						console.log(err);
					}
				});
			});
		});
		
		
	</script>
</body>
</html>