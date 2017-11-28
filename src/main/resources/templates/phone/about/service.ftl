<#include "../defaultLayout/defaultLayout.ftl">
<#assign base="${request.contextPath}"/>
<@header siteName="开封麦芒网" base_css=["global","style","bootstrap.min"] base_keywords="开封麦芒网">
<link rel="stylesheet" href="${base}/css/font-awesome.min.css"></@header>

<@body title="推广服务" back=true>
<div id="contactbar">
    <a href="${base}/m/index" class="bottom_index">首页</a>
    <a href="${base}/m/user/info" class="bottom_member">我的</a>
    <a href="${base}/m/about/cpdesc" class="bottom_history_on">推送</a>
    <a href="${base}/m/push/choose" class="bottom_post">发布</a>
</div>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">手机导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" style="padding: 0" href="#">
                <img alt="麦芒网络" src="${base}/ico/mmfavicon.ico">
                推广服务
            </a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li ><a href="${base}/m/about/cpdesc">公司简介</a></li>
                <li><a href="${base}/m/about/contact">联系方式</a></li>
                <li class="active"><a href="${base}/m/about/service">推广服务</a></li>
                <li><a href="${base}/m/about/charge">收费标准</a></li>
                <li ><a href="${base}/m/about/help">使用帮助</a></li>
                <li ><a href="${base}/m/about/law">网站申明</a></li>
                <li ><a href="${base}/m/about/friend">友情链接</a></li>
            </ul>

        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            <p class="table-title">大类置顶产品介绍</p>
        </div>
        <div class="panel-body">
            <p>大类置顶可以将您的信息置顶在信息列表页面的最上面</p>
            <p>并且在：信息列表底部、信息内页【热点推荐】位置同步推送</p>
            <p>从而快速获得比他人信息多10倍以上的访问量</p>
            <p><a href="${base}/about/charge">更多咨询</a></p>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">
            <p class="table-title">竞价排名</p>
        </div>
        <div class="panel-body">
            <p>★ 排名比“大类置顶”更靠上</p>
            <p>★ 显示在所属频道所有类别、所有分页</p>
            <p><a href="${base}/about/charge">更多咨询</a></p>
        </div>
    </div>

</div>

</@body>

<@footer base_js=["jq_min.211","bootstrap.min"]>

</@footer>

<#--自定义脚本区-->
