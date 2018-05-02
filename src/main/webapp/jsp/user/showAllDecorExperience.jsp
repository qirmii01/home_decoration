<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<link href="<%=basePath%>plugins/layui/css/layui.css" rel="stylesheet" type="text/css"/>
<div class="contentpage w1" style="margin-top: 10px;">
    <%@include file="../common/leftInfo.jsp"%>
    <div class="cont_l fr">
        <div class="navhl" id="set_tab">
             <a href="javascript:void(0);" class="active">装修经验列表</a>
         </div>
        <div id="set_tab_c0" class="navhlcont" style="display:block;">
        	<ul></ul>
        </div>
        <!--翻页 开始-->
       	<div id="layPage"></div>
     	<!--推荐效果图结束-->
    </div>
    <!--右边CSS 结束-->
    
</div>

<script type="text/javascript" src="<%=basePath%>plugins/layui/layui.js"></script>
<script type="text/javascript">
$('.nav>ul>li').eq(4).find("a").addClass("navxd");
	layui.use("laypage",function(){
		var laypage = layui.laypage;
		var count =0;
		$.get("countExperience",function(data){
			count = data.data;
		})
		laypage.render({
			elem:"layPage",
			count:count,
			limit:12,
			curr:1,
			jump: function(obj, first){
				$.ajax({
					url:"<%=basePath%>user/queryExperienceLis",
					data:{"page":obj.curr,"limit":obj.limit},
					success:function(d){
						if(d.code == '0'){
							var data = d.data;
							var html ='';
							console.log(data)
							if(data.length != 0 && d.data !='无数据'){
								for(var i =0 ; i <data.length ; i++){
									html+='<li><a href="javascript:show(\''+data[i].id+'\')">'+data[i].title+'</a>'
				                        +'<span>'+millisDateFormat(data[i].createTime,"yyyy-mm-dd")+'</span></li>' 
								}
							}else{
								html+='<p style="color:#5f5e5e;margin-top:10px;text-align:center;">暂无数据</p>';
							}
							$('#set_tab_c0>ul').html(html);
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
	
	function show(id){
		$("#layPage").html('<button class="layui-btn" onclick="<%=basePath%>user/showAllDecorExperience">返回装修经验列表</button>');
		
		$.ajax({
			url:"queryExperience",
			method:"POST",
			data:{"id":''+id.toString()},
			success:function(data){
				console.log(data)
				if(data.code != '0'){
					layer.msg(data.msg);
				}else{
					var da = data.data;
					var contHtml="";
					if(!da){
						contHtml='<p style="color:#5f5e5e;margin-top:20px;text-align:center;">暂无数据</p>';
					}else{
						$('.active').text(da.title);
						$('#set_tab').after('<div class="company-time"><span>作者：<em>${sessionScope.baseInfo.name}</em></span><span>发布时间：<em>'+millisDateFormat(da.createTime,"yyyy年mm月dd日")+'</em></span></div>');
						contHtml = da.content;
					}
					$('#set_tab_c0>ul').html(contHtml);
				}
			}
		});
	}
</script>