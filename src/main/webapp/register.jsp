<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String filePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
%>
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>用户注册</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <link href="<%=basePath%>css/reg/global.css" rel="stylesheet">
    <link href="<%=basePath%>css/reg/index.css" rel="stylesheet">
    <link href="<%=basePath%>css/reg/style.1.4.8.css" rel="stylesheet">
    <link href="<%=basePath%>css/reg/validform.css" rel="stylesheet">
    <style type="text/css">
    	#verifyImg{display: block;position: absolute;right: 21px;top: 4px;}
    </style>
<body>
<!--头部 start-->
<header class="reg-header">
    <div class="w1">
        <div class="header-logo fl"><a href="<%=basePath%>"><img src="<%=basePath%>images/reg_logo.png"></a><em>欢迎成为透明家装用户</em></div>
        <div class="header-item fr">已有账号？<a href="<%=basePath%>/user/login?login=1" target="_blank">请登录&gt;</a></div>
    </div>
</header>
<!--头部 end-->

<div class="reg-nav">
    <div class="reg-bg01"><img src="<%=basePath%>images/reg_bg.jpg"></div>
    <div class="w1">
        <div class="reg-nav-con">
            <div class="reg-nav-l">
                <form method="post" class="reg_form" id="regForm" action="register">
                    <div>
                        <label>用户名</label>
                        <input type="text" id="username" name="telphone" datatype="uname" onkeyup="value=value.replace(/[^\d]/g,&#39;&#39;);" maxlength="11" sucmsg="" errormsg="请输入正确手机号" placeholder="请输入常用手机号">
                    	<span class="Validform_checktip"></span>
                    </div>
                    <div>
                        <label>设置密码</label>
                        <input type="password" name="password" datatype="*6-20" sucmsg=" " nullmsg="请输入密码" errormsg="密码最少6个字符，最多20个字符！" placeholder="请输入6-20字符的密码">
                    	<span class="Validform_checktip"></span>
                    </div>
                    <div>
                        <label>确认密码</label>
                        <input type="password" name="repeat" datatype="*6-20" sucmsg=" " nullmsg="请输入确认密码"  placeholder="请输入6-20字符的密码">
                        <span class="Validform_checktip"></span>
                    </div>
                    <div style="position:relative;">
                        <label>验证码</label>
                        <input type="text" id="verify_code" name="code" class="passw" value="" maxlength="6" placeholder="请输入验证码" nullmsg="请填写校验码" errormsg="请填写6位校验码">
                        <img src="<%=basePath%>/user/getVerificationCode" id="verifyImg" style="cursor:pointer;" title="点击刷新"/>
                        <span class="Validform_checktip"></span>
                    </div>
                    <div>
                    	<input type="hidden" name="role" value="1">
                        <button type="button" id="subBtn" class="reg-submit" tabindex="10">立即注册成为透明家装用户</button>
                    </div>
                    <input type="hidden" name="type" value="0">
                	<div class="geetest_form">
                		<input type="hidden" name="geetest_challenge">
                		<input type="hidden" name="geetest_validate">
                		<input type="hidden" name="geetest_seccode">
                	</div>
               	</form>
            </div>
        </div>
    </div>
</div>

<div class="footer">
    <div class="footer-hd clearfix">
        <div class="box">
            <div class="about">
                <div class="item_about rd">
                    <dl>
                        <dt><span class="a1">关于我们</span></dt>
                        <dd><span class="a2"><a href="http://www.jiazhuang.com/about/" target="_blank" rel="nofollow">公司介绍</a></span></dd>
                        <dd><span class="a2"><a href="http://www.jiazhuang.com/dongtai/" target="_blank" rel="nofollow">企业动态</a></span></dd>
                        <dd><span class="a2"><a href="http://www.jiazhuang.com/contact/" target="_blank" rel="nofollow">联系我们</a></span></dd>
                        <dd><span class="a2"><a href="http://www.jiazhuang.com/fukuan/" target="_blank" rel="nofollow">付款方式</a></span> </dd>
                        <dd><span class="a2"><a href="http://www.jiazhuang.com/agreement/" target="_blank" rel="nofollow">用户协议</a></span></dd>
                    </dl>
                </div>
                <div class="item_about rd">
                    <dl>
                        <dt><span class="a1">我是业主</span></dt>
                        <dd><span class="a2"><a href="http://www.jiazhuang.com/shejishi/">找设计师</a></span></dd>
                        <dd><span class="a2"><a href="http://www.jiazhuang.com/company/">找装修公司</a></span></dd>
                        <dd><span class="a2"><a href="http://www.jiazhuang.com/baojia_2/" target="_blank" rel="nofollow">申请量房</a></span></dd>
                        <dd><span class="a2"><a href="http://www.jiazhuang.com/yusuan/" target="_blank" rel="nofollow">申请报价</a></span></dd>
                        <dd><span class="a2"><a href="http://www.jiazhuang.com/baojia/" target="_blank" rel="nofollow">免费设计</a></span></dd>
                    </dl>
                </div>
                <div class="item_about rd">
                    <dl>
                        <dt><span class="a1">我是装修公司</span></dt>
                        <dd><span class="a2"><a href="http://user.jiazhuang.com/register/" target="_blank" rel="nofollow">我要接单</a></span></dd>
                        <!--<dd><span class="a2"><a href="http://www.jiazhuang.com/joinus/" target="_blank" rel="nofollow">成为合伙人</a></span></dd>-->
                        <dd><span class="a2"><a href="http://www.jiazhuang.com/zhaobiao/list/" target="_blank" rel="nofollow">查看装修申请</a></span></dd>
                    </dl>
                </div>
                <div class="item_about rd">
                    <dl>
                        <dt><span class="a1">装修课堂</span></dt>
                        <dd><span class="a2"><a href="http://www.jiazhuang.com/zhuangxiuriji/">装修日记</a></span></dd>
                        <dd><span class="a2"><a href="http://www.jiazhuang.com/zhuangxiufengshui/">装修风水</a></span></dd>
                        <dd><span class="a2"><a href="http://www.jiazhuang.com/zhuangxiuliucheng/">装修知识</a></span></dd>
                        <dd><span class="a2"><a href="http://www.jiazhuang.com/sitemap/">网站地图</a></span></dd>
                    </dl>
                </div>
            </div>

            <div class="weibo">
                <div class="wb_tel">
                    <ul>
                        <li><span>联系客服</span></li>
                        <li>周一至周日：08:00-22:00</li>
                        <li>全国统一服务热线：</li>
                        <li>400-889-7706</li>
                    </ul>
                    <div class="ser_btn">
                        <blockquote>
                            <p><a href="http://wpa.qq.com/msgrd?v=3&amp;uin=2010749522&amp;site=qq&amp;menu=yes" target="_blank" class="btn">在线咨询</a></p>
                        </blockquote>
                    </div>
                </div>
                <div class="wb_pub">
                    <p class="t1">微信公众号</p>

                    <p><img src="" width="96" height="96"></p>

                    <p class="t2">在微信上关注我们！</p>
                </div>

                <div class="wb_pub">
                    <p class="t1">家装网APP下载</p>

                    <p><img src="" width="96" height="96"></p>

                    <p class="t2">下载APP获得更多服务！</p>
                </div>
            </div>

        </div>
    </div>
    <!-- end box -->

    <div class="box">
        <div class="icon">
            <div class="list">
                <a href="http://www.jiazhuang.com/baojia_2/" rel="nofollow"><i class="icon1"></i>免费量房<em></em></a>
                <a href="http://www.jiazhuang.com/baojia/" rel="nofollow"><i class="icon2"></i>免费设计<em></em></a>
                <a href="http://www.jiazhuang.com/yusuan/" rel="nofollow"><i class="icon3"></i>免费报价<em></em></a>
                <a href="http://www.jiazhuang.com/baojia_4/" rel="nofollow"><i class="icon4"></i>先行赔付<em></em></a>
                <a href="javascript:;"><i class="icon5"></i>业主监督<em></em></a>
                <a href="http://www.jiazhuang.com/baojia_3/" rel="nofollow"><i class="icon6"></i>装修保障</a>
            </div>
        </div>
        <div class="copyright">
            <ul>
                <li>免责声明：本网站部分内容由用户自行上传，如权利人发现存在误传其作品情形，请及时与本站联系</li>
                <li>家装网 保留所有权利 ©2005- 2017 jiazhuang.com</li>
                <li>家装网 <a href="http://www.miitbeian.gov.cn/">闽ICP备16003468号-2</a></li>
            </ul>
        </div>
    </div>
    <!-- end box -->
</div>
<!-- end footer -->
<script type="text/javascript" src="<%=basePath%>js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/register.js"></script>
<script type="text/javascript" src="<%=basePath%>js/Validform_v5.3.2.js"></script>
<script type="text/javascript" src="<%=basePath%>js/gt.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/layui/layer.js"></script>
<script type="text/javascript">
    $('#verifyImg').on('click', function() {
        $(this).attr("src",'getVerificationCode?abc='+Math.random());
    });

    $('#username').blur(function(){
    	$.ajax({
    		url:"userExist",
    		data:{"telphone":$('#username').val()},
			success:function(data){
				if(data.code == '0'){
					if(data.body+"" == 'false'){
						$("#username").next().addClass("Validform_right").removeClass("Validform_wrong").text("");
					}else if(data.body+"" == 'true'){
						$("#username").next().addClass("Validform_wrong").removeClass("Validform_right").text("该账号已注册");
					}
				}
			},
			error:function(err){
				console.log(err);
			}
    	});
    	
    });
    
    $('input[name="repeat"]').blur(function(){
    	if(!/^\s*$/.test($(this).val()) && $(this).val() != $('input[name="password"]').val()){
    		$(this).next().addClass("Validform_wrong").removeClass("Validform_right").text("两次密码输入不一致");
    	}
    });
    
    $('#verify_code').blur(function(){
    	var img =$(this).next();
    	var validform = $(this).next().next();
    	$.ajax({
    		url:"verifyMatch",
    		data:{code:$(this).val()},
    		success:function(data){
    			if(data.code == '1'){
    				validform.addClass("Validform_wrong").removeClass("Validform_right").text("验证码错误");
    				img.click();
    			}else{
    				validform.addClass("Validform_right").removeClass("Validform_wrong").text("");
    			}
    		}
    		
    	})
    });
    
    $(function(){
        $("#regForm").Validform({
            btnSubmit:'#subBtn',
            tiptype:3,
            postonce:true,
            ajaxPost:true,
            datatype:{
                "uname":/^13[0-9]{9}$|14[57][0-9]{8}$|166[0-9]{8}$|15[0-9]{9}$|17[0-9]{9}$|18[0-9]{9}$/
            },
            beforeSubmit:function(curform){
            	console.log(curform)
            },
            callback: function (data) {
            	console.log(data)
                $.Hidemsg();
                if (data.code == '0') {
                    layer.confirm("注册成功，是否去完善个人信息？",{btn:["是，完善个人信息","否，进入网站主页"]},function(index){
                    	layer.close(index);
                    	location.href="<%=basePath%>user/personalCenter/"+data.body.id;
                    },function(index){
                    	location.href="<%=basePath%>user";
                    	layer.close(index);
                    });
                } else {
                    layer.alert(data.msg,{time:1500});
                }
            }
        });
    });
</script>