<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<diV class="contentpage w1">
	<div class="home_main">
		<div class="seat">
			<span><a href="<%=basePath%>">首页</a></span>&nbsp;&gt;&nbsp;
			<span><a href="<%=basePath%>user/showAllDesigner">设计团队</a></span>&nbsp;&gt;&nbsp;
			<span class="name">${designerInfo[0].userName}</span>
		</div>
	</div>
	<div class="sjs_intro">
	    <div class="hd">设计师档案</div>
	    <div class="bd">
	        <div class="fl author">
	            <img <c:if test="${!empty designerInfo[0].avatarPath}">src="${filePath}${designerInfo[0].avatarPath}"</c:if> width="96" height="96">
	            <ul>
	                <li><span class="val">${!empty designerInfo[0].caseExample ? designerInfo[0].caseExample : 0}</span><span class="name">案例</span></li>
	            </ul>
	        </div>
	        <dl class="fr info">
	            <dt>
	            <h1>${empty designerInfo[0].userName ? "":designerInfo[0].userName} </h1><span class="is_v"></span>
	            <u title="已认证">证</u>
	            <a href="javascript:;" onclick="helpDesign('${designerInfo[0].userId}','找TA设计');">找TA设计</a>
	            </dt>
	            <dd>
	                <span class="col-1">所属公司：${sessionScope.baseInfo.name}</span>
	                <span class="col-2">服务地址：${designerInfo[0].serviceAddress}</span>
	            </dd>
	            <dd>
	            	<span class="col-1">设计费用：${designerInfo[0].designAmountLow}-${designerInfo[0].designAmountHigh}元/㎡</span>
	            	<span class="col-2">擅长风格：
	                	<c:forEach items="${designerInfo[0].designerStyles}" var="styles">
	                		${styles.styleName}&nbsp;
	                	</c:forEach>
	                </span>
	            </dd>
				<dd>
	            	<span class="col-1">设计经验：${designerInfo[0].engageTime}年</span>
	            </dd>
	            <dd>
	                <span class="name">个人简介：</span>
	               <pre>
	               ${designerInfo[0].introduce}
	               ${designerInfo[0].record}
	               </pre>
	            </dd>
	        </dl>
	    </div>
	</div>
</diV>
<div class="choose-designer-box" style="display:none;">
	<input type="hidden" id="applyId">
	<div class="layui-form-item">
		<div class="layui-input-block choose-apply">
			<p style="padding-left:30px;">您已选择的装修申请</p>
		</div>
	</div>
	<div class="add-doc layui-form-item">
		<div class="layui-input-block">
			<button type="button" class="layui-btn subm">提交</button>
		</div>
	</div>
</div>
<%@include file="../common/footer.jsp"%>
<script type="text/javascript">
//找他设计
function helpDesign(designerId){
	layer.open({
		title:"<center>选择要设计的装修申请</center>",
		area:['460px','228px'],
		type:1,
		content:$('.choose-designer-box'),
		success:function(layero, indexOut){
			var loadOut = layer.load();
			var applyIds = [];
			$.ajax({
				url:"<%=basePath%>decoration/myApplyLis",
				success:function(data){
					if(data.code!='0'){
						layer.msg(data.msg);
					}else{
						layer.open({
							title:"我的装修申请",
							type:1,
							area:["380px","240px"],
							content:$('.apply-list'),
							success:function(layero, index){
								layer.close(loadOut);
								var applylis = data.data;
								if(applylis.length <=0){
									layer.msg("您还没有审核通过该的装修申请",{time:3000},function(){
										layer.close(index);
									});
									return;
								}else{
									//添加装修申请列表
									for(var i =0; i< applylis.length; i++){
										var id = applylis[i].id;
										var createTime = millisDateFormat(applylis[i].createTime,'yyyy-MM-dd hh:mm:ss');
										var li = '<li class="layui-form-item c-ch"><input type="checkbox" name="apply" value="'+id+'">&nbsp;申请id:'+id+'<br/>&nbsp;申请时间:'+createTime+'</li>';
										$('.apply-list ul').append(li);
									}
									
									$('.apply-list .apply-btn').click(function(){
										$('.apply-list ul input').each(function(index){
											if($(this).is(':checked')){
												$('.choose-designer-box .choose-apply').append("&nbsp;&nbsp;<p>装修id:&nbsp;"+$(this).val()+"</p>");
												applyIds.push($(this).val());
											}  
										});
										layer.close(index);
									});
								}
							},
							cancel:function(){
								layer.close(loadOut);
							}
						});
						
						$('.add-doc button.subm').click(function(){
							var load=layer.load();
							$.ajax({
								url:"<%=basePath%>decoration/chooseDesigner",
								data:{designerId:designerId, applyIds:applyIds},
								traditional: true,
								method:"POST",
								success:function(data){
									layer.close(load);
									if(data.code != '0'){
										layer.msg(data.msg);
									}else{
										layer.msg("申请成功，等待设计师处理",{time:2000},function(){
											layer.close(indexOut);
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
				},
				error:function(err){
					layer.msg("系统异常");
				}
			});
		},
		cancel:function(){
			$('.apply-list ul').html("");
			$('.choose-designer-box .choose-apply').html("");
			$('.apply-list .apply-btn').unbind("click");
			$('.add-doc button.subm').unbind("click");
		}
	});
}
</script>