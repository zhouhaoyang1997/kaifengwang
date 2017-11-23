<#include "defaultLayout/defaultLayout.ftl">
<@base siteName="开封麦芒网" base_js=["jq_min.211_1","common_1"] base_css=["global","style","all"] base_keywords="开封麦芒网" title="首页">

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
                    <li><a href="${request.contextPath}/push/fill?mcId=${mc.mcId}&scId=${sc.scId}">${sc.scName}</a></li>
                </#list>
            </ul>
        </div>
    </div>

    </#list>

<div class="navv">
    <div class="nav_tt nav_ttbg1">
        <img src="http://www.5ol.com/template/default/images/index/icon_che.gif" align="center" valign="middle"
             class="icon">&nbsp;
        <a href="index.php?mod=category&catid=2&cityid=1">招聘</a>
    </div>
    <div class="big_dl sale">
        <ul>
            <#list zhaopin as z>
                <li class="one_third"><a href="index.php?mod=category&catid=28&cityid=1">${z.scName}</a></li>
            </#list>
        </ul>
    </div>
</div>
<div class="navv">
    <div class="nav_tt nav_ttbg1">
        <img src="http://www.5ol.com/template/default/images/index/icon_che.gif" align="center" valign="middle"
             class="icon">&nbsp;
        <a href="index.php?mod=category&catid=2&cityid=1">二手市场</a>
    </div>
    <div class="big_dl sale">
        <ul>
            <#list ershou as x>
                <li class="one_third"><a href="index.php?mod=category&catid=28&cityid=1">${x.scName}</a></li>
            </#list>
        </ul>
    </div>
</div>
<div class="navv">
    <div class="nav_tt nav_ttbg1">
        <img src="http://www.5ol.com/template/default/images/index/icon_che.gif" align="center" valign="middle"
             class="icon">&nbsp;
        <a href="index.php?mod=category&catid=2&cityid=1">房产</a>
    </div>
    <div class="big_dl sale">
        <ul>
            <#list fangchan as x>
                <li class="one_third"><a href="index.php?mod=category&catid=28&cityid=1">${x.scName}</a></li>
            </#list>
        </ul>
    </div>
</div>
<div class="navv">
    <div class="nav_tt nav_ttbg1">
        <img src="http://www.5ol.com/template/default/images/index/icon_che.gif" align="center" valign="middle"
             class="icon">&nbsp;
        <a href="index.php?mod=category&catid=2&cityid=1">生活</a>
    </div>
    <div class="big_dl sale">
        <ul>
            <#list shenghuo as x>
                <li class="one_third"><a href="index.php?mod=category&catid=28&cityid=1">${x.scName}</a></li>
            </#list>
        </ul>
    </div>
</div>
<div class="navv">
    <div class="nav_tt nav_ttbg1">
        <img src="http://www.5ol.com/template/default/images/index/icon_che.gif" align="center" valign="middle"
             class="icon">&nbsp;
        <a href="index.php?mod=category&catid=2&cityid=1">宠物</a>
    </div>
    <div class="big_dl sale">
        <ul>
            <#list chongwu as x>
                <li class="one_third"><a href="index.php?mod=category&catid=28&cityid=1">${x.scName}</a></li>
            </#list>
        </ul>
    </div>
</div>
<div class="navv">
    <div class="nav_tt nav_ttbg1">
        <img src="http://www.5ol.com/template/default/images/index/icon_che.gif" align="center" valign="middle"
             class="icon">&nbsp;
        <a href="index.php?mod=category&catid=2&cityid=1">名企</a>
    </div>
    <div class="big_dl sale">
        <ul>
            <#list mingqi as x>
                <li class="one_third"><a href="index.php?mod=category&catid=28&cityid=1">${x.scName}</a></li>
            </#list>
        </ul>
    </div>
</div>
</@base>
