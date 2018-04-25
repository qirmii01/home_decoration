<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/base.jsp"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>设计师审核</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="${basePath}/plugins/layui/css/layui.css" media="all">
	<style>
		body{overflow-y: scroll;}
		.accountTable{
			margin-top: 20px;
			margin-left: 20px;
		}
	</style>
</head>

<body>

<div class="accountTable">
	设计师名称：
	<div class="layui-inline">
		<input class="layui-input" id="designerName" autocomplete="off">
	</div>

	电话号码：
	<div class="layui-inline">
		<input class="layui-input" id="telphone" autocomplete="off">
	</div>
	职称：
	<div class="layui-inline">
		<input class="layui-input" id="positionalTitle" autocomplete="off">
	</div>
	状态：
	<div class="layui-inline">
		<form class="layui-form" action="#">
			<select id="status">
				<option value="">请选择</option>
				<option value="0">待审核</option>
				<option value="1">审核通过</option>
				<option value="2">审核失败</option>
			</select>
		</form>
	</div>

	<button class="layui-btn layui-btn-radius" data-type="reload">搜索</button>
</div>



<table class="layui-hide" id="accountTable" lay-filter="account"></table>



<script type="text/html" id="operationBar">
	{{# if(d.status==='0'){}}
		<button class="layui-btn layui-btn-radius layui-btn-xs" lay-event="through">通过</button>
		<button class="layui-btn layui-btn-radius layui-btn-xs" lay-event="notThrough">不通过</button>
	{{#  } }}
</script>



<script src="${basePath}/plugins/layui/layui.js"></script>
<script src="${basePath}/js/moment.js"></script>
<script>
    layui.use(['table','element','form'],function(){
        var table = layui.table,
            form = layui.form,
            element = layui.element;
        var openLayerIndex;
        var param;
        var data;
        //方法级渲染
        table.render({
            elem: '#accountTable'
            ,url: '${basePath}/admin/queryDesignerCheckInfo'
            ,cols: [[
                {field:'designerName',width:'10%', title: '设计师名称'}
                ,{field:'telphone',width:'10%', title: '电话号码'}
                ,{field:'sex', width:'5%',title: '性别',templet:function (d) {
                    if(d.sex=='0'){
                        return '男';
                    }else{
                        return '女';
                    }

                }}
                ,{field:'serviceAddress', width:'10%',title: '服务地址'}
                ,{field:'introduce', width:'10%',title: '介绍'}
                ,{field:'record', width:'10%',title: '其他记录'}
                ,{field:'positionalTitle', width:'5%',title: '职称'}
                ,{field:'status', width:'8%',title: '状态',templet:function (d) {
                    if(d.status=='0'){
                        return '待审核';
                    }else if(d.status=='1'){
                        return '审核通过';
                    }else{
                        return '审核失败';
					}

                }}
                ,{field:'engageTime', width:'10%',title: '从事设计时间',templet:function (d) {
                    var date =moment(d.engageTime).format('YYYY-MM-DD HH:mm:ss');
                    return date;
                }}
                ,{field:'designAmountLow',width:'10%', title: '最低设计费用'}
                ,{field:'designAmountHigh',width:'10%', title: '最高设计费用'}
                ,{fixed: 'right',width:'15%',title: '操作', toolbar: '#operationBar'}
            ]]
            ,page: true
            ,height: 'full-40'
            ,cellMinWidth: '80'
            ,size:'lg'
        });

        //监听工具条
        table.on('tool(account)', function(obj){
            data = obj.data;
            //通过
            if(obj.event==='through'){
                var loadIndex = layer.load(2, {
                    shade: [0.3, '#333']
                });
                var param={
                    userId:data.userId,
                    designerId:data.designerId,
					status:'1'
				}
                //请求服务器
                $.post("${basePath}/admin/checkDesigner", param, function(res) {
                    loadIndex && layer.close(loadIndex);
                    if (res.code!='0') {
                        layer.msg(res.msg, {
                            icon: 2
                        });
                    } else {
                        loadIndex && layer.close(loadIndex);
                        table.reload('accountTable');
                    }
                }, 'json').error(function(){
                    loadIndex && layer.close(loadIndex);
                    layer.msg("系统异常", {
                        icon: 2
                    });
                });
            }else if(obj.event==='notThrough'){
                var loadIndex = layer.load(2, {
                    shade: [0.3, '#333']
                });

                var param={
                    userId:data.userId,
                    designerId:data.designerId,
                    status:'2'
                }
                //请求服务器
                $.post("${basePath}/admin/checkDesigner", param, function(res) {
                    loadIndex && layer.close(loadIndex);
                    if (res.code!='0') {
                        layer.msg(res.msg, {
                            icon: 2
                        });
                    } else {
                        loadIndex && layer.close(loadIndex);
                        table.reload('accountTable');
                    }
                }, 'json').error(function(){
                    loadIndex && layer.close(loadIndex);
                    layer.msg("系统异常", {
                        icon: 2
                    });
                });
			}
        });

        var $ = layui.$, active = {
            reload: function(){
                //执行重载
                table.reload('accountTable', {
                    url: '${basePath}/admin/queryDesignerCheckInfo'
                    ,page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        designerName: $('#designerName').val()
                        ,telphone:$('#telphone').val()
                        ,positionalTitle:$('#positionalTitle').val()
                        ,status:$('#status').val()
                    }
                });
            }
        };

        $('.accountTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });
</script>
</body>

</html>
