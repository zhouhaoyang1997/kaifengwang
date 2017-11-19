<#include "public/default.ftl">
<#include "public/pushdefault.ftl">
<@header title="免费发布信息">
<link rel="stylesheet" href="${request.contextPath}/css/style.css">
</@header>
<@push_header>

</@push_header>
<div class="mainPage">
    <div class="container_self ">
        <div class="row step">

            <div class="col-xs-4"><span class="span_1">1 选择分类信息</span></div>
            <div class="col-xs-4"><span>2 填写信息内容</span></div>
            <div class="col-xs-4"><span>3 发布成功</span></div>
        </div>
        <div class="row" style="margin-top: 30px;">
        <#list mainClass as mc>
            <div class="panel panel_self">
                <div class="panel-heading"><h4>${mc.mcName}</h4></div>
                <div class="panel-body">
                    <ul class="lanmu_ul2">
                        <#list mc.secondClasses as sc>
                            <li><a href="${request.contextPath}/push/fill?mcId=${mc.mcId}&scId=${sc.scId}">${sc.scName}</a></li>
                        </#list>
                    </ul>
                </div>
            </div>
        </#list>
        </div>
    </div>
</div>
<@push_footer>
<script type="text/javascript" src="${base}/js/jquery.min.js"></script>
</@push_footer>