<#include "defaultLayout/defaultLayout.ftl">

<@header siteName="开封麦芒网" base_keywords="开封麦芒网" base_css=["global","style","all"]>

</@header>

<@body title="发布信息-选择主要类别" back=true>
<div id="contactbar">
    <a href="/m/index" class="bottom_index">首页</a>
    <a href="/m/user/index" class="bottom_member">我的</a>
    <a href="#" class="bottom_history">推送</a>
    <a href="${baseUrl}/m/push/choose" class="bottom_post_on">发布</a>
</div>
    <#list mainClass as mc>

    <div class="navv">
        <div class="nav_tt nav_ttbg1">
            <img src="${baseUrl}/${mc.mcImg}" align="center" valign="middle"
                 class="icon">&nbsp;
            ${mc.mcName}
        </div>
        <div class="big_dl sale">
            <ul>
                <#list mc.secondClasses as sc>
                    <li class="one_third"><a href="${request.contextPath}/m/push/fill?mcId=${mc.mcId}&scId=${sc.scId}">${sc.scName}</a></li>
                </#list>
            </ul>
        </div>
    </div>

    </#list>

</@body>

<@footer base_js=["jquery.min","common_1","iscroll-probe"]>

</@footer>