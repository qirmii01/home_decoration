<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=basePath%>plugins/layui/css/layui.css" rel="stylesheet">
<link href="<%=basePath%>css/admin.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=basePath%>js/jquery.upload.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/layui/layui.js"></script>
<style type="text/css">
	input{border:none;outline:none;}
</style>
</head>
<body>
	<div class="admin-box">
		<div class="title"><h2>基本信息</h2></div>
		<div class="content">
			<div class="a">
				<div class="line">
					<label>
						<span>公司名称:</span><input type="text" id="name" class="search_txt">
					</label>
				</div>		
				<div class="line">
					<label>
						<span>公司地址:</span><input type="text" id="address" class="search_txt">
					</label>
				</div>
				<div class="line">
					<label>
						<span>公司电话:</span><input type="text" id="phone" class="search_txt">
					</label>
				</div>
				<div class="line">
					<label>
						<span>服务地区:</span><textarea id="serviceArea" class="search_txt"></textarea>
					</label>
				</div>
			</div>
			<div class="b">
				<div class="line">
					<label>
						<span>公司介绍:</span><textarea id="companyIntroduce" class="search_txt autoArea"></textarea>
					</label>
				</div>		
				<div class="line bott-line">
					<label>
						<span>主页banner图:</span>
						<span class="img bannerImg"><img ></span>
					</label>
					<div class="upload-bt">
						<input type="button" class="bt-1-hv" id="bannerImg" value="上传图片">
					</div>
				</div>
				<div class="line bott-line">
					<label>
						<span>公司logo:</span>
						<span class="img logoImg"><img></span>
					</label>
					<div class="upload-bt">
						<input type="button" class="bt-1-hv" id="logoImg" value="上传图片">
					</div>
				</div>		
				<div class="line bott-line">
					<label>
						<span>公司营业执照:</span>
						<span class="img qualificationsImg"><img ></span>
					</label>
					<div class="upload-bt">
						<input type="button" class="bt-1-hv" id="qualificationsImg" value="上传图片">
					</div>
				</div>
			</div>
			<div class="btns">
				<div class="line">
					<div>
						<input type="button" value="提&nbsp;&nbsp;交" id="submit">
						<input type="button" value="取消改变" id="cancel">
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		var data;
		function init(){
			$.ajax({
				url:"<%=basePath%>admin/queryBaseInfo",
				success:function(a){
					data = a.data;
					setParams(data);
				}
			})
		}
		
		function setParams(data){
			$('#name').val(data.name);
			$('#address').val(data.address);
			$('#phone').val(data.phone);
			$('#companyIntroduce').val(data.companyIntroduce);
			$('#serviceArea').val(data.serviceArea);
			if(data.bannerImg){
				$('.bannerImg>img').attr("src","<%=filePath %>/"+data.bannerPath);
			}
			if(data.logoImg){
				$('.logoImg>img').attr("src","<%=filePath %>/"+data.logoPath);
			}
			if(data.qualificationsImg){
				$('.qualificationsImg>img').attr("src","<%=filePath %>/"+data.qualifPath);
			}
			
			//textarea 高度自适应
			$(".autoArea").height($(".autoArea")[0].scrollHeight);
			$(".autoArea").on("keyup keydown", function(){
			    $(this).height(this.scrollHeight);
			})
		}
		
		$('#cancel').click(function(){
			setParams(data);
		});
		
		$('#submit').click(function(){
			$('#submit').attr("disabled","disabled");
			var name = $('#name').val();
			name = name ? name : null;//后台传值为空则为null，设置在input中获取到的是 ""字符串，统一转化成null
			var address = $('#address').val();
			address = address ? address : null;
			var phone = $('#phone').val();
			phone = phone ? phone : null;
			var companyIntroduce = $('#companyIntroduce').val();
			companyIntroduce = companyIntroduce ? companyIntroduce : null;
			var serviceArea = $('#serviceArea').val();
			serviceArea = serviceArea ? serviceArea : null;
			var bannerImg = $('.bannerImg img').attr("data-id");//attr不存在返回undefined
			bannerImg = bannerImg ? bannerImg : null;
			var logoImg = $('.logoImg img').attr("data-id");
			logoImg = logoImg ? logoImg : null;
			var qualificationsImg = $('.qualificationsImg img').attr("data-id");
			qualificationsImg = qualificationsImg ? qualificationsImg : null;
			
			var sysCompany ={};
			if(data && data.name == name && data.address == address 
				&& data.phone == phone && data.companyIntroduce == companyIntroduce
				&& data.serviceArea == serviceArea && data.bannerImg == bannerImg
				&& data.logoImg == logoImg && data.qualificationsImg == qualificationsImg){
				layer.msg("未作任何改变");
				$('#submit').removeAttr("disabled");
				return;
			}else{
				updateData();
			}
			
			function updateData(bool){
				sysCompany.id =data.id;
				if( name != data.name){
					if(bool){
						data.name = name;
					}else{
						sysCompany.name = name;
					}
				}
				if( address != data.address){
					if(bool){
						data.address = address;
					}else{
						sysCompany.address = address;
					}
				}
				if( phone != data.phone){
					if(bool){
						data.phone = phone;
					}else{
						sysCompany.phone = phone;
					}
				}
				if( companyIntroduce != data.companyIntroduce){
					if(bool){
						data.companyIntroduce = companyIntroduce;
					}else{
						sysCompany.companyIntroduce = companyIntroduce;
					}
				}
				if( serviceArea != data.serviceArea){
					if(bool){
						data.serviceArea = serviceArea;
					}else{
						sysCompany.serviceArea = serviceArea;
					}
				}
				if( bannerImg != data.bannerImg){
					if(bool){
						data.bannerImg = bannerImg;
						data.bannerPath = $('.bannerImg img').attr("data-url");
					}else{
						sysCompany.bannerImg = bannerImg;
					}
				}
				if( logoImg != data.logoImg){
					if(bool){
						data.logoImg = logoImg;
						data.logoPath = $('.logoImg img').attr("data-url");
					}else{
						sysCompany.logoImg = logoImg;
					}
				}
				if( qualificationsImg != data.qualificationsImg){
					if(bool){
						data.qualifPath = $('.qualificationsImg img').attr("data-url");
						data.qualificationsImg = qualificationsImg;
					}else{
						sysCompany.qualificationsImg = qualificationsImg;
					}
				}
			}
			
			$.ajax({
				url:"<%=basePath%>admin/addOrUpdateBaseInfo",
				method:"POST",
				data:sysCompany,
				success:function(data){
					if(data.code == '0'){
						updateData(true);
						layer.msg(data.data);
					}else{
						layer.msg(data.msg);
					}
					$('#submit').removeAttr("disabled");
				},
				error:function(err){
					layer.msg('系统错误')
					$('#submit').removeAttr("disabled");
					console.log(err)
				}
			});
		});
		
		$(function(){
			init();
		})
		
		$('#logoImg').click(function(){
			
			MyUtil.upload({"target":".logoImg img","show":true});
		});
		
		$('#bannerImg').click(function(){
			MyUtil.upload({"target":".bannerImg img","show":true});
		});
		
		$('#qualificationsImg').click(function(){
			MyUtil.upload({"target":".qualificationsImg img","show":true});
		});
		
	</script>
</body>
</html>