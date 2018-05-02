<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String leftInfoFilePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();%>
<div class="cont_r fl">
    <div class="companyinfo">
        <div class="companyinfo_a">
            <img src="<%=leftInfoFilePath%>${sessionScope.baseInfo.logoPath}">
            <span class="name">透明家装</span>
            <i class="jzicon6"></i>
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
                        ${sessionScope.baseInfo.phone}
                        </span></li>
                <li>
                    <div class="fl">服务区域：</div>
                    <span>${sessionScope.baseInfo.serviceArea}</span></li>
                <li>
                    <div class="fl">注册资金：</div>
                    <span>100万</span></li>
                <li>
                    <div class="fl">公司地址：</div>
                    <span>${sessionScope.baseInfo.address}</span></li>

            </ul>
        </div>
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