<!DOCTYPE html>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String filePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<%=basePath%>css/global.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/index.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/layui/layer.js"></script>
<link rel="stylesheet" href="<%=basePath%>plugins/layui/css/modules/layer/default/layer.css">
<link rel="shortcut icon" href="<%=basePath%>images/webico.ico" type="image/x-icon">
