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
                        <li><a href="#"><i class="fa fa-edit"></i> 修改/删除信息</a></li>
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
                            <a href="" class="dropdown-toggle" data-toggle="dropdown">${user.userName}</a>
                            <ul class="dropdown-menu">
                                <li><a href="${base}/user/info">账户设置</a></li>
                                <li><a href="${base}/user/personal">个人中心</a></li>
                                <li><a href="${base}/user/extension">推广中心</a></li>
                                <li class="divider"></li>
                                <li><a href="${base}/user/attc">公司认证</a></li>
                                <li class="divider"></li>
                                <li><a href="#">我的简历</a></li>
                            </ul>
                        </li>
                        <#--该方法返回当前页面uri -->
                        <li>
                            <a href="${base}/logout">注销</a>
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
            <div class="col-xs-2">
                <div style="list-style: none">
                    <h4>关于我们</h4>
                    <li><p>本站公告</p></li>
                    <li><p>加盟与合作</p></li>
                    <li><p>网站地图</p></li>

                </div>
            </div>

            <div class="col-xs-2">
                <div style="list-style: none">
                    <h4>服务支持</h4>
                    <li><p>推广服务</p></li>
                    <li><p>渠道招商</p></li>
                    <li><p>举报平台</p></li>

                </div>
            </div>
            <div class="col-xs-2">
                <div style="list-style: none">
                    <h4>帮助中心</h4>
                    <li><p>常见问题</p></li>
                    <li><p>更多帮助</p></li>
                    <li><p>意见反馈</p></li>
                    <li><p>隐私权条款</p></li>
                </div>
            </div>
            <div class="col-xs-3">
                <div style="list-style: none">
                    <img src="${base}/img/二维码.png" alt="扫码访问手机版">
                </div>
            </div>
        </div>
        <div class="row">
            <p style="text-align: center">Copyright © 河南开封 ｜xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx所有</p>
            <p style="text-align: center">河南大学网站工作室</p>
        </div>
    </div>
</div>
<script type="text/javascript" src="${base}/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/js/bootstrap.min.js"></script>
    <#nested >
</body>
</html>
</#macro>