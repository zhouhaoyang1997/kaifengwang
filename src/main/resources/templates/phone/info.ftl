<#include "defaultLayout/defaultLayout.ftl">
<#assign base="${request.contextPath}"/>
<@header siteName="开封麦芒网" base_css=["global","style","info","bxSlider"] base_keywords="开封麦芒网">
<link rel="stylesheet" href="${base}/css/font-awesome.min.css">
</@header>

<@body title="详细信息" back=true>
<div id="contactbar">
    <a href="/m/index" class="bottom_index_on">首页</a>
    <a href="/m/user/index" class="bottom_member">我的</a>
    <a href="#" class="bottom_history">推送</a>
    <a href="${baseUrl}/m/push/choose" class="bottom_post">发布</a>
</div>
<div class="tit_area">
    <h1 class="tit"><#if info.piTitle?length gt 13>${info.piTitle[0..10]}...<#else>${info.piTitle}</#if>
        <span class="date-title">更新:${info.piPushDate?string("yyyy-MM-dd")}</span></h1>

    <div class="status_bar">
        <span class="data-user">${info.piUser}</span>
         <span class="date-title"> 浏览:${info.piScan}人</span>


        <span class="date-title" style="margin-right: 5px" id="collect">
            <#if collected>
                <i class="fa fa-calendar"></i> 已收藏
            <#else>
                <a href="javascript:;" id="phone_collect"><i class="fa fa-calendar"></i> 收藏</a>
            </#if>
            </span>
    </div>
</div>
<div class="image_area_w">
    <div class="image_area">
        <ul class="slider7">
            <#if info.piImg??>
                <#list info.piImg?split("#") as piImg>
                    <li class="slide" style="width: 100%;"><img src="${base}/${piImg}" class="img-thumbnail" width="220" /></li>
                </#list>
            <#else>
                <li class="slide" style="width: 100%;"><img src="${base}/img/noimage.png" class="img-thumbnail" width="220"/></li>
            </#if>
        </ul>
        <div class="panel_num"></div>
    </div>
</div>
<#--此处写属性-->
<ul class="attr_info" style="margin-top:0;min-height: 100px">
        <li><span class="attrName2">地区:</span ><span class="attrVal">${info.piDistrictName}</span></li>
        <#list info.tagValues as tv>
            <li><span class="attrName2">${tv.tagName}:</span><span class="attrVal">${tv.tcName}</span></li>
        </#list>
        <#list info.otherInfos as oi>
            <li><span class="attrName2">${oi.picName}:</span><span class="attrVal">${oi.pcContent}</span></li>
        </#list>
</ul>

<ul class="attr_info bottom" style="margin-top:0;min-height: 100px">
        <li style="float: none;width: 100%;">
            <span class="attrName">联系 Q Q：</span>
            <span class="attrVal">${info.piQq!""}</span>
        </li>
        <li style="float: none;width: 100%;">
            <span class="attrName">地址：</span>
            <span class="attrVal"> ${info.piAddress!""}</span>
        </li>
        <li style="float: none;width: 100%;">
            <#--注意-->
                <span class="attrName">联系电话：</span>
        <span class="attrVal"><a class="fred" href="tel:${info.piPhone}">${info.piPhone}</a>&nbsp;&nbsp;${info.piContactPerson}</span>
        </li >

        <li style="float: none;width: 100%;">
        <p class="mt10">
        <a href="tel:${info.piPhone}" class="fangico dianhua">拨打电话</a>
        <a href="sms:${info.piPhone}" class="fangico duanxin">短信咨询</a>
        </p>
        </li>

</ul>

<div class="detail-tit">详细描述</div>
<div class="detail_txt_che">
    <p align="left">
        <span style="font-size:15.0pt;font-family:宋体;color:#333333;background:white;">
        ${info.piContent}
        </span>
    </p><br/>联系我时，请说是在五网看到的。
</div>

    <#if company??>
<div class="detail-tit">公司介绍</div>
<div class="detail_txt_che">

    <h4>公司名称:${company.cpName}</h4>
    <#if company.cpDescription??>
        <div style="min-height: 250px;">
            <p><span style="color: #aaa;">公司描述</span>${company.cpDescription!""}</p>
        </div>
    <#else>
        该公司暂未更新公司描述!
    </#if>
    <div class="row">
        <#if company.cpImg??>
            <#list company.cpImg?split("#") as imgUrl>
                <div class="col-xs-3">
                    <img src="${base}/${imgUrl}" alt="">
                </div>
            </#list>
        </#if>
    </div>
</div>
    </#if>

</@body>

<@footer base_js=["jq_min.211_1","common_1","bxslider"]>

<script>
    $(document).ready(function(){
        $('.slider7').bxSlider({
            slideWidth: 600,
            slideMargin: 10
        });
    });
    $(function () {
        $("#phone_collect").click(function () {
            $.ajax({
                url:'${base}/collect?piId=${info.piId}',
                type:'get',
                success:function (result) {
                    var res=result.split(":");
                    if(res[0]=="ok"){
                        $("#collect").html('<i class="fa fa-calendar"></i> 已收藏');
                    }
                    if(res[0]=="nol"){
                        window.location.href="${base}/m/login?path=${base}/m/info?piId=${info.piId}";
                    }
                    else{
                        alert(res[1]);
                    }
                }
            })
        })
    })



</script>
</@footer>

<#--自定义脚本区-->
