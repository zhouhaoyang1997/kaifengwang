<#include "defaultLayout/defaultLayout.ftl">
<#assign base="${request.contextPath}"/>
<@header siteName="开封麦芒网"  base_css=["global","style","usercenter","bootstrap.min"] base_keywords="开封麦芒网" >
</@header>

<@body title="修改资料" back=true>
<div class="panel panel-default">
    <div class="panel-heading"><h3>修改密码</h3></div>
    <div class="panel-body">
        <form class="form-horizontal" id="alterPwdForm" action="${base}/user/alterPwd" method="post">
            <div class="form-group">
                <label for="name" class="col-sm-2">原密码</label>
                <div class="col-sm-4">
                    <input type="password" class="form-control" required id="oldPwd" name="oldPwd">
                </div>
            </div>
            <div class="form-group">
                <label for="phone" class="col-sm-2">新密码</label>
                <div class="col-sm-4">
                    <input type="password" class="form-control" minlength="6" maxlength="20" id="newPwd" name="newPwd">
                </div>
                <div class="col-sm-4">${alterPwdError!""}</div>
            </div>
            <div class="form-group">
                <label for="email" class="col-sm-2">确认</label>
                <div class="col-sm-4">
                    <input type="password" class="form-control" minlength="6" maxlength="20" equalTo="#newPwd" id="repPwd" name="repPwd" >
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-6 text-center">
                    <button type="submit" class="btn btn-primary">保存修改</button>

                </div>

            </div>
            <a  style="font-size: 12px" href="${base}/m/verifyAccount" >忘记密码?手机号修改</a>
        </form>
    </div>
</div>
</@body>

<@footer base_js=["jquery.min","bootstrap.min"]>
<script type="text/javascript" src="${base}/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${base}/js/messages_zh.js"></script>
</@footer>
<script>

    $().ready(function() {
        $("#alterPwdForm").validate();
    });
</script>