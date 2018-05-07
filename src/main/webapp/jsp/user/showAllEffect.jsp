<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<link href="<%=basePath%>plugins/layui/css/layui.css" rel="stylesheet" type="text/css"/>
<div class="contentpage w1" style="margin-top: 10px;">
    <%@include file="../common/leftInfo.jsp"%>
    <div class="cont_l fr">
        <div class="navhl"><span>透明家装居网设计方案</span></div>
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
$('.nav>ul>li').eq(1).find("a").addClass("navxd");
	layui.use("laypage",function(){
		var laypage = layui.laypage;
		var count =0;
		$.get("countDecorationEffect",function(data){
			count = data.data;
		})
		laypage.render({
			elem:"layPage",
			count:count,
			limit:12,
			curr:1,
			jump: function(obj, first){
				$.ajax({
					url:"<%=basePath%>decoration/queryDecoEffect",
					data:{"page":obj.curr,"limit":obj.limit},
					success:function(d){
						if(d.code == '0'){
							var data = d.data;
							var html ='';
							console.log(data)
							if(data.length != 0 && d.data !='无数据'){
								for(var i =0 ; i <data.length ; i++){
									html+= 
								'<li><div class="piclist_img">'
				                        +'<a href=""><img src="<%=filePath%>/'+data[i].effectSrc+'" width="325" height="210" alt="'+data[i].title+'"/></a>'
				                        +'<div class="piclist_img_a">'+data[i].imgCount+'张</div>'
				                        +'<div class="piclist_img_b"><a href="javascript:designScheme(\''+data[i].id+'\',\''+data[i].title+'\');" target="_blank" title="获取设计方案">获取设计方案</a></div>'
				                    +'</div>'
				                    +'<div class="picont"><div class="piclist_txt">'
				                        +'<a href="" title="'+data[i].designerName+'"><img src="<%=filePath%>/'+data.designerHeader+'" alt="data[i].designerName"></a>'
				                        +'<a href="" class="piclist_txt_link3">'+data[i].designerName+'</a>'
										+'<a href="" title="'+data[i].title+'" class="piclist_txt_link">'+data[i].title+'</a></div>'
				                        +'<div class="piclist_txt">';
				                        if(data[i].decorationEffectKeys){
					                        for(var j=0 ; j<data[i].decorationEffectKeys.length; j++){
						                        html+='<a href="javascript:;" class="piclist_txt_link2">'+data[i].decorationEffectKeys[j].keyWord+'</a>';
					                        }
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
	
	function designScheme(id,title){
    	var load= layer.load();
    	$.ajax({
    		url:"${basePath}decoration/allEffectImgs",
    		data:{id:id,title:title},
    		success:function(data){
    			layer.close(load);
    			if(data.code != '0'){
    				layer.msg(data.msg);
    			}else{
    				var da=data.data;
    				layer.photos({
    				    photos: da,
    				    tab:function(pic, layero){}
    				});
    			}
    		},
    		error:function(err){
    			layer.msg("系统异常");
    		}
    	});
    }
</script>