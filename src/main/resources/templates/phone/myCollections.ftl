<#include "defaultLayout/defaultLayout.ftl">
<@header siteName="开封麦芒网"  base_css=["global","style","list"] base_keywords="开封麦芒网" >

</@header>

<@body title="收藏" back=true>
<div>
    <ul class="list-info">
    <#--结果集合-->
        <div class="clear1"></div>
        <li class="">
            <a href="#">
                <img class="thumbnail" src="${baseUrl}/img/pushimg/4feccb07-f8cb-4d94-ada9-508245af39b1.jpg">
                <dl>
                    <dt class="tit" style="">大型夜场男模团队领队招聘男模-绝对真实&nbsp;<span
                            style="background:#339966; color:#FFFFFF; font-size:14px; padding:0 2px;text-align:center;">1图</span>
                    </dt>
                    <dd class="attr"><span>应聘加Q/Q8655.81.231领队宇哥直招微/信：134.3075.5000</span></dd>
                    <dd class="attr pr5">
                        <span>3天前</span>
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
</@body>
<#--js-->
<@footer base_js=["jquery.min"]></@footer>