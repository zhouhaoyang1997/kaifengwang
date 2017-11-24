<#include "defaultLayout/defaultLayout.ftl">
<#assign baseUrl = "${request.contextPath}"/>
<@header siteName="开封麦芒网" base_css=["global","style","index","all"] base_keywords="开封麦芒网">

</@header>


<@body title="首页">
<!--广告页-->
<section>
    <div id="slide" style="display:none;">
        <div id="content">
            <div class="cell">
                <a href="#"><img width="100%" height="144px" src="../img/phone/pic/1.jpg" alt="开封城市网招商"></a>
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
                <a href="infolist?mcId=1" class="item food">
                    <div class="icon"><img src="${baseUrl}/img/zp_icon.png" width="55px" height="55px" alt=""></div>
                    招聘</a>
                <a href="" class="item food">
                    <div class="icon"><img src="${baseUrl}/img/kf_ershou.png" width="55px" height="55px" alt=""></div>
                    二手市场</a>
                <a href="" class="item food">
                    <div class="icon"><img src="${baseUrl}/img/kf_fangchan.png" width="55px" height="55px" alt=""></div>
                    房产</a>
                <a href="" class="item food">
                    <div class="icon"><img src="${baseUrl}/img/kf_shenghuo.png" width="55px" height="55px" alt=""></div>
                    生活服务</a>
                <a href="" class="item food">
                    <div class="icon"><img src="${baseUrl}/img/kf_mingshi.png" width="55px" height="55px" alt=""></div>
                    名师培优</a>
                <a href="" class="item food">
                    <div class="icon"><img src="${baseUrl}/img/jz.png" width="55px" height="55px" alt=""></div>
                    名企招聘</a>
                <a href="" class="item food">
                    <div class="icon"><img src="${baseUrl}/img/jz.png" width="55px" height="55px" alt=""></div>
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
            <a href="index.php?mod=category&catid=2&cityid=1">${mc.mcName}</a>
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
