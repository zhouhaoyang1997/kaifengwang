<#import "spring.ftl" as spring />
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
            <form id="commentForm" class="fh5co-form animate-box">
                <h1 style="text-align: center">
                    成为麦芒会员
                </h1>
                <div class="form-box row">
                    <div class="col-sm-offset-1 col-sm-10">
                        <div class="form-group input-group">
                            <label for="phone" class="sr-only">手机号</label>
                            <input type="text" class="form-control" minlength="11" maxlength="11" name="userPhone" <#if userDetail??>value="${userDetail.userPhone}"</#if> id="phone" placeholder="手机号" >
                            <span class="input-group-addon" style="background: none;border: none;"><input class="btn btn-success"  id="verify_refresh" type="button" onclick="regGetMsgNum()" value="免费获取验证码"></span>
                        </div>

                        <div class="form-group">
                            <label for="phone" class="sr-only">动态码</label>
                            <input type="text" class="form-control" required minlength="6" maxlength="6" name="code" id="phone" placeholder="动态码" >
                        </div>
                        <input type="hidden" name="tamp" id="tamp">
                        <input type="hidden" name="hash" id="hash">
                        <div class="form-group">
                            <label for="name" class="sr-only">用户名</label>
                            <input type="text" class="form-control" name="userName" required id="name" minlength="4" maxlength="16" placeholder="用户名" >
                        </div>

                        <div class="form-group">
                            <label for="password" class="sr-only">密码</label>
                            <input type="password" class="form-control" name="userPassword" required minlength="6" maxlength="15" id="password" placeholder="密码" >
                        </div>
                        <div class="form-group">
                            <label for="re-password" class="sr-only">确认密码</label>
                            <input type="password" class="form-control" equalTo="#password" required id="re-password" minlength="6" maxlength="15" placeholder="确认密码" >
                        </div>
                        <div class="form-group">
                            <label for="remember"><input type="checkbox" name="remember" id="remember"> 记住我?公共场合不建议使用!</label>
                        </div>
                        <div class="form-group">
                            <p>已经注册? <a href="${request.contextPath}/login">登录</a></p>
                        </div>
                        <div class="form-group">
                            <input type="button" onclick="submitReg()" style="width: 100%;" value="注册" class="btn btn-primary">
                        </div>
                    </div>

                </div>
            </form>
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
    $(function() {
        jQuery.validator.addMethod("regex",
                function(value, element, params) {
                    var exp = new RegExp(params);
                    return exp.test(value);
                }, "格式错误");
    });
    function submitReg() {
        if(reg()){
            $.ajax({
                url:'${request.contextPath}/register',
                dataType : "json",
                type : "post",
                data:$("#commentForm").serialize(),
                success:function (result) {

                    if(result.msg=="ok"){
                        window.location.href=result.url;
                    }else{
                        alert(result.msg);
                    }
                }
            })
        }

    }
    function reg() {
        return $("#commentForm").validate({
            onkeyup :false,// 是否在敲击键盘时验证
            rules:{
                userName:{
                    required:true,
                    regex: /^[a-zA-Z0-9_-]{4,16}$/,
                    remote:{
                        type:'post',
                        url:'/unIsEx',
                        data:{
                            userName:function () {
                                return $("#name").val();
                            }
                        }
                    }
                },
                userPhone:{
                    required:true,

                    remote:{
                        type:'post',
                        url:'/upIsEx',
                        data:{
                            userPhone:function () {
                                return $("#phone").val();
                            }
                        }
                    }
                }
            },
            messages:{
                userName:{
                    remote:"用户名已被使用了",
                    regex:'用户名不合法（字母开头，允许4-16位长，允许字母数字下划线)'
                },
                userPhone:{
                    remote:"手机号已经注册了!",
                    required:"请输入合法的手机号!"
                }
            }
        }).form();
    }

</script>
</html>