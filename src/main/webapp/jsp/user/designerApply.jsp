<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.par{postion:relative;}
	.addAttach{position:absolute;top:0;right:0;}
</style>
<%@include file="../common/header.jsp"%>
<link href="<%=basePath%>plugins/layui/css/layui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=basePath%>js/jquery.upload.js"></script>
<style>
.locat{height:30px;line-height:30px;padding-left:16px;border-bottom: 1px solid #123;}
.apply-cont{width:624px;margin:10px auto;padding:0 200px;}
.apply-cont .layui-form-label{width:100px;}
.apply-cont .layui-input-block{margin-left:130px;}
h4{margin:20px auto;font-size: 22px;text-align: center;}
.addAttach{z-index:1;}
</style>
<div class="designer-apply">
	<div class="locat"><span><a href="<%=basePath%>">首页</a></span>&nbsp;&gt;&nbsp;<span>设计师申请</span></div>
	<div class="apply-cont">
		<h4>设计师申请信息</h4>
		<form class="layui-form" action="<%=basePath%>user/designerApply">
	    	<div class="layui-form-item">
				<label class="layui-form-label">手机号：</label>
				<div class="layui-input-block">
					<input type="text" name="telphone" required="" lay-verify="required|phone" placeholder="请输入常用手机号" autocomplete="off" class="layui-input">
				</div>
		    </div>
		
		    <div class="layui-form-item">
		    	<label class="layui-form-label">从事设计时间：</label>
		    	<div class="layui-input-block">
		        	<input type="number" name="engageTime" required="" lay-verify="required|number" placeholder="从事设计的时间(单位:年)" autocomplete="off" class="layui-input">
		    	</div>
		    </div>
		
		    <div class="layui-form-item">
		    	<label class="layui-form-label">最低设计费用：</label>
		    	<div class="layui-input-block">
		        	<input type="number" name="designAmountLow" required="" lay-verify="required|number" placeholder="最低设计费用(单位:元/㎡)" autocomplete="off" class="layui-input">
		    	</div>
		    </div>
		
		    <div class="layui-form-item">
		    	<label class="layui-form-label">最高设计费用：</label>
		    	<div class="layui-input-block">
		        	<input type="number" name="designAmountHigh" required="" lay-verify="required|number" placeholder="最高设计费用(单位:元/㎡)" autocomplete="off" class="layui-input">
		    	</div>
		    </div>
		
		    <div class="layui-form-item">
		      <label class="layui-form-label">设计师职称：</label>
		        <div class="layui-input-block">
		            <select name="positionalTitle" lay-verify="required">
		              <option value=""></option>
		              <option value="0">初级设计师</option>
		              <option value="1">中级设计师</option>
		              <option value="2">高级设计师</option>
		              <option value="3">资深设计师</option>
		              <option value="4">首席设计师</option>
		            </select>
		            <div class="layui-unselect layui-form-select">
		                <div class="layui-select-title">
		                    <input type="text" placeholder="请选择" value="" readonly="" class="layui-input layui-unselect">
		                    <i class="layui-edge"></i>
		                </div>
		                <dl class="layui-anim layui-anim-upbit">
		                    <dd lay-value="" class="layui-select-tips">请选择</dd>
		                    <dd lay-value="0" class="">初级设计师</dd>
		                    <dd lay-value="1" class="">中级设计师</dd>
		                    <dd lay-value="2" class="">高级设计师</dd>
		                    <dd lay-value="3" class="">资深设计师</dd>
		                    <dd lay-value="4" class="">首席设计师</dd>
		                </dl>
		            </div>
		        </div>
		    </div>
		
		    <div class="layui-form-item layui-form-text">
		      <label class="layui-form-label">服务区域：</label>
		      <div class="layui-input-block">
		        <textarea name="serviceAddress" placeholder="多个服务地区则以 ',' 隔开" class="layui-textarea"></textarea>
		      </div>
		    </div>
		
		    <div class="layui-form-item layui-form-text">
		      <label class="layui-form-label">自我介绍：</label>
		      <div class="layui-input-block">
		        <textarea name="introduce" placeholder="请输入内容" oninput="autosize(this)" class="layui-textarea"></textarea>
		      </div>
		    </div>
		
		    <div class="layui-form-item layui-form-text">
		      <label class="layui-form-label">其他记录(比如获奖)：</label>
		      <div class="layui-input-block par">
		      	<span class="layui-btn layui-btn-xs addAttach">添加附件</span>
		        <textarea name="record" placeholder="请输入内容" oninput="autosize(this)" class="layui-textarea textarea-attach"></textarea>
		      </div>
		    </div>
			
		    <div class="layui-form-item">
		      <div class="layui-input-block">
		        <button class="layui-btn" lay-submit="" lay-filter="formSub">立即提交</button>
		        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
		      </div>
		    </div>
		</form>
	</div>
</div>
<%@include file="../common/footer.jsp"%>
<script type="text/javascript" src="<%=basePath%>plugins/layui/layui.js"></script>
<script type="text/javascript">
	layui.use("form",function(){
		var form = layui.form;
		form.on('submit(formSub)', function(data){
			var fields =data.field;
			$.ajax({
				url:"${basePath}user/addDesigner",
				data:fields,
				method:"POST",
				success:function(data){
					if(data.code != '0'){
						layer.msg(data.msg);
					}else{
						layer.confirm("申请成功，您的登录账号为你的申请手机号，密码为手机号后六位，设计师审核结果将发送至你的消息(登录之后可以看在个人中心中查看消息)。",{btn:['进入个人中心','进入网站首页'],btn2:function(){
							location.href="${basePath}";
						}},function(){
							location.href="${basePath}user/personalCenter/"+data.data;
						})
					}
				},
				error:function(err){
					layer.msg("系统异常");
				}
			});
			return false;
		});
	})
	
	$('.addAttach').click(function(){
		var cont = $('.textarea-attach').val();
		MyUtil.upload({url:"<%=basePath%>admin/upload"},function(url,id){
			cont+=' 附件('+id+')地址: <%=filePath%>'+url;
			$('.textarea-attach').val(cont);
		});
	});
	
	function autosize(obj) {
        var el = obj;
        setTimeout(function() {
            el.style.cssText = 'height:auto; padding:0';
            el.style.cssText = 'height:' + el.scrollHeight + 'px';
        }, 0);
    }
</script>