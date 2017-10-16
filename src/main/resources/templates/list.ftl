<#include "public/default.ftl">
<#assign base="${request.contextPath}"/>
<@header title="开封城市网${currMc.mcName}">
<link rel="stylesheet" href="${request.contextPath}/css/style.css">
<link rel="stylesheet" href="${request.contextPath}/css/menu.css">
</@header>

<@headerArea>
<li><a href="${base}/index">回首页</a></li>
</@headerArea>

<#macro url>
${base}/list?mcId=${currMc.mcId}<#nested ><#if currTags??><#list currTags as tagStr>&tagId=${tagStr.tagId}-${tagStr.tcId}</#list></#if>
</#macro>
<#-- 广告-->
<div class="advert">
    <div class="container_self">
        <div class="gg_box" style="background:url(${request.contextPath}/img/advert.jpg) no-repeat">
        </div>
    </div>
</div>
<div class="site-branding-area">
    <div class="container_self" style="width: 1200px;">
        <div class="row">
            <div class="col-xs-3">
                <div class="logo">
                    <h1><a href="${base}/index">开封<span>${currMc.mcName}</span></a></h1>
                </div>
            </div>

            <div class="col-xs-6">
                <div class="search-box">
                    <form action="" method="post">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="输入你感兴趣信息">
                            <span class="input-group-btn" >
                                <button class="btn btn-danger"  type="button">搜索</button>
                            </span>
                        </div>
                    </form>
                    <div class="quickClick">
                        <ul>
                            <li><a href="#">丽人坊</a></li>
                            <li><a href="#">找宠物</a></li>
                            <li><a href="#" style="color: red;">农家乐</a></li>
                            <li><a href="#">名车4s店</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="pushing-item">
                    <a href="#"><i class="fa fa-edit"></i>免费发布信息</a>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End site branding area -->

<!--轮播图 -->
<div class="slider_width" id="lunbotu">

    <div class="slider-area">
        <div id="slide-list" class="carousel carousel-fade slide" data-ride="carousel">

            <div class="slide-bulletz">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <ol class="carousel-indicators slide-indicators">
                                <li data-target="#slide-list" data-slide-to="0" class="active"></li>
                                <li data-target="#slide-list" data-slide-to="1"></li>
                                <li data-target="#slide-list" data-slide-to="2"></li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>

            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <div class="single-slide">
                        <div class="slide-bg slide-one"></div>
                        <div class="slide-text-wrapper">
                            <div class="slide-text">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-4 col-md-offset-8">
                                            <div class="slide-content">
                                                <h2>XXXXX公司</h2>
                                                <p>中国最具有影响力的游戏公司</p>
                                                <p>世界第一.</p>
                                                <a href="" class="readmore">加入我们</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="single-slide">
                        <div class="slide-bg slide-two"></div>
                        <div class="slide-text-wrapper">
                            <div class="slide-text">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-4 col-md-offset-8">
                                            <div class="slide-content">
                                                <h2>XXXXX公司</h2>
                                                <p>中国最具有影响力的游戏公司</p>
                                                <p>世界第一.</p>
                                                <a href="" class="readmore">加入我们</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="single-slide">
                        <div class="slide-bg slide-three"></div>
                        <div class="slide-text-wrapper">
                            <div class="slide-text">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-4 col-md-offset-8">
                                            <div class="slide-content">
                                                <h2>XXXXX公司</h2>
                                                <p>中国最具有影响力的游戏公司</p>
                                                <p>世界第一.</p>
                                                <a href="" class="readmore">加入我们</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

</div>

<!-- 下方显示职位类别及搜索-->
<div class="container_self">
    <div class="row">
        <div class="now_position">
            <i class="fa fa-home"></i><a href="/index">开封城市网</a>&nbsp;>&nbsp;<span>${currMc.mcName}</span>
        </div>
        <div class="panel panel_self now_position" >
            <div class="panel-body">
                <div class="row" style="border-bottom: 1px #e6e6e6 dashed;">
                    <div class="col-xs-1"><span class="lanmutitle">栏目分类:</span></div>
                    <div class="col-xs-11">
                        <ul class="lanmu_ul">
                            <li class="active" id="notController"><a href="<@url><#if currDistrictId??>&districtId=${currDistrictId}</#if></@url>">不限</a></li>
                        <#list secondClass as sc>
                            <li id="lanmu${sc.scId}"><a href="<@url>&scId=${sc.scId}<#if currDistrictId??>&districtId=${currDistrictId}</#if></@url>">${sc.scName}</a></li>
                        </#list>
                        </ul>
                    </div>
                </div>
                <#list tags as tg>
                    <div class="row" style="border-bottom: 1px #e6e6e6 dashed;">
                        <div class="col-xs-1"><span class="lanmutitle">${tg.tagName}:</span></div>
                        <div class="col-xs-11">
                            <ul class="lanmu_ul2">
                                <li class="active" id="tag${tg.tagId}"><a href="<@url><#if currScId??>&scId=${currScId}</#if><#if currDistrictId??>&districtId=${currDistrictId}</#if>&tagId=${tg.tagId}-0</@url>">不限</a></li>
                                <#list tg.tagContents as tagContent>
                                    <li id="tagValue${tagContent.tcId}"><a href="<@url><#if currScId??>&scId=${currScId}</#if><#if currDistrictId??>&districtId=${currDistrictId}</#if>&tagId=${tg.tagId}-${tagContent.tcId}</@url>">${tagContent.tcName}</a></li>
                                </#list>
                            </ul>
                        </div>
                    </div>
                </#list>
                <div class="row" style="border-bottom: 1px #e6e6e6 dashed;">
                    <div class="col-xs-1"><span class="lanmutitle">地点:</span></div>
                    <div class="col-xs-11">
                        <ul class="lanmu_ul2">
                            <li class="active" id="districtNo"><a href="<@url><#if currScId??>&scId=${currScId}</#if></@url>">不限</a></li>
                            <#list districts as ds>
                                <li id="district${ds.districtId}"><a href="<@url><#if currScId??>&scId=${currScId}</#if>&districtId=${ds.districtId}</@url>">${ds.districtName}</a></li>
                            </#list>
                        </ul>
                    </div>
                </div>
            </div>
        </div>


        <div class="now_position">
            <div class="panel panel_self">
                <div class="panel-heading"><h4>开封${currMc.mcName}</h4></div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-11">
                            <#if pushInfos??&&(pushInfos?size>0)>
                                <#list pushInfos as pushInfo>
                                    <div class="row hover_info">
                                        <div class="col-xs-5 padding-top1">
                                            <div class="info_title"><a href="${base}/info?piId=${pushInfo.piId}">${pushInfo.piTitle}</a></div>
                                            <#list pushInfo.tagValues as tagValue>
                                            <#if tagValue.tagName=='月薪'>
                                                <span class="label label-danger">${tagValue.tcName}&nbsp;元/月</span>
                                            <#else>
                                                <span class="label label-success">${tagValue.tcName}</span>
                                            </#if>

                                            </#list>
                                        </div>
                                        <div class="col-xs-3 padding_top">
                                            <#if pushInfo.otherInfos??&&(pushInfo.otherInfos?size>0)>
                                                <#list pushInfo.otherInfos as otherInfo>
                                                    <#if otherInfo.picName??&&otherInfo.picName='公司名称'>
                                                        <span>${otherInfo.pcContent}</span>
                                                    </#if>
                                                </#list>
                                            </#if>
                                            <#if currMcId??&&currMcId!=1>
                                                <span>${pushInfo.piContactPerson}</span>
                                            </#if>
                                        </div>
                                        <div class="col-xs-2 padding_top">
                                            <span>${(pushInfo.piDistrictName)!""}</span>
                                        </div>
                                        <div class="col-xs-2 padding_top">
                                            <span class="info_yuan">${(pushInfo.piPushDate)!""}</span>
                                        </div>
                                    </div>
                                </#list>
                            <#else>
                            <div class="row hover_info">
                                <span>抱歉，暂时没有符合该条件的信息，请重新修改搜索条件后再搜索、筛选</span>
                            </div>
                            </#if>
                        </div>
                        <!-- 广告位-->
                        <div class="col-xs-1"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<@footer>
<script type="text/javascript" src="js/menu.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>

    <#if currScId??||currDistrictId??||(currTags?size>0)>
    <script type="text/javascript">
        $(function () {
            $("#lunbotu").css("display","none");
        });
    </script>
    </#if>

    <#if currTags??&&(currTags?size>0)>
    <script type="text/javascript">
    $(function () {
        <#list currTags as ct>
            $("#tag${ct.tagId}").removeClass("active");
            $("#tagValue${ct.tcId}").addClass("active");
        </#list>
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
</@footer>