<!DOCTYPE HTML>
<html>
<head lang="zh">
    <title>欢迎注册麦芒网</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="${request.contextPath}/css/bootstrap.min.css" >
    <link rel="stylesheet" href="${request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${request.contextPath}/css/login.css">
</head>
<body class="style-3">
<img src="${request.contextPath}/img/login_bg.jpg" alt="" width="100%" height="100%" class="bg_img">
<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-push-4">


            <div class="fh5co-form">
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
            <!-- END Sign In Form -->
        </div>
    </div>
</div>


</body>
<script type="text/javascript" src="${request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/bootstrap.min.js"></script>
<script>
    var wait=5;
    $(function () {
        function updateVal() {
            if(wait==0){
                window.location.href="${request.contextPath}/index"
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
</html>
