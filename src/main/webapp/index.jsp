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
	                <div class="plan"><a class="navhl_more_b" href="javascript:void(0)e">我也要免费申请 </a>
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
	            <div class="navhl"><span>业主点评</span> <a href="javascript:;" class="navhl_more_b ask">发表我的评论 >> </a></div>
	            <div class="comment_a">
	                <div class="comment_al">
	                    <div class="comment_al_1"><p>暂无</p>好评数</div>
	                    <ul>
	                        <li>
	                            <p>好评100%</p>
	                            <div class="commenttag_box">
	                                <div class="commenttag_c" style="width:100%"></div>
	                            </div>
	                        </li>
	                        <li>
	                            <p>中评0%</p>
	                            <div class="commenttag_box">
	                                <div class="commenttag_c" style="width:0%"></div>
	                            </div>
	                        </li>
	                        <li>
	                            <p>差评0%</p>
	                            <div class="commenttag_box">
	                                <div class="commenttag_c" style="width:0%"></div>
	                            </div>
	                        </li>
	                    </ul>
	                </div>
	                <div class="comment_ar">
	                    <p>业主给他的标签：</p>
	                    <a href="javascript:;" class="link_b">设计非常专业</a>
	                    <a href="javascript:;" class="link_b">服务贴心</a>
	                    <a href="javascript:;" class="link_b">施工精细</a>
	                    <a href="javascript:;" class="link_b">诚信企业</a>
	                    <a href="javascript:;" class="link_b">价格合理</a>
	                    <a href="javascript:;" class="link_b">质量保证</a>
	                    <a href="javascript:;" class="link_b">质量保障</a>
	                </div>
	            </div>
	            <!-- 代码 开始 -->
	            <div id="tab">
	                <div class="tabList navhl_b">
	                    <ul>
	                        <li class="cur">好评<em>（0条）</em></li>
	                        <li>中评<em>（0条）</em></li>
	                        <li>差评<em>（0条）</em></li>
	                    </ul>
	                </div>
	                <div class="tabCon">
	                    <div class="cur" id="list_fdxx">暂时没有评论</div>
	                    <div id="list_fdxx">暂时没有评论</div>
	                    <div id="list_fdxx">暂时没有评论</div>
	
	                </div>
	            </div>
	            <!-- 代码 结束 -->
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
		                        +'<div class="piclist_img_b"><a href="" target="_blank" title="获取设计方案">获取设计方案</a></div>'
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
							html+=
								'<li><a href="<%=basePath%>user/showDesigner/'+data[i].userId+'" title="'+data[i].userName+'"><img';
								if(data[i].headerImg){
									html+= (' src="<%=filePath%>/'+ data[i].headerImg + '"');
								}
							html+= 'alt="'+data[i].userName+' " title="'+data[i].userName+'"/></a>'
								+'<dl><dt><a href="<%=basePath%>user/designerInfo/'+data[i].userId+'" class="colu_tw_btitle fl">'+data[i].userName+'</a></dt>'
								+'<dt><p>装修案例：</p><span>'+data[i].designNumber+'</span></dt><dt><p style="width: 45px">职称：</p>'
								+'<div class="colu_tw_btxt">'+data[i].positionalTitles+'</div></dt></dl></li>';
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
					var html;
					if(data.length != 0){
						for(var i=0 ;i<data.length; i++){
							html+=
								'<li><div class="welist_r" style="width:900px;"><dl>'
								+'<dd class="d1">问题详情<i>'+data[i].createTime+'</i></dd>'
								+'<dd class="d5"><h3><a href="javascript:void(0)" target="_blank">'+data[i].question+'</a></h3></dd>'
								+'<dd class="d3"><div class="d3p30"><pre>'+data[i].answerContent
								+'</pre></div></dd></dl></div><div class="clear"></div></li>';
						}
					}else{
						html+='<p style="color:#5f5e5e;margin-top:30px;text-align:center;">暂无数据</p>';
					}
					$('.wd_l_list>ul').html(html);
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
    window.onload = function () {
        var oDiv = document.getElementById("tab");
        var oLi = oDiv.getElementsByTagName("div")[0].getElementsByTagName("li");
        var aCon = oDiv.getElementsByTagName("div")[1].getElementsByTagName("div");
        var timer = null;
        for (var i = 0; i < oLi.length; i++) {
            oLi[i].index = i;
            oLi[i].onclick = function () {
                show(this.index);
            }
        }
        function show(a) {
            index = a;
            var alpha = 0;
            for (var j = 0; j < oLi.length; j++) {
                oLi[j].className = "";
                aCon[j].className = "";
                aCon[j].style.opacity = 0;
                aCon[j].style.filter = "alpha(opacity=0)";
            }
            oLi[index].className = "cur";
            clearInterval(timer);
            timer = setInterval(function () {
                        alpha += 2;
                        alpha > 100 && (alpha = 100);
                        aCon[index].style.opacity = alpha / 100;
                        aCon[index].style.filter = "alpha(opacity=" + alpha + ")";
                        alpha == 100 && clearInterval(timer);
                    },
                    5)
        }
    }
    
    $('.navhl_more_b').click(function(){
    	layer.open({
			type:2,
			title:"装修申请",
			area:["840px","316px"],
			scrollbar: false,
			content:'<%=basePath%>decoration/decorationApplyPage'
		});
    })
    
    $('.nav>ul>li').eq(0).find("a").addClass("navxd");
</script>