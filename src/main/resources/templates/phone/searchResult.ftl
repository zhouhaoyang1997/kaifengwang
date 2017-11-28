<#include "defaultLayout/defaultLayout.ftl">
<#assign base = "${request.contextPath}"/>

<@header siteName="开封麦芒网" base_css=["global","style","list","filter","search"] base_keywords="开封麦芒网">
<link rel="stylesheet" href="${base}/css/kkpager.css">
</@header>


<@body title="首页" back=true>
<form action="${baseUrl}/search" class="search_form" method="get">
    <div class="search_input">
        <input type="text" class="search_box" name="key" value="${keyWords!""}" placeholder="输入你感兴趣信息">

    </div>

    <#if currDistrictId??>
        <input type="hidden" name="district" value="${currDistrictId}">
    </#if>
    <input class="btn btn_search" type="submit">
</form>
<div class="filter2" id="filter2">

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
                            <dt class="tit" > <strong> <#if pushInfo.piTitle?length gt 13>${pushInfo.piTitle[0..14]}...<#else>${pushInfo.piTitle}</#if></strong>&nbsp;
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
            hrefFormer : 'search',
            //链接尾部
            <#if currDistrictId??>
                hrefLatter : '?key=${keyWords}&districtId=${currDistrictId}',
            <#else>
                hrefLatter : '?key=${keyWords}',
            </#if>
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
        <#if currTags??>
            <#list currTags as ct>
            $(function () {
                $("#tag${ct.tagId}").removeClass("active");
                $("#tagValue${ct.tcId}").addClass("active");
            });
            </#list>
        </#if>

</script>
</body>
</html>

</@footer>
