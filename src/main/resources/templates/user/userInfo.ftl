<#include "../public/default.ftl">
<#include "../public/pushdefault.ftl">
<#include "../public/userdefault.ftl">
<#assign base="${request.contextPath}"/>
<@header title="麦芒网">
<link rel="stylesheet" href="${base}/css/style.css">
<link rel="stylesheet" href="${base}/css/menu.css">
<link rel="stylesheet" href="${base}/css/userInfo.css">

</@header>
<@headerArea>
<li><a href="${base}/index">回首页</a></li>
</@headerArea>
<@user_nav>
<div class="col-md-3">
    <div class="user_bar"><h4><a href="${base}/user/personal">个人中心</a></h4></div>
</div>
<div class="col-md-3">
    <div class="user_bar"><h4><a href="${base}/user/info" style="font-size: 18px;font-weight: 600">账户设置</a></h4></div>
</div>
</@user_nav>

<div class="container_self" style="min-height: 800px;">
    <div class="row">
        <div class="col-md-2" style="width:20%">
            <!-- Contenedor -->
            <ul id="accordion" class="accordion">
                <li>
                    <a href="${base}/user/personal"><div class="link"><i class="fa fa-paint-brush"></i>个人中心<i class="fa fa-chevron-down"></i></div></a>

                </li>
                <li class="active open">
                    <div class="link"><i class="fa fa-code"></i>账户设置<i class="fa fa-chevron-down"></i></div>
                    <ul class="submenu" style="display: block;">
                        <li><a href="${base}/user/info">个人资料</a></li>
                        <li><a href="${base}/user/info/pwd">密码设置</a></li>
                        <li><a href="${base}/user/info/pic">头像设置</a></li>
                        <li><a href="${base}/user/info/alterInfo">修改资料</a></li>
                    </ul>
                </li>
                <li>
                    <a href="${base}/user/extension" target="_blank"><div class="link"><i class="fa fa-mobile"></i>推广中心</div></a>
                </li>
                <li>
                    <a href="${base}/user/attc"><div class="link"><i class="fa fa-id-card-o"></i>公司认证</div></a>
                </li>
                <li><a href="${base}/user/resume"><div class="link"><i class="fa fa-globe"></i>我的简历</div></a></li>
            </ul>


        </div>
        <div class="col-md-9">
            <div style="margin-top: 20px;">
                <div class="panel panel-default">
                    <div class="panel-heading"><h3>我的资料</h3></div>
                    <div class="panel-body">
                        <div class="profile-left">
                            <!-- PROFILE HEADER -->
                            <div class="profile-header">
                                <div class="overlay"></div>
                                <div class="profile-main">
                                    <#if userInfo.userImg??>
                                        <img src="${base}/${userInfo.userImg}" width="100px" height="100px" class="img-circle" alt="Avatar">
                                    <#else>
                                        <img src="${base}/img/noimage.png" width="100px" height="100px" class="img-circle" alt="Avatar">
                                    </#if>

                                    <h3 class="name">${userInfo.userName}</h3>
                                    <span>麦芒网欢迎你</span>
                                </div>
                                <div class="profile-stat">
                                    <div class="row">
                                        <div class="col-md-4 stat-item">
                                            ${userInfo.userPush} <span>发布</span>
                                        </div>
                                        <div class="col-md-4 stat-item">
                                            ${userInfo.userCollection} <span>收藏</span>
                                        </div>
                                        <div class="col-md-4 stat-item">
                                            <#if userInfo.lastedTime??>
                                            ${userInfo.lastedTime?string("yyyy-MM-dd")} <span>最后登陆时间</span>
                                            </#if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END PROFILE HEADER -->
                            <!-- PROFILE DETAIL -->
                            <div class="profile-detail">
                                <div class="profile-info">
                                    <h4 class="heading">基础信息</h4>
                                    <ul class="list-unstyled list-justify">
                                        <li>用户名 <span>${userInfo.userName}</span></li>
                                        <li><#if userInfo.userPhone??>手机号 <span>${userInfo.userPhone}</span>
                                        <#else>手机号 <span>暂未绑定手机号</span></#if></li>
                                        <li>邮箱 <span>${userInfo.userEmail!""}</span></li>
                                    </ul>
                                </div>
                                <div class="profile-info">
                                    <h4 class="heading">个人简介</h4>
                                    <#if userInfo.userDescription??>
                                        <p>${userInfo.userDescription}</p>
                                    <#else>
                                        <p>你还没有个人简介信息,快去 <a href="${base}/user/info/alterInfo">修改</a> 吧!</p>
                                    </#if>
                                </div>
                            </div>
                            <!-- END PROFILE DETAIL -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<@push_footer>
<script type="text/javascript" src="${base}/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/js/bootstrap.min.js"></script>
</@push_footer>


