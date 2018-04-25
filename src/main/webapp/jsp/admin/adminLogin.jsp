<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%= basePath%>css/admin.css">
<title>管理员登录</title>
</head>
<body>
	<div id="admin">
		<div class="admin-box">
			<div class="po">
				<div class="fl">
					<span><input type="text" name="userName" id="userName"/></span>
					<span><input type="password" name="password" id="password"/></span>
				</div>
				<div class="fl">
					<input type="button" id="submit">
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$('#submit').click(function(){
		var userName = $('#userName').val().trim();
		var password = $('#password').val().trim();
		if('' == userName){
			layer.msg("请输入用户名")
			$('#userName').focus();
			return;
		}
		if( '' == password){
			layer.msg("请输入密码")
			$('#password').focus();
			return;			
		}
		$.ajax({
			url:"<%=basePath%>admin/login",
			method:"POST",
			data:{"userName":userName,"password":password},
			success:function(data){
				layer.msg(data.msg,{time:1500},function(){
					if(data.code == '0'){
						location.href="<%=basePath%>admin/menuList";
					}
				});
			}
		});
	});
</script>
</html>