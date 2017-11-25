<#macro push_header>
<#assign base="${request.contextPath}"/>
<div class="site-branding-area">
    <div class="container_self" style="width: 1200px;">
        <div class="row">
            <div class="col-sm-3">
                <div class="logo">
                    <h1><a href="${base}/index"><span>麦芒网</span></a></h1>
                </div>
            </div>

            <div class="col-sm-offset-6 col-sm-3" style="padding-top:50px;">
                <#if Session.user??>
                    <#-- ?url=${springMacroRequestContext.getRequestUri()request.queryString，实际调用的是request.getQueryString方法。
request有哪些方法，可以参考 org.springframework.web.servlet.support.RequestContext的源码。-->
                <p><a href="${base}/user/info"><i class="fa fa-user"></i>${user.userName}</a> &nbsp;|&nbsp;  <a href="javascript:;" id="logout"><i class="fa fa-window-close"></i> 注销</a></p>
            <#else>
                <p><a href="${base}/login">登录</a> &nbsp;|&nbsp; <a href="${base}/register">注册</a></p>
            </#if>
            </div>
        </div>
    </div>
</div> <!-- End site branding area -->
</#macro>

<#macro push_footer>

<div class="footerPage" style="margin-top: 30px;background: none repeat scroll 0 0 #f4f4f4;">
    <div class="container_self">
        <div class="row">
            <p style="text-align: center">Copyright © 河南开封 ｜河南省麦芒网络科技有限公司所有</p>
        </div>
    </div>
</div>
<#nested >
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
</body>
</html>
</#macro>