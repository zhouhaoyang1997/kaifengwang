<!DOCTYPE HTML>
<html>
<head lang="zh">
    <title>登录麦芒网</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="${request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${request.contextPath}/css/login.css">
    <style>
        a{
            color: #000;
        }
        a:hover{
            text-decoration: none;
        }
        .error{
            color: #ff552e;
        }

    </style>
    <script type="text/javascript">
        //判断是否移动端访问
        browserRedirect();
        function browserRedirect() {
            var sUserAgent = navigator.userAgent.toLowerCase();
            var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";
            var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";
            var bIsMidp = sUserAgent.match(/midp/i) == "midp";
            var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
            var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";
            var bIsAndroid = sUserAgent.match(/android/i) == "android";
            var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";
            var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";

            if (bIsIpad || bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM) {
                window.location.href = "${request.contextPath}/m${springMacroRequestContext.getRequestUri()}<#if request.queryString??>?${request.queryString}</#if>";
            }
        }
    </script>
</head>
<body class="style-3">
<img src="${request.contextPath}/img/login_bg.jpg" alt="" width="100%" height="100%" class="bg_img">
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
                                        <input type="text" class="form-control" id="username" minlength="2" maxlength="16" required name="userName" placeholder="用户名">
                                    </div>
                                    <div class="form-group">
                                        <label for="password" class="sr-only">密码</label>
                                        <input type="password" class="form-control" id="password" minlength="6" required name="userPassword" placeholder="密码">
                                    </div>


                                    <div class="form-group input-group" id="verifyDiv">
                                        <label for="verifyCode" class="sr-only">验证码</label>
                                        <input type="text" class="form-control" id="verifyCode" required name="verifyCode" placeholder="验证码">
                                        <span class="input-group-addon" style="background: none;border: none;">
                                            <a href="javascript:;" title="看不清?点击更换验证码" id="changeImg"><img src="${request.contextPath}/verify/code" class="verify" alt="验证码"></a>

                                        </span>
                                    </div>
                                    <span style="color:red" id="error"></span>
                                    <div class="form-group row">
                                        <div class="col-xs-6">
                                            <label for="remember"><input type="checkbox" name="remember" value="true" id="remember">记住我?</label>
                                        </div>
                                        <div class="col-xs-6">
                                            <p>没有账号? <a href="${request.contextPath}/register">注册</a> | <a href="javascript:;">忘记密码?</a></p>
                                        </div>

                                    </div>
                                    <div class="form-group">
                                        <input type="button" value="登录" style="width: 100%;" id="loginBtn" class="btn btn-primary">
                                    </div>
                                </form>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="phoneLogin">
                                <form action="" id="phoneLoginForm">
                                    <div class="form-group input-group">
                                        <label for="phone" class="sr-only">手机号</label>
                                        <input type="text" class="form-control" id="phone" maxlength="11" minlength="11" name="phone" placeholder="手机号">
                                        <span class="input-group-addon" style="background: none;border: none;"><input class="btn btn-success"  id="verify_refresh" type="button" onclick="getMsgNum(this)" value="免费获取验证码"></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="phoneCode" class="sr-only">动态码</label>
                                        <input type="text" class="form-control" id="phoneCode" name="phoneCode" placeholder="动态码">
                                    </div>


                                    <span style="color:red" id="phoneError"></span>

                                    <div class="form-group row">
                                        <div class="col-xs-6">
                                            <label for="remember"><input type="checkbox" name="remember" value="true" id="phoneRemember">记住我?</label>
                                        </div>
                                        <div class="col-xs-6">
                                            <p>没有账号? <a href="${request.contextPath}/register">注册</a> | <a href="javascript:;">忘记密码?</a></p>
                                        </div>

                                    </div>
                                    <div class="form-group">
                                        <input type="button" value="登录" style="width: 100%;" onclick="validateNum()" class="btn btn-primary">
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
                        <input type="button" onclick="verifyNum()" class="btn btn-danger" style="width: 100%" value="确定">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript" src="${request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/messages_zh.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/message.js"></script>

<script>


    $(function() {
        $("#changeImg").click(function () {
            <#--var verify = document.getElementById("verify");-->
            <#--verify.src = "${request.contextPath}/verify/code?date=" + new Date();-->
            $(".verify").attr("src","${request.contextPath}/verify/code?date=" + new Date().getTime());
        });

        $("#phoneChangeImg").click(function () {
            $(".verify").attr("src","${request.contextPath}/verify/code?date=" + new Date().getTime());
        });

        function updateVerifyHtml() {
            $("#verifyCode").val("");
            $(".verify").attr("src","${request.contextPath}/verify/code?date=" + new Date().getTime());
        }

        function valForm() {
            return $("#commentForm").validate().form();
        }




        $("#loginBtn").click(function () {
            if(valForm()){
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
                            updateVerifyHtml();
                            $("#error").text(res[1]);
                        }
                    }
                })
            }

        })
    });
</script>
</body>
</html>