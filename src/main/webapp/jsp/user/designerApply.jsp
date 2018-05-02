<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/base.jsp"%>
<style>
	.par{postion:relative;}
	.addAttach{position:absolute;top:0;right:0;}
</style>
<div class="designer-apply">
	<div class="locat"><span><a href="<%=basePath%>">首页</a></span>&nbsp;&gt;&nbsp;<span>设计师申请</span></div>
	<div class="apply-cont">
		<form class="layui-form" action="<%=basePath%>user/designerApply">
	    	<div class="layui-form-item">
				<label class="layui-form-label">手机号</label>
				<div class="layui-input-block">
					<input type="text" name="telphone" required="" lay-verify="required|phone" placeholder="请输入常用手机号" autocomplete="off" class="layui-input">
				</div>
		    </div>
		
		    <div class="layui-form-item">
		    	<label class="layui-form-label">从事设计时间</label>
		    	<div class="layui-input-block">
		        	<input type="number" name="engageTime" required="" lay-verify="required|number" placeholder="从事设计的时间" autocomplete="off" class="layui-input">
		    	</div>
		    </div>
		
		    <div class="layui-form-item">
		    	<label class="layui-form-label">最低设计费用</label>
		    	<div class="layui-input-block">
		        	<input type="number" name="designAmountLow" required="" lay-verify="required|number" placeholder="最低设计费用" autocomplete="off" class="layui-input">
		    	</div>
		    </div>
		
		    <div class="layui-form-item">
		    	<label class="layui-form-label">最高设计费用</label>
		    	<div class="layui-input-block">
		        	<input type="number" name="designAmountHigh" required="" lay-verify="required|number" placeholder="最高设计费用" autocomplete="off" class="layui-input">
		    	</div>
		    </div>
		
		    <div class="layui-form-item">
		      <label class="layui-form-label">设计师职称</label>
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
		      <label class="layui-form-label">服务区域</label>
		      <div class="layui-input-block">
		        <textarea name="serviceAddress" placeholder="请输入内容" class="layui-textarea"></textarea>
		      </div>
		    </div>
		
		    <div class="layui-form-item layui-form-text">
		      <label class="layui-form-label">自我介绍</label>
		      <div class="layui-input-block">
		        <textarea name="introduce" placeholder="请输入内容" oninput="autosize(this)" class="layui-textarea"></textarea>
		      </div>
		    </div>
		
		    <div class="layui-form-item layui-form-text">
		      <label class="layui-form-label">其他记录(比如获奖)</label>
		      <div class="layui-input-block par">
		      	<button class="layui-btn layui-btn-xs addAttach">添加附件</button>
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
		form.on('submit(formSub)', function(data){
			var fields =data.field;
			console.log(fields)
		});
	})
	
	$('.addAttach').click(function(){
		var cont = $('.textarea-attach').val();
		MyUtil.upload({url:"<%=basePath%>admin/upload"},function(url,id){
			cont+='/n&nbsp;&nbsp;&nbsp;附件('+id+')地址:&nbsp;<%=filePath%>'+url;
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