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
<body class="orange">

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
    <#list base_css as c>
        <link rel="stylesheet" href="${baseUrl}/css/phone/${c}.css">
    </#list>
    <#nested/>
</head>
</#macro>

<#macro body title back=false>

<body class="orange">

<div class="wrapper">
    <div class="header">
        <#if back>
            <a href="javascript:void(0);" onClick="return window.history.go(-1);" class="back left8">返回</a>
        </#if>
        <div id="ipageTitle">${title}</div>
        <div class="search left8" id="search_ico" onClick="showNewPage('搜索',searchHtml,newPageSearch);">搜索</div>

    </div>
    <div id="contactbar">
        <a href="#" class="bottom_index_on">首页</a>
        <a href="#" class="bottom_member">我的</a>
        <a href="#" class="bottom_history">历史</a>
        <a href="${baseUrl}/m/push/choose" class="bottom_post">发布</a>
    </div>
    <#nested/>
</div>
<div class="footer_02">&copy;copyright开封麦芒网版权所有. </div>

</#macro>

<#macro footer base_js=[]>
    <#list base_js as j>
    <script src="${baseUrl}/js/phone/${j}.js"></script>
    </#list>
<#nested />
</body>
</html>
</#macro>
