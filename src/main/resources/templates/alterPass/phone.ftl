
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

            <form id="commentForm" action="${request.contextPath}/verifyAccount" method="post" class="fh5co-form animate-box">

                <h1 style="text-align: center">
                    ①确认账户
                </h1>
                <div class="form-box row">
                    <div class="col-sm-offset-1 col-sm-10">
                        <div class="form-group">
                            <label for="phone" class="sr-only">手机号</label>
                            <input type="text" class="form-control" minlength="11" maxlength="11" name="phoneNum" value="${phone!""}" required id="phone" placeholder="手机号" >

                        </div>

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


</body>
<script type="text/javascript" src="${request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${request.contextPath}/BeAlert/BeAlert.js"></script>
<script>
    <#if error??>
    $(function () {
        alert("${error}");
    });
    </#if>
</script>
</html>
