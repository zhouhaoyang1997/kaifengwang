<#include "public/default.ftl">
<#include "public/pushdefault.ftl">
<#assign base="${request.contextPath}"/>
<@header title="麦芒网搜索页">
<link rel="stylesheet" href="${request.contextPath}/css/style.css">
<link rel="stylesheet" href="${request.contextPath}/css/menu.css">
<link rel="stylesheet" href="${base}/css/list.css">
</@header>

<@headerArea>
<li><a href="${base}/index">回首页</a></li>
</@headerArea>

<#-- 广告-->
<div class="advert">
    <div class="container_self">
        <div class="gg_box" style="background:url(${request.contextPath}/img/advert.jpg) no-repeat">
        </div>
    </div>
</div>

<@searchArea>
<h1><a href="${base}/index"><span>麦芒网搜索页</span></a></h1>
</@searchArea>

<div class="container_self">
    <div class="now_position">
        <i class="fa fa-home"></i><a href="/index">麦芒网</a>
    </div>
    <div class="panel panel_self now_position" >
        <div class="row" style="border-bottom: 1px #e6e6e6 dashed;">
            <div class="col-xs-1"><span class="lanmutitle">地点:</span></div>
            <div class="col-xs-11">
                <ul class="lanmu_ul2">
                    <li class="active" id="districtNo"><a href="">不限</a></li>
                <#list districts as ds>
                    <li id="district${ds.districtId}"><a href="">${ds.districtName}</a></li>
                </#list>
                </ul>
            </div>
        </div>
    </div>
    <div class="now_position">
        <div class="panel panel-default">
            <div class="panel-heading ">
                <div class="row">
                    <div class="col-xs-8">
                        <h4 style="color: #ff552e;">麦芒网搜索页</h4>
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

<@push_footer>
<script type="text/javascript" src="${base}/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${base}/js/basePath.js"></script>
<script type="text/javascript" src="${base}/js/quickClick.js"></script>
<script src="${base}js/hhshare.js"></script>
<script type="text/javascript" src="${base}/js/kkpager.min.js"></script>
<script type="text/javascript">
    function getParameter(name) {
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r!=null) return unescape(r[2]); return null;
    }

    //init
    $(function(){
        //关键字标红
        var regExp = new RegExp("(${keyWords!})","i");
        $(".info_title").each(function(i,n){//这是找到所有的class为“className”的标签，然后将其内容表标红。
            n.innerHTML=n.innerHTML.replace(regExp,"<span style='color:red'>$1</span>");
        });


        //分页开始
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
            hrefFormer : 'search',
            //链接尾部
            hrefLatter : '?key=${keyWords}',
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

    <#if currDistrictId??>
        $(function () {
            $("#districtNo").removeClass("active");
            $("#district${currDistrictId}").addClass("active");
        });
    </#if>
</script>
</@push_footer>