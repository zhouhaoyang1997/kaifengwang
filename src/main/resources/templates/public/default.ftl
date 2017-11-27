<#macro header title="麦芒网">
<#assign base = "${request.contextPath}"/>
<!DOCTYPE html>
<html>
<head lang="zh">
    <title>${title}</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="${base}/css/bootstrap.min.css" >
    <link rel="stylesheet" href="${base}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${base}/css/floating.css">
    <link rel="shortcut icon" href="${base}/ico/mmfavicon.ico">
    <script type="text/javascript">
        //判断是否移动端访问
        browserRedirect();
        function browserRedirect() {
            var sUserAgent = navigator.userAgent.toLowerCase();
            var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";
            var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";
            var bIsMidp = sUserAgent.match(/midp/i) == "midp";
            var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
            var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";
            var bIsAndroid = sUserAgent.match(/android/i) == "android";
            var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";
            var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";

            if (bIsIpad || bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM) {
                window.location.href = "${base}/m${springMacroRequestContext.getRequestUri()}<#if request.queryString??>?${request.queryString}</#if>";
            }
        }
    </script>
    <#nested >
</head>
<body style="min-width: 1200px;">
</#macro>
<#macro searchArea>
<div class="site-branding-area">
    <div class="container_self" style="background: #FFF;">
        <div class="row">
            <div class="col-xs-4">
                <div class="logo">
                    <#nested >
                </div>
            </div>

            <div class="col-xs-5">
                <div class="search-box">
                    <form action="${base}/search" method="get">
                        <div class="input-group">
                            <input type="text" class="form-control search_box" name="key" value="${keyWords!""}" placeholder="输入你感兴趣信息">
                            <#if currDistrictId??>
                                <input type="hidden" name="district" value="${currDistrictId}">
                            </#if>
                            <span class="input-group-btn">
                                <button class="btn btn_search" type="submit">麦芒搜索</button>
                            </span>
                        </div>
                    </form>
                    <div class="quickClick">
                        <ul id="hotSearch">
                            <#--<#if hotSearches??>-->
                            <#--<#list hotSearches as hotSearch>-->
                            <#--<#if hotSearch.hotSearchBz==1>-->
                                <#--<li><a href="${base}/search?key=${hotSearch.hotSearchCt}-->
<#--<#if currDistrictId??>&district=${currDistrictId}</#if>" style="color: red;">${hotSearch.hotSearchCt}</a></li>-->
                            <#--<#else>-->
                                <#--<li><a href="${base}/search?key=${hotSearch.hotSearchCt}-->
<#--<#if currDistrictId??>&district=${currDistrictId}</#if>" style="color: #aaa;">${hotSearch.hotSearchCt}</a></li>-->
                            <#--</#if>-->
                            <#--</#list>-->
                            <#--</#if>-->
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="pushing-item">
                    <a href="${base}/push/choose"><i class="fa fa-edit"></i>免费发布信息</a>
                </div>
            </div>
        </div>
    </div>
</div>

</#macro>

<#macro headerArea>
<div class="header-area">
    <div class="container_self">
        <div class="row">
            <div class="col-xs-8">
                <div class="user-menu">
                    <ul>
                        <li><p>欢迎来到麦芒网!</p></li>
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
                                <li><a href="${base}/user/extension" target="_blank">推广中心</a></li>
                                <li class="divider"></li>
                                <li><a href="${base}/user/attc" target="_blank">公司认证</a></li>
                                <li class="divider"></li>
                                <li><a href="${base}/user/resume">我的简历</a></li>
                            </ul>
                        </li>
                        <#--该方法返回当前页面uri -->
                        <li>
                            <a href="javascript:;" id="logout"><i class="fa fa-window-close"></i> 注销</a>
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
                <div class="logo foot_logo">
                    <p><span style="font-size: 16px;font-weight: 500;color: #aaaaaa;">客服电话:</span></p>
                    <p style="font-size: 24px;color: #ff552e;">0371-0000000</p>
                    <p style="font-size: 10px;color: #aaa;">工作时间:</p>
                    <p>周一至周六:上午8点-下午5点</p>
                </div>
            </div>
            <div class="col-xs-2 footer_ul">
                <ul>
                    <li><h4>关于我们</h4></li>
                    <li><p><a href="${base}/about/cpdesc"  target="_blank">公司介绍</a></p></li>
                    <li><p><a href="${base}/about/contact"  target="_blank">联系方式</a></p></li>
                    <li><p><a href="${base}/about/friend"  target="_blank">友情链接</a></p></li>
                </ul>
            </div>

            <div class="col-xs-2 footer_ul">
                <ul>
                    <li><h4>服务支持</h4></li>
                    <li><p><a href="${base}/about/service"  target="_blank">推广服务</a></p></li>
                    <li><p><a href="${base}/about/charge"  target="_blank">收费标准</a></p></li>
                    <li><p><a href="${base}/about/attc"  target="_blank">企业认证</a></p></li>
                </ul>
            </div>
            <div class="col-xs-2 footer_ul">
                <ul>
                    <li><h4>帮助中心</h4></li>
                    <li><p><a href="${base}/about/help"  target="_blank">使用帮助</a></p></li>
                    <li><p><a href="${base}/about/law" target="_blank">隐私权条款</a></p></li>
                </ul>
            </div>
            <div class="col-xs-3">
                <div style="list-style: none">
                    <img src="${base}/img/二维码.png" alt="扫码访问手机版">
                </div>
            </div>
        </div>
        <div class="row">
            <p style="text-align: center">Copyright © 麦芒网 ｜河南省麦芒网络科技有限公司所有</p>
            <p style="text-align: center"><a href="http://www.miibeian.gov.cn">豫ICP备17047159</a></p>
        </div>
    </div>
</div>
<script type="text/javascript" src="${base}/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${base}/js/floating.js"></script>


<script>
    $(function () {
       $("#logout").click(function () {
           $.ajax({
               url:'${base}/logout',
               type:'get',
               success:function (result) {
                   if(result){
                       window.location.reload();
                   }else{
                       alert("服务器出错了!");
                   }
               }
           })
       })
    });
</script>
    <#nested >
</body>
</html>
</#macro>


<#macro floating>
<script>
    $(function () {
        $("body").floating({"theme":"panel_theme_round_solid",
            "state":true,
            "moveState":true,
            "size":"lg",
            "position":"right-center",
            "tip":{"background-color":"#000","color":"#fff"},
            "account":[
                {"type":"Viber","tip":"400-155-111","text":null,"url":null},
                {"type":"Phone","tip":"http://jq22com.qiniudn.com/12.png","text":null,"url":null},
                {"type":"QQ","tip":"QQ咨询","text":null,"url":"http://wpa.qq.com/msgrd?v=3&uin=null&site=qq&menu=yes"},
                {"type":"Top","tip":"返回顶部","text":null,"url":null}]});
    })
</script>
</#macro>