<#macro header title="开封城市网">
<#assign base = "${request.contextPath}"/>
<!DOCTYPE HTML>
<html>
<head lang="zh">
    <title>${title}</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="${base}/css/bootstrap.min.css" >
    <link rel="stylesheet" href="${base}/css/font-awesome.min.css">
    <#nested >
</head>
<body>
</#macro>

<#macro headerArea>
<div class="header-area">
    <div class="container_self">
        <div class="row">
            <div class="col-xs-8">
                <div class="user-menu">
                    <ul>
                        <li><p>欢迎来到开封城市网!</p></li>
                        <li><a href="${base}/push/choose"><i class="fa fa-heart"></i> 快速发布信息</a></li>
                        <li><a href="${base}/user/personal"><i class="fa fa-edit"></i> 修改/删除信息</a></li>
                        <li><a href="#"><i class="fa fa-phone"></i> 手机浏览</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-xs-4">
                <div class="header-right">
                    <ul class="list-unstyled list-inline">
                        <#nested >
                        <#if Session.user??>
                        <li  class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> ${user.userName}</a>
                            <ul class="dropdown-menu">
                                <li><a href="${base}/user/info">账户设置</a></li>
                                <li><a href="${base}/user/personal">个人中心</a></li>
                                <li><a href="${base}/user/extension">推广中心</a></li>
                                <li class="divider"></li>
                                <li><a href="${base}/user/attc">公司认证</a></li>
                                <li class="divider"></li>
                                <li><a href="${base}/user/resume">我的简历</a></li>
                            </ul>
                        </li>
                        <#--该方法返回当前页面uri -->
                        <li>
                            <a href="${base}/logout"><i class="fa fa-window-close"></i> 注销</a>
                        </li>
                        <#else>
                            <li><a href="${base}/login">登录</a></li>
                            <li><a href="${base}/register">注册</a></li>
                        </#if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End header area -->
</#macro>

<#macro footer>
<#-- 页脚-->
<div class="footerPage" style="">
    <div class="container_self">
        <div class="row" style="padding-top: 15px;">
            <div class="col-xs-3">
                <div class="logo">
                    <h1><a href="/index">开封<span>城市网</span></a></h1>
                </div>
            </div>
            <div class="col-xs-2 footer_ul">
                <ul>
                    <li><h4>关于我们</h4></li>
                    <li><p><a href="${base}/about/cpdesc">公司介绍</a></p></li>
                    <li><p><a href="${base}/about/contact">联系方式</a></p></li>
                    <li><p><a href="${base}/about/friend">友情链接</a></p></li>
                </ul>
            </div>

            <div class="col-xs-2 footer_ul">
                <ul>
                    <li><h4>服务支持</h4></li>
                    <li><p><a href="${base}/about/service">推广服务</a></p></li>
                    <li><p><a href="${base}/about/charge">收费标准</a></p></li>
                    <li><p><a href="${base}/about/attc">企业认证</a></p></li>
                </ul>
            </div>
            <div class="col-xs-2 footer_ul">
                <ul>
                    <li><h4>帮助中心</h4></li>
                    <li><p><a href="${base}/about/help">使用帮助</a></p></li>
                    <li><p><a href="${base}/about/law">隐私权条款</a></p></li>
                </ul>
            </div>
            <div class="col-xs-3">
                <div style="list-style: none">
                    <img src="${base}/img/二维码.png" alt="扫码访问手机版">
                </div>
            </div>
        </div>
        <div class="row">
            <p style="text-align: center">Copyright © 河南开封 ｜河南省麦芒网络科技有限公司所有</p>
        </div>
    </div>
</div>
<script type="text/javascript" src="${base}/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/js/bootstrap.min.js"></script>
    <#nested >
</body>
</html>
</#macro>