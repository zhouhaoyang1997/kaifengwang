<#include "../defaultLayout/defaultLayout.ftl">
<#assign baseUrl = "${request.contextPath}"/>

<@header siteName="麦芒网"  base_css=["global","style","login"] base_keywords="麦芒网">
<link rel="stylesheet" href="${baseUrl}/css/bootstrap.min.css">
<link rel="stylesheet" href="${baseUrl}/css/font-awesome.min.css">
<script type="text/javascript" src="${baseUrl}/js/jquery.min.js"></script>
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
            <form id="commentForm" action="${request.contextPath}/resetPass" method="post" class="fh5co-form animate-box">
                <h1 style="text-align: center">
                    ②手机号认证
                </h1>
                <div class="form-box row">
                    <div class="col-sm-offset-1 col-sm-10">
                        <div class="form-group input-group">
                            <label for="phone" class="sr-only">手机号</label>
                            <input type="text" class="form-control" minlength="11" maxlength="11" name="phoneNum" value="${phone!""}" required id="phone" placeholder="手机号" >
                            <span class="input-group-addon" style="padding: 0;background: none;border: none;"><input class="btn btn-success"  id="verify_refresh" type="button" onclick="regGetMsgNum()" value="免费获取验证码"></span>
                        </div>

                        <div class="form-group">
                            <label for="phone" class="sr-only">动态码</label>
                            <input type="text" class="form-control" required minlength="6" maxlength="6" name="code" id="phone" placeholder="动态码" >
                        </div>
                        <input type="hidden" name="tamp" id="tamp" value="${tamp!""}">
                        <input type="hidden" name="hash" id="hash" value="${hash!""}">

                        <div class="form-group">
                            <input type="submit" style="width: 100%;" value="确认" class="btn btn-primary">
                        </div>
                    </div>

                </div>
            </form>

        </div>
    </div>
</div>

<div class="modal fade" id="verifyModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">

        <div class="modal-content">
            <div class="modal-body" style="padding: 10% 16% 10% 16%">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <div class="container logo_login">
                    <p >请填写图片验证码</p>
                </div>
                <form action="">
                    <div class="form-group input-group" id="verifyDiv">
                        <label for="verifyCode" class="sr-only">验证码</label>
                        <input type="text" class="form-control" id="phoneVerifyCode" name="verifyCode" placeholder="验证码">
                        <span class="input-group-addon" style="background: none;border: none;">
                             <a href="javascript:;" title="看不清?点击更换验证码" id="phoneChangeImg"><img src="${request.contextPath}/verify/code" class="verify" alt="验证码"></a>
                        </span>
                    </div>
                    <span id="verifyError"></span>
                    <div class="form-group">
                        <input type="button" onclick="verifyRegNum()" class="btn btn-danger" style="width: 100%" value="确定">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</@body>
<@footer base_js=["common_1","iscroll-probe","slider"]>
<script type="text/javascript" src="${request.contextPath}/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/messages_zh.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/message.js"></script>
<script>
    $(function () {
        $("#phoneChangeImg").click(function () {
            $(".verify").attr("src","${request.contextPath}/verify/code?date=" + new Date().getTime());
        });
        <#if error??>
            alert("${error}");
        </#if>
    });

</script>
</@footer>