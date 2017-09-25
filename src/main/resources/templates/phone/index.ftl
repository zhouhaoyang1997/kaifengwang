<!DOCTYPE html>
<html lang="zh-CN" class="index_page">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,minimal-ui" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="format-detection" content="email=no" />
    <meta name="format-detection" content="address=no;">
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="default" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <meta name="keywords" content="开封城市网" />
    <meta name="description" content="开封城市网手机版" />
    <title>开封城市网-手机版</title>
    <link type="text/css" rel="stylesheet" href="../css/phone/global.css">
    <link type="text/css" rel="stylesheet" href="../css/phone/style.css">
    <link type="text/css" rel="stylesheet" href="../css/phone/index.css">
</head>

<body class="orange">
<div class="wrapper">

    <script src="../js/phone/jq_min.211_1.js"></script>
    <script src="../js/phone/common_1.js"></script>
    <div class="header">
        <div id="ipageTitle" style="display:none;">开封城市网</div>
        <div class="search left8" id="search" onclick="searchOnClik()"></div>
    </div>
    <div id="contactbar">
        <a href="#" class="bottom_index_on">首页</a>
        <a href="#" class="bottom_member">我的</a>
        <a href="#" class="bottom_history">历史</a>
        <a href="#" class="bottom_post">发布</a>
    </div>
    <script>
        window['siteUrl'] = 'http://m.5ol.com';
        $('.header .back').hide();
        $('#login_ico').show();
        if(window['current']) {
            $('#ipageTitle').html(window['current']).show()
        } else {
            $('#ipageTitle').show()
        }
    </script>
    <div class="select_01" id="wrapper2">
        <ul class="tab-hd" id="scroller2">
            <li class="item current">
                <a style="color:;" target="_self" href="#">首页</a>
            </li>
            <li class="item ">
                <a style="color:;" target="_self" href="#">信息分类</a>
            </li>
            <li class="item ">
                <a style="color:;" target="_self" href="#">热点资讯</a>
            </li>
            <li class="item ">
                <a style="color:;" target="_self" href="#">商家店铺</a>
            </li>
        </ul>
    </div>
    <script type="text/javascript" src="../js/phone/iscroll-probe.js"></script>
    <script>
        (function($) {
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
        <span class="prev" id="slide_prev" style="display:none">上一张</span><span class="next" id="slide_next" style="display:none">下一张</span>
    </section>
    <div class="clear"></div>
    <div class="mod_02" id="myPicsrc">
        <div class="bd tab-cont">
            <ul class="list_normal list_news">
            </ul>
        </div>
    </div>
    <script src="../js/phone/slider.js"></script>
    <script>
        (function($) {
            var list = $('#content').find('.cell');
            if(list.length > 0) {
                var txt = '';
                $('#content').find('.cell').each(function(i) {
                    if(i === 0) {
                        txt += '<li class="active">1</li>'
                    } else {
                        txt += '<li>' + (i + 1) + '</li>'
                    }
                });
                $('#indicator').html(txt);
                var w_w = $(window).width();
                setTimeout(function() {
                    new C_Scroll({
                        container: 'slide',
                        content: 'content',
                        ct: 'indicator',
                        size: w_w,
                        intervalTime: 5000,
                        lazyIMG: !!0
                    })
                }, 20);
                setTimeout(function() {
                    $('#slide').show()
                }, 20)
            }
        })(jQuery);
    </script>
    <div class="index-category">
        <div class="index_slider">
            <div class="index_slider-wrap">
                <div class="page">
                    <a href="#" class="item food">
                        <div class="icon"><img src="../img/phone/pic/zp_icon.png"></div>二手货</a>
                    <a href="#" class="item food">
                        <div class="icon"><img src="../img/phone/pic/cw_icon.png"></div>车辆买卖</a>
                    <a href="#" class="item food">
                        <div class="icon"><img src="../img/phone/pic/cw_icon.png"></div>房屋租售</a>
                    <a href="#" class="item food">
                        <div class="icon"><img src="../img/phone/pic/zp_icon.png"></div>全职招聘</a>
                    <a href="#" class="item food">
                        <div class="icon"><img src="../img/phone/pic/jjz.png"></div>兼职招聘</a>
                    <a href="#" class="item food">
                        <div class="icon"><img src="../img/phone/pic/cw_icon.png"></div>找工作</a>
                    <a href="#" class="item food">
                        <div class="icon"><img src="../img/phone/pic/jz.png"></div>交友/征</a>
                    <a href="#" class="item food">
                        <div class="icon"><img src="../img/phone/pic/cw_icon.png"></div>宠物</a>
                    <a href="#" class="item food">
                        <div class="icon"><img src="../img/phone/pic/jz.png"></div>生活服务</a>
                    <a href="#" class="item food">
                        <div class="icon"><img src="../img/phone/pic/cw_icon.png"></div>教育培训</a>
                    <a href="#" class="item food">
                        <div class="icon"><img src="../img/phone/pic/cw_icon.png"></div>商务服务</a>
                    <a href="#" class="item food">
                        <div class="icon"><img src="../img/phone/pic/cw_icon.png"></div>车辆服务</a>
                    <a href="#" class="item food">
                        <div class="icon"><img src="../img/phone/pic/jz.png"></div>旅游/酒</a>
                    <a href="#" class="item food">
                        <div class="icon"><img src="../img/phone/pic/zp_icon.png"></div>休闲/生</a>
                    <a href="#" class="item food">
                        <div class="icon"><img src="../img/phone/pic/jjz.png"></div>医疗健康</a>
                    <a href="#" class="item food">
                        <div class="icon"><img src="../img/phone/pic/jjz.png"></div>丽人美容</a>
                    <a href="#" class="item food">
                        <div class="icon"><img src="../img/phone/pic/zp_icon.png"></div>建材/装</a>
                    <a href="#" class="item food">
                        <div class="icon"><img src="../img/phone/pic/jjz.png"></div>农贸市场</a>
                </div>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>

</div>

<div class="clear"></div>
<p class="footer_02">&copy;copyright 开封版权所有.</p>
<div class="footer">
    <!--360自动提交收录代码-->
    <script>
        (function() {
            var src = (document.location.protocol == "http:") ? "http://js.passport.qihucdn.com/11.0.1.js?78760c6b4ad8a664271f522d3f7d9027" : "https://jspassport.ssl.qhimg.com/11.0.1.js?78760c6b4ad8a664271f522d3f7d9027";
            document.write('<script src="' + src + '" id="sozz"><\/script>');
        })();
    </script>
    <!--百度自动提交收录代码-->
    <script>
        (function() {
            var bp = document.createElement('script');
            var curProtocol = window.location.protocol.split(':')[0];
            if(curProtocol === 'https') {
                bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
            } else {
                bp.src = 'http://push.zhanzhang.baidu.com/push.js';
            }
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(bp, s);
        })();
    </script>
    <script src="../js/phone/index.js"></script>
    <script>
        (function($) {
            var list = $('#content').find('.cell');
            if(list.length > 0) {
                var txt = '';
                $('#content').find('.cell').each(function(i) {
                    if(i === 0) {
                        txt += '<li class="active">1</li>'
                    } else {
                        txt += '<li>' + (i + 1) + '</li>'
                    }
                });
                $('#indicator').html(txt);
                var w_w = $(window).width();
                setTimeout(function() {
                    new C_Scroll({
                        container: 'slide',
                        content: 'content',
                        ct: 'indicator',
                        size: w_w,
                        intervalTime: 5000,
                        lazyIMG: !!0
                    })
                }, 20);
                setTimeout(function() {
                    $('#slide').show()
                }, 20)
            }
            IDC.tabADS($('#tab_01'))
        })(jQuery);
    </script>
</body>

</html>