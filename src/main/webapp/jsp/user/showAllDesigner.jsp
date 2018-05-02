<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<link href="<%=basePath%>plugins/layui/css/layui.css" rel="stylesheet" type="text/css"/>
<div class="contentpage w1" style="margin-top: 10px;">
    <%@include file="../common/leftInfo.jsp"%>
    <div class="cont_l fr">
        <div class="navhl"><span>透明家装居网设计师</span></div>
        <div class="piclist list_border" style="">
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
										+'<dl><dt>'+data[i].designNumber+'</dt><dd>案例</dd></dl></div></div><div class="designerlist_r"><div class="designerlist_r_a">'
										+'<span><a href="<%=basePath%>user/designer/'+data[i].userId+'" title="'+data[i].userName+' ">'+data[i].userName+' </a></span>'
										+'<div class="fr"><a class="gr" href="javascript:;" onclick="helpDesign(\''+data[i].userId+'\')">找TA设计</a>'
										+'</div></div><div class="designerlist_r_b"><dl><dt><span>所属公司：</span><span>${sessionScope.baseInfo.name}</span></dt><dt><span>设计风格：</span>';
										for(var j =0 ;j <data[i].designerStyles.lenght; j++){
											html+='<span>'+data[i].designerStyles[j].styleName+'</span>&nbsp;&nbsp;&nbsp;';
										}
										html+='<dt><span>精选案例：</span></dt></dl> </div><div class="designerlist_r_c">';
										for(var k=0 ; k< data[i].showImgs.length; k++){
											html+='<a href="javascript:void(0)" title="'
											+data[i].showImgs[k].title+'"><img src="<%=filePath%>'+data[i].showImgs[k].imgPath+'" alt="'+data[i].showImgs[k].title+'"></a>';
										}
										html+='</div></div></li>';
								}
							}else{
								html+='<p style="color:#5f5e5e;margin-top:10px;text-align:center;">暂无数据</p>';
							}
							$('.piclist>ul').html(html);
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
</script>