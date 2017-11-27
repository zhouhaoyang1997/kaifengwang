<#include "../defaultLayout/defaultLayout.ftl">
<#assign base="${request.contextPath}"/>
<@header siteName="开封麦芒网" base_css=["global","style","bootstrap.min"] base_keywords="开封麦芒网">
<link rel="stylesheet" href="${base}/css/font-awesome.min.css"></@header>

<@body title="公司简介" back=true>
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
                公司简介
            </a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="${base}/m/about/cpdesc">公司简介</a></li>
                <li><a href="${base}/m/about/contact">联系方式</a></li>
                <li><a href="${base}/m/about/service">推广服务</a></li>
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
            <p class="table-title">河南麦芒网络科技有限公司</p>
        </div>
        <div class="panel-body">
            <div class="desc" style="min-height: 500px">
                <h3>公司简介:</h3>
                <h3 style="text-align: center">河南麦芒网络科技有限公司</h3>
                <p>内容</p>
            </div>
            <div class="imgbox row">
                <h3>公司图片介绍:</h3>
                <div class="col-md-3">
                    <img src="${base}/img/yanshi/d1.jpg" class="img-thumbnail" alt="">
                </div>
                <div class="col-md-3">
                    <img src="${base}/img/yanshi/d1.jpg" class="img-thumbnail" alt="">
                </div>
                <div class="col-md-3">
                    <img src="${base}/img/yanshi/d1.jpg" class="img-thumbnail" alt="">
                </div>
                <div class="col-md-3">
                    <img src="${base}/img/yanshi/d1.jpg" class="img-thumbnail" alt="">
                </div>
            </div>
        </div>
    </div>

</div>

</@body>

<@footer base_js=["jq_min.211","bootstrap.min"]>
</@footer>

<#--自定义脚本区-->
