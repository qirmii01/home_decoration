<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="base.jsp"%>
<title>透明家装</title>
<header class="home_top">
    <div class="top_t w">
        <div class="w1">
            <div class="top_t_i fl">
                <span class="icon_person"></span>
                <a href="<%= basePath%>" title="首页" target="_blank">首页</a>
                <a href="<%= basePath%>user/showAllDesigner" title="设计师" target="_blank">设计师</a>
                <a href="<%= basePath%>user/showAllEffect" title="装修效果图" target="_blank">装修效果图</a>
                <a href="<%= basePath%>user/showExceperience" title="装修学堂" target="_blank">装修学堂</a>
            </div>
            <div class="top_t_z fr">
            	<c:choose>
            		<c:when test="${!empty sessionScope.userInfo}">
	                	<a href="<%=basePath%>user/personalCenter/${sessionScope.userInfo.id}" title="点击进入个人中心">${!empty sessionScope.userInfo.userName ? sessionScope.userInfo.userName:sessionScope.userInfo.telphone}&nbsp;用户，欢迎登陆</a><span class="line">|</span>
	                	<a link="topLogout" rel="nofollow">注销</a><span class="line">|</span>
            		</c:when>
            		<c:otherwise>
		                <a link="topLogin" rel="nofollow">登录</a><span class="line">|</span>
		                <a link="register" href="<%=basePath%>user/registerPage" target="_blank" rel="nofollow">注册</a><span class="line">|</span>
            		</c:otherwise>
            	</c:choose>
           		<a link="designerApply" href="<%=basePath%>user/addDesignerPage" rel="nofollow">设计师申请</a><span class="line">|</span>
            </div>
        </div>
    </div>
</header>
<!--头部CSS 结束-->
<div class="jz_header" style="background: rgba(128, 128, 128, 0.24)">
	<div class="w1" style="height:inherit;">
     <div class="logo_lf">
         <a href="<%=basePath%>" class="logo">
             <img id="logoImg" src="<%=filePath%>/${sessionScope.baseInfo.logoPath}" alt="${sessionScope.baseInfo.name}" width="80" class="company_logo">
         </a>
         <h1 id="companyName">${sessionScope.baseInfo.name}</h1>
         <span>一个让你放心的家装网</span>
     </div>
     <ul>
         <li>
             <div class="fr">
                 <div class="jzicon1"></div>
                 <span id="phone">${sessionScope.baseInfo.phone}</span>
             </div>
         </li>
         <li>
             <div class="jzicon2"></div>
             <div class="jz_headertxt_a">支持免费量房</div>
             <div class="jzicon3"></div>
             <div class="jz_headertxt_b">支持满意后付款</div>
             <div class="jzicon4"></div>
             <div class="jz_headertxt_c">支持先行赔付</div>
         </li>
     </ul>
   	</div>
</div>
<!--导航 开始-->
<nav class="navbg">
    <div class="nav">
        <ul>
            <li>
                <a href="<%=basePath%>">
	                <div class="jzicon5"></div>
	                <div class="fl">公司首页</div>
            	</a>
            </li>
            <li><a href="<%=basePath%>user/showAllEffect">设计方案</a></li>
            <li><a href="<%=basePath%>user/showAllDesigner"> 设计团队</a></li>
            <li><a href="<%=basePath%>user/companyInfo">公司介绍</a></li>
            <li><a href="<%=basePath%>user/showAllDecorExperience">装修经验</a></li>
            <li><a href="<%=basePath%>user/showAllPerferActivities">优惠活动</a></li>
        </ul>
        <div class="navtag"><a href="javascript:void(0)">立即申请预约</a></div>
    </div>
</nav>
<!--导航 结束-->

<div class="login_popup">
    <div class="main_content log_form">
        <ul>
            <li>
                <em>用户名：</em>
                <input value="" placeholder="请输入登录手机号/邮箱" name="loginName" type="text">
            </li>
            <li>
                <em>密码：</em>
                <input placeholder="请输入密码" name="loginPwd" type="password">
            </li>
        </ul>
        <p class="small_tip">
            <input checked="checked" type="checkbox">
            <span>记住我</span>
            <a href="javascript:void(0)">忘记登录密码？</a>
        </p>

        <p class="loading_sub">
            <input id="loginBtn" value="登录" type="button">
        </p>

        <p style="width:406px; text-align:center; line-height: 35px"><a href="<%=basePath%>user/registerPage" rel="nofollow">还没有账号？立即注册</a>
        </p>
    </div>
</div>
<script type="text/javascript">
	var baseInfo;
	$(function(){
		if(getCookie("userName")){
			$('input[name="loginName"]').val(getCookie("userName"));
		}
		
		if("${login}" == "1"){
			$('a[link="topLogin"]').click();
		}
	})

	function home_login() {
	    layer.open({
	        title: '欢迎登录',
	        type: 1,
	        offset: 'auto',
	        area: ['435px', '320px'],
	        shadeClose: true, //点击遮罩关闭
	        content: $('.login_popup'),
	        success:function(){
	        	$('.login_popup').keydown(function(e){
	        		var code = e.keyCode;
	        		if(e.keyCode==13){
	        			$('#loginBtn').click();
	        		}
	        	});
	        },
	        end:function(){
	        	var loc =location.href;
	        	if(loc.indexOf("?") != -1){
		        	location.href = loc.substring(0,loc.indexOf("?"));
	        	}
	        }
	    });
	}
	
	//弹出一个页面层
	$('a[link="topLogin"]').on('click', function () {
	    home_login();
	});
	
	$('#loginBtn').click(function () {
		var load = layer.load();
	    var name = $('[name="loginName"]').val();
	    if($('.small_tip input[type="checkbox"]').prop("checked")){
		    setCookie("userName",name,30);
	    }else{
	    	setCookie("userName","");
	    }
	    if (name.length < 8) {
	        layer.alert('请输入11位手机号', {
	            title: '登录提示', time: 1500, end: function () {
	                $('[name="loginName"]').focus();
	            }
	        });
	        layer.close(load);
	        return;
	    }
	    var pwd = $('[name="loginPwd"]').val();
	    if (pwd.length < 6) {
	        layer.alert('密码不能少于6位', {
	            title: '登录提示', time: 1500, end: function () {
	                $('[name="loginPwd"]').focus();
	            }
	        });
	        layer.close(load);
	        return;
	    }
	    var data = {};
	    data.telphone = name;
	    data.password = pwd;
	    $.ajax({
	        type: 'post',
	        url: '<%= basePath%>user/loginIn',
	        data: data,
	        dataType: 'json',
	        success: function (result) {
	        	layer.close(load);
	            if (result.code == 0) {
	            	layer.msg("登录成功",{
	            		time:1400,
	            		end:function(){
	            			location.href="<%=basePath%>";
	            		}
	            	})
	            } else {
	            	console.log(result.msg)
	                layer.alert(result.msg, {time: 1500});
	            }
	        },
	        error:function(err){
	        	layer.close(load);
	        	laer.msg("系统异常");
	        }
	    })
	});
	
	$('a[link="topLogout"]').on('click', function () {
	    $.post('<%= basePath%>user/logOut', {}, function (result) {
	        if (result.code=='0') {
	            window.location.href = '<%=basePath%>';
	        }
	    }, 'json');
	});
	
	$('.navtag>a').click(function(){
		layer.open({
			type:2,
			title:"装修申请",
			area:["840px","316px"],
			scrollbar: false,
			content:'<%=basePath%>decoration/decorationApplyPage'
		});
	});
</script>
