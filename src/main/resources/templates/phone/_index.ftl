<#include "defaultLayout/defaultLayout.ftl">
<@base siteName="开封麦芒网" base_js=["jq_min.211_1","common_1","iscroll-probe","slider","index"] base_css=["global","style","index"] base_keywords="开封麦芒网" title="首页">
<div class="select_01" id="wrapper2">
<#--<ul class="tab-hd" id="scroller2"  >-->
    <ul class="tab-hd">
        <li class="item current">
            <a style="color:;" target="_self" href="#">首页</a>
        </li>
        <li class="item ">
            <a style="color:;" target="_self" href="menulist">信息分类</a>
        </li>
    </ul>
</div>
<script>
    (function ($) {
        var w_w = $(window).width();
        $('#scroller2').css('width', (90 * $('#scroller2').find('li').length) + 40 + 'px');
        window['myScroll2'] = new IScroll('#wrapper2', {
            scrollX: true,
            scrollY: false,
            click: true,
            keyBindings: true
        });
    })(jQuery);
</script>
<div class="clearfix"></div>
<div class="clear"></div>
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
<div class="index-category">
    <div class="index_slider">
        <div class="index_slider-wrap">
            <div class="page">
                <a href="infolist?mcId=1" class="item food">
                    <div class="icon"><img src="../img/phone/pic/zp_icon.png"></div>
                    二手货</a>
                <a href="" class="item food">
                    <div class="icon"><img src="../img/phone/pic/zp_icon.png"></div>
                    二手货</a>
                <a href="" class="item food">
                    <div class="icon"><img src="../img/phone/pic/zp_icon.png"></div>
                    二手货</a>
                <a href="" class="item food">
                    <div class="icon"><img src="../img/phone/pic/zp_icon.png"></div>
                    二手货</a>
                <a href="" class="item food">
                    <div class="icon"><img src="../img/phone/pic/zp_icon.png"></div>
                    二手货</a>
                <a href="" class="item food">
                    <div class="icon"><img src="../img/phone/pic/zp_icon.png"></div>
                    二手货</a>
            </div>
        </div>
    </div>
</div>
<div class="clearfix"></div>
<div class="index-category">
    <div class=""><h4 style="margin-left: -80%;margin-top: 5px">生活服务</h4></div>
    <div class="index_slider">
        <div class="index_slider-wrap">
            <div class="page2">
                <a href="" class="item block">
                    <div class="icon"><img src="../img/phone/pic/zp_icon.png"></div>
                    二手货</a>
                <a href="" class="item block">
                    <div class="icon"><img src="../img/phone/pic/zp_icon.png"></div>
                    二手货</a>
                <a href="" class="item block">
                    <div class="icon"><img src="../img/phone/pic/zp_icon.png"></div>
                    二手货</a>
                <a href="" class="item block">
                    <div class="icon"><img src="../img/phone/pic/zp_icon.png"></div>
                    二手货</a>
                <a href="" class="item block">
                    <div class="icon"><img src="../img/phone/pic/zp_icon.png"></div>
                    二手货</a>
                <a href="" class="item block">
                    <div class="icon"><img src="../img/phone/pic/zp_icon.png"></div>
                    二手货</a>
            </div>
        </div>
    </div>

</div>
</@base>
