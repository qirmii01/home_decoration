<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="jsp/common/header.jsp"%>
<link rel="stylesheet" href="<%=basePath%>plugins/layui/css/layui.css">
<div class="al1l w">
	<a href="javascript:;">
    <img src="http://img.jiazhuang.com/Uploads/user/2018-03-14/5aa87c954d0b1.png" alt="" class="banner_img" style="width: 1220px;max-height: 300px;"/></a>
	<div class="home_main w">
	    <!--站内导航CSS 结束-->
	    <div class="contentpage w1">
	        <div class="cont_r fl">
	    <div class="companyinfo">
	        <div class="companyinfo_a">
	            <img src="http://img-resize.jiazhuang.com/Uploads/news/2017-08-23/599d31ab7a64c.png@!200_200_jz">
	            <span class="name">透明家装</span>
	            <i class="jzicon6"></i>
	        </div>
	        <div class="companyinfo_b">
	            <dl>
	                <dt>126</dt>
	                <dd>口碑值</dd>
	            </dl>
	            <dl>
	                <dt>95%</dt>
	                <dd>好评率</dd>
	            </dl>
	            <dl>
	                <dt>11</dt>
	                <dd>预约</dd>
	            </dl>
	        </div>
	        <div class="companyinfo_c">
	            <ul>
	                <li>
	                    <div class="fl">公司营业执照认证：</div> <div class="jzicon7"></div>
	                </li>
	                <li>
	                    <div class="fl">家装网保障协议商户：</div>
	                    <div class="jzicon8"></div>
	                </li>
	                <li>
	                    <div class="fl">支持免费量房：</div>
	                    <div class="jzicon9"></div>
	                </li>
	                <li>
	                    <div class="fl">支持先行赔付：</div>
	                                            <div class="jzicon10_">赔</div>                </li>
	                <li>
	                    <div class="fl">支持满意后付款：</div>
	                    <div class="jzicon11"></div>
	                </li>
	            </ul>
	        </div>
	        <div class="companyinfo_d">
	            <ul>
	                <li>
	                    <div class="fl">联系电话：</div>
	                    <span>
	                        400-889-7706
	                        </span></li>
	                <li>
	                    <div class="fl">服务区域：</div>
	                    <span>郫县,成华区,高新,锦江区,金牛区,龙泉驿区,青羊区,青白江区,双流县,天府新区,武侯区,温江区,新都区,新津县</span></li>
	                <li>
	                    <div class="fl">注册资金：</div>
	                    <span>100万</span></li>
	                <li>
	                    <div class="fl">公司地址：</div>
	                    <span>东三环路五段外侧辅道悦来街59号大观茗筑</span></li>
	
	            </ul>
	        </div>
	    </div>
		<div class="companyinfo activity mt20" style="display: none">
					     <h3>装修公司最新优惠活动<a>查看更多>></a></h3>
						 <span>2016年开年钜惠</span>
						 <p>后期问题多多多多，人生第一次装修学费交了后期问题多多多多，人生第一次装修学费交了后</p>
					</div>
	    <div class="freeapply">
	        <input type="text" name="chenghu" value="您的称呼" data-value="您的称呼" placeholder="您的称呼" class="search_txt"/>
	        <input type="text" name="mobile" value="手机号码（必填）" data-value="手机号码（必填）" placeholder="手机号码（必填）" class="search_txt"/>
	        <input type="hidden" name="conID" value="14178">
	        <input type="hidden" name="siteID" value="17">
	        <input type="hidden" name="position" value="15" placeholder="申请位置">
	        <input type="hidden" name="b_type" value="1"  placeholder="免费设计">
	        <a href="javascript:;" id="bidBtn" class="freeapply_btn">立即免费申请</a>
	        <dl>
	            <dt>申请装修步骤</dt>
	            <dd>第一步：填写申请</dd>
	            <dd>第二步：装修公司免费量房和设计</dd>
	            <dd>第三步：装修公司报价</dd>
	            <dd>承诺：以上服务绝对不收取任何费用。</dd>
	        </dl>
	    </div>
	</div>
	
	<!--左边CSS 结束-->
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
	                        <p><em>透明家装：</em>通过家装网平台预约的业主，独享本品牌智能装修报价及家装网会员特权免费量房设计等以上服务 ,优惠，省钱、省心、还省时！</p>
	                    </div>
	                </div>
	            </div>
	            <div class="path2 mt20">
	                <h2>最近量房申请</h2>
	                <div class="plan"><a class="navhl_more_b" href="../../baojia/index.html">我也要免费申请 </a>
	                    <span><a href="<%=basePath%>decoration/allApply" target="_blank">查看所有申请 &gt;&gt;</a></span>
	                    <div></div>
	                </div>
	            </div>
	            <div class="form" style="border:none;">
	            	<div id="applyTable" style="display:none;"></div>
	            </div>
	            <div class="navhl mt20"><span>所有装修效果图</span>
	                <a href="" class="navhl_more">查看全部装修效果图 >></a>
	            </div>
	            <!--图片列表  开始-->
	            <div class="piclist">
	                <ul></ul>
	            </div>
	                        <!--图片列表  结束-->
	            <div class="mt2 cl"></div>
	            <div class="navhl"><span>设计师</span>
	                <a href="" class="navhl_more">查看全部设计师 >></a>
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

	<div class="friend_link">
	    <div class="box">
	        <div class="link">
	            <div class="title">
	                <ul>
	                                        <li id="link_2">热门城市</li>                </ul>
	            </div>
	
	            <div class="list" id="link_content_2" style="display:none;">
	                                        <a href="http://xm.jiazhuang.com" target="_blank">厦门装修</a>|                        <a href="http://bj.jiazhuang.com" target="_blank">北京装修</a>|                        <a href="http://tj.jiazhuang.com" target="_blank">天津装修</a>|                        <a href="http://sh.jiazhuang.com" target="_blank">上海装修</a>|                        <a href="http://cq.jiazhuang.com" target="_blank">重庆装修</a>|                        <a href="http://sjz.jiazhuang.com" target="_blank">石家庄装修</a>|                        <a href="http://km.jiazhuang.com" target="_blank">昆明装修</a>|                        <a href="http://sz.jiazhuang.com" target="_blank">深圳装修</a>|                        <a href="http://nj.jiazhuang.com" target="_blank">南京装修</a>|                        <a href="http://suzhou.jiazhuang.com" target="_blank">苏州装修</a>|                        <a href="http://hz.jiazhuang.com" target="_blank">杭州装修</a>|                        <a href="http://fz.jiazhuang.com" target="_blank">福州装修</a>|                        <a href="http://cd.jiazhuang.com" target="_blank">成都装修</a>|                        <a href="http://wh.jiazhuang.com" target="_blank">武汉装修</a>|                        <a href="http://cs.jiazhuang.com" target="_blank">长沙装修</a>|                        <a href="http://chchu.jiazhuang.com" target="_blank">长春装修</a>|                        <a href="http://dg.jiazhuang.com" target="_blank">东莞装修</a>|                        <a href="http://guangzhou.jiazhuang.com" target="_blank">广州装修</a>|                        <a href="http://guiyang.jiazhuang.com" target="_blank">贵阳装修</a>|                        <a href="http://hefei.jiazhuang.com" target="_blank">合肥装修</a>|                        <a href="http://nanning.jiazhuang.com" target="_blank">南宁装修</a>|                        <a href="http://ningbo.jiazhuang.com" target="_blank">宁波装修</a>|                        <a href="http://qingdao.jiazhuang.com" target="_blank">青岛装修</a>|                        <a href="http://shenyang.jiazhuang.com" target="_blank">沈阳装修</a>|                        <a href="http://taiyuan.jiazhuang.com" target="_blank">太原装修</a>|                        <a href="http://xa.jiazhuang.com" target="_blank">西安装修</a>|                        <a href="http://zhengzhou.jiazhuang.com" target="_blank">郑州装修</a>|                        <a href="http://zhongshan.jiazhuang.com" target="_blank">中山装修</a>|            </div>
	
	        </div>
	        <div class="weibo">
	
	            <div class="wb_pub">
	                <span class="t1">微信公众号</span>
	                <p><img src="http://static.jiazhuang.com/Public/Home/version_2/images/pub_bg.jpg" width="96" height="96"/></p>
	            </div>
	
	            <div class="wb_pub">
	                <span class="t1">家装网APP下载</span>
	                <p><img src="http://static.jiazhuang.com/Public/Home/version_2/images/pub_app.jpg" width="96" height="96"/></p>
	            </div>
	
	            <div class="wb_tel">
	                <span>联系客服</span>
	                <ul>
	                    <li>周一至周日：08:00-22:00</li>
	                    <li>全国统一服务热线：</li>
	                    <li>400-889-7706</li>
	                </ul>
	                <div class="ser_btn">
	                    <blockquote>
	                        <p><a href="http://wpa.qq.com/msgrd?v=3&uin=2010749522&site=qq&menu=yes" target="_blank"
	                              class="btn">在线咨询</a></p>
	                    </blockquote>
	                </div>
	            </div>
	
	        </div>
	    </div>
	</div><!-- end friend_link -->

	<footer class="footer">
	
	    <!-- end box -->
	
	    <div class="box">
	        <div class="icon">
	            <div class="list">
	                <a href="../../about/index.html" target="_blank" rel="nofollow"><i class="icon1"></i>公司介绍<em></em></a>
	                <a href="../../dongtai/index.html" target="_blank" rel="nofollow"><i class="icon2"></i>企业动态<em></em></a>
	                <a href="../../contact/index.html" target="_blank" rel="nofollow"><i class="icon3"></i>联系我们<em></em></a>
	                <a href="../../join/index.html" target="_blank" rel="nofollow"><i class="icon4"></i>加入我们<em></em></a>
	                <a href="../../fukuan/index.html" target="_blank" rel="nofollow"><i class="icon5"></i>付款方式<em></em></a>
	                <a href="../../agreement/index.html" target="_blank" rel="nofollow"><i class="icon6"></i>用户协议<em></em></a>
	                <a href="../../sitemap/index.html" target="_blank" rel="nofollow"><i class="icon7"></i>网站地图</a>
	            </div>
	        </div>
	        <div class="copyright">
	            <ul>
	                <li>免责声明：本网站部分内容由用户自行上传，如权利人发现存在误传其作品情形，请及时与本站联系</li>
	                <li>家装网 保留所有权利 ©2005- 2017 jiazhuang.com</li>
	                <li>厦门大加盈网络科技有限公司 <a href="http://www.miitbeian.gov.cn">闽ICP备16003468号-2</a></li>
	            </ul>
	        </div>
	        <div class="icpico">
	            <a href="javascript:;" class="ico1"></a>
	            <a href="javascript:;" class="ico2"></a>
	            <a href="javascript:;" class="ico3"></a>
	            <a key="574d6cb4efbfb00a5a3c3f7a" logo_size="83x30" logo_type="realname" rel="nofollow"
	               href="https://v.pinpaibao.com.cn/authenticate/cert/?site=www.jiazhuang.com&amp;at=realname"
	               target="_blank">
	                <b id="aqLogoOPVTR" style="display: none;"></b>
	                <img src="http://static.anquan.org/static/outer/image/sm_83x30.png?id=www.jiazhuang.com?t=6" alt="安全联盟认证"
	                     width="83" height="30" style="border: none;">
	            </a>
	        </div>
	    </div><!-- end box -->
	
	</footer><!-- end footer -->

</div><!-- end warp -->


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
<<script type="text/javascript" src="<%=basePath%>plugins/layui/layui.js"></script>
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
				response:{dataName:'body'},
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
							if(d.sex){
								name = d.userName.substring(0,1);
								name += (d.sex == 0? '先生' : '女士');
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
		var pageObj={};
		pageObj.pageSize = 3;
		$.ajax({
			url:"<%=basePath%>decoration/queryDecoEffect",
			data : pageObj,
			success:function(r){
				var data = r.body;
				if(r.code == '0'){
					var html ='';
					if(data.length != 0){
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
		                        for(var j=0 ; j<data[i].decorationEffectKeys.length; j++){
			                        html+='<a href="javascript:;" class="piclist_txt_link2">'+data[i].decorationEffectKeys[j].keyWord+'</a>';
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
		var pageObj={};
		pageObj.pageSize = 5;
		$.ajax({
			url:"<%=basePath%>user/queryDesigner",
			data:pageObj,
			success:function(r){
				var data = r.body;
				if(r.code == '0'){
					var html="";
					if(data.length != 0){
						for(var i=0; i<data.length; i++){
							html+=
								'<li><a href="<%=basePath%>user/showDesigner/'+data[i].userId+'" title="'+data[i].userName+'">'
							+'<img src="<%=filePath%>/'+data[i].headerImg+'" alt="'+data[i].userName+' " title="'+data[i].userName+'"/></a>'
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
			data:{"start":0,"end":4},
			success:function(r){
				if(r.code == '0'){
					var data = r.body;
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
</script>