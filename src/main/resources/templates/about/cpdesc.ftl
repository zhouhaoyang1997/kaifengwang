<#include "../public/default.ftl">
<#include "../public/baseabout.ftl">
<#assign base="${request.contextPath}"/>
<@header title="麦芒网">
<link rel="stylesheet" href="${base}/css/style.css">
<link rel="stylesheet" href="${base}/css/menu.css">
<link rel="stylesheet" href="${base}/css/about.css">
<link href="${base}/css/lightbox.min.css" rel="stylesheet">
</@header>
<@headerArea>
<li><a href="${base}/index">回首页</a></li>
</@headerArea>
<@menu>
<li class="active"><a href="${base}/about/cpdesc">公司简介</a></li>
<li><a href="${base}/about/contact">联系方式</a></li>
<li><a href="${base}/about/service">推广服务</a></li>
<li><a href="${base}/about/charge">收费标准</a></li>
<li><a href="${base}/about/help">使用帮助</a></li>
<li><a href="${base}/about/law">网站申明</a></li>
<li><a href="${base}/about/friend">友情链接</a></li>
</@menu>
<div style="min-height: 800px;width: 100%">
    <div class="container_self">
        <div class="panel panel-default">
            <div class="panel-heading">
                <p class="table-title">河南麦芒网络科技有限公司</p>
            </div>
            <div class="panel-body">
                <div class="desc" style="min-height: 500px">
                    <h3>公司简介:</h3>
                    <h2 style="text-align: center">河南麦芒网路科技有限公司</h2>
                    <p>内容</p>
                </div>
                <div class="imgbox row">
                    <h3>公司图片介绍:</h3>
                    <div class="col-md-3">
                        <a data-lightbox="image-1" href="${base}/img/yanshi/d1.jpg"><img src="${base}/img/yanshi/d1.jpg" class="img-thumbnail" alt=""></a>
                    </div>
                    <div class="col-md-3">
                        <a data-lightbox="image-1" href="${base}/img/yanshi/d1.jpg"><img src="${base}/img/yanshi/d1.jpg" class="img-thumbnail" alt=""></a>
                    </div>
                    <div class="col-md-3">
                        <a data-lightbox="image-1" href="${base}/img/yanshi/d1.jpg"><img src="${base}/img/yanshi/d1.jpg" class="img-thumbnail" alt=""></a>
                    </div>
                    <div class="col-md-3">
                        <a data-lightbox="image-1" href="${base}/img/yanshi/d1.jpg"><img src="${base}/img/yanshi/d1.jpg" class="img-thumbnail" alt=""></a>
                    </div>
                </div>
            </div>
        </div>


    </div>
</div>
<@footer>
<script src="${base}/js/lightbox.min.js"></script>
</@footer>