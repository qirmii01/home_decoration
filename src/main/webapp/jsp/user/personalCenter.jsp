<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="<%=basePath%>plugins/layui/css/layui.css" rel="stylesheet">
<script type="text/javascript" src="<%=basePath%>js/jquery.upload.js"></script>
<style>
	.layui-input{width:auto;display:inline-block;}
	.layui-btn{color:#FFF;}
	input[type="radio"]{display:none;}
	#telphone{display:inline-block;width:170px;padding-left:10px;border:1px solid #FFF;border-radius: 2px;height:38px;line-height: 1.3;background:rgba(210,210,210,.6)}
	.locat{height:30px;line-height:30px;padding-left:16px;}
	#my-content{border-top:1px solid #123;overflow:hidden;}
	.per-left{min-height:450px;margin-right:20px;}
	.per-content{margin-top:5px;width:1100px;}
	.per-content .edit{}
	.oper{margin-right:75px;}
	.oper a:first-child{margin-right:8px;}
	.avatar{line-height:100px;text-align:center;position:relative;}
	.dr-addr:hover{text-decoration:underline;cursor:pointer;}
	.doc-url{display:inline-block;width:700px;overflow:hidden;vertical-align:middle;}
	.doc-url:hover{text-decoration:underline;}
	.msg-status,.msg-time{position:absolute;top: 12px;}
	.apply-detail .layui-form-label{width:130px;}
	.apply-detail .layui-input{width:280px;}
	.message-list .layui-form-label{width:290px;color: #4a4848;}
	.message-list .layui-form-item{border-bottom: 1px dashed;}
	.message-list .layui-input-block{margin-left: 320px;}
	.message-list .msg-status{left:-12px;}
	.message-list .msg-time{right:18px;}
	.message-list .cont{height: 36px;line-height: 36px;line-height:50px;font-size:18px;width:685px;padding-left:5px;border-bottom:1px solid rgba(0,150,169,.5);overflow: hidden;}
	.message-list .cont:hover{cursor:pointer;}
	.indent20{text-indent:20px;}
	.indent40{text-indent:40px;}
</style>
<div class="locat"><span><a href="<%=basePath%>">首页</a></span>&nbsp;&gt;&nbsp;<span>个人中心</span></div>
<div id="my-content">
	<div class="per-left fl layui-bg-black">
		<ul class="layui-nav layui-nav-tree">
			<li class="layui-nav-item layui-this"><a class="t-common t1" href="javascript:void(0);">个人信息</a></li>
			<c:if test="${sessionScope.userInfo.type ==0}">
				<li class="layui-nav-item"><a class="t-common t-apply" href="javascript:void(0);">我的装修申请</a></li>
			</c:if>
			<c:if test="${sessionScope.userInfo.type ==1}">
				<li class="layui-nav-item"><a class="t-common t-design" href="javascript:void(0);">我的设计</a></li>
				<li class="layui-nav-item"><a class="t-common t-apply-list" href="javascript:void(0);">装修申请列表</a></li>
			</c:if>
			<li class="layui-nav-item"><a class="t-common t-m" href="javascript:void(0);">我的消息</a></li>
		</ul>
	</div>
	<div class="per-content fl" lay-filter="personCenter-cont"></div>
</div>

<div class="uploadEffectImg-box layui-form" style="display:none;">
	<input type="hidden" class="apply-id">
	<input type="hidden" class="designer-id">
	<div class="layui-form-item">
		<label class="layui-form-label">风格：</label>
		<div class="layui-input-block">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">上传效果图</label>
		<div style="margin-left:110px;">
			<button class="layui-btn" id="openBtn">点击上传</button>
		</div>
	</div>
</div>

<div class="apply-detail" style="display:none;">
	<div class="layui-form-item">
        <label class="layui-form-label">装修申请编号：</label>
        <div class="layui-input-block">
            <input type="text" name="id" disabled class="layui-input">
        </div>
    </div>
	<div class="layui-form-item">
        <label class="layui-form-label">装修申请类型：</label>
        <div class="layui-input-block">
            <input type="text" name="type" disabled class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">装修申请预算金额：</label>
        <div class="layui-input-block">
            <input type="text" name="budgetAmount" disabled class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">装修面积：</label>
        <div class="layui-input-block">
            <input type="text" name="area" disabled class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">当前进展：</label>
        <div class="layui-input-block">
            <input type="text" name="status" disabled class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">装修申请时间：</label>
        <div class="layui-input-block">
            <input type="text" name="createTime" disabled class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">发布时间：</label>
        <div class="layui-input-block">
            <input type="text" name="checkTime" disabled class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">拒绝接受设计时间：</label>
        <div class="layui-input-block">
            <input type="text" name="refuseTime" disabled class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">拒绝接受设计理由：</label>
        <div class="layui-input-block">
            <textarea name="refuseReason" disabled class="layui-input"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">我的接受时间：</label>
        <div class="layui-input-block">
            <input type="text" name="acceptTime" disabled class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">申请用户id：</label>
        <div class="layui-input-block">
            <input type="text" name="userId" disabled class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">装修完成时间：</label>
        <div class="layui-input-block">
            <input type="text" name="finishTime" disabled class="layui-input">
        </div>
    </div>
</div>

<div class="my-message" style="display:none;">
	<h4 style="text-align:center;font-size:20px;">我的消息</h4>
	<ul class="message-list">
	</ul>
	<div id="layPage"></div>
</div>

<div class="layui-form edit-style" style="display:none;">
	<div class="layui-form-item">
	    <label class="layui-form-label">风格列表(绿色为我已选择的风格)</label>
	    <div class="layui-input-block">
	    </div>
  </div>
  <div class="layui-form-item">
  	<div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="changeStyle">立即提交</button>
  </div>
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
		+'<div class="layui-form-item"><span class="layui-form-label">电话：</span><p style="line-height:40px;" id="telphone">${sessionScope.userInfo.telphone}</p></div>'
		+'<div class="layui-form-item"><span class="layui-form-label">用户名：</span><input type="text" class="layui-input" id="userName" disabled="disabled" value="${sessionScope.userInfo.userName}"></div>'
		+'<div class="avatar layui-form-item colu_tw_b"><span class="layui-form-label">我的头像：</span><a href="javascript:void(0);" id="upload"><img id="avatartImg" data-id="${sessionScope.userInfo.avatar}" '
		if('${sessionScope.userInfo.avatarPath}'){
			html+=' alt="我的头像" src="<%=filePath%>/${fn:replace(sessionScope.userInfo.avatarPath,"\\","/")}"';
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
			html+='"><i class="layui-anim layui-icon"></i>';
		}
		html+='<div>女</div></div></div></div></div>';
		
		var userType = "${sessionScope.userInfo.type}";
		if(userType == "1"){
			html+='<div class="layui-form-item"><label class="layui-form-label">我的风格：</label><div class="layui-input-block styles"></div></div>';
			$.ajax({
				url:"${basePath}user/queryMyStyles",
				success:function(data){
					if(data.code != '0'){
						layer.msg("加载设计风格失败");
					}else{
						var da= data.data;
						if(da.length > 0){
							for(var i=0 ; i<da.length; i++){
								html += '<span data-id="'+da.id+'">'+da.styleName+'</span>';
							}
						}else{
							html+='<span style="color:gray;">暂无</span>';
						}
						html+='<span class="edit"></span>';
					}
				}
			});
		}
		$('.per-content').html(html);
		
		$('.styles .edit').click(function(){
			var load = layer.load();
			$.ajax({
				url:"${basePath}user/allStylesStatusAboutDesigner",
				success:function(data){
					layer.close(load);
					if(data.code != '0'){
						layer.msg(data.msg);
					}else{
						var da = data.data;
						var html="";
						if(da.length ==0){
							hmlt="暂无数据";
						}else{
							for(var i= 0 ;i<da.length; i++){
								html+='<input type="checkbox" lay-skin="primary" name="style" data-id="'+da[i].id+'" title="'+da[i].styleName+'"';
								if(da.status == '1'){
									html+='checked';
								}
								html+='>';
							}
						}
						$(".edit-style .layui-input-block").html(html);
						layer.open({
							type:1,
							title:"风格编辑",
							area:"680px",
							content:$(".edit-style"),
							success:function(layero,index){
								layui.use('form',function(){
									var form = layui.form;
									form.on('sumbit(changeStyle)',function(obj){
										console.log(obj.field)
										
										return false;
									});
								})
							}
						});
					}
				},
				error:function(err){
					layer.close(load);
					layer.msg("系统异常");
				}
			});
		});
		
		$('.oper a').click(function(){
			var index = $(this).index();
			if(index == 0){
				$('.per-content input').removeAttr("disabled");
				$('#userName').focus();
				$('#upload').attr("type","button");
				$('#upload').click(function(){
					MyUtil.upload({"url":"<%=basePath%>admin/upload","show":true,"target":'#upload img'})
				});
				
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
			}
			if(index ==1){
				$('.per-content input').attr("disabled","disabled");
				$('#upload').unbind("click");
				$('.layui-form-radio').unbind("click");
				var un = $('#userName').val();
				var avatar= $('#avatartImg').attr("data-id");
				var sex = $('.layui-form-radioed').prev().val();
				var avatarPath = $('#upload img').attr("data-url");
				var user={};
				user.userName = un;
				user.avatar = avatar;
				user.sex = sex;
				user.avatarPath = avatarPath;
				user.id = "${sessionScope.userInfo.id}";
				$.ajax({
					url:"<%=basePath%>user/updateUser",
					method:"POST",
					data:user,
					success:function(data){
						if(data.code != '0'){
							layer.msg(data.msg);
						}else{
							layer.msg("数据更新成功",{time:1500},function(){
								location.reload();
							});
						}
					},
					error:function(err){
						console.log(err);
						layer.msg("系统错误");
					}
				})
			}
		});
	})
	$(function(){
		$('.t1').click();
	})
	$('.per-left li .t-apply').click(function(){
		$('.per-content').html("");
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
								id: "app-cont",
								elem: ".per-content",
								data: appLis,
								width: tableWid,
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
												return "已发布";
											}if(d.status == 2){
												return "审核未通过";
											}if(d.status == 3){
												return "设计师于"+getYearMonthDate(d.acceptTime)+"接受装修设计";
											}if(d.status == 4){
												return getYearMonthDate(d.acceptTime)+"拒绝"+d.designerName+"的设计";;
											}if(d.status == 5){
												return "正在装修";
											}if(d.status == 6){
												return "装修完成";
											}
										}},
										{title:'操作',width:tableWid/7,templet:function(d){
											console.log(d)
											var templ;
											if(d.status == 0){
												templ='<a class="layui-btn layui-btn-xs" href="javascript:edit(\''+d.id+'\')">修改</a>';
											}else if(d.status == 1){
												templ='<a class="layui-btn layui-btn-xs" href="javascript:chooseDesigner(\''+d.id+'\')">选择设计师</a>';
											}else if(d.status == 2){
												templ='<a class="layui-btn layui-btn-xs" href="javascript:reapply(\''+d.userId+'\')">重新申请</a>';
											}else if(d.status == 3){
												templ='<a class="layui-btn layui-btn-xs" href="javascript:seeDesignInfo(\''+d.id+'\')" title="查看设计方案">查看</a>'
													+'<a class="layui-btn layui-btn-xs" href="javascript:accept(\''+d.id+'\')" title="接受设计方案，开始装修">接受</a>'
													+'<a class="layui-btn layui-btn-xs" href="javascript:inputRefuseReason(\''+d.id+'\')" title="拒绝接受设计方案，并输入理由">拒绝</a>';
											}else if(d.status == 4){
												templ='<a class="layui-btn layui-btn-xs" href="javascript:seeDesignInfo(\''+d.id+'\')">查看设计状态</a>'
											}else if(d.status == 5){
												templ='<a class="layui-btn layui-btn-xs" href="javascript:seeDesignInfo(\''+d.id+'\')">查看设计状态</a>'
												+'<a class="layui-btn layui-btn-xs" href="javascript:finish(\''+d.id+'\')">装修完成</a>';
											}else if(d.status == 6){
												templ='<a class="layui-btn layui-btn-xs" href="javascript:seeDesignInfo(\''+d.id+'\')">查看设计状态</a>'
												+'<a class="layui-btn layui-btn-xs" href="javascript:uploadEffectImg(\''+d.id+'\',\''+d.acceptId+'\')">上传装修效果图</a>'
												+'<a class="layui-btn layui-btn-xs" href="javascript:evaluate(\''+d.id+'\')">评价</a>';
											}
											return templ;
										}}
								     ]],
								   done:function(){
								   }
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
	
	/** 申请用户功能 */
	//修改申请
	function edit(id){
		layer.open({
			type:2,
			title:"修改申请",
			area:'380px',
			content:"<%=basePath%>decoration/decorationApplyPage?applyId="+id
		});
	}
	
	//拒绝接受设计方案并输入理由
	function inputRefuseReason(id){
		layer.prompt({
			title:'<center>拒绝接受</center>',
			formType:2,
			area:["580px","258px"],
			success:function(layero,index){
				var this_textArea = $(layero).find(".layui-layer-content textarea");
				this_textArea.attr("placeholder","请输入拒绝接受的理由");
			},
			yes:function(index, layero){
				var this_textArea = $(layero).find(".layui-layer-content textarea");
				var value = this_textArea.val();
				if(/^\s*$/.test(value)){
					layer.alert("拒绝理由不能为空")
					return;
				}else{
					layer.confirm("<center>确认拒绝设计结果？</center>\n(&nbsp;&nbsp;注：若恶意拒绝，经过透明家装确认将进行封号处理)",function(i){
						$.ajax({
							url:"<%=basePath%>decoration/updateDecorationApply",
							data:{refuseReason:value,status:"4",id:id},
							success:function(data){
								if(data.code != '0'){
									layer.msg(data.msg);
								}else{
									layer.msg("操作成功，等待设计师确认")
								}
							},
							error:function(err){
								layer.msg("系统错误");
							}
						});
					});
				}
			}
		});
	}
	
	//选择设计师
	function chooseDesigner(id){
		location.href="<%=basePath%>user/showAllDesigner";
	}
	
	//重新申请装修
	function reapply(id){
		layer.open({
			title:"装修申请",
			type:2,
			content:"<%=basePath%>decoration/decorationApplyPage"
		});
	}
	
	//查看设计情况
	function seeDesignInfo(id){
		var load= layer.load();
		$.ajax({
			url:"<%=basePath%>decoration/queryDesignResult",
			success:function(data){
				layer.close(load);
				if(data.code != '0'){
					layer.msg(data.msg)
				}else{
					var da=data.data;
					console.log(da)
					var html = '<ul class="design-result">';
					for(var i=0 ; i<da.length; i++){
						html+='<li><p class="indent20"><span>'+da[i].attachmentName+'：</span></p><p class="indent40"><span class="dr-addr"><%=filePath%>'+da[i].sourcePath+'</span><p></li>';
					}
					html+='</ul>';
					layer.open({
						title:"设计结果",
						type:1,
						area:"860px",
						content:html,
						success:function(){
							$('.dr-addr').click(function(){
								var addr =$(this).text();
								window.open(addr);
							});
						}
					});
				}
			},
			error:function(err){
				layer.close(load);
				layer.msg("系统异常")
			}
		});
	}
	
	function accept(id){
		var load=layer.load();
		$.ajax({
			url:"${basePath}decoration/updateDecorationApply",
			data:{"id":id,"status":"5"},
			success:function(data){
				layer.close(load);
				if( data.code != '0'){
					layer.msg(data.msg);
				}else{
					layer.alert("已接受设计方案，透明家装装修团队将尽快与您联系装修事宜，请保持手机开机状态",function(){
						location.reload();
					});
				}
			},
			error:function(err){
				layer.close(load);
				layer.msg("系统异常");
			}
		});
	}
	
	function uploadEffectImg(id,designerId){
		layer.open({
			title:"<center>添加效果图</center>",
			type:1,
			area:'420px',
			content:$('.uploadEffectImg-box'),
			success:function(){
				var load=layer.load();
				if($('.uploadEffectImg-box .layui-input-block').html().trim() == ''){
					$.ajax({
						url:"<%=basePath%>decoration/queryStyles",
						success:function(data){
							layer.close(load);
							if(data.code != '0'){
								layer.msg(data.msg);
							}else{
								var styles = data.data;
								for(var i = 0; i<styles.length ; i++){
									var html ='<input type="checkbox" name="style" title="'+styles[i].name+'">'
										+'<div class="style-cont layui-unselect layui-form-checkbox" data-id="'+styles[i].id+'" lay-skin="">'
										+'<span>'+styles[i].name+'</span><i class="layui-icon"></i></div>';
									$('.uploadEffectImg-box .layui-input-block').append(html);
								}
								$('.uploadEffectImg-box .apply-id').val(id);
								$('.uploadEffectImg-box .designer-id').val(designerId);
								$('.style-cont').click(function(){
									$(this).toggleClass("layui-form-checked");
								});
							}
						},
						error:function(err){
							layer.close(load);
							layer.msg("系统异常");
						}
					});
				}else{
					layer.close(load);
				}
			}
		});
		
	}
	
	function finish(id){
		var load=layer.load();
		$.ajax({
			url:"${basePath}decoration/updateDecorationApply",
			data:{"id":id,"status":"6"},
			success:function(data){
				layer.close(load);
				if( data.code != '0'){
					layer.msg(data.msg);
				}else{
					layer.alert("已完成装修，您可对设计师进行评价以及上传效果图，(上传有惊喜！)",function(){
						location.reload();
					});
				}
			},
			error:function(err){
				layer.close(load);
				layer.msg("系统异常");
			}
		});
	}
	
	function evaluate(id){
		var html = '<div class="layui-form"><div class="layui-form-item"><label class="layui-form-label">评价</label><div class="layui-input-block">'
	            +'<select name="commentRating" lay-verify="required"><option value="">选择评价等级</option><option value="0">差评</option>'
	            +'<option value="1">一般</option><option value="2">好评</option></select><div class="layui-unselect layui-form-select">'
	            +'<div class="layui-select-title"><input type="text" placeholder="请选择" value="" readonly="" class="layui-input layui-unselect"><i class="layui-edge"></i></div>'
	            +'<dl class="layui-anim layui-anim-upbit"><dd lay-value="" class="layui-select-tips">请选择</dd><dd lay-value="0" class="">差评</dd><dd lay-value="1" class="">一般</dd>'
	            +'<dd lay-value="2" class="">好评</dd></dl></div></div></div>'
	            +'<div class="layui-form-item"><div class="layui-input-block"><button class="layui-btn evaluate-btn" lay-submit="" lay-filter="formDemo">立即提交</button></div></div></div>'
	    layer.open({
	    	title:"<center>评价</center>",
	    	area:['488px','280px'],
	    	content: html,
	    	success:function(){
	    		$('.evaluate-btn').click(function(){
	    			var commentRating = $('select[name="commentRating"]').value;
	    			console.log(commentRating);
	    			var load=layer.load();
	    			$.ajax({
	    				url:"${basePath}decoration/updateDecorationApply",
	    				data:{"id":id,"commentRating":commentRating},
	    				success:function(data){
	    					layer.close(load);
	    					if( data.code != '0'){
	    						layer.msg(data.msg);
	    					}else{
	    						layer.alert("感谢您的评价。",function(){
	    							location.reload();
	    						});
	    					}
	    				},
	    				error:function(err){
	    					layer.close(load);
	    					layer.msg("系统异常");
	    				}
	    			});
	    		});
	    	}
	    });
	}
	
	//上传效果图
	$('#openBtn').click(function(){
		var applyId = $('.uploadEffectImg-box .apply-id').val();
		var designerId = $('.uploadEffectImg-box .designer-id').val();
		MyUtil.docUpload(
			{uploadUrl:"<%=basePath%>admin/upload",filePath:"<%=filePath%>"},
			function(boxObj){
				boxObj.find('.add-doc button.submit').click(function(){
					var title ="";
					layer.prompt({
						title:"输入效果标题",
						area:"480px"
					},function(value,index,elem){
						layer.close(index);
						title = value;
						var load=layer.load();
						var titles = boxObj.find('.docList input.title-items');
						if(titles.length == 0){
							layer.close(load);
							return;
						}
						
						var decorationEffectImgs=[];
						
						for(var i=0; i<titles.length ; i++){
							var decorationEffectImg={};
							decorationEffectImg.img = titles.eq(i).attr("data-id");
							if(!decorationEffectImg.img){
								continue;
							}
							decorationEffectImg.applyId = applyId;
							decorationEffectImg.title= titles.eq(i).val();
							decorationEffectImgs.push(decorationEffectImg);
						}
						
						var decorationEffectKeys=[];
						$('.uploadEffectImg-box .layui-form-checked').each(function(i){
							var decorationEffectKey={};
							decorationEffectKey.keyWord = $(this).attr("data-id");
							decorationEffectKeys.push(decorationEffectKey);
						});
						
						var decorationEffect ={designerId:designerId,applyId:applyId,title:title};
						
						console.log(params)
						$.ajax({
							url:"<%=basePath%>decoration/addDecoEffect",
							data:{
								decorationEffect : decorationEffect,
								decorationEffectKeys: decorationEffectKeys,
								decorationEffectImgs: decorationEffectImgs,	
							},
							method:"POST",
							success:function(data){
								layer.close(load);
								if(data.code != '0'){
									layer.msg(data.msg);
								}else{
									layer.msg("添加成功")
								}
							},
							error:function(err){
								layer.close(load);
								layer.msg("系统异常");
							}
						});
					});
				});
			}
		);
	});
	
	/** 设计师功能 */
	//拒绝接受
	function refuse(id){
		var load=layer.load();
		$.ajax({
			url:"<%=basePath%>decoration/applyRecord",
			data:{applyId:id,status:"2"},
			success:function(data){
				layer.close(load);
				if(data.code != '0'){
					layer.msg(data.msg);
				}else{
					layer.msg("已拒绝改用户的装修申请");
				}
			},
			error:function(err){
				layer.close(load);
				layer.msg("系统异常");
			}
		});
	}
	
	//接受
	function acceptApply(id){
		var load=layer.load();
		$.ajax({
			url:"<%=basePath%>decoration/applyRecord",
			data:{applyId:id,status:"1"},
			success:function(data){
				layer.close(load);
				if(data.code != '0'){
					layer.msg(data.msg);
				}else{
					layer.msg("接受装修设计成功，请尽快与装修者联系");
				}
			},
			error:function(err){
				layer.close(load);
				layer.msg("系统异常");
			}
		});
	}
	
	$('.t-apply-list').click(function(){
		$('.per-content').html("");
		var load = layer.load();
		layui.use("table",function(){
			var table= layui.table;
			var tableWid = $('.per-content').width()-20;
			table.render({
				id:"applyDesign",
				elem:".per-content",
				url:"<%=basePath%>user/applyDesignLis",
				width:tableWid,
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
							templ+='<a class="layui-btn layui-btn-xs hei" href="javascript:check(\''+d.id+'\',1)">接受</a>'
								+'<a class="layui-btn layui-btn-xs hei" href="javascript:check(\''+d.id+'\',2)">不接受</a>';
							return templ;
						}}
					 ]],
				done:function(){
					layer.close(load);
				}	 
			});
		});
	});
	
	function check(id,status){
		if(!id) return ;
		var load = layer.load();
		$.ajax({
			url:"${basePath}user/dealApply",
			data:{applyId:id,status:status},
			success:function(data){
				layer.close(load);
				if(data.code != '0'){
					layer.msg(data.msg)
				}else{
					if(status == '1'){
						layer.msg("已成功接受装修设计，请尽早与申请人联系",{time:3000},function(){
							$(".t-apply-list").click();
						});
					}else{
						layer.msg("已拒绝该装修设计申请",{time:3000},function(){
							$(".t-apply-list").click();
						});
					}
				}
			},
			error:function(err){
				layer.close(load);
				layer.msg("系统异常");
			}
		});
	}
	
	$('#my-content .t-common').click(function(){
		if(!$(this).hasClass("t-apply-list")){
			$('#my-content .per-content').next().remove();
		}
		if(!$(this).hasClass("t-m")){
			$('.message-list').html("");
			$('.my-message').css("display","none");
		}
	});
	
	$('#my-content .t-design').click(function(){
		$('.per-content').html("");
		var load = layer.load();
		layui.use("table",function(){
			var table= layui.table;
			var tableWid = $('.per-content').width()-20;
			table.render({
				id:"my-design",
				elem:".per-content",
				url:"<%=basePath%>user/myDesignLis",
				width:tableWid,
				cols:[[
						{field:'id', title: '装修id', align:"center", width:tableWid/4},
						{field:'telphone', title: '用户电话', align:"center", width:tableWid/4},
						{title: '接受时间', align:"center", width:tableWid/4,templet:function(d){
							return millisDateFormat(d.acceptTime,"yyyy-MM-dd");
						}},
						{title: '操作', align:"center", width:tableWid/4,toolbar:"#designLis"}
				]],
				page:true,
				done:function(res, curr, count){
					layer.close(load);
				}
			});
		});
	});
	
	$('.message-list .layui-form-item').click(function(){
		var renderId = $(this).attr("sender-id");
		layer.alert({
			title:"<center>来自&nbsp;"+renderId+"&nbsp;用户的消息</center>",
			area:'750px',
			maxHeight:'480px',
			success:function(data){
				$(this).find(".msg-status").removeClass("layui-badge-dot");
				$.post("${basePath}user/updateMsg",{status:"1"},function(data){
					if(data.code != '0'){
						layer.msg(data.msg);
					}
				});
			}
		});
	});
	
	$('.t-m').click(function(){
		$('.per-content').html("");
		var load = layer.load();
		layui.use("laypage",function(){
			var laypage = layui.laypage;
			var count =0;
			$.get("${basePath}/user/countMsg",function(data){
				count = data.data;
			})
			laypage.render({
				elem:"layPage",
				count:count,
				limit:12,
				curr:1,
				jump: function(obj, first){
					$.ajax({
						url:"<%=basePath%>user/getMsgList",
						data:{"page":obj.curr,"limit":obj.limit},
						success:function(data){
							layer.close(load);
							if(data.code != '0'){
								layer.msg(data.msg);
							}else{
								if(data.data.length ==0){
									$('.message-list').html('<p style="text-align:center;">暂无消息</p>');
								}else{
									var re = data.data;
									var html ='';
									for(var i=0 ; i<re.length; i++){
										html+='<div class="layui-form-item" sender-id="'+re[i].senderId+'"><label class="layui-form-label">来自&nbsp;<span style="color:#342;">'+re[i].senderId+'</span>&nbsp;的消息</label>'
										+'<div class="layui-input-block"><p class="cont">'+re[i].content+'</p><span class="msg-time">'+getYearMonthDate(re[i].createTime)+'</span>'
										+'<span class="msg-status ';
										if(re[i].status == '0'){
											html+='layui-badge-dot';
										}
										html +='"></span></div></div>';
									}
								}
								$('.message-list').html(html);
								$('.per-content').html($('.my-message'));
								$('.my-message').css("display","block")
								
							}
						}
					});
				}
			});
		});
	});
	
	layui.use("table",function(){
		var table= layui.table;
		table.on("tool(personCenter-cont)",function(obj){
			var load = layer.load();
			var opera = obj.event;
			if(opera == 'detail'){
				var load = layer.load();
				$.ajax({
					url:"${basePath}decoration/userDecorationApply",
					data:{"id":obj.data.id},
					success:function(data){
						layer.close(load);
						if( data.code != '0'){
							layer.msg(data.msg);
						}else{
							if(data.data.length != 1){
								layer.msg("系统异常");
							}
							layer.open({
								title:'<p style="text-align:center;">申请详情</p>',
								type: 1,
								scrollbar: false,
								area: ['520px', '600px'],
								content:$('.apply-detail'),
								success:function(){
									var result =data.data[0];
									$('.apply-detail input[name="id"]').val(result.id);
									var type="";
									if(result.type == '0'){
										type='面议';
									}else if(result.type == '1'){
										type='半包';
									}else if(result.type == '2'){
										type='全包';
									}
									$('.apply-detail input[name="type"]').val(type);
									var budgetAmount = "";
									if(result.budgetAmount == '-1'){
										budgetAmount = '面议';
									}else if(result.budgetAmount == '0'){
										budgetAmount = '￥三万以下';
									}else if(result.budgetAmount == '1'){
										budgetAmount = '￥3~5万';
									}else if(result.budgetAmount == '2'){
										budgetAmount = '￥5~8万';
									}else if(result.budgetAmount == '3'){
										budgetAmount = '￥8~10万';
									}else if(result.budgetAmount == '4'){
										budgetAmount = '￥10~12万';
									}else if(result.budgetAmount == '5'){
										budgetAmount = '￥12~15万';
									}else if(result.budgetAmount == '6'){
										budgetAmount = '￥15~30万';
									}else if(result.budgetAmount == '7'){
										budgetAmount = '￥30万以上';
									}
									$('.apply-detail input[name="budgetAmount"]').val(budgetAmount);
									$('.apply-detail input[name="area"]').val(result.area+" ㎡");
									var status = "";
									if(result.status == '1'){
										status = '申请通过';
									}else if(result.status == '3'){
										status = '已被接受';
									}else if(result.status == '4'){
										status = '拒绝接受已设计的方案';
									}else if(result.status == '5'){
										status = '正在装修';
									}else if(result.status == '6'){
										status = '装修完成';
									}
									$('.apply-detail input[name="status"]').val(status);
									$('.apply-detail input[name="createTime"]').val(result.createTime ? getYearMonthDate(result.createTime):"");
									$('.apply-detail input[name="checkTime"]').val(result.checkTime ? getYearMonthDate(result.checkTime) :"");
									$('.apply-detail input[name="refuseTime"]').val(result.refuseTime ? getYearMonthDate(result.refuseTime):"");
									$('.apply-detail input[name="refuseReason"]').val(result.refuseReason);
									$('.apply-detail input[name="acceptTime"]').val(result.acceptTime ? getYearMonthDate(result.acceptTime) :"");
									$('.apply-detail input[name="userId"]').val(result.userId);
									$('.apply-detail input[name="finishTime"]').val(result.finishTime ? getYearMonthDate(result.finishTime) :"");
								},
								cancel:function(index){
									layer.close(load);
									layer.close(index);
								}
							});
						}
					},
					error:function(err){
						layer.close(load);
						layer.msg("系统异常");
					}
				});
				
			}else if(opera == 'sendMsg'){
				layer.prompt({
					formType: 2,
					title: '<center>给&nbsp;'+obj.data.userId+'&nbsp;用户发送消息</center>',
					area: ['600px', '360px'],
					cancel:function(index){
						layer.closeAll();
					}
				},function(value, index, elem){
					var load = layer.load();
					$.ajax({
						url:"${basePath}user/sendMsg",
						method:"POST",
						data:{content:value,receiveId:obj.data.userId},
						success:function(data){
							layer.close(load);
							if(data.code != '0'){
								layer.msg(data.msg);
							}else{
								layer.msg("发送成功");
								layer.close(index);
							}
						},
						error:function(err){
							layer.close(load);
							layer.msg("系统异常")
						}
					});
				});
				
			}else if(opera == 'uploadDesign'){
				MyUtil.docUpload(
						{uploadUrl:"<%=basePath%>admin/upload",filePath:"<%=filePath%>"},
						function(boxObj){
							boxObj.find('.add-doc button.submit').click(function(){
								var load=layer.load();
								var titles = boxObj.find('.docList input.title-items');
								if(titles.length == 0){
									layer.close(load);
									layer.msg("木有添加文件");
									return;
								}
								
								var attachments=[];
								for(var i=0; i<titles.length ; i++){
									var attachment={};
									attachment.sourceId = titles.eq(i).attr("data-id");
									if(!attachment.sourceId){
										continue;
									}
									attachment.applyId = obj.data.id;
									attachment.attachmentName= titles.eq(i).val();
									attachment.type = '1';
									attachments.push(attachment);
								}
								
								for(var i=0 ; i<attachments.length ; i++){
									if(!attachments[i].attachmentName){
										layer.close(load);
										layer.msg("有文件名未输入");
										return;
									}
								}
								
								$.ajax({
									url:"<%=basePath%>decoration/addAttachment",
									data:{"applyAttachments":JSON.stringify(attachments)},
									method:"POST",
									success:function(data){
										layer.close(load);
										if(data.code != '0'){
											var result = data.data;
											var re="";
											for(var i=0 ; i<result.length; i++){
												re +=result[i]+";";
											}
											layer.alert(re);
										}else{
											layer.msg("添加成功",{time:2000},function(){
												location.reload();
											})
										}
									},
									error:function(err){
										layer.close(load);
										layer.msg("系统异常");
									}
								});
							});
						}
					);
			}else if(opera == 'seeReason'){
				var load = layer.load();
				$.ajax({
					url:"${basePath}decoration/applyBaseInfo",
					data:{"id":obj.data.id,"status":"4"},
					success:function(data){
						layer.close(load);
						if( data.code != '0'){
							layer.msg(data.msg);
						}else{
							layer.alert(data.data[0].refuseReason);
						}
					},
					error:function(err){
						layer.close(load);
						layer.msg("系统异常");
					}
				});
			}else if(opera == 'stopService'){
				var load = layer.load();
				$.ajax({
					url:"${basePath}decoration/updateDecorationApply",
					data:{"id":obj.data.id,"status":"1"},
					success:function(data){
						layer.close(load);
						if( data.code != '0'){
							layer.msg(data.msg);
						}else{
							layer.alert("已停止对 "+obj.data.userId+" 用户服务",{time:3000},function(){
								location.reload();
							});
						}
					},
					error:function(err){
						layer.close(load);
						layer.msg("系统异常");
					}
				});
			}else if(opera == 'report'){
				
			}
		});
	});
</script>
<script type="text/html" id="designLis">
	<a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
	<a class="layui-btn layui-btn-xs" lay-event="sendMsg">发送消息</a>
	{{# if(d.status == "3" ){ }}
		<a class="layui-btn layui-btn-xs" lay-event="uploadDesign">上传设计图</a>
	{{# }else if(d.status =="4" ){ }}
		<a class="layui-btn layui-btn-xs" lay-event="seeReason">查看拒绝原因</a>
		<a class="layui-btn layui-btn-xs" lay-event="stopService">停止服务</a>
		//<a class="layui-btn layui-btn-xs" lay-event="report">举报恶意拒绝</a>
	{{# } }}
</script>