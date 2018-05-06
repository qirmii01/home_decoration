<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<link href="<%=basePath%>plugins/layui/css/layui.css" rel="stylesheet" type="text/css"/>
<style>
	.c-ch{padding-left:30px;}
</style>
<div class="contentpage w1" style="margin-top: 10px;">
    <%@include file="../common/leftInfo.jsp"%>
    <div class="cont_l fr">
        <div class="navhl"><span>透明家装居网设计师</span></div>
        <div class="designerlist" style="">
            <ul></ul>
        </div>
        <!--翻页 开始-->
       	<div id="layPage"></div>
     	<!--推荐效果图结束-->
    </div>
    <!--右边CSS 结束-->
</div>
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

<div class="apply-list" style="display:none;">
	<ul>
	</ul>
	<div class="layui-form-item">
		<div class="layui-input-block">
            <button class="layui-btn apply-btn" lay-submit="" lay-filter="formDemo">确定</button>
          </div>
	</div>
</div>
<script type="text/javascript" src="<%=basePath%>plugins/layui/layui.js"></script>
<script type="text/javascript">
	$('.nav>ul>li').eq(2).find("a").addClass("navxd");

	layui.use("laypage",function(){
		var laypage = layui.laypage;
		var count =0;
		$.get("countDesigner",function(data){
			count = data.data;
		})
		laypage.render({
			elem:"layPage",
			count:count,
			limit:12,
			curr:1,
			jump: function(obj, first){
				$.ajax({
					url:"<%=basePath%>user/queryDesigner",
					data:{"page":obj.curr,"limit":obj.limit},
					success:function(d){
						if(d.code == '0'){
							var data = d.data;
							var html ='';
							if(data.length != 0 && d.data !='无数据'){
								for(var i =0 ; i <data.length ; i++){
									html+= '<li><div class="designerlist_l"><a href="<%=basePath%>user/designer/'+data[i].userId
										+'"><img src="<%=filePath%>'+data[i].headerImg+'" alt="'+data[i].userName+'"></a><div class="companyinfo_b">'
										+'<dl><dt>'+(data[i].designNumber?data[i].designNumber:"暂无")+'</dt><dd>案例</dd></dl></div></div><div class="designerlist_r"><div class="designerlist_r_a">'
										+'<span><a href="<%=basePath%>user/designer/'+data[i].userId+'" title="'+data[i].userName+' ">'+data[i].userName+' </a></span>'
										+'<div class="fr"><a class="gr" href="javascript:;" onclick="helpDesign(\''+data[i].userId+'\')">找TA设计</a>'
										+'</div></div><div class="designerlist_r_b"><dl><dt><span>所属公司：</span><span>${sessionScope.baseInfo.name}</span></dt><dt><span>设计风格：</span>';
										if(data[i].designerStyles.length ==0){
											html+='<span>暂无</span>';
										}
										for(var j =0 ;j <data[i].designerStyles.length; j++){
											html+='<span>'+data[i].designerStyles[j].styleName+'</span>&nbsp;&nbsp;&nbsp;';
										}
										html+='<dt><span>精选案例：</span></dt></dl> </div><div class="designerlist_r_c">';
										if(data[i].showImgs.length ==0){
											html+='<span>暂无</span>';
										}
										for(var k=0 ; k< data[i].showImgs.length; k++){
											html+='<a href="javascript:void(0)" title="'
											+data[i].showImgs[k].title+'"><img src="<%=filePath%>'+data[i].showImgs[k].imgPath+'" alt="'+data[i].showImgs[k].title+'"></a>';
										}
										html+='</div></div></li>';
								}
							}else{
								html+='<p style="color:#5f5e5e;margin-top:10px;text-align:center;">暂无数据</p>';
							}
							$('.designerlist>ul').html(html);
						}
					},
					error:function(err){
						console.log(err);
						layer.msg("系统错误");
					}
				});
			}
		});
	})
	
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