<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="base.jsp"%>
<header class="home_top">
    <div class="top_t w">
        <div class="w1">
            <div class="top_t_i fl">
                <span class="icon_person"></span>
                <a href="<%= basePath%>" title="首页" target="_blank">首页</a>
                <a href="../../shejishi/index.html" title="设计师" target="_blank">设计师</a>
                <a href="../../xiaoguotu/index.html" title="装修效果图" target="_blank">装修效果图</a>
                <a href="../../zxxt/index.html" title="装修学堂" target="_blank">装修学堂</a>
            </div>
            <div class="top_t_z fr">
            	<c:choose>
            		<c:when test="${!empty sessionScope.userInfo}">
	                	<a href="<%=basePath%>user/personalCenter/${sessionScope.userInfo.id}" title="点击进入个人中心">${!empty sessionScope.userInfo.userName ? sessionScope.userInfo.userName:sessionScope.userInfo.telphone}&nbsp;用户，欢迎登陆</a><span class="line">|</span>
	                	<a link="topLogout" rel="nofollow">注销</a>
            		</c:when>
            		<c:otherwise>
		                <a link="topLogin" rel="nofollow">登录</a><span class="line">|</span>
		                <a link="register" href="user/registerPage" target="_blank" rel="nofollow">注册</a>
            		</c:otherwise>
            	</c:choose>
            </div>
        </div>
    </div>
</header>
<!--头部CSS 结束-->
<div class="jz_header" style="background: rgba(128, 128, 128, 0.24)">
	<div class="w1" style="height:inherit;">
     <div class="logo_lf">
         <a href="<%=basePath%>" class="logo">
             <img id="logoImg" src="<%=filePath%>/${sessionScope.baseInfo.logoPath}" alt="${sessionScope.baseInfo.phone}" width="80" class="company_logo">
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
                <a href="index.html" class="navxd" >
	                <div class="jzicon5"></div>
	                <div class="fl">公司首页</div>
            	</a>
            </li>
            <li><a href="../14178_case/index.html"   >设计方案</a></li><li><a href="../14178_designer/index.html"> 设计团队</a></li><li><a href="../14178_info/index.html"   >公司介绍</a></li><li><a href="../14178_news/index.html"   >装修经验</a></li><li><a href="../14178_promotion/index.html"   >优惠活动</a></li>            </ul>
        <div class="navtag"><a href="<%=basePath%>decoration/decorationApplyPage">立即申请预约</a></div>
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

        <p style="width:406px; text-align:center; line-height: 35px"><a href="user/registerPage" rel="nofollow">还没有账号？立即注册</a>
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
	        		console.log(code)
	        		if(e.keyCode==13){
	        			$('#loginBtn').click();
	        		}
	        	});
	        },
	        end:function(){
	        	var loc =location.href;
	        	location.href = loc.substring(0,loc.indexOf("?"));
	        }
	    });
	}
	
	//弹出一个页面层
	$('a[link="topLogin"]').on('click', function () {
	    home_login();
	});
	
	$('#loginBtn').click(function () {
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
	        return;
	    }
	    var pwd = $('[name="loginPwd"]').val();
	    if (pwd.length < 6) {
	        layer.alert('密码不能少于6位', {
	            title: '登录提示', time: 1500, end: function () {
	                $('[name="loginPwd"]').focus();
	            }
	        });
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
	
</script>

