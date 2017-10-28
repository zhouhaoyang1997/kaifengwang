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
    <div class="container_self">
        <div class="gg_box" style="background:url(${request.contextPath}/img/advert.jpg) no-repeat">
        </div>
    </div>
</div>


<@searchArea>
<h1><a href="${base}/index">开封<span>${currMc.mcName}</span></a></h1>
</@searchArea>


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
            <div class="panel panel-default">
                <div class="panel-heading ">
                    <div class="row">
                        <div class="col-xs-8">
                            <h4 style="color: #ff552e;">开封${currMc.mcName}</h4>
                        </div>
                        <div class="col-xs-4">
                            <span>您知道吗？ <a href="${base}/about/service" style="color: #ff552e">置顶</a>发布的信息可使成交率提高50%！</span>
                        </div>
                    </div>
                </div>
                <div class="panel-body" style="min-height: 1000px;">
                    <div class="row">
                        <div class="col-xs-10">
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
                        <div class="col-xs-2">
                            <img src="${base}/img/gg_fz.jpg" class="img-thumbnail" style="width: 170px;height: 600px" alt="">
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


<div class="asid_share" id="asid_share">
    <div class="asid_share_box relative">
        <a href="#"><img alt="我有话说" title="我有话说" class="adid_icon" src="img/icon_say.png"></a>
    </div>
    <div class="asid_share_box relative">
        <a href="#"><img alt="新版帮助" title="新版帮助" class="adid_icon" src="img/icon_help.png"></a>
        <div class="asid_share_triangle" style="display:none;">
            <em class="border_sj">&#9670;</em>
            <span class="con_sj">&#9670;</span>
        </div>
        <div class="asid_sha_layer" style="display:none;">
            <ul class="asid_help_list" style="width:130px;">
                <li><a href="#">测试数据</a></li>
                <li><a href="#">测试数据</a></li>
                <li><a href="#">测试数据</a></li>
                <li><a href="#">测试数据</a></li>
            </ul>
        </div>
    </div>
    <div class="asid_share_box relative" style="display:none;">
        <a href="#"><img alt="返回顶部" title="返回顶部" class="adid_icon" src="img/icon_back.png"></a>
    </div>
</div>


<@footer>
<script src="${base}js/hhshare.js"></script>
<script type="text/javascript" src="js/menu.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>
<script type="text/javascript" src="${base}/js/kkpager.min.js"></script>
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
            hrefFormer : '<@url></@>',
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