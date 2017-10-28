<#include "../public/default.ftl">
<#include "../public/baseabout.ftl">
<#assign base="${request.contextPath}"/>
<@header title="麦芒网">
<link rel="stylesheet" href="${base}/css/style.css">
<link rel="stylesheet" href="${base}/css/menu.css">
<link rel="stylesheet" href="${base}/css/about.css">
</@header>
<@headerArea>
<li><a href="${base}/index">回首页</a></li>
</@headerArea>
<@menu>
<li ><a href="${base}/about/cpdesc">公司简介</a></li>
<li class="active"><a href="${base}/about/contact">联系方式</a></li>
<li><a href="${base}/about/service">推广服务</a></li>
<li><a href="${base}/about/charge">收费标准</a></li>
<li><a href="${base}/about/attc">企业认证</a></li>
<li><a href="${base}/about/help">使用帮助</a></li>
<li><a href="${base}/about/law">网站申明</a></li>
<li><a href="${base}/about/friend">友情链接</a></li>
</@menu>
<div style="min-height: 800px;width: 100%">
    <div class="container_self">
        <div class="panel panel-default">
            <div class="panel-heading">
                <p class="table-title">贴片广告、招聘置顶、竞价排名、企业认证请联系：</p>
            </div>
            <div class="panel-body">
                <p>联系人xxxxx</p>
                <p>联系人xxxxx</p>
                <p>联系人xxxxx</p>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <p class="table-title">找回密码、修改手机号、审核信息等网站使用问题请联系：</p>
            </div>
            <div class="panel-body">
                <p>联系人xxxxx</p>
                <p>联系人xxxxx</p>
                <p>联系人xxxxx</p>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <p class="table-title">被封、被屏蔽、不能正常发布信息请联系:</p>
            </div>
            <div class="panel-body">
                <p>联系人xxxxx</p>
                <p>联系人xxxxx</p>
                <p>联系人xxxxx</p>
            </div>
        </div>

    </div>
</div>
<@footer>
</@footer>