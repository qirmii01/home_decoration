<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.acti-list{width:1100px;margin:20px auto;}
	.fl{padding-top:10px;margin-top: 5px;}
	.acti-menu{width:200px;border:1px solid #123;padding-top:10px;margin-top: 5px;}
	.menu-header{border-bottom:1px solid #123;margin-bottom:5px;text-align:center;font-size:18px;}
	.menu-title:hover{background:rgba(29,26,27,.5);}
	.menu-title:hover a{color:#DED;}
	.menu-title a{display:block;margin-left: 5px;border-bottom:1px solid gray;}
	.menu-title a:last-child{border-bottom:none;}
	.acti-content{width:800px;}
	.acti-content .title{text-align:center;font-size:18px;}
	.acti-content .corr{text-align:right;margin-bottom:10px;}
	.acti-content .corr span{margin-right:66px;}
	.art-content{padding:0 58px;}
</style>
</head>
<body>
	<div class="admin-box">
		<div class="acti-list">
			<div class="acti-menu fl">
				<div class="menu-header">活动列表</div>
				<ul class="menu-detail"></ul>
			</div>
			<div class="fl">
				<ul class="acti-content"></ul>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	function init(){
		$.ajax({
			url:"<%=basePath%>admin/queryPreferentialActivitiesList",
			success:function(data){
				if(data.code =='0'){
					cont = data.data;
					var menuHtml="";
					if(cont.length ==0){
						menuHtml='<p style="color:#5f5e5e;margin-top:30px;text-align:center;">暂无数据</p>';
						
					}else{
						var dataLis = cont;
						for(var i=0 ; i<dataLis.length ; i++){
							menuHtml+=
								'<li class="menu-title" title="'+dataLis[i].title+'" data-id="'+dataLis[i].id+'"><a href="javascript:show(\''+dataLis[i].id+'\');">'+dataLis[i].title;
								if(dataLis[i].status == '0'){
									menuHtml+='&nbsp;（展示中）</a></li>';
								}else{
									menuHtml+='&nbsp;（撤销）</a></li>';
								}
						}
					}
					$('.acti-menu>ul.menu-detail').html(menuHtml);
				}else{
					layer.msg(data.msg);
				}
			}
		});
	}
	
	$(function(){
		init();
	})
	
	function show(id){
		$.ajax({
			url:"queryPreferentialActivity",
			method:"POST",
			data:{"id":''+id.toString()},
			success:function(data){
				if(data.code != '0'){
					layer.msg(data.msg);
				}else{
					var da = data.data;
					var contHtml="";
					if(!da){
						contHtml='<p style="color:#5f5e5e;margin-top:30px;text-align:center;">暂无数据</p>';
					}else{
						contHtml=
							'<li ><div class="title"><h4>'+da.title+'</h4></div>'
							+'<div class="corr"><span>发布时间：'+millisDateFormat(da.createTime,"yyyy年mm月dd日")+'</span></div>'
							+'<div class="art-content">'+da.content+'</div></li>';
					}
					$('ul.acti-content').html(contHtml);
				}
			}
		})
	}
</script>
</html>