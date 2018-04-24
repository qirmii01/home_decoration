<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<style>
	
</style>
<div class="locat"><span><a href="<%=basePath%>">首页</a></span>&nbsp;&gt;&nbsp;<span>个人中心</span></div>
<div id="my-content">
	<div class="per-left">
		<ul>
			<li><a class="t1" href="javascript:void(0);">个人信息</a></li>
			<li>
				<a class="t2 apply-open" href="javascript:void(0);">我的装修申请<span class="mark">&gt;</span></a>
				
			</li>
		</ul>
	</div>
	<div class="per-content">
		
	</div>
</div>
<script type="text/javascript">
	$('.per-left li .t1').click(function(){
		var html = '';
		html+='<div class="oper"><a href="javascript:void(0);">编辑</a><a href="javascript:void(0);">保存</a></div>'
		+'<div><span>电话：</span><p id="telphone">${sessionScope.userInfo.telphone}</p></div>'
		+'<div><span>用户名：</span><input type="text" id="userName" disabled="disabled" value="${sessionScope.userInfo.userName}"></div>'
		+'<div class="avatar"><span>我的头像：</span><img id="avatartImg" alt="我的头像" data-id="${sessionScope.userInfo.avatar}" src="<%=filePath%>/${sessionScope.userInfo.avatarPath}"><input id="upload" type="hidden" value="上传头像"></div>'
		+'<div><span>性别：</span><label><input disabled="disabled" type="radio" ';
		<c:if test="${sessionScope.userInfo.sex == 0}">
			html+='checked="check"';
		</c:if>
		html+=' name="sex" id="sex-boy" value="0">男</label><label><input disabled="disabled" type="radio"';
		<c:if test="${sessionScope.userInfo.sex == 1}">
		html+='checked="check"';
		</c:if>
		html+='name="sex" id="sex-girl" value="1">女</label><input type="hidden" id="userId" value="${sessionScope.userInfo.id}"></div>';
		$('.per-content').html(html);
		
		$('.oper a').click(function(){
			var index = $(this).index();
			if(index == 0){
				$('.per-content input').removeAttr("disabled");
				$('#upload').attr("type","button");
			}
			if(index ==1){
				$('.per-content input').attr("disabled","disabled");
				$('#upload').attr("type","hidden");
				
				var un = $('#userName').val();
				var avatar= $('#avatartImg').attr("data-id");
				var sex = $('#sex-boy').prop("checked")?0:1;
				var update = 0;
				var user={};
				if(un != "${sessionScope.userInfo.userName}"){
					user.userName = un;
					update = 1;
				}
				if(avatar != "${sessionScope.userInfo.avatar}"){
					user.avatar = avatar;
					update = 1;
				}
				if(sex != "${sessionScope.userInfo.sex}"){
					user.sex = sex;
					update = 1;
				}
				if(update){
					user.id = $("#userId").val();
					$.ajax({
						url:"<%=basePath%>user/updateUser",
						method:"POST",
						data:user,
						success:function(data){
							if(data.code != '0'){
								layer.msg(data.msg);
							}else{
								layer.msg(data.body);
							}
						},
						error:function(err){
							console.log(err);
							layer.msg("系统错误");
						}
					})
				}
			}
		});
	})
	
	
	$('.per-left li .t2').click(function(){
		$.ajax({
			url:"<%=basePath%>decoration/userDecorationApply",
			data:{"userId":"${sessionScope.userInfo.id}"},
			success:function(data){
				if(data.code != '0'){
					layer.msg(data.msg);
				}else{
					var appLis = data.body;
					var appCont="";
					if(appLis.length==0){
						appCont = '<div class="app-cont"><p style="text-align:center;">无数据</p></div>';
						$('.per-content').html(appCont);
						return;
					}else{
						layui.use("table",function(){
							var table = layui.table;
							table.render({
								id:"app-cont",
								elem:"#app-cont",
								data:dt,
								width:$('.per-content').width(),
								cols:[[
								     {field:"id",title:"申请id",width:""},
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
										{title: '申请时间', align:"center", width:'17%',templet:function(d){
											return getYearMonthDate(d.createTime);
										}},
										{title: '当前状态', align:"center", width:'17%',templet:function(d){
											if(d.status == 0){
												return "审核中";
											}else if(d.status == 1){
												return "已发布，等待设计师接受";
											}if(d.status == 2){
												return "审核未通过";
											}if(d.status == 3){
												return d.designerName+"于"+getYearMonthDate(d.acceptTime)+"接受装修设计";
											}if(d.status == 4){
												return d.designerName+"于"+getYearMonthDate(d.acceptTime)+"拒绝装修设计";
											}if(d.status == 5){
												return "正在装修";
											}if(d.status == 6){
												return "装修完成";
											}
										}},
										{title:'操作',width:"",templet:function(d){
											var templ;
											if(d.status == 0){
												templ='<a class="layui-btn layui-btn-xs" href="javascript:edit(\''+d.id+'\')">修改</a>';
											}else if(d.status == 1){
												templ='<a class="layui-btn layui-btn-xs" href="javascript:chooseDesigner(\''+d.id+'\')">选择设计师</a>';
											}if(d.status == 2){
												templ='<a class="layui-btn layui-btn-xs" href="javascript:reapply(\''+d.userId+'\')">重新申请</a>';
											}if(d.status == 3){
												templ='<a class="layui-btn layui-btn-xs" href="javascript:seeDesignInfo(\''+d.id+'\')">查看设计状态</a>';
											}if(d.status == 4){
												templ='<a class="layui-btn layui-btn-xs" href="javascript:seeDesignInfo(\''+d.id+'\')">查看设计状态</a>'
													+'<a class="layui-btn layui-btn-xs" href="javascript:chooseDesigner(\''+d.id+'\')">重新选择设计师</a>';
											}if(d.status == 5){
												templ='<a class="layui-btn layui-btn-xs" href="javascript:seeDesignInfo(\''+d.id+'\')">查看设计状态</a>';
											}if(d.status == 6){
												templ='<a class="layui-btn layui-btn-xs" href="javascript:seeDesignInfo(\''+d.id+'\')">查看设计状态</a>'
												+'<a class="layui-btn layui-btn-xs" href="javascript:uploadEffectImg(\''+d.id+'\')">上传装修效果图</a>';
											}
											return templ;
										}}
								     ]]
							});
						});
					}
				}
			},
			error:function(err){
				console.log(err);
				layer.msg("系统错误");
			}
		});
		
	});

	function getYearMonthDate(millisTime){
		if(typeof millisTime != 'number'){
			console.log("时间类型错误")
			return ;
		}
		var d =new Date(millisTime);
		return d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
	}
	
	//修改申请
	function edit(id){
		
	}
	
	//选择设计师
	function chooseDesigner(id){
		
	}
	
	//重新申请装修
	function reapply(id){
		
	}
	
	//查看设计情况
	function seeDesignInfo(id){
		
	}
	
	//上传效果图
	function uploadEffectImg(id){
		
	}
</script>