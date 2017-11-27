<#include "defaultLayout/defaultLayout.ftl">
<#assign baseUrl = "${request.contextPath}"/>
<@header siteName="开封麦芒网" base_css=["global","style","index","all","bootstrap.min"] base_keywords="开封麦芒网">
<link rel="stylesheet" href="${baseUrl}/css/font-awesome.min.css">
<style>
    a{
        color: #ff552e;
    }
</style>
</@header>


<@body title="麦芒网">
<div id="contactbar">
    <a href="/m/index" class="bottom_index_on">首页</a>
    <a href="/m/user/info" class="bottom_member">我的</a>
    <a href="#" class="bottom_history">推送</a>
    <a href="${baseUrl}/m/push/choose" class="bottom_post">发布</a>
</div>
<!--广告页-->
<section>
    <div id="slide" style="display:none;">
        <div id="content">
            <div class="cell">
                <a href="#"><img width="100%" height="144px" src="../img/phone/pic/center.jpg" alt="开封城市网招商"></a>
            </div>
            <div class="cell">
                <a href="#"><img height="144px" src="../img/phone/pic/2.jpg" alt="河南大学广告"></a>
            </div>
            <div class="cell">
                <a href="#"><img height="144px" src="../img/phone/pic/3.jpg" alt="河南省开封市"></a>
            </div>
        </div>
        <!--子组件-->
        <ul id="indicator"></ul>
    </div>
    <span class="prev" id="slide_prev" style="display:none">上一张</span><span class="next" id="slide_next"
                                                                            style="display:none">下一张</span>
</section>
<div class="clear"></div>
<div class="mod_02" id="myPicsrc">
    <div class="bd tab-cont">
        <ul class="list_normal list_news">
        </ul>
    </div>
</div>
<div class="index-category">
    <div class="index_slider">
        <div class="index_slider-wrap">
            <div class="page">
                <a href="${baseUrl}/m/list?mcId=1" class="item food">
                    <div class="icon"><img src="${baseUrl}/img/zp_icon.png" class="img-thumbnail" alt=""></div>
                    招聘</a>
                <a href="${baseUrl}/m/list?mcId=3" class="item food">
                    <div class="icon"><img src="${baseUrl}/img/kf_ershou.png" class="img-thumbnail" alt=""></div>
                    二手市场</a>
                <a href="${baseUrl}/m/list?mcId=2" class="item food">
                    <div class="icon"><img src="${baseUrl}/img/kf_fangchan.png" class="img-thumbnail" alt=""></div>
                    房产</a>
                <a href="${baseUrl}/m/list?mcId=4" class="item food">
                    <div class="icon"><img src="${baseUrl}/img/kf_shenghuo.png" class="img-thumbnail" alt=""></div>
                    生活服务</a>
                <a href="${baseUrl}/m/list?mcId=5" class="item food">
                    <div class="icon"><img src="${baseUrl}/img/kf_mingshi.png" class="img-thumbnail"  alt=""></div>
                    名师培优</a>
                <a href="${baseUrl}/m/list?mcId=6" class="item food">
                    <div class="icon"><img src="${baseUrl}/img/timg.jpg" class="img-thumbnail"  alt=""></div>
                    名企招聘</a>
                <a href="${baseUrl}/m/resume/list" class="item food">
                    <div class="icon"><img src="${baseUrl}/img/resume.png" class="img-thumbnail" alt=""></div>
                    求职简历</a>
            </div>
        </div>
    </div>
</div>

    <#list mainClass as mc>

    <div class="navv">
        <div class="nav_tt nav_ttbg1">
            <img src="${baseUrl}/${mc.mcImg}" align="center" valign="middle"
                 class="icon">&nbsp;
            <a href="${baseUrl}/m/list?mcId=${mc.mcId}">${mc.mcName}</a>
            <span style="float: right;font-size: 12px;height:36px;line-height: 36px;margin-right: 18px;"><a style="color: #000;" href="${baseUrl}/m/push/choose"><i class="fa fa-plus-square"></i>发信息</a></span>
        </div>
        <div class="big_dl sale">
            <ul>
                <#list mc.secondClasses as sc>
                    <li class="one_third"><a href="${request.contextPath}/m/list?mcId=${mc.mcId}&scId=${sc.scId}">${sc.scName}</a></li>
                </#list>
            </ul>
        </div>
    </div>

    </#list>
</@body>

<@footer base_js=["jq_min.211_1","common_1","iscroll-probe","slider","index"]>

<script>
    (function ($) {
        var list = $('#content').find('.cell');
        if (list.length > 0) {
            var txt = '';
            $('#content').find('.cell').each(function (i) {
                if (i === 0) {
                    txt += '<li class="active">1</li>'
                } else {
                    txt += '<li>' + (i + 1) + '</li>'
                }
            });
            $('#indicator').html(txt);
            var w_w = $(window).width();
            setTimeout(function () {
                new C_Scroll({
                    container: 'slide',
                    content: 'content',
                    ct: 'indicator',
                    size: w_w,
                    intervalTime: 5000,
                    lazyIMG: !!0
                })
            }, 20);
            setTimeout(function () {
                $('#slide').show()
            }, 20)
        }
    })(jQuery);
</script>
</@footer>
