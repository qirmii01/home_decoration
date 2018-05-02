<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<link href="<%=basePath%>plugins/layui/css/layui.css" rel="stylesheet">
<script type="text/javascript" src="<%=basePath%>js/jquery.upload.js"></script>
<style>
	.layui-input{width:auto;display:inline-block;}
	.layui-btn{color:#FFF;}
	input[type="radio"]{display:none;}
	#telphone{display:inline-block;width:170px;padding-left:10px;border:1px solid #FFF;border-radius: 2px;height:38px;line-height: 1.3;background:rgba(210,210,210,.6)}
	.locat{height:30px;line-height:30px;padding-left:16px;}
	#my-content{border-top:1px solid #123;overflow:hidden;}
	.per-left{min-height:450px;}
	.per-content{padding:5px 16px;width:1100px;}
	.oper{margin-right:75px;}
	.oper a:first-child{margin-right:8px;}
	.avatar{line-height:100px;text-align:center;position:relative;}
</style>
<div class="locat"><span><a href="<%=basePath%>">首页</a></span>&nbsp;&gt;&nbsp;<span>个人中心</span></div>
<div id="my-content">
	<div class="per-left fl layui-bg-black">
		<ul class="layui-nav layui-nav-tree">
			<li class="layui-nav-item layui-this"><a class="t1" href="javascript:void(0);">个人信息</a></li>
			<c:if test="${sessionScope.userInfo.type ==0}">
				<li class="layui-nav-item"><a class="t-apply" href="javascript:void(0);">我的装修申请</a></li>
			</c:if>
			<c:if test="${sessionScope.userInfo.type ==1}">
				<li class="layui-nav-item"><a class="t-design" href="javascript:void(0);">我的设计</a></li>
				<li class="layui-nav-item"><a class="t-apply-list" href="javascript:void(0);">装修申请列表</a></li>
			</c:if>
			<li class="layui-nav-item"><a class="t-m" href="javascript:void(0);">我的消息</a></li>
		</ul>
	</div>
	<div class="per-content fl"></div>
</div>
<%@include file="../common/footer.jsp"%>
<script type="text/javascript" src="<%=basePath%>plugins/layui/layui.js"></script>
<script type="text/javascript">
	$('.layui-nav-item').click(function(){
		$('.layui-nav-item').each(function(){
			$(this).removeClass("layui-this");
		});
		$(this).addClass("layui-this");
	});
	
	$('.per-left li .t1').click(function(){
		$('.per-content').html("");
		var html = '';
		html+='<div class="oper fr"><a href="javascript:void(0);" class="layui-btn layui-btn-sm" style="color:#FFF;">编辑</a><a href="javascript:void(0);" class="layui-btn layui-btn-sm" style="color:#FFF;">保存</a></div>'
		+'<div class="layui-form-item"><span class="layui-form-label">电话：</span><p id="telphone">${sessionScope.userInfo.telphone}</p>'
		+'<div class="layui-form-item"><span class="layui-form-label">用户名：</span><input type="text" class="layui-input" id="userName" disabled="disabled" value="${sessionScope.userInfo.userName}"></div>'
		+'<div class="avatar layui-form-item colu_tw_b"><span class="layui-form-label">我的头像：</span><a href="javascript:void(0);" id="upload"><img id="avatartImg" data-id="${sessionScope.userInfo.avatar}" '
		if('${sessionScope.userInfo.avatarPath}'){
			html+=' alt="我的头像" src="<%=filePath%>/${sessionScope.userInfo.avatarPath}"';
		}else{
			html+=' alt="点击上传头像"';
		}
		html+='></a></div><div class="layui-form-item"><span class="layui-form-label">性别：</span><div class="layui-input-block"><input type="radio" name="sex" value="0" title="男">'
		+'<div class="layui-unselect layui-form-radio';
		if("${sessionScope.userInfo.sex}"=="0"){
			html +=' layui-form-radioed"><i class="layui-anim layui-icon"></i>';
		}else{
			html+= '"><i class="layui-anim layui-icon"></i>';
		}
		html+='<div>男</div></div><input type="radio" name="sex" value="1" title="女">'
		+'<div class="layui-unselect layui-form-radio';
		if("${sessionScope.userInfo.sex}"=="1"){
			html+=' layui-form-radioed"><i class="layui-anim layui-icon"></i>';
		}else{
			html+='"><i class="layui-anim layui-icon"></i>';
		}
		html+='<div>女</div></div></div></div></div>';
		$('.per-content').html(html);
		$('.layui-form-radio').click(function(){
			$('.layui-form-radio').each(function(index){
				if($(this).hasClass("layui-form-radioed")){
					$(this).removeClass("layui-form-radioed");
					$(this).find("i").text("");
				}
			});
			$(this).addClass("layui-form-radioed");
			$(this).find("i").text("");
		});
		
		$('.oper a').click(function(){
			var index = $(this).index();
			if(index == 0){
				$('.per-content input').removeAttr("disabled");
				$('#upload').attr("type","button");
				$('#upload').click(function(){
					MyUtil.upload({"url":"<%=basePath%>admin/upload","show":true,"target":'#upload img'})
				});
			}
			if(index ==1){
				$('.per-content input').attr("disabled","disabled");
				$('#upload').unbind("click");
				var un = $('#userName').val();
				var avatar= $('#avatartImg').attr("data-id");
				var sex = $('.layui-form-radioed').prev().val();
				var update = 0;
				var user={};
				if(un && un != "${sessionScope.userInfo.userName}"){
					user.userName = un;
					update = 1;
				}
				if(avatar && avatar != "${sessionScope.userInfo.avatar}"){
					user.avatar = avatar;
					update = 1;
				}
				if(sex && sex != "${sessionScope.userInfo.sex}"){
					user.sex = sex;
					update = 1;
				}
				if(update){
					user.id = "${sessionScope.userInfo.id}";
					$.ajax({
						url:"<%=basePath%>user/updateUser",
						method:"POST",
						data:user,
						success:function(data){
							if(data.code != '0'){
								layer.msg(data.msg);
							}else{
								layer.msg(data.data);
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
		$('.per-content').html("");
		<c:if test="${sessionScope.userInfo.type ==0 }">
		$.ajax({
			url:"<%=basePath%>decoration/userDecorationApply",
			data:{"userId":"${sessionScope.userInfo.id}"},
			success:function(data){
				if(data.code != '0'){
					layer.msg(data.msg);
				}else{
					var appLis = data.data;
					var appCont="";
					if(appLis.length==0){
						appCont = '<div class="app-cont"><p style="text-align:center;">无数据</p></div>';
						$('.per-content').html(appCont);
						return;
					}else{
						layui.use("table",function(){
							var table = layui.table;
							var tableWid = $('.per-content').width()-20;
							table.render({
								id:"app-cont",
								elem:".per-content",
								data:appLis,
								width:tableWid,
								cols:[[
								       {field:"id",title:"申请id",width:tableWid/7},
								       {field:'type', title: '装修类型', align:"center", width:tableWid/7, templet: function(d){
											if(d.type == '0'){
												return '面议';
											}else if(d.type == '1'){
												return '半包';
											}else if(d.type == '2'){
												return '全包';
											}
											return '[无效数据]';
										}},
										{field:'budgetAmount', title: '装修预算', align:"center", width:tableWid/7, templet: function(d){
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
										{field:'area', title: '项目大小', align:"center", width:tableWid/7, templet : function(d){
											return d.area + '&nbsp;㎡';
										}},
										{title: '申请时间', align:"center", width:tableWid/7,templet:function(d){
											return getYearMonthDate(d.createTime);
										}},
										{title: '当前状态', align:"center", width:tableWid/7,templet:function(d){
											if(d.status == 0){
												return "审核中";
											}else if(d.status == 1){
												return "已发布，等待设计师选择";
											}if(d.status == 2){
												return "审核未通过";
											}if(d.status == 3){
												return d.designerName+"于"+getYearMonthDate(d.acceptTime)+"接受装修设计";
											}if(d.status == 4){
												return getYearMonthDate(d.acceptTime)+"拒绝"+d.designerName+"的设计";;
											}if(d.status == 5){
												return "正在装修";
											}if(d.status == 6){
												return "装修完成";
											}
										}},
										{title:'操作',width:tableWid/7,templet:function(d){
											var templ;
											if(d.status == 0){
												templ='<a class="layui-btn layui-btn-xs" href="javascript:edit(\''+d.id+'\')">修改</a>';
											}else if(d.status == 1){
												templ='<a class="layui-btn layui-btn-xs" href="javascript:chooseDesigner(\''+d.id+'\')">选择设计师</a>';
											}else if(d.status == 2){
												templ='<a class="layui-btn layui-btn-xs" href="javascript:reapply(\''+d.userId+'\')">重新申请</a>';
											}else if(d.status == 3){
												templ='<a class="layui-btn layui-btn-xs" href="javascript:seeDesignInfo(\''+d.id+'\')">查看设计状态</a>';
											}else if(d.status == 4){
												templ='<a class="layui-btn layui-btn-xs" href="javascript:seeDesignInfo(\''+d.id+'\')">查看设计状态</a>'
													+'<a class="layui-btn layui-btn-xs" href="javascript:inputRefuseReason(\''+d.id+'\')">拒绝接受设计方案，并输入理由</a>';
											}else if(d.status == 5){
												templ='<a class="layui-btn layui-btn-xs" href="javascript:seeDesignInfo(\''+d.id+'\')">查看设计状态</a>';
											}else if(d.status == 6){
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
		</c:if>
		<c:if test="${sessionScope.userInfo.type == 1 }">
			layui.use("table",function(){
				var table= layui.table;
				var tableWid = $('.per-content').width()-20;
				table.render({
					id:"mydesign",
					elem:".per-content",
					url:"<%=basePath%>user/myDesign",
					where:{"userId":"${sessionScope.userInfo.id}"},
					width:tableWid,
					cols:[[
						{field:"telphone",title:"申请用户",width:tableWid/6},
						{field:'type', title: '装修类型', align:"center", width:tableWid/6, templet: function(d){
							if(d.type == '0'){
								return '面议';
							}else if(d.type == '1'){
								return '半包';
							}else if(d.type == '2'){
								return '全包';
							}
							return '[无效数据]';
						}},
						{field:'budgetAmount', title: '装修预算', align:"center", width:tableWid/6, templet: function(d){
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
						{field:'area', title: '项目大小', align:"center", width:tableWid/6, templet : function(d){
							return d.area + '&nbsp;㎡';
						}},
						{title: '申请时间', align:"center", width:tableWid/6,templet:function(d){
							return getYearMonthDate(d.createTime);
						}},
						{title:"操作",width:tableWid/6,templet:function(d){
							var templ;
							if(d.status == 1){
								templ='<a class="layui-btn layui-btn-xs" href="javascript:refuse(\''+d.id+'\')">拒绝</a>'
								+'<a class="layui-btn layui-btn-xs" href="javascript:accept(\''+d.id+'\')">接受</a>';
							}else if(d.status == 3){
								templ='<a class="layui-btn layui-btn-xs" href="javascript:sendMessage(\''+d.id+'\')">发送消息</a>'
								+'<a class="layui-btn layui-btn-xs" href="javascript:startDesign(\''+d.id+'\')">上传设计文档设计</a>';
							}else if(d.status == 4 ||d.status == 5 || d.status == 6){
								templ='<a class="layui-btn layui-btn-xs" href="javascript:void(0)">无操作</a>'
							}
							return templ;
						}}
					   ]],
					page:true
				});
			});
		</c:if>
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
		layer.open({
			title:"修改申请",
			content:"<%=basePath%>decoration/decorationApplyPage"
		});
	}
	
	//拒绝接受设计方案并输入理由
	function inputRefuseReason(id){
		
	}
	
	//选择设计师
	function chooseDesigner(id){
		
	}
	
	//重新申请装修
	function reapply(id){
		layer.open({
			title:"装修申请",
			content:"<%=basePath%>decoration/decorationApplyPage"
		});
	}
	
	//查看设计情况
	function seeDesignInfo(id){
		
	}
	
	//上传效果图
	function uploadEffectImg(id){
		
	}
	
	//拒绝接受
	function refuse(id){
		
	}
	
	//接受
	function accept(id){
		
	}
	
	//上传设计文档
	function startDesign(id){
		
	}
	
	$('.t3').click(function(){
		
	});
</script>