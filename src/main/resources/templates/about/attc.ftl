<#include "../public/default.ftl">
<#include "../public/baseabout.ftl">
<#assign base="${request.contextPath}"/>
<@header title="麦芒网招聘">
<link rel="stylesheet" href="${base}/css/style.css">
<link rel="stylesheet" href="${base}/css/menu.css">
<link rel="stylesheet" href="${base}/css/about.css">
<link href="${base}/css/lightbox.min.css" rel="stylesheet">
</@header>
<@headerArea>
<li><a href="${base}/index">回首页</a></li>
</@headerArea>
<@menu>
<li ><a href="${base}/about/cpdesc">公司简介</a></li>
<li ><a href="${base}/about/contact">联系方式</a></li>
<li><a href="${base}/about/service">推广服务</a></li>
<li ><a href="${base}/about/charge">收费标准</a></li>
<li class="active"><a href="${base}/about/attc">企业认证</a></li>
<li><a href="${base}/about/help">使用帮助</a></li>
<li><a href="${base}/about/law">网站申明</a></li>
<li><a href="${base}/about/friend">友情链接</a></li>
</@menu>
<div style="min-height: 800px;width: 100%">
    <div class="container_self">

        <div class="panel panel-default">
            <div class="panel-heading">
                <p class="title">企业认证</p>
            </div>
            <div class="panel-body">
                企业认证是XXX
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <p class="table-title">企业认证普通版</p>
            </div>
            <div class="panel-body">
                <table class="table">
                    <tr>
                        <th>展示位置</th>
                        <th>样式尺寸</th>
                        <th>效果演示</th>
                        <th>收费标准</th>
                        <th>备注</th>
                    </tr>
                    <tr>
                        <td>首页通栏贴片</td>
                        <td>JPG/GIF 横幅图片 / 960px × 50px</td>
                        <td><a data-lightbox="image-1" href="${base}/img/yanshi/d1.jpg">查看演示</a></td>
                        <td>3000元/月</td>
                        <td>赠送：一季度企业认证</td>
                    </tr>
                    <tr>
                        <td>首页通栏贴片</td>
                        <td>JPG/GIF 横幅图片 / 960px × 50px</td>
                        <td><a href="#">查看演示</a></td>
                        <td>3000元/月</td>
                        <td>赠送：一季度企业认证</td>
                    </tr>
                    <tr>
                        <td>首页通栏贴片</td>
                        <td>JPG/GIF 横幅图片 / 960px × 50px</td>
                        <td><a href="#">查看演示</a></td>
                        <td>3000元/月</td>
                        <td>赠送：一季度企业认证</td>
                    </tr>
                    <tr>
                        <td>首页通栏贴片</td>
                        <td>JPG/GIF 横幅图片 / 960px × 50px</td>
                        <td><a href="#">查看演示</a></td>
                        <td>3000元/月</td>
                        <td>赠送：一季度企业认证</td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <p class="table-title">企业认证高级版 |  投放请联系：xxxxxxxxxx XX）</p>
            </div>
            <div class="panel-body">
                <table class="table">
                    <tr>
                        <th>展示位置</th>
                        <th>样式尺寸</th>
                        <th>效果演示</th>
                        <th>收费标准</th>
                        <th>备注</th>
                    </tr>
                    <tr>
                        <td>首页通栏贴片</td>
                        <td>JPG/GIF 横幅图片 / 960px × 50px</td>
                        <td><a data-lightbox="image-1" href="${base}/img/yanshi/d1.jpg">查看演示</a></td>
                        <td>3000元/月</td>
                        <td>赠送：一季度企业认证</td>
                    </tr>
                    <tr>
                        <td>首页通栏贴片</td>
                        <td>JPG/GIF 横幅图片 / 960px × 50px</td>
                        <td><a href="#">查看演示</a></td>
                        <td>3000元/月</td>
                        <td>赠送：一季度企业认证</td>
                    </tr>
                    <tr>
                        <td>首页通栏贴片</td>
                        <td>JPG/GIF 横幅图片 / 960px × 50px</td>
                        <td><a href="#">查看演示</a></td>
                        <td>3000元/月</td>
                        <td>赠送：一季度企业认证</td>
                    </tr>
                    <tr>
                        <td>首页通栏贴片</td>
                        <td>JPG/GIF 横幅图片 / 960px × 50px</td>
                        <td><a href="#">查看演示</a></td>
                        <td>3000元/月</td>
                        <td>赠送：一季度企业认证</td>
                    </tr>
                </table>
            </div>
        </div>

    </div>
</div>
<@footer>
<script src="${base}/js/lightbox.min.js"></script>
</@footer>