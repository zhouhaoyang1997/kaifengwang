<!DOCTYPE HTML>
<html>
<head lang="zh">
    <title>登录麦芒网</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="${request.contextPath}/css/bootstrap.min.css" >
    <link rel="stylesheet" href="${request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${request.contextPath}/css/login.css">
    <style>
        a{
            color: #000;
        }
        a:hover{
            text-decoration: none;
        }
        .nav a{
            color: #ff552e;
        }
    </style>
</head>
<body class="style-3">

<div class="container">

    <div class="row" id="login">
        <div class="col-md-6 col-md-push-4 fh5co-form animate-box">
            <!-- Start Sign In Form -->

                <h1 style="text-align: center">欢迎登录麦芒网</h1>
                <div class="form-box row">



                    <div class="col-sm-offset-1 col-sm-10">
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" style="width: 50%;text-align: center" class="active" ><a href="#userLogin" aria-controls="userLogin" role="tab" data-toggle="tab">用户名密码登录</a></li>
                            <li role="presentation" style="width: 50%;text-align: center"><a href="#phoneLogin" aria-controls="phoneLogin" role="tab" data-toggle="tab">手机动态码登录</a></li>
                        </ul>
                        <div class="tab-content" style="margin-top: 20px;">
                            <div role="tabpanel" class="tab-pane active" id="userLogin">
                                <form id="commentForm" >
                                    <div class="form-group">
                                        <label for="username" class="sr-only">用户名</label>
                                        <input type="text" class="form-control" id="username" required name="userName" placeholder="用户名">
                                    </div>
                                    <div class="form-group">
                                        <label for="password" class="sr-only">密码</label>
                                        <input type="password" class="form-control" id="password" required name="userPassword" placeholder="密码">
                                    </div>
                                    <span style="color:red" id="error"></span>

                                    <div class="form-group row" id="verifyDiv">

                                    </div>

                                    <div class="form-group row">
                                        <div class="col-xs-6">
                                            <label for="remember"><input type="checkbox" name="remember" value="true" id="remember">记住我?</label>
                                        </div>
                                        <div class="col-xs-6">
                                            <p>没有账号? <a href="${request.contextPath}/register">注册</a> | <a href="javascript:;">忘记密码?</a></p>
                                        </div>

                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-sm-9">
                                                <input type="button" value="登录" id="loginBtn" class="btn btn-primary">
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#"><div class="qq_lg"></div><span>QQ登陆</span></a>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="phoneLogin">
                                <form action="" >
                                    <div class="form-group input-group">
                                        <label for="phone" class="sr-only">手机号</label>
                                        <input type="text" class="form-control" id="phone" required name="phone" placeholder="手机号">
                                        <span class="input-group-addon"><a href="javascript:;">获取动态码</a></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="phoneCode" class="sr-only">动态码</label>
                                        <input type="text" class="form-control" id="phoneCode" required name="phoneCode" placeholder="动态码">
                                    </div>

                                    <span style="color:red" id="error"></span>

                                    <div class="form-group row" id="verifyDiv">

                                    </div>

                                    <div class="form-group row">
                                        <div class="col-xs-6">
                                            <label for="remember"><input type="checkbox" name="remember" value="true" id="remember">记住我?</label>
                                        </div>
                                        <div class="col-xs-6">
                                            <p>没有账号? <a href="${request.contextPath}/register">注册</a> | <a href="javascript:;">忘记密码?</a></p>
                                        </div>

                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-sm-9">
                                                <input type="button" value="登录" id="phoneLoginBtn" class="btn btn-primary">
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#"><div class="qq_lg"></div><span>QQ登陆</span></a>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>

                </div>


            <!-- END Sign In Form -->
        </div>
    </div>
</div>

<script type="text/javascript" src="${request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/messages_zh.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/bootstrap.min.js"></script>
<script>
    $.validator.setDefaults({
        submitHandler: function(form) {
            form.submit();
        }
    });


    $(function() {
        var verifyHtml = '<label for="verifyCode" class="sr-only">验证码</label>' +
                '<input type="text" class="col-xs-5" style="margin-left: 20px" id="verifyCode"' +
                ' required name="verifyCode" placeholder="验证码"> <div class="col-xs-6"> ' +
                '<img src="${request.contextPath}/verify/code" id="verify" alt="验证码"> ' +
                '<a href="javascript:;" id="changImg">看不清？</a></div>';
        <#if verify??>
                $("#verifyDiv").html(verifyHtml);
            <#else>
                $("#verifyDiv").html("");
        </#if>


        $("#changImg").click(function () {
            var verify = document.getElementById("verify");
            verify.src = "${request.contextPath}/verify/code?date=" + new Date();
        });

        function updateVerifyHtml() {
            $("#verifyCode").val("");
            var verify = document.getElementById("verify");
            verify.src = "${request.contextPath}/verify/code?date=" + new Date();
        }

        $("#commentForm").validate();

        $("#loginBtn").click(function () {
            //下面的请求发多了,开始需要用户验证。
            $.ajax({
                url:'${request.contextPath}/login',
                type:'post',
                data:$("#commentForm").serialize(),
                success:function (result) {
                    var res=result.split(":");
                    if(res[0]=="ok"){
                        window.location.href=res[1];
                    }else{
                        if(res[2]>3){
                            $("#verifyDiv").html(verifyHtml);
                            updateVerifyHtml();
                        }
                        if(res[2]<0){
                            updateVerifyHtml();
                        }
                        $("#error").text(res[1]);
                    }
                }
            })
        })
    });
</script>
</body>
</html>