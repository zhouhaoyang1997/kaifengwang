<#include "defaultLayout/defaultLayout.ftl">

<@header siteName="开封麦芒网" base_keywords="开封麦芒网" base_css=["global","style","all"]>

</@header>

<@body title="信息分类" back=true>
    <#list mainClass as mc>

    <div class="navv">
        <div class="nav_tt nav_ttbg1">
            <img src="http://www.5ol.com/template/default/images/index/icon_che.gif" align="center" valign="middle"
                 class="icon">&nbsp;
            <a href="index.php?mod=category&catid=2&cityid=1">${mc.mcName}</a>
        </div>
        <div class="big_dl sale">
            <ul>
                <#list mc.secondClasses as sc>
                    <li class="one_third"><a href="${request.contextPath}/push/fill?mcId=${mc.mcId}&scId=${sc.scId}">${sc.scName}</a></li>
                </#list>
            </ul>
        </div>
    </div>

    </#list>

</@body>

<@footer base_js=["jquery.min","common_1","iscroll-probe","slider","index"]>

</@footer>