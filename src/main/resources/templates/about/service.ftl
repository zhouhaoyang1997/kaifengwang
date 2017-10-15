<#include "../public/default.ftl">
<#include "../public/baseabout.ftl">
<#assign base="${request.contextPath}"/>
<@header title="开封网招聘">
<link rel="stylesheet" href="${base}/css/style.css">
<link rel="stylesheet" href="${base}/css/menu.css">
<link rel="stylesheet" href="${base}/css/about.css">
</@header>
<@headerArea>
<li><a href="${base}/index">回首页</a></li>
</@headerArea>
<@menu>
<li ><a href="${base}/about/cpdesc">公司简介</a></li>
<li ><a href="${base}/about/contact">联系方式</a></li>
<li  class="active"><a href="${base}/about/service">推广服务</a></li>
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
</div>
<@footer>
</@footer>