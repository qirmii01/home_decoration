<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="jsp/common/base.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript" src="<%= basePath%>plugins/layui/layui.js"></script>
<link rel="stylesheet" href="<%= basePath%>plugins/layui/css/layui.css" media="all">
<link rel="stylesheet" href="<%= basePath%>build/css/app.css" media="all">
<link rel="stylesheet" href="<%= basePath%>build/css/nprogress.css" media="all">
<link rel="stylesheet" href="<%= basePath%>build/css/themes/default.css" media="all" id="skin" kit-skin />
<style>
.kit-tab .kit-tab-tool{border-left:none;background:#f2f2f2;}
</style>
</head>
<body class="kit-theme">
	<div class="layui-layout layui-layout-admin kit-layout-admin">
        <div class="layui-header">
            <div class="layui-logo">KIT ADMIN</div>
            <div class="layui-logo kit-logo-mobile">K</div>
            
            <ul class="layui-nav layui-layout-right kit-nav">
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <img src="http://m.zhengjinfan.cn/images/0.jpg" class="layui-nav-img"> ADMIN
                    </a>
                </li>
                <li class="layui-nav-item"><a id="logout" href="javascript:;"><i class="fa fa-sign-out" aria-hidden="true"></i> 注销</a></li>
            </ul>
        </div>

        <div class="layui-side layui-bg-black kit-side">
            <div class="layui-side-scroll">
                <div class="kit-side-fold"><i class="fa fa-navicon">菜单</i></div>
                <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
                <ul class="layui-nav layui-nav-tree">
                    <c:forEach items="${menuList}" var="oneLevelMenu">
	                    	<c:choose>
	                    		<c:when test="${empty oneLevelMenu.children}">
                    				<li class="layui-nav-item">
		                    			<a href="javascript:;" data-options="{url:'${oneLevelMenu.url}',id:'${oneLevelMenu.id}'}">
		                    			<i class="fa fa-plug"></i><span>${oneLevelMenu.title}</span></a>
		                    		</li>
	                    		</c:when>
	                    		<c:otherwise>
		                    		<li class="layui-nav-item haveChild layui-nav-itemed">
				                    	<a class="" href="javascript:;"><i class="fa fa-plug"></i><span>${oneLevelMenu.title}</span><span class="layui-nav-more"></span></a>
		                    			<dl class="layui-nav-child">
				                            <c:forEach items="${oneLevelMenu.children}" var="secondMenu">
				                            	<dd>
				                            		 <a href="javascript:;" data-options="{url:'${secondMenu.url}',id:'${secondMenu.id}'}">
		                                    		<i class="layui-icon"></i><span>${secondMenu.title}</span></a>
		                                    	</dd>
				                            </c:forEach>
				                        </dl>
		                    		</li>
	                    		</c:otherwise>
	                    	</c:choose>
                    </c:forEach>
                </ul>  
            </div>
        </div>
        <div class="layui-body" id="container">
        	<div class="layui-tab layui-tab-card kit-tab" lay-filter="kitTab">
        		<ul class="layui-tab-title"><li class="layui-this" lay-id="-1"><i class="layui-icon"></i><span>控制面板</span></li></ul>
       			<div class="kit-tab-tool"><i class="fa fa-caret-down"></i></div>
	       		<div class="layui-tab-content">
	       			<div class="layui-tab-item layui-show" lay-item-id="-1">
       					<iframe src=""></iframe>
       				</div>
       			</div>
       		</div>
       	</div>

        <div class="layui-footer">
            <!-- 底部固定区域 -->
            2018 ©
            <a href="<%=basePath%>">透明家装</a> MIT license
        </div>
    </div>
	<script type="text/javascript">
		$(function(){
			$('.layui-nav-tree>li').eq(0).find("a").click();
		})
	
		$('.layui-nav-tree .layui-nav-item>a').click(function(){
			if($(this).parent().hasClass("haveChild")){
				$(this).parent().toggleClass("layui-nav-itemed");
			}
		})
		
		var navs =$('.layui-nav-tree .layui-nav-item a');
		navs.click(function(){
			if($(this).attr("data-options")){
				navs.each(function(i){
					navs.eq(i).parent().removeClass("layui-this");
				});
				$(this).parent().addClass("layui-this");
				var options = $(this).attr("data-options");
				options = eval('['+options+']')[0];
				var iframe = $('.layui-tab-content iframe');
				iframe.height($('#container').height());
				$('#container .layui-tab-title li.layui-this>span').text($(this).find('span').text());
				iframe.attr("src","<%=basePath%>"+options.url);
			}
		})
		
		$("#logout").click(function(){
			$.get("<%=basePath%>admin/adminLogout",function(){
				layer.msg("退出成功",{time:2000},function(){
					location.href="<%=basePath%>admin";
				})
			})
		});
	</script>
</body>
</html>