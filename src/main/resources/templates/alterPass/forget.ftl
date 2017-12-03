
<!DOCTYPE HTML>
<html>
<head lang="zh">
    <title>欢迎注册麦芒网</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="${request.contextPath}/css/bootstrap.min.css" >
    <link rel="stylesheet" href="${request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${request.contextPath}/css/login.css">
    <link rel="stylesheet" href="${request.contextPath}/BeAlert/BeAlert.css">
</head>
<body class="style-3">
<img src="${request.contextPath}/img/login_bg.jpg" alt="" width="100%" height="100%" class="bg_img">
<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-push-4">

            <form id="commentForm" action="${request.contextPath}/resetPass" method="post" class="fh5co-form animate-box">

                <h1 style="text-align: center">
                    ②手机号认证
                </h1>
                <div class="form-box row">
                    <div class="col-sm-offset-1 col-sm-10">
                        <div class="form-group input-group">
                            <label for="phone" class="sr-only">手机号</label>
                            <input type="text" class="form-control" minlength="11" maxlength="11" name="phoneNum" value="${phone!""}" required id="phone" placeholder="手机号" >
                            <span class="input-group-addon" style="background: none;border: none;"><input class="btn btn-success"  id="verify_refresh" type="button" onclick="regGetMsgNum()" value="免费获取验证码"></span>
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
            <p style="color: #fff;">想起密码? 返回<a href="${request.contextPath}/login">登录</a></p>
            <!-- END Sign In Form -->
        </div>
    </div>
</div>

<div class="modal fade" id="verifyModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">

        <div class="modal-content">
            <div class="modal-body" >
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <div class="container logo_login">
                    <p >请填写图片验证码</p>
                </div>
                <form action="" style="padding: 10% 16% 10% 16%">
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

</body>
<script type="text/javascript" src="${request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/messages_zh.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/message.js"></script>
<script type="text/javascript" src="${request.contextPath}/BeAlert/BeAlert.js"></script>
<script>
    <#if error??>
    $(function () {
        alert("${error}");
    });
    </#if>
</script>
</html>
