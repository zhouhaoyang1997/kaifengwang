<#include "public/default.ftl">
<#assign base="${request.contextPath}"/>
<@header title="开封网招聘">
<link rel="stylesheet" href="${base}/css/style.css">
<link rel="stylesheet" href="${base}/css/menu.css">
<link rel="stylesheet" href="${base}/css/info.css">
</@header>
<@headerArea>
<li><a href="${base}/index">回首页</a></li>
</@headerArea>

<div class="container_self">
    <div class="row">
        <div class="col-md-3">
            <div class="logo">
                <h1><a href="${base}/index">开封<span>${info.piMcName!""}</span></a></h1>
            </div>
        </div>
        <div class="col-md-7"></div>
        <div class="col-md-2">
            <div style="margin-top:15px">
                <button onclick="" class="btn btn-info">发布信息</button>
                <#if info.piMcName="招聘">
                    <button onclick="" class="btn btn-info">登记简历</button>
                </#if>
            </div>
        </div>
    </div>
</div>

<div class="container_self">
    <div class="row">
        <div class="now_position">
            <i class="fa fa-home"></i><a href="/index">开封城市网</a>&nbsp;>&nbsp;<a href="/list?mcId=${info.piMc}">${info.piMcName}</a>&nbsp;>&nbsp;<a href="/list?mcId=${info.piMc}&scId=${info.piSc}">${info.piScName}</a>
        </div>
    </div>
    <div class="row">
        <div class="info_box">
            <div class="row">
                <div class="col-md-4 push_base_static">
                    <span>发布时间:${info.piPushDate?string("yyyy-MM-dd")}</span> <span>浏览量:${info.piScan}</span>
                </div>
                <div class="col-md-4"></div>
                <div class="col-md-4 push_base_static">
                    <a href="/"><i class="fa fa-calendar"></i> 收藏</a>  <a href="#"> 举报</a>  <a href="#" style="color: #red;">置顶</a>
                </div>
            </div>
            <div class="row push_base_title">
                <div class="col-md-8">
                    <h2>${info.piTitle}</h2>
                </div>
            </div>
            <div class="row push_base_data">
                <div class="col-md-5">
                    <div id="myCarousel" class="carousel slide">
                        <!-- 轮播（Carousel）内容 -->
                        <div class="carousel-inner">
                            <#if info.piImg??>
                            <#list info.piImg?split("#") as piImg>
                                <#if piImg_index==0>
                                    <div class="item active">
                                        <img src="${base}/${piImg}" class="img-thumbnail">
                                    </div>
                                <#else>
                                    <div class="item">
                                        <img src="${base}/${piImg}" class="img-thumbnail">
                                    </div>
                                </#if>
                            </#list>
                            <#else>
                                <div class="item active">
                                    <img src="${base}/img/noimage.png" class="img-thumbnail">
                                </div>
                            </#if>
                        </div>
                        <!-- 轮播（Carousel）导航 -->
                        <a class="carousel-control left" href="#myCarousel"
                           data-slide="prev">&lsaquo;
                        </a>
                        <a class="carousel-control right" href="#myCarousel"
                           data-slide="next">&rsaquo;
                        </a>
                    </div>
                </div>
                <div class="col-md-7">
                    <table class="push_base_list">
                    <#list info.tagValues as tv>
                        <tr>
                            <td class="tag_name">${tv.tagName}&nbsp;</td><td class="tag_content">:&nbsp;${tv.tcName}</td>
                        </tr>
                    </#list>
                        <#list info.otherInfos as oi>
                        <tr>
                            <td class="tag_name">${oi.picName}&nbsp;</td><td class="tag_content">:&nbsp;${oi.pcContent}</td>
                        </tr>
                        </#list>
                        <tr><td class="tag_name">地区&nbsp;</td><td class="tag_content">:&nbsp;${info.piDistrictName}</td></tr>
                    </table>
                </div>
            </div>
            <div class="row push_base_other">
                <div class="col-md-8">
                    <p>联系人: <span style="margin-left: 30px;">${info.piContactPerson}</span></p>
                    <p>联系电话: <span style="margin-left: 30px;">${info.piPhone}</span></p>
                <#if info.piQq??>
                    <p>qq: <span style="margin-left: 30px;">${info.piQq}</span></p>
                </#if>
                    <p>详细地址: <span style="margin-left: 30px;">${info.piAddress}</span></p>
                </div>
                <div class="col-md-4 jinggao">
                    <img src="${base}/img/warning.png" width="30px" height="30px"><span style="font-size: 16px">开封城市网提醒你：</span>让你提前汇款，或者价格明显低于市价，均有骗子嫌疑，不要轻易相信。
                </div>
            </div>
        </div>

        <div class="person_box">
            <h4>${info.piUser}</h4>
        </div>
    </div>
    <div class="row">
        <div class="panel info_box">
            <div class="panel-heading"><h3>信息描述</h3></div>
            <div class="panel-body">
                ${info.piContent}
            </div>
        </div>
    </div>
</div>
<@footer>

</@footer>