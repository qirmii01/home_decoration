<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=basePath%>css/admin.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<div class="admin-box">
		<div class="title"><h2>优惠活动</h2></div>
		<div class="content">
			<div class="line">
				<label>
					<span>标题</span><input type="text" id="expe-title" class="search_txt">
				</label>
			</div>		
			<div class="line">
				<div class="expe-cont">
					<div class="tools">
						<input type="button" id="addImg">
					</div>
					<textarea class="autoArea"></textarea>
				</div>
			</div>
			<div class="btns">
				<div class="line">
					<input type="button" id="submit" value="提&nbsp;&nbsp;&nbsp;交">
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		//textarea 高度自适应
		$(".autoArea").height($(".autoArea")[0].scrollHeight);
		$(".autoArea").on("keyup keydown", function(){
		    $(this).height(this.scrollHeight);
		})
	</script>
</body>
</html>