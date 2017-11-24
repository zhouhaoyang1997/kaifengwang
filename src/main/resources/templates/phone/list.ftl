<#include "defaultLayout/defaultLayout.ftl">
<#assign base = "${request.contextPath}"/>

<#macro url>${base}/m/list?mcId=${currMc.mcId}<#nested ><#if currTags??><#list currTags as tagStr>&tagId=${tagStr.tagId}-${tagStr.tcId}</#list></#if></#macro>
<@header siteName="开封麦芒网" base_css=["global","style","list","filter"] base_keywords="开封麦芒网">
<link rel="stylesheet" href="${base}/css/kkpager.css">
</@header>


<@body title="首页" back=true>
<div class="filter2" id="filter2">

    <ul class="tab cfix">
        <li class="item"><a href="javascript:void(0);"><span id="str_a_node">分类</span><em></em></a></li>
        <li class="item"><a href="javascript:void(0);"><span id="str_b_node">区域</span><em></em></a></li>
        <#list tags as tag>
            <li class="item"><a href="javascript:void(0);"><span id="str_salary_node">${tag.tagName}</span><em></em></a>
            </li>
        </#list>
    </ul>

    <div class="inner" style="display:none;">

        <ul>
            <li><a class="selected" href="<@url><#if currDistrictId??>&districtId=${currDistrictId}</#if></@url>">不限</a></li>
            <#list secondClass as sc>
                <li><a class=""  href="<@url>&scId=${sc.scId}<#if currDistrictId??>&districtId=${currDistrictId}</#if></@url>">${sc.scName}</a></li>
            </#list>
        </ul>

    </div>

    <div class="inner" style="display:none;">
        <ul>
            <li><a  class='selected' href="<@url><#if currScId??>&scId=${currScId}</#if></@url>">不限</a></li>
            <#list districts as ds>
                <li><a  href="<@url><#if currScId??>&scId=${currScId}</#if>&districtId=${ds.districtId}</@url>">${ds.districtName}</a></li>
            </#list>
        </ul>
    </div>

    <#list tags as tg>
        <div class="inner" style="display:none;">
            <ul>
                <a class="selected" href="<@url><#if currScId??>&scId=${currScId}</#if><#if currDistrictId??>&districtId=${currDistrictId}</#if>&tagId=${tg.tagId}-0</@url>">不限</a>
                <#list tg.tagContents as tagContent>
                    <a class="" href="<@url><#if currScId??>&scId=${currScId}</#if><#if currDistrictId??>&districtId=${currDistrictId}</#if>&tagId=${tg.tagId}-${tagContent.tcId}</@url>">${tagContent.tcName}</a>
                </#list>
            </ul>
        </div>
    </#list>

    <div class="inner_parent" id="parent_container" style="display:none;">
        <div class="innercontent"></div>
    </div>
    <div class="inner_child" id="inner_container" style="display:none;">
        <div class="innercontent"></div>
    </div>
</div>
<div class="fullbg" id="fullbg" style="height: 1632px; display: none"><i class="pull2"></i></div>
<div class="infolst_w">
    <ul class="list-info">
    <#--结果集合-->
        <#if pushInfos??&&(pushInfos?size>0)>
            <#list pushInfos as pushInfo>
                <li class="">
                    <a href="${base}/m/info?piId=${pushInfo.piId}">
                        <dl>
                            <dt class="tit" style=""> <strong> ${pushInfo.piTitle!""}</strong>&nbsp;
                                <#if pushInfo.piImg??>
                                    <span style="background:#339966; color:#FFFFFF; font-size:14px; padding:0 2px;text-align:center;">有图</span>
                                </#if>
                            </dt>
                            <dd class="attr" style="height:40px;line-height:20px;overflow:hidden;">
                                <#if pushInfo.piContent??>
                                    <#if pushInfo.piContent?length gt 100>
                                    ${pushInfo.piContent[0..100]}
                                    <#else>
                                    ${pushInfo.piContent}
                                    </#if>
                                <#else>
                                    欢迎您联系我!
                                </#if>
                            </dd>
                            <dd class="attr" style="border-top: 1px dashed #cacaca;padding-top: 3px">
                <#list pushInfo.tagValues as tagValue>
                     <span class="info_left">${tagValue.tcName}</span>
                </#list>
                                <span class="lvzi" style="float: right;">${(pushInfo.piPushDate)?string("yyyy-MM-dd")}</span>
                            </dd>
                        </dl>
                    </a>
                </li>
            </#list>
        </#if>
    </ul>
</div>
<div class="clear1"></div>

<div id="kkpager"></div>
</@body>

<@footer base_js=["jq_min.211","common"]>
<script type="text/javascript" src="${base}/js/kkpager.min.js"></script>
<script src="../js/phone/iscroll.js"></script>


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
<script>
    document.addEventListener('DOMContentLoaded', function () {
        window['myScroll_parent'] = null;
        window['myScroll_inner'] = null;
        showFilter({ibox: 'filter2', content1: 'parent_container', content2: 'inner_container', fullbg: 'fullbg'});
    }, false);
</script>
</body>
</html>
    <#if currScId??||currDistrictId??||(currTags?size>0)>
    <script type="text/javascript">
        $(function () {
            $("#lunbotu").css("display", "none");
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
<script type="text/javascript">
        <#list currTags as ct>
        $(function () {
            $("#tag${ct.tagId}").removeClass("active");
            $("#tagValue${ct.tcId}").addClass("active");
        });
        </#list>
</script>
</@footer>
