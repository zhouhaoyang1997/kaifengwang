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
            <form id="commentForm" action="/alterPassword" method="post" class="fh5co-form animate-box">
                <h1 style="text-align: center">
                    ③修改密码
                </h1>
                <div class="form-box row">
                    <div class="col-sm-offset-1 col-sm-10">
                        <div class="form-group">
                            <label for="phone" class="sr-only">新密码</label>
                            <input type="password" class="form-control" minlength="6" maxlength="16" name="userPassword" id="password" placeholder="新密码" >
                        </div>

                        <div class="form-group">
                            <label for="phone" class="sr-only">重复密码</label>
                            <input type="password" class="form-control" required minlength="6" equalTo="#password" maxlength="16" placeholder="重复密码" >
                        </div>
                        <input type="hidden" name="tamp" value="${msgCode.tamp}">
                        <input type="hidden" name="hash" value="${msgCode.hash}">
                        <input type="hidden" name="code" value="${msgCode.code}">
                        <input type="hidden" name="phoneNum" value="${msgCode.phoneNum}">
                        <div class="form-group">
                            <input type="submit" style="width: 100%;" value="确认修改" class="btn btn-primary">
                        </div>
                    </div>

                </div>
            </form>

        </div>
    </div>
</div>

</@body>
<@footer base_js=["jquery.min","common_1","iscroll-probe","slider"]>
<script type="text/javascript" src="${request.contextPath}/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/messages_zh.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/message.js"></script>
<script>
        <#if error??>
        $(function () {
            alert("${error}");
        });
        </#if>
</script>
</@footer>


