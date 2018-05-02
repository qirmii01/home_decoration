<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=basePath%>plugins/layui/css/layui.css" rel="stylesheet">
<link href="<%=basePath%>css/admin.css" rel="stylesheet">
<script type="text/javascript" src="<%=basePath%>plugins/layui/layui.js"></script>
<title>装修申请审核</title>
<style type="text/css">
	.admin-box{margin:5px;}
	.data-content{height:40px;}
	.hei{height:28px;line-height:28px;}
	.layui-btn:hover{color:#FFF;}
	.apply-search{margin-top:20px;}
	.layui-inline{width:191px;}
	.layui-inline:last-child{width:auto;}
</style>
</head>
<body>
	<div class="admin-box">
		<div class="content">
			<div class="apply-search">
				<div class="accountTable">
					用户id：     <div class="layui-inline">
								<input class="layui-input" id="designerName" autocomplete="off">
							</div>
					预算金额：    <div class="layui-inline">
								<form class="layui-form" action="#">
									<select id="budget">
										<option value="">请选择</option>
										<option value="-1">面议</option>
										<option value="0">三万以下</option>
										<option value="1">3~5万</option>
										<option value="2">5~8万</option>
										<option value="3">8~10万</option>
										<option value="4">10~12万</option>
										<option value="5">12~15万</option>
										<option value="6">15~30万</option>
										<option value="7">30万以上</option>
									</select>
									<div class="layui-unselect layui-form-select">
										<div class="layui-select-title">
											<input type="text" placeholder="请选择" value="" readonly="" class="layui-input layui-unselect"><i class="layui-edge"></i>
										</div>
										<dl class="layui-anim layui-anim-upbit">
											<dd lay-value="" class="layui-select-tips">请选择</dd>
											<dd lay-value="-1" class="">面议</dd>
											<dd lay-value="0" class="">三万以下</dd>
											<dd lay-value="1" class="">3~5万</dd>
											<dd lay-value="2" class="">5~8万</dd>
											<dd lay-value="3" class="">8~10万</dd>
											<dd lay-value="4" class="">10~12万</dd>
											<dd lay-value="5" class="">12~15万</dd>
											<dd lay-value="6" class="">15~30万</dd>
											<dd lay-value="7" class="">30万以上</dd>
										</dl>
									</div>
								</form>
							</div>
					装修类型：     	<div class="layui-inline">
								<form class="layui-form" action="#">
									<select id="type">
										<option value="">请选择</option>
										<option value="0">面议</option>
										<option value="1">半包</option>
										<option value="2">全包</option>
									</select>
									<div class="layui-unselect layui-form-select">
										<div class="layui-select-title">
											<input type="text" placeholder="请选择" value="" readonly="" class="layui-input layui-unselect"><i class="layui-edge"></i>
										</div>
										<dl class="layui-anim layui-anim-upbit">
											<dd lay-value="" class="layui-select-tips">请选择</dd>
											<dd lay-value="0" class="">面议</dd>
											<dd lay-value="1" class="">半包</dd>
											<dd lay-value="2" class="">全包</dd>
										</dl>
									</div>
								</form>
							</div>
					装修面积：	<div class="layui-inline"><input class="layui-input" type="number" id="area" autocomplete="off"></div>
					<div class="layui-inline"><button class="layui-btn" data-type="reload" id="apply-search">搜索</button></div>
				</div>
			</div>
			<div id="appl-check-table"></div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function loadTable(where){
		layui.use("table",function(){
			$('#appl-check-table').next().height("auto");
			var table = layui.table;
			var tableWid = $("#appl-check-table").width();
			table.render({
				id:"appl-check-table",
				elem:"#appl-check-table",
				url:"<%=basePath%>admin/queryDecorApplyCheckLis",
				width:tableWid,
				where:where,
				page:true,
				cols:[[
					{field:'userId', title: '用户id', align:"center", width:tableWid/6},
					{title:"预算金额",width:tableWid/6, templet:function(d){
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
					{title:"装修类型",width:tableWid/6, templet:function(d){
						if(d.type == '0'){
							return '面议';
						}else if(d.type == '1'){
							return '半包';
						}else if(d.type == '2'){
							return '全包';
						}
						return '[无效数据]';
					}},
					{title:"装修面积",width:tableWid/6, templet:function(d){
						return d.area + '&nbsp;㎡';
					}},
					{field:'createTime', title: '申请时间', align:"center", width:tableWid/6},
					{title:"操作",width:tableWid/6, templet:function(d){
						var templ="";
						if(d.hasAttachment == 1){
							//templ+='<a class="layui-btn layui-btn-xs hei" href="javascript:seeAttachment(\''+d.id+'\')">查看附件</a>';
						}
						templ+='<a class="layui-btn layui-btn-xs hei" href="javascript:check(\''+d.id+'\',1)">通过</a>'
							+'<a class="layui-btn layui-btn-xs hei" href="javascript:check(\''+d.id+'\',2)">不通过</a>';
						return templ;
					}}
				     ]],
				done:function(res,curr,count){
					var tableHeight = $('#appl-check-table').next().height();
					$('#appl-check-table').next().height(tableHeight+20);
				}				     
			});
		});
	}
	
	$(function(){
		loadTable();
	})
	//查看附件
	function seeAttachment(id){
		layer.open({
			title:"查看附件",
			content:"<%=basePath%>admin/seeAttachment?applyId="+id
		});
	}
	
	//审核
	function check(id,status){
		$.ajax({
			url:"<%=basePath%>admin/decorationApplyCheck",
			data:{"status":status,"id":id},
			success:function(data){
				if(data.code != '0'){
					layer.msg(data.msg)
				}else{
					layer.msg("审核完成",{"time":1500},function(){
						location.reload();
					})
				}
			},
			error:function(err){
				console.log(err);
				layer.msg("系统错误")
			}
		});
	}
	
	$('.apply-search').click(function(){
		var formData ={};
		formData.budgetAmount = $('#budget').val();
		formData.type = $('#type').val();
		formData.userId = $('#userId').val();
		formData.area = $('#area').val();
		loadTable(formData);
	});
</script>
</html>