
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
            <!-- END Sign In Form -->
            <p style="color: #fff;">想起密码? 返回<a href="${request.contextPath}/login">登录</a></p>
        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="${request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/messages_zh.js"></script>
<script type="text/javascript" src="${request.contextPath}/BeAlert/BeAlert.js"></script>
</html>