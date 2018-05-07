<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<div class="locat">
	<span><a href="<%=basePath%>">首页</a></span>&nbsp;&gt;&nbsp;
	<span><a href="<%=basePath%>user/showAllDesigner">设计团队</a></span>&nbsp;&gt;&nbsp;
	<span class="name"></span>
</div>
<div class="sjs_intro">
    <div class="hd">设计师档案</div>
    <div class="bd">
        <div class="fl author">
            <img <c:if test="${!empty designerInfo.avatarPath}">src="${basePath+designerInfo.avatarPath}"</c:if> width="96" height="96">
            <ul>
                <li><span class="val">${designerInfo.caseExample}</span><span class="name">案例</span></li>
            </ul>
        </div>
        <dl class="fr info">
            <dt>
            <h1>${empty designerInfo.userName ? "":designerInfo.userName} </h1><span class="is_v"></span>
            <u title="已认证">证</u>
            <a href="javascript:;" onclick="helpDesign('${designerInfo.userId}','找TA设计');">找TA设计</a>
            </dt>
            <dd>
                <span class="col-1">所属公司：${sessionScope.baseInfo.name}</span>
                <span class="col-2">服务地址：${designerInfo.serviceAddress}</span>
            </dd>
            <dd>
            	<span class="col-1">设计费用：${designerInfo.designAmountLow}-${designerInfo.designAmountHigh}元/㎡</span>
            	<span class="col-2">擅长风格：
                	<c:forEach items="${designerInfo.designerStyles}" var="styles">
                		${styles.styleName}&nbsp;
                	</c:forEach>
                </span>
            </dd>
			<dd>
            	<span class="col-1">设计经验：${designerInfo.engageTime}年</span>
            </dd>
            <dd>
                <span class="name">个人简介：</span>
               <pre>
               ${designerInfo.introduce}
               ${designerInfo.record}
               </pre>
            </dd>
        </dl>
    </div>
</div>
<%@include file="../common/footer.jsp"%>