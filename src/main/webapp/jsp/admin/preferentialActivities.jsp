<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=basePath%>css/admin.css" rel="stylesheet">
<title>Insert title here</title>
<style>
	.line{margin:0 auto;width:980px;margin-bottom:10px;}
	.line:first-child{margin-top:20px;}
</style>
</head>
<body>
	<div class="admin-box">
		<div class="content">
			<div class="line">
				<label>
					<span>标题</span><input type="text" id="activity-title" class="search_txt">
				</label>
			</div>
			<div class="line">	
				<div class="activity-cont">
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
				var title = $('#activity-title').val();
				var content=$('#expeCont').val();
				if(title.trim() == ''){
					layer.msg("标题不能为空");
					return ;
				}
				if(content.trim() == ''){
					layer.msg("内容不能为空");
					return;
				}
				var experienceList={};
				experienceList.title =title;
				experienceList.content = content;
				$.ajax({
					url:"<%=basePath%>admin/addExperience",
					data:experienceList,
					method:"POST",
					success:function(r){
						if(r.code =='0'){
							layer.msg(r.data);
							$('#activity-title').val("");
							$('#expeCont').val("");
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