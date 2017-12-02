<#--在基本宏里定义#compress 压缩页面指令-->
<#--<#compress>-->
<#assign baseUrl = "${request.contextPath}"/>
<#macro base siteName title base_keywords="" base_js=[] base_css=[] cssPath="../css/phone/" jsPath="../js/phone/">


<!DOCTYPE html>
<html lang="zh-CN" class="index_page">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport"
          content="initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,minimal-ui"/>
    <meta name="format-detection" content="telephone=no"/>
    <meta name="format-detection" content="email=no"/>
    <meta name="format-detection" content="address=no;">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="default"/>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <meta name="keywords" content=${base_keywords}/>
    <meta name="description" content=${base_keywords}/>
    <title>${siteName}</title>
    <#--//遍历扩展页css-->
    <#list base_css as c>
        <link rel="stylesheet" href="${cssPath}${c}.css">
    </#list>
<#--//遍历公共js-->
    <#list base_js as j>
        <script src="${jsPath}${j}.js"></script>
    </#list>
</head>
<body class="orange" >

<div class="wrapper">
    <div class="header">
        <div id="ipageTitle">${title}</div>
    </div>
    <div id="contactbar">
        <a href="#" class="bottom_index_on">首页</a>
        <a href="#" class="bottom_member">我的</a>
        <a href="#" class="bottom_history">历史</a>
        <a href="#" class="bottom_post">发布</a>
    </div>
    <#nested/>
</div>
<div class="clear"></div>
<div class="clear"></div>
<div class="clear"></div>
<div class="footer_02">&copy;copyright开封麦芒网版权所有. </div>
</body>
</html>

</#macro>
<#--</#compress>-->

<#macro header siteName base_keywords="" base_css=[]>

<!DOCTYPE html>
<html lang="zh-CN" class="index_page">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport"
          content="initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,minimal-ui"/>
    <meta name="format-detection" content="telephone=no"/>
    <meta name="format-detection" content="email=no"/>
    <meta name="format-detection" content="address=no;">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="default"/>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <meta name="keywords" content=${base_keywords}/>
    <meta name="description" content=${base_keywords}/>
    <title>${siteName}</title>
<#--//遍历扩展页css-->
    <link rel="stylesheet" href="${baseUrl}/BeAlert/BeAlert.css">
    <#list base_css as c>
        <link rel="stylesheet" href="${baseUrl}/css/phone/${c}.css">
    </#list>
    <#nested/>
</head>
</#macro>

<#macro body title back=false>

<body class="orange" style="background: #F2F2F2">

<div class="wrapper">
    <div class="header">
        <#if back>
            <a href="javascript:void(0);" onClick="return window.history.go(-1);" class="back left8">返回</a>
        </#if>
        <div id="ipageTitle">${title}</div>
        <a class="search left8" id="search_ico" href="${baseUrl}/m/searchPage">搜索</a>

    </div>

    <#nested/>
</div>
<div class="footer_02">
    <p style="text-align: center">Copyright © 麦芒网 ｜河南省麦芒网络科技有限公司所有</p>
    <p style="text-align: center">
        <a href="http://www.miibeian.gov.cn">豫ICP备17047159</a>
    </p>
</div>

</#macro>

<#macro footer base_js=[]>


    <#list base_js as j>
    <script src="${baseUrl}/js/phone/${j}.js"></script>
    </#list>
<script type="text/javascript" src="${request.contextPath}/BeAlert/BeAlert.js"></script>
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
        var pageUrl = "${springMacroRequestContext.getRequestUri()}".substr(2);
        if (!(bIsIpad || bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM)) {
            window.location.href = "${baseUrl}"+pageUrl+"<#if request.queryString??>?${request.queryString}</#if>";
        }
    }
</script>
<#nested />
</body>
</html>
</#macro>
