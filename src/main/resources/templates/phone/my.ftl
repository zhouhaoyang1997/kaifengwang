<#include "defaultLayout/defaultLayout.ftl">
<#assign base="${request.contextPath}"/>
<@header siteName="开封麦芒网"  base_css=["global","style","usercenter","bootstrap.min"] base_keywords="开封麦芒网" >

</@header>
<#--js-->
<@body title="首页" back=true>
<div id="contactbar">
    <a href="/m/index" class="bottom_index">首页</a>
    <a href="/m/user/info" class="bottom_member_on">我的</a>
    <a href="#" class="bottom_history">推送</a>
    <a href="${baseUrl}/m/push/choose" class="bottom_post">发布</a>
</div>
<div class="heading">
    <div>
        <img src="${baseUrl}/${user.userImg!''}" class="img-circle" style="max-width: 60px">
    </div>
    <div >
        <h3 >${user.userName!''}</h3>
        <h5 >修改资料|修改密码</h5>
    </div>
</div>
<ul class="list-group NumPanel" style="background: orangered">
    <li class="list-group-item left">发布：${pushCounts!''}</li>
    <li class="list-group-item left">收藏：${clCounts!''}</li>
</ul>
<ul class="list-group">
    <li class="clear"></li>
    <li class="list-group-item" onclick="location='${baseUrl}/m/user/personal'"><img src="${baseUrl}/img/jz.png" align="center" valign="middle" class="icon">&nbsp;&nbsp;&nbsp;我的收藏<span class="badge">></span></li>
    <li class="list-group-item" onclick="location='${baseUrl}/m/user/pushing'"><img src="${baseUrl}/img/jz.png" align="center" valign="middle" class="icon">&nbsp;&nbsp;&nbsp;我的发布<span class="badge">></span></li>
    <li class="list-group-item"><img src="${baseUrl}/img/jz.png" align="center" valign="middle" class="icon">&nbsp;&nbsp;&nbsp;我的简历<span class="badge">></span></li>
    <li class="list-group-item"><img src="${baseUrl}/img/jz.png" align="center" valign="middle" class="icon">&nbsp;&nbsp;&nbsp;公司认证<span class="badge">></span></li>
    <li class="clear"></li>
    <li class="list-group-item"><img src="${baseUrl}/img/jz.png" align="center" valign="middle" class="icon">&nbsp;&nbsp;&nbsp;帮助信息<span class="badge">></span></li>
    <li class="list-group-item"><img src="${baseUrl}/img/jz.png" align="center" valign="middle" class="icon">&nbsp;&nbsp;&nbsp;关于<span class="badge">></span></li>
</ul>
<div class="text-center"><button class="btn-lg btn-danger" >退出登录</button></div>

</@body>

<@footer base_js=["jq_min.211_1","bootstrap.min"]>

</@footer>