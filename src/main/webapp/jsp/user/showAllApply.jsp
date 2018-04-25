<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>装修申请</title>
</head>
<body>
	<div><a>首页</a><span>&gt;</span><a >装修申请列表</a></div>
	<div class="lis-cont"></div>
</body>
<script type="text/javascript">
	$(function(){
		loadApplyLis();
	})
	loadApplyLis(){
		layui.use("table",function(){
			var tableWidth = $('.lis-cont').width();
			var table = layui.table;
			table.render({
				id: "dec-apply-table",
				elem:"#applyTable",
				url:"<%=basePath%>decoration/decorationApplyLis",
				where:{"queryAll":true},
				width: tableWidth,
				page:true,
				cols:[[
						{field:'type', title: '装修类型', align:"center", width:'16%', templet: function(d){
							if(d.type == '0'){
								return '面议';
							}else if(d.type == '1'){
								return '半包';
							}else if(d.type == '2'){
								return '全包';
							}
							return '[无效数据]';
						}},
						{field:'budgetAmount', title: '装修预算', align:"center", width:'16%', templet: function(d){
							if(d.budgetAmount == '-1'){
								return '面议';
							}else if(d.budgetAmount == '0'){
								return '￥三万以下';
							}else if(d.budgetAmount == '1'){
								return '￥3~5万';
							}else if(d.budgetAmount == '2'){
								return '￥5~8万';
							}else if(d.budgetAmount == '3'){
								return '￥8~10万';
							}else if(d.budgetAmount == '4'){
								return '￥10~12万';
							}else if(d.budgetAmount == '5'){
								return '￥12~15万';
							}else if(d.budgetAmount == '6'){
								return '￥15~30万';
							}else if(d.budgetAmount == '7'){
								return '￥30万以上';
							}else{
								return '[无效数据]';
							}
						}},
						{field:'area', title: '项目大小', align:"center", width:'18%', templet : function(d){
							return d.area + '&nbsp;㎡';
						}},
						{field:'userName', title: '业主姓名', align:"center", width:'16%', templet :function(d){
							var name = d.userName;
							if(d.sex){
								name = d.userName.substring(0,1);
								name += (d.sex == 0? '先生' : '女士');
							}
							return name;
						}},
						{field:'telphone', title: '联系方式', align:"center", width:'17%'},
						{field:'publishTime', title: '发布时间', align:"center", width:'17%'}
				     ]],
				  done:function(res,curr,count){
					  
				  }
			});
		});
	}
</script>
</html>