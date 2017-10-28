<#include "defaultLayout/defaultLayout.ftl">
<@base siteName="开封麦芒网" base_js=["jq_min.211","common"] base_css=["global","style","list","filter"] base_keywords="开封麦芒网" title="全职招聘">
    <#macro url>
    ${base}/m/infolist?mcId=${currMc.mcId}<#nested ><#if currTags??><#list currTags as tagStr>&tagId=${tagStr.tagId}-${tagStr.tcId}</#list></#if>
    </#macro>
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
            <a class="selected" href="<@url><#if currDistrictId??>&districtId=${currDistrictId}</#if></@url>">不限</a></li>
            <#list secondClass as sc>
                <a class=""  href="<@url>&scId=${sc.scId}<#if currDistrictId??>&districtId=${currDistrictId}</#if></@url>">${sc.scName}</a>
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
        <div class="clear1"></div>
        <li class="">
            <a href="index.php?mod=information&id=1229554">
                <img class="thumbnail" src="picture/pre_1506069120z0frn.png" alt="大型夜场男模团队领队招聘男模-绝对真实</strong>">
                <dl>
                    <dt class="tit" style="">大型夜场男模团队领队招聘男模-绝对真实&nbsp;<span
                            style="background:#339966; color:#FFFFFF; font-size:14px; padding:0 2px;text-align:center;">1图</span>
                    </dt>
                    <dd class="attr"><span>应聘加Q/Q8655.81.231领队宇哥直招微/信：134.3075.5000</span></dd>
                    <dd class="attr pr5">
                        <span class="lvzi">3天前</span>
                    </dd>
                </dl>
            </a>
        </li>

        <#if pushInfos??&&(pushInfos?size>0)>
            <#list pushInfos as pushInfo>
                <li class="">
                    <a href="">
                        <dl>
                            <dt class="tit" style="">${pushInfo.piTitle!""}&nbsp;<span
                                    style="background:#339966; color:#FFFFFF; font-size:14px; padding:0 2px;text-align:center;">1图</span>
                            </dt>
                            <dd class="attr" style="height:40px;line-height:20px;overflow:hidden;">水电费空间十分的合法的空间阿凡达哈付款就好打飞机快点发货的健康防护等级分活动经费和接受对方获得积分活动经费和大家思考</dd>
                            <dd class="attr" style="margin-left: 80%">
                                <span class="lvzi">${pushInfo.piPushDate}</span>
                            </dd>
                        </dl>
                    </a>
                </li>
            </#list>
        </#if>
    </ul>
</div>
<div class="clear1"></div>

<div class="pager">
    <a href="javascript:void();" class="pageprev pagedisable">上一页</a><a class="pageno pagecur">1</a><a
        href="?mod=category&catid=4&cityid=1&page=2" class="pageno">2</a><a
        href="?mod=category&catid=4&cityid=1&page=3" class="pageno">3</a><a
        href="?mod=category&catid=4&cityid=1&page=2" class="pagenext">下一页</a></div>
</div>
</@base>
<#--自定义脚本区-->
<script src="../js/phone/iscroll.js"></script>
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