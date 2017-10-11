<!DOCTYPE html>
<html lang="zh-CN" class="index_page">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport"
          content="initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,minimal-ui"/>
    <meta name="format-detection" content="telephone=no"/>
    <meta name="format-detection" content="email=no"/>
    <meta name="format-detection" content="address=no;">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="default"/>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <title>全职招聘</title>
    <link type="text/css" rel="stylesheet" href="../css/phone/global.css">
    <link type="text/css" rel="stylesheet" href="../css/phone/style.css">
    <link type="text/css" rel="stylesheet" href="../css/phone/list.css">
    <link type="text/css" rel="stylesheet" href="../css/phone/filter.css">
</head>

<body class="orange">
<div class="wrapper">
    <script src="../js/phone/jq_min.211.js"></script>
    <script src="../js/phone/common.js"></script>


    <div class="header">
        <div id="ipageTitle">开封城市网</div>
        <div class="search left8" id="search" onclick="searchOnClik()"></div>
    </div>
    <div id="contactbar">
        <a href="#" class="bottom_index_on">首页</a>
        <a href="#" class="bottom_member">我的</a>
        <a href="#" class="bottom_history">历史</a>
        <a href="#" class="bottom_post">发布</a>
    </div>


    <div class="filter2" id="filter2">

        <ul class="tab cfix">
            <#--<input type="hidden" name="scId" value="${currScId}！“”">-->
            <#--<input type="hidden" name="mcId" value="${currMcId}！“”">-->
            <#--<input type="hidden" name="currTags" value="${tagValues}">-->
            <li class="item"><a href="javascript:void(0);"><span id="str_a_node">分类</span><em></em></a></li>
            <li class="item"><a href="javascript:void(0);"><span id="str_b_node">区域</span><em></em></a></li>
        <#list tags as tag>
            <li class="item"><a href="javascript:void(0);"><span id="str_salary_node">${tag.tagName}</span><em></em></a>
            </li>
        </#list>
        </ul>

        <div class="inner" style="display:none;">
            <ul>
                <a class="selected" href="${request.contextPath}/m/infolist?mcId=${currMcId}&districtId=${currDistrictId!""}<#if currTags??&&(currTags?size>0)>&tagId=<#list currTags as ct>${ct.tagId}-${ct.tcId}--</#list></#if>">不限</a></li>
            <#list secondClassList as sc>
                <a class=""  href="${request.contextPath}/m/infolist?mcId=${currMcId}&districtId=${currDistrictId!""}&scId=${sc.scId}<#if currTags??&&(currTags?size>0)>&tagId=<#list currTags as ct>${ct.tagId}-${ct.tcId}--</#list></#if>">${sc.scName}</a>
            </#list>
            </ul>

        </div>

        <div class="inner" style="display:none;">
            <ul>
                <li><a  class='selected' href="${request.contextPath}/m/infolist?mcId=${currMcId}&scId=${currScId!""}<#if currTags??&&(currTags?size>0)>&tagId=<#list currTags as ct>${ct.tagId}-${ct.tcId}--</#list></#if>">不限</a></li>
            <#list districts as d>
                <li><a  href="${request.contextPath}/m/infolist?mcId=${currMcId}&scId=${currScId!""}&districtId=${d.districtId}<#if currTags??&&(currTags?size>0)>&tagId=<#list currTags as ct>${ct.tagId}-${ct.tcId}--</#list></#if>">${d.districtName}</a></li>
            </#list>
            </ul>
        </div>

    <#list tags as tag>
        <div class="inner" style="display:none;">
            <ul>
                <a class="selected" href="${request.contextPath}/m/infolist?mcId=${currMcId}&districtId=${currDistrictId!""}&scId=${currScId!""}&tagId=<#list currTags as ct><#if ct.tagId!=tag.tagId>${ct.tagId}-${ct.tcId}--</#if></#list>">不限</a>
                <#list tag.tagContents as tagContent>
                    <a class="" href="${request.contextPath}/m/infolist?mcId=${currMcId}&districtId=${currDistrictId!""}&scId=${currScId!""}&tagId=${tag.tagId}-${tagContent.tcId}<#list currTags as ct><#if ct.tagId!=tag.tagId>--${ct.tagId}-${ct.tcId}</#if></#list>">${tagContent.tcName}</a>
                </#list>
            </ul>
        </div>
    </#list>

        <div class="inner_parent" id="parent_container" style="display:none;">
            <div class="innercontent"></div>
        </div>
        <div class="inner_child" id="inner_container" style="display:none;">
            <div class="innercontent"></div>
        </div>
    </div>
    <div class="fullbg" id="fullbg" style="height: 1632px; display: none"><i class="pull2"></i></div>
    <div class="infolst_w">
        <ul class="list-info">
        <#--结果集合-->
            <div class="clear1"></div>
            <li class="">
                <a href="index.php?mod=information&id=1229554">
                    <img class="thumbnail" src="picture/pre_1506069120z0frn.png" alt="大型夜场男模团队领队招聘男模-绝对真实</strong>">
                    <dl>
                        <dt class="tit" style="">大型夜场男模团队领队招聘男模-绝对真实&nbsp;<span
                                style="background:#339966; color:#FFFFFF; font-size:14px; padding:0 2px;text-align:center;">1图</span>
                        </dt>
                        <dd class="attr"><span>应聘加Q/Q8655.81.231领队宇哥直招微/信：134.3075.5000</span></dd>
                        <dd class="attr pr5">
                            <span class="lvzi">3天前</span>
                        </dd>
                    </dl>
                </a>
            </li>
            <#if pushInfos??&&(pushInfos?size>0)>
                <#list pushInfos as pushInfo>
                        <li class="">
                            <a href="index.php?mod=information&id=1229554">
                                <dl>
                                    <dt class="tit" style="">${pushInfo.piTitle!""}&nbsp;<span
                                            style="background:#339966; color:#FFFFFF; font-size:14px; padding:0 2px;text-align:center;">1图</span>
                                    </dt>
                                    <dd class="attr" style="height:40px;line-height:20px;overflow:hidden;">水电费空间十分的合法的空间阿凡达哈付款就好打飞机快点发货的健康防护等级分活动经费和接受对方获得积分活动经费和大家思考</dd>
                                    <dd class="attr" style="margin-left: 80%">
                                        <span class="lvzi">${pushInfo.piPushDate}</span>
                                    </dd>
                                </dl>
                            </a>
                        </li>
                    </#list>
            </#if>
        </ul>
    </div>
    <div class="clear1"></div>

    <div class="pager">
        <a href="javascript:void();" class="pageprev pagedisable">上一页</a><a class="pageno pagecur">1</a><a
            href="?mod=category&catid=4&cityid=1&page=2" class="pageno">2</a><a
            href="?mod=category&catid=4&cityid=1&page=3" class="pageno">3</a><a
            href="?mod=category&catid=4&cityid=1&page=2" class="pagenext">下一页</a></div>
</div>
<div class="clear"></div>
<p class="footer_02">&copy;copyright 开封城市网版权所有. </p>
<p class="footer_02">
    <script>
        var _hmt = _hmt || [];
        (function () {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?ae4a3d4eac699abe92f1094e6af10cfb";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();</script>
</p>

<div class="footer">
    <!--360自动提交收录代码-->
    <script>
        (function () {
            var src = (document.location.protocol == "http:") ? "http://js.passport.qihucdn.com/11.0.1.js?78760c6b4ad8a664271f522d3f7d9027" : "https://jspassport.ssl.qhimg.com/11.0.1.js?78760c6b4ad8a664271f522d3f7d9027";
            document.write('<script src="' + src + '" id="sozz"><\/script>');
        })();
    </script>
    <!--百度自动提交收录代码-->
    <script>(function () {
        var bp = document.createElement('script');
        var curProtocol = window.location.protocol.split(':')[0];
        if (curProtocol === 'https') {
            bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
        }
        else {
            bp.src = 'http://push.zhanzhang.baidu.com/push.js';
        }
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(bp, s);
    })();
    </script>
    <script>var searchHtml = '<div class="searchbar2">' + '<form id="myform" action="http://m.5ol.com/index.php?" method="get">' + '<input name="mod" type="hidden" value="search">' + '<input type="text" name="keywords" id="keyword" class="s_ipt" value="" placeholder="输入关键字" />' + '<input type="submit" class="s_btn po_ab" value="搜索">' + '</form></div>';

    function newPageSearch() {
        $('#windowIframe .back').show();
        $('#myform').submit(function () {
            if ($('#keyword').val() === '') {
                MSGwindowShow('index', '0', '请输入搜索关键字', '', '')
            }
        })
    }</script>
    <script src="../js/phone/iscroll.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            window['myScroll_parent'] = null;
            window['myScroll_inner'] = null;
            showFilter({ibox: 'filter2', content1: 'parent_container', content2: 'inner_container', fullbg: 'fullbg'});
        }, false);
    </script>
</body>
</html>
<#if currScId??||currDistrictId??||(currTags?size>0)>
<script type="text/javascript">
    $(function () {
        $("#lunbotu").css("display", "none");
    });
</script>

</#if>
<#if currScId??>
<script type="text/javascript">
    $(function () {
        $("#notController").removeClass("active");
        $("#lanmu${currScId}").addClass("active");
    });
</script>
</#if>
<#if currDistrictId??>
<script type="text/javascript">
    $(function () {
        $("#districtNo").removeClass("active");
        $("#district${currDistrictId}").addClass("active");
    })
</script>
</#if>
<script type="text/javascript">
    <#list currTags as ct>
    $(function () {
        $("#tag${ct.tagId}").removeClass("active");
        $("#tagValue${ct.tcId}").addClass("active");
    });
    </#list>
</script>