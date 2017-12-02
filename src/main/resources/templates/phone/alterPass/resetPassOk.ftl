<#include "../defaultLayout/defaultLayout.ftl">
<#assign baseUrl = "${request.contextPath}"/>

<@header siteName="麦芒网"  base_css=["global","style","login"] base_keywords="麦芒网">
<link rel="stylesheet" href="${baseUrl}/css/bootstrap.min.css">
<link rel="stylesheet" href="${baseUrl}/css/font-awesome.min.css">
</@header>

<@body title="麦芒网" back=true>
<div id="contactbar">
    <a href="/m/index" class="bottom_index">首页</a>
    <a href="/m/user/info" class="bottom_member_on">我的</a>
    <a href="${baseUrl}/m/about/cpdesc" class="bottom_history">推送</a>
    <a href="${baseUrl}/m/push/choose" class="bottom_post">发布</a>
</div>
<div class="fh5co-form">
    <div id="logRegTabCon">
        <div class="form-box" style="margin-top: 10px;">
            <h1 style="text-align: center">
                ④修改成功
            </h1>
            <div class="form-box row">
                <div class="col-sm-offset-1 col-sm-10">
                    <h3>你的密码已经重置成功!</h3>
                    <p>即将为您自动登录&nbsp; <span id="time">5</span> &nbsp;秒</p>
                </div>

            </div>

        </div>
    </div>
</div>

</@body>
<@footer base_js=["jquery.min","common_1","iscroll-probe","slider"]>
<script type="text/javascript" src="${request.contextPath}/js/bootstrap.min.js"></script>
<script>
    var wait=5;
    $(function () {
        function updateVal() {
            if(wait==0){
                window.location.href="${request.contextPath}/m/index"
            }else{
                wait--;
                $("#time").text(wait);
                setTimeout(function() {
                    updateVal()
                }, 1000)
            }
        }
        updateVal();
    })
</script>
</@footer>


