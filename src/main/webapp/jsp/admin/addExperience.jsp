<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=basePath%>plugins/layui/css/layui.css" rel="stylesheet">
<link href="<%=basePath%>css/admin.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=basePath%>js/jquery.upload.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/layui/layui.js"></script>
<style type="text/css">
	.line{margin:0 auto;width:980px;margin-bottom:10px;}
	.line:first-child{margin-top:20px;}
</style>
</head>
<body>
	<div class="admin-box">
		<div class="content">
			<div class="line">
				<label>
					<span>标题</span><input type="text" id="expe-title" class="search_txt">
				</label>
			</div>
			<div class="line">	
				<div class="expe-cont">
					<textarea id="cont-area" style="display:none;"></textarea>
				</div>
			</div>
			<div class="btns">
				<div class="line">
					<input type="button" id="submit" value="提&nbsp;&nbsp;&nbsp;交">
				</div>
			</div>
		</div>
	</div>
	
	<script>
		layui.use('layedit', function(){
			var layedit = layui.layedit;
			var index =layedit.build('cont-area',{
			 tool:['strong', 'italic', 'underline', 'del', 'left', 'center', 'image'],
			 uploadImage:{url:'uploadImage'}
			}); //建立编辑器
			
			$('#submit').click(function(){
				var title = $('#expe-title').val();
				var content=$('#expeCont').val();
				if(title.trim() == ''){
					layer.msg("标题不能为空");
					return ;
				}
				if(content.trim() == ''){
					layer.msg("内容不能为空");
					return;
				}
				var experienceList={};
				experienceList.title =title;
				experienceList.content = content;
				$.ajax({
					url:"<%=basePath%>admin/addExperience",
					data:experienceList,
					method:"POST",
					success:function(r){
						if(r.code =='0'){
							layer.msg(r.data);
							$('#expe-title').val("");
							$('#expeCont').val("");
						}else{
							layer.msg(r.msg);
						}
					},
					error:function(err){
						console.log(err);
					}
				});
			});
		});
		
		
	</script>
	
	<script type="text/javascript">
		var cont="";
		
		$('#submit').click(function(){
			var title = $('#expe-title').val();
			var content=$('#expeCont').val();
			if(title.trim() == ''){
				layer.msg("标题不能为空");
				return ;
			}
			if(content.trim() == ''){
				layer.msg("内容不能为空");
				return;
			}
			var experienceList={};
			experienceList.title =title;
			experienceList.content = content;
			$.ajax({
				url:"<%=basePath%>admin/addExperience",
				data:experienceList,
				method:"POST",
				success:function(r){
					if(r.code =='0'){
						layer.msg(r.data);
						$('#expe-title').val("");
						$('#expeCont').val("");
					}else{
						layer.msg(r.msg);
					}
				},
				error:function(err){
					console.log(err);
				}
			});
		});
		
		$('.autoArea').focus(function(){
			
		
		})
		
		function addCont(){
			var e = window.event;
			var code = e.keyCode;
			console.log(code)
			cont = $('.autoArea').val();
			cont = cont ? cont :"";
			if(code == 9){
				 if (e.preventDefault) { e.preventDefault(); }
	            else { e.returnValue = false; }
				cont +="&nbsp;&nbsp;&nbsp;&nbsp;";
			}
		}
		
		$('#addImg').click(function(){
			MyUtil.upload({"target":""},function(result){
				console.log("url"+result)
				var content=$('#expeCont').val();
				if(result){
					content+='\n<img src="<%=filePath%>/'+result+'" class="article-img"/>';
				}
				$('#expeCont').html(content);
			});
		})
		
		$(function(){
			init();
		})
		
		var pageIndex = 1;
		var cont;
		function init(){
			$.ajax({
				url:"<%=basePath%>admin/queryExperienceLis",
				data:{"pageIndex":pageIndex,"limit":5},
				success:function(data){
					if(data.code =='0'){
						cont = data.data;
						var menuHtml="";
						var contHtml="";
						if(cont.length ==0){
							menuHtml='<p style="color:#5f5e5e;margin-top:30px;text-align:center;">暂无数据</p>';
							contHtml='<p style="color:#5f5e5e;margin-top:30px;text-align:center;">暂无数据</p>';
						}else{
							var dataLis = cont;
							for(var i=0 ; i<dataLis.length ; i++){
								menuHtml+=
									'<li class="menu-title" data-id="'+dataLis[i].id+'">'+dataLis[i].title+'</li>';
									
							}
							contHtml=
								'<li ><div class="title"><h4>'+dataLis[0].title+'</h4></div>'
								+'<div class="corr"><span>发布时间：'+dataLis[0].createTimeStr+'</span></div>'
								+'<div class="art-content">'+dataLis[0].content+'</div></li>';
						}
						$('.expe-menu>ul.menu-detail').html(menuHtml);
						$('.expe-list>ul.expe-content').html(contHtml);
					}else{
						layer.msg(data.msg);
					}
				}
				
			});
		}
		
		
	</script>
</body>
</html>