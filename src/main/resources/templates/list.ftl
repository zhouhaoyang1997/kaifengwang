<#include "public/default.ftl">
<#assign base="${request.contextPath}"/>
<@header title="麦芒网${currMc.mcName}">
<link rel="stylesheet" href="${request.contextPath}/css/style.css">
<link rel="stylesheet" href="${request.contextPath}/css/menu.css">
<link rel="stylesheet" href="${base}/css/list.css">

</@header>

<@headerArea>
<li><a href="${base}/index">回首页</a></li>
</@headerArea>

<#macro url>${base}/list?mcId=${currMc.mcId}<#nested ><#if currTags??><#list currTags as tagStr>&tagId=${tagStr.tagId}-${tagStr.tcId}</#list></#if></#macro>
<#-- 广告-->
<div class="advert">
    <div class="container_self_advert">
        <div class="gg_box" style="background:url(${request.contextPath}${advertMap["list_gg_header"].advertUrl}) no-repeat;background-size: 100%">
        </div>
    </div>
</div>


<@searchArea>
<h1><img src="/img/kflogo2.png" width="48" height="48" alt="网站logo"><a href="${base}/index">开封<span>${currMc.mcName}</span></a></h1>
</@searchArea>

<#if currScId??||currDistrictId??||currTags??>
<#else>
<!--轮播图 -->
<#if banners??>

<div class="slider_width">
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
            <#list banners as banner>
                <#if banner_index==0>
                <div class="item active">
                <#else>
                <div class="item">
                </#if>

                        <div class="single-slide">
                            <div class="slide-bg" style="background-image: url('${banner.advertUrl}')"></div>
                            <div class="slide-text-wrapper">
                                <div class="slide-text">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-4 col-md-offset-8">
                                                <div class="slide-content">
                                                    <h2>${banner.bannerTitle}</h2>
                                                    <p>${banner.bannerContent}</p>
                                                    <a href="#" class="readmore">加入我们</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </#list>
                </div>

        </div>
    </div>

</div>
</#if>

</#if>


<!-- 下方显示职位类别及搜索-->
<div class="container_self">
        <div class="now_position">
            <i class="fa fa-home"></i><a href="/index">开封麦芒网</a>&nbsp;>&nbsp;<span>${currMc.mcName}</span>
        </div>
        <div class="panel panel_self now_position" >
            <div class="panel-body">
                <div class="row info_tag">
                    <div class="col-xs-1"><span class="lanmutitle">栏目分类:</span></div>
                    <div class="col-xs-11">
                        <ul class="lanmu_ul2">
                            <li class="active" id="notController"><a href="<@url><#if currDistrictId??>&districtId=${currDistrictId}</#if></@url>">不限</a></li>
                        <#list secondClass as sc>
                            <li id="lanmu${sc.scId}"><a href="<@url>&scId=${sc.scId}<#if currDistrictId??>&districtId=${currDistrictId}</#if></@url>">${sc.scName}</a></li>
                        </#list>
                        </ul>
                    </div>
                </div>
                <#list tags as tg>
                    <div class="row info_tag">
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
                <div class="row info_tag">
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
            <div class="panel panel-default">
                <div class="panel-heading ">
                    <div class="row">
                        <div class="col-xs-8">
                            <h4 class="list_title">开封${currMc.mcName}</h4>
                        </div>
                        <div class="col-xs-4">
                            <span>您知道吗？ <a href="${base}/about/service" target="_blank" style="color: #ff552e">置顶</a>发布的信息可使成交率提高50%！</span>
                        </div>
                    </div>
                </div>
                <div class="panel-body" style="min-height: 1000px;">
                    <div class="row">
                        <div class="col-xs-10">
                            <#if pushInfos??&&(pushInfos?size>0)>
                                <#list pushInfos as pushInfo>
                                    <div class="row hover_info">
                                        <div class="col-xs-4 padding-top1">
                                            <a href="${base}/info?piId=${pushInfo.piId}">
                                                <div class="info_title">
                                                    <#if pushInfo.piTitle?length gt 13>${pushInfo.piTitle[0..14]}...<#else>${pushInfo.piTitle}</#if>
                                                    <#if pushInfo.piImg??>
                                                    <span class="self_label label-primary">有图</span>
                                                    </#if>
                                                </div>
                                                <div class="list_tag">
                                                    <#list pushInfo.tagValues as tagValue>
                                                        <#if tagValue.tagName=='月薪'>
                                                            <span class="label-danger">${tagValue.tcName}&nbsp;元/月</span>
                                                        <#else>
                                                            <span class="label-success">${tagValue.tcName}</span>
                                                        </#if>
                                                    </#list>
                                                </div>
                                            <div class="inforbox">
                                                <div class="arrow"> <em></em> <span></span> </div>
                                                <div class="tipsbox">
                                                    <a href="${base}/info?piId=${pushInfo.piId}" class="ib-btn">查看详情</a>
                                                    <h3><#if pushInfo.piTitle?length gt 13>${pushInfo.piTitle[0..14]}...<#else>${pushInfo.piTitle}</#if></h3>
                                                    <ul class="lists">
                                                        <#list pushInfo.tagValues as tagValue>
                                                            <li> <span>${tagValue.tagName}：</span> ${tagValue.tcName} </li>
                                                        </#list>
                                                        <#list pushInfo.otherInfos as otherInfo>
                                                            <li> <span>${otherInfo.picName}：</span> ${otherInfo.pcContent} </li>
                                                        </#list>
                                                    </ul>

                                                    <dl class="content"><span class="infoDesc">信息简介: </span>
                                                        <#if pushInfo.piContent??>
                                                            <#if pushInfo.piContent?length gt 100>
                                                            ${pushInfo.piContent[0..100]}
                                                            <#else>
                                                            ${pushInfo.piContent}
                                                            </#if>
                                                        <#else>
                                                            欢迎您联系我!
                                                        </#if> </dl>
                                                    <dl class="warning">
                                                        <strong> 麦芒网提醒：</strong> 让你提前汇款，或者价格明显低于市价，均有骗子嫌疑，不要轻易相信。
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-xs-4 padding_top">
                                            <#if currMc.mcId!=1>
                                                <span>${pushInfo.piContactPerson}</span>
                                            <#else>
                                                <#list pushInfo.otherInfos as otherInfo>
                                                    <#if otherInfo.picName??&&otherInfo.picName='公司名称'>
                                                        <span>${otherInfo.pcContent}</span>
                                                    </#if>
                                                </#list>
                                            </#if>
                                        </div>
                                        <div class="col-xs-2 padding_top">
                                            <span>${(pushInfo.piDistrictName)!""}</span>
                                        </div>
                                        <div class="col-xs-2 padding_top">
                                            <span style="color: #3d8de2;">${(pushInfo.piPushDate)?string("yyyy-MM-dd")}</span>
                                            <span class="jiaji">急</span>
                                        </div>
                                    <#if pushInfo.piChujia gt 0>
                                        <i class="urgent_jingjia"></i>
                                    <#else>
                                        <#if pushInfo.piZhiding==1>
                                            <i class="urgent"></i>
                                        </#if>
                                    </#if>
                                    </div>
                                </#list>
                            <#else>
                            <div class="row hover_info">
                                <span>抱歉，暂时没有符合该条件的信息，请重新修改搜索条件后再搜索、筛选</span>
                            </div>
                            </#if>
                        </div>
                        <!-- 广告位-->
                        <div class="col-xs-2">
                            <img src="${base}${advertMap["list_gg_1"].advertUrl}" class="img-thumbnail" style="width: 170px;height: 600px" alt="">
                            <img src="${base}${advertMap["list_gg_2"].advertUrl}" class="img-thumbnail" style="width: 170px;height: 600px" alt="">
                            <img src="${base}${advertMap["list_gg_3"].advertUrl}" class="img-thumbnail" style="width: 170px;height: 600px" alt="">
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-offset-2 col-xs-8">
                        <div class="container">
                            <div id="kkpager"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>




<@footer>

<script src="${base}/js/owl.carousel.min.js"></script>
<script type="text/javascript" src="${base}/js/kkpager.min.js"></script>
<!-- 快速点击js-->
<script type="text/javascript" src="${base}/js/basePath.js"></script>
<script type="text/javascript" src="${base}/js/quickClick.js"></script>
    <@floating/>
<script type="text/javascript">

    function getParameter(name) {
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r!=null) return unescape(r[2]); return null;
    }

    //init
    $(function(){

        var totalPage = ${pageUtil.pageNums};
        var totalRecords = ${pageUtil.total};
        var pageNo = getParameter('pno');
        if(!pageNo){
            pageNo = 1;
        }
        //生成分页
        //有些参数是可选的，比如lang，若不传有默认值
        kkpager.generPageHtml({
            pno : pageNo,
            //总页码
            total : totalPage,
            //总数据条数
            totalRecords : totalRecords,
            //链接前部
            hrefFormer : '<@url><#if currDistrictId??>&districtId=${currDistrictId}</#if><#if currScId??>&scId=${currScId}</#if></@>',
            //链接尾部
            hrefLatter : '',
            getLink : function(n){
                return this.hrefFormer + this.hrefLatter + "&pno="+n;
            }
            /*
            ,lang				: {
                firstPageText			: '首页',
                firstPageTipText		: '首页',
                lastPageText			: '尾页',
                lastPageTipText			: '尾页',
                prePageText				: '上一页',
                prePageTipText			: '上一页',
                nextPageText			: '下一页',
                nextPageTipText			: '下一页',
                totalPageBeforeText		: '共',
                totalPageAfterText		: '页',
                currPageBeforeText		: '当前第',
                currPageAfterText		: '页',
                totalInfoSplitStr		: '/',
                totalRecordsBeforeText	: '共',
                totalRecordsAfterText	: '条数据',
                gopageBeforeText		: '&nbsp;转到',
                gopageButtonOkText		: '确定',
                gopageAfterText			: '页',
                buttonTipBeforeText		: '第',
                buttonTipAfterText		: '页'
            }*/

            //,
            //mode : 'click',//默认值是link，可选link或者click
            //click : function(n){
            //	this.selectPage(n);
            //  return false;
            //}
        });
    });
</script>



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