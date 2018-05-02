<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<link href="<%=basePath%>plugins/layui/css/layui.css" rel="stylesheet" type="text/css"/>
<div class="contentpage w1" style="margin-top: 10px;">
    <%@include file="../common/leftInfo.jsp"%>
    <div class="cont_l fr">
        <div class="navhl" id="set_tab">
            <a href="javascript:void(0);" onclick="set_tab(this,0,'active')" class="active">公司简介</a>
            <a href="javascript:void(0);" onclick="set_tab(this,1,'active')" class="">营业执照</a>            
        </div>
        <div id="set_tab_c0" class="navhlcont active" style="display: block;">
        	<p>${sessionScope.baseInfo.companyIntroduce}</p>
        </div>
        <div id="set_tab_c1" class="navhlcont" style="display: none;">
            <img src="${sessionScope.baseInfo.qualifPath}" width="800px">
		</div>
        <!--翻页 开始-->
       	<div id="layPage"></div>
     	<!--推荐效果图结束-->
    </div>
    <!--右边CSS 结束-->
    
</div>
<script type="text/javascript">
$('.nav>ul>li').eq(3).find("a").addClass("navxd");
</script>