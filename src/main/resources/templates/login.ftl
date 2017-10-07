<!DOCTYPE HTML>
<html>
<head lang="zh">
    <title>登录开封城市网</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="${request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${request.contextPath}/css/login.css">
</head>
<body class="style-3">

<div class="container">

    <div class="row" id="login">
        <div class="col-md-4 col-md-push-8">
            <!-- Start Sign In Form -->
            <form action="${request.contextPath}/lg" method="post" class="fh5co-form animate-box">
                <h2>欢迎登录开封城市网</h2>
                <div class="form-group">
                    <label for="username" class="sr-only">用户名</label>
                    <input type="text" class="form-control" id="username" name="userName" placeholder="用户名">
                </div>
                <div class="form-group">
                    <label for="password" class="sr-only">密码</label>
                    <input type="password" class="form-control" id="password" name="userPassword" placeholder="密码">
                </div>
                <span style="color:red">${error!""}</span>
                <div class="form-group">
                    <label for="remember"><input type="checkbox" name="remember" value="true" id="remember">记住我?</label>
                </div>
                <div class="form-group">
                    <p>没有账号? <a href="${request.contextPath}/reg">注册</a> | <a href="javascript:;">忘记密码?</a></p>
                </div>
                <div class="form-group">
                    <input type="submit" value="登录" class="btn btn-primary">
                </div>
            </form>
            <!-- END Sign In Form -->
        </div>
    </div>
</div>
</body>
</html>