<#include "defaultLayout/defaultLayout.ftl">
<#assign baseUrl = "${request.contextPath}"/>

<@header siteName="麦芒网"  base_css=["global","style","search"] base_keywords="麦芒网">

</@header>

<@body title="麦芒网" back=true>
    <form action="${baseUrl}/search" class="search_form" method="get">
            <div class="search_input">
                <input type="text" class="search_box" name="key" value="${keyWords!""}" placeholder="输入你感兴趣信息">

            </div>

            <#if currDistrictId??>
                <input type="hidden" name="district" value="${currDistrictId}">
            </#if>
            <input class="btn btn_search" type="submit">
    </form>
    <div class="quickClick">
        <div class="hot"><span>热门搜索</span></div>
        <ul id="hotSearch" class="mylist">

        </ul>
    </div>
</@body>
<@footer base_js=["jquery.min","common_1","iscroll-probe","slider"]>
<!-- 快速点击js-->
<script type="text/javascript" src="${baseUrl}/js/basePath.js"></script>
<script type="text/javascript" src="${baseUrl}/js/quickClick.js"></script>
</@footer>


