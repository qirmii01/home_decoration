<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="jsp/common/header.jsp"%>
<link rel="stylesheet" href="<%=basePath%>plugins/layui/css/layui.css">
<div class="al1l w">
	<a href="javascript:;">
    <img src="<%=filePath%>${sessionScope.baseInfo.bannerPath}" alt="" class="banner_img" style="width: 1220px;max-height: 300px;"/></a>
	<div class="home_main w" style="margin-top: 10px;">
	    <!--站内导航CSS 结束-->
	    <div class="contentpage w1">
	        <%@include file="jsp/common/leftInfo.jsp"%>
	        <div class="cont_l fr main_content_r ">
	            <div class="navhl_c">
	                <div class="path">
	                    <ul>
	                        <li>
	                            <div class="jzwicon29"></div>
	                            免费量房
	                        </li>
	                        <li>
	                            <div class="jzwicon30"></div>
	                            免费设计
	                        </li>
	                        <li>
	                            <div class="jzwicon31"></div>
	                            免费报价
	                        </li>
	                        <li>
	                            <div class="jzwicon32"></div>
	                            送施工监理
	                        </li>
	                        <li>
	                            <div class="jzwicon33"></div>
	                            参观工地
	                        </li>
	                    </ul>
	                </div>
	                <div class="path1">
	                    <div class="fl w650">
	                        <div class="jzwicon34"></div>
	                        <p><em>透明家装：</em>通过透明家装网平台预约的业主，独享本品牌智能装修报价及透明家装网会员特权免费量房设计等以上服务 ,优惠，省钱、省心、还省时！</p>
	                    </div>
	                </div>
	            </div>
	            <div class="path2 mt20">
	                <h2>最近量房申请</h2>
	                <div class="plan"><a class="navhl_more_b free-apply" href="javascript:void(0)e">我也要免费申请 </a>
	                    <span><a href="<%=basePath%>decoration/allApply" target="_blank">查看所有申请 &gt;&gt;</a></span>
	                    <div></div>
	                </div>
	            </div>
	            <div class="form" style="border:none;">
	            	<div id="applyTable" style="display:none;"></div>
	            </div>
	            <div class="navhl mt20"><span>所有装修效果图</span>
	                <a href="<%=basePath%>user/showAllEffect" class="navhl_more">查看全部装修效果图 &gt;&gt;</a>
	            </div>
	            <!--图片列表  开始-->
	            <div class="piclist">
	                <ul></ul>
	            </div>
	                        <!--图片列表  结束-->
	            <div class="mt2 cl"></div>
	            <div class="navhl"><span>设计师</span>
	                <a href="<%=basePath%>user/showAllDesigner" class="navhl_more">查看全部设计师 &gt;&gt;</a>
	            </div>
	
	            <!--图文信息混排 开始-->
	            <div class="colu_tw_b">
	                <ul></ul>
	            </div>
	                        <!--图文信息混排 结束-->
	
	            <!--问答动态-->
	            <div class="navhl"><span>问答动态</span></div>
	                <div class="wd">
	                    <div class="wd_l_list wdxq_da_ren">
	                        <ul></ul>
	                    </div>
	                </div>            
	            <div class="navhl"><a href="javascript:;" class="navhl_more_b ask">发表我的问题 >> </a></div>
	        </div>
	    </div>
	</div>
</div><!-- end warp -->

<%@include file="jsp/common/footer.jsp"%>

<div class="floating_ck" style="">
	<dl>
		<dd class="return" style="display: block;">
            <div onclick="window.scrollTo(0,0);return false;">
                <i class="con_04"></i>
                <span>返回顶部</span>
            </div>
        </dd>
	</dl>
</div>
<script type="text/javascript" src="<%=basePath%>plugins/layui/layui.js"></script>
<script>
	/** 装修申请初始化  **/
	function initDecorApply(){
		var tableWidth = $('.main_content_r .form').width();
		layui.use("table",function(){
			var table = layui.table;
			table.render({
				id: "dec-apply-table",
				elem:"#applyTable",
				url:"<%=basePath%>decoration/decorationApplyLis",
				where:{"queryAll":false},
				width: tableWidth,
				response:{dataName:'data'},
				cols:[[
						{field:'type', title: '装修类型', align:"center", width:'16%', templet: function(d){
							if(d.type == '0'){
								return '面议';
							}else if(d.type == '1'){
								return '半包';
							}else if(d.type == '2'){
								return '全包';
							}
							return '[无效数据]';
						}},
						{field:'budgetAmount', title: '装修预算', align:"center", width:'16%', templet: function(d){
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
						{field:'area', title: '项目大小', align:"center", width:'18%', templet : function(d){
							return d.area + '&nbsp;㎡';
						}},
						{field:'userName', title: '业主姓名', align:"center", width:'16%', templet :function(d){
							var name = d.userName;
							if(!name){
								return "[暂无]";
							}
							if(d.sex){
								name = d.userName.substring(0,1);
								if(d.sex == 0){
									name+='先生';
								}
								if(d.sex == 0){
									name+='女士';
								}
							}
							return name;
						}},
						{field:'telphone', title: '联系方式', align:"center", width:'17%'},
						{field:'publishTime', title: '发布时间', align:"center", width:'17%'}
				     ]],
				  done:function(res,curr,count){
					  
				  }
			});
		});
		
	}
	
	/** 装修效果初始化  **/
	function initDecorEffect(){
		$.ajax({
			url:"<%=basePath%>decoration/queryDecoEffect",
			data : {"page":1,"limit":3},
			success:function(r){
				var data = r.data;
				if(r.code == '0'){
					var html ='';
					if(data.length != 0 && data!='无数据'){
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
						html+='<p style="color:#5f5e5e;margin-top:30px;text-align:center;">暂无数据</p>';
					}
					$('.piclist>ul').html(html);
				}
			},
			error:function(err){
				console.log(err);
			}
		});
	}
	
	/** 设计师列表初始化  **/
	function initDesignerLis(){
		$.ajax({
			url:"<%=basePath%>user/queryDesigner",
			data:{"page":1,"limit":5},
			success:function(r){
				var data = r.data;
				if(r.code == '0'){
					var html="";
					if(data.length != 0){
						for(var i=0; i<data.length; i++){
							html+='<li><a href="${basePath}user/designerDetailInfo/'+data[i].userId+'" target="_blank" title="'+data[i].userName+'"><img';
								if(data[i].headerImg){
									html+= (' src="<%=filePath%>/'+ data[i].headerImg + '"');
								}
							html+= 'alt="'+data[i].userName+' " target="_blank" title="'+data[i].userName+'"/></a>'
								+'<dl><dt><a href="${basePath}user/designerDetailInfo/'+data[i].userId+'" class="colu_tw_btitle fl">'+data[i].userName+'</a></dt>'
								+'<dt><p>装修案例：</p><span>'+data[i].designNumber+'</span></dt><dt><p style="width: 45px">职称：</p>'
								+'<div class="colu_tw_btxt">'+data[i].positionalTitles ? data[i].positionalTitles:""+'</div></dt></dl></li>';
						}
					}else{
						html+='<p style="color:#5f5e5e;margin-top:30px;text-align:center;">暂无数据</p>';
					}
				}
				$('.colu_tw_b>ul').html(html);
			},
			error:function(err){
				console.log(err);
			}
		});
	}
	
	/** 问答动态初始化  **/
	function initQuestion(){
		$.ajax({
			url:"<%=basePath%>question/queryQuestionAndAnswer",
			data:{"page":1,"limit":4},
			success:function(r){
				if(r.code == '0'){
					var data = r.data;
					console.log(data)
					var html='';
					if(data.length != 0){
						for(var i=0 ;i<data.length; i++){
							html+='<li><div class="welist_r" style="width:900px;"><dl>'
								+'<dd class="d1">问题详情<i>'+millisDateFormat(data[i].createTime, "yyyy-MM-dd")+'</i></dd>'
								+'<dd class="d5"><h3><a href="javascript:void(0)" target="_blank">'+data[i].content+'</a></h3></dd>';
								if(data[i].questionAnswers.length != 0){
									html+='<dd class="d3"><div class="d3p30"><pre>'+data[i].questionAnswers[0].answerContent+'</pre></div></dd></dl>';
								}
								html+='<div class="fr"><a class="answer" question-id="'+data[i].id+'">我来回答</a></div></div><div class="clear"></div></li>';
						}
					}else{
						html+='<p style="color:#5f5e5e;margin-top:30px;text-align:center;">暂无数据</p>';
					}
					$('.wd_l_list>ul').html(html);
					
					$('.answer').click(function(){
						var questionId = $(this).attr("question-id");
						var load = layer.load();
						layer.prompt({
							title:"回答问题",
							area:['580px','380px'],
							formType:2
						},function(value,index,elem){
							$.ajax({
								url:"${basePath}question/addAnswer",
								data:{answerContent:value,questionId:questionId},
								method:"POST",
								success:function(data){
									if(data.code != '0'){
										layer.msg(data.msg);
									}else{
										layer.alert("回答完成",function(){
											location.reload();
										})
									}
								},
								error:function(err){
									layer.close(load);
									layer.msg("系统异常")
								}
							})
						});
					});
				}
			},
			error:function(err){
				$('.wd_l_list>ul').html('<p style="color:#5f5e5e;margin-top:30px;text-align:center;">暂无数据</p>');
				console.log(err);
			}
		});
	}
	
	$(function(){
		initDecorApply();
		initDecorEffect();
		initDesignerLis();
		initQuestion();
	});

   
</script>
<script type="text/javascript">
    $(window).on('scroll resize', function () {
        $('.floating_ck').show();
        if ($(window).scrollTop() > 273) {
            $('.return').show();
        } else {
            $('.return').hide();
        }
    });

</script>
</body>
</html>
<script type="text/javascript">
    $('.free-apply').click(function(){
    	layer.open({
			type:2,
			title:"装修申请",
			area:["840px","316px"],
			scrollbar: false,
			content:'<%=basePath%>decoration/decorationApplyPage'
		});
    })
    
    $('.nav>ul>li').eq(0).find("a").addClass("navxd");
    
    $('.ask').click(function(){
    	var load = layer.load();
    	layer.prompt({
    		title:"<center>提问</center>",
    		area:['580px','320px'],
    		formType:2
    	},function(value, index, elem){
    		$.ajax({
    			url:"${basePath}question/addQuestion",
    			method:"POST",
    			data:{content:value},
    			success:function(data){
    				if(data.code!= '0'){
    					layer.msg(data.msg);
    				}else{
    					layer.alert("添加问题完成",function(){
    						location.reload();
    					});
    				}
    			}
    		});
    	});
    });
    
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