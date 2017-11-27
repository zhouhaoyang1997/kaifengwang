<#import "spring.ftl" as spring />
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

<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-push-4">
            <form action="${request.contextPath}/register" id="commentForm" method="post" class="fh5co-form animate-box">
                <h1 style="text-align: center">
                    成为麦芒会员
                </h1>
                <div class="form-box row">
                    <div class="col-sm-offset-1 col-sm-10">
                        <div class="form-group">
                            <label for="name" class="sr-only">用户名</label>
                            <input type="text" class="form-control" name="userName" required id="name" minlength="4" maxlength="16" placeholder="用户名" >
                        </div>
                    <#if userDetail??>
                        <@spring.bind "userDetail.userName" />
                        <@spring.showErrors "<br>"/>
                    </#if>
                        <div class="form-group">
                            <label for="email" class="sr-only">邮箱</label>
                            <input type="email" class="form-control" name="userEmail" id="email" placeholder="邮箱" >
                        </div>
                    <#if userDetail??>
                        <@spring.bind "userDetail.userEmail" />
                        <@spring.showErrors "<br>"/>
                    </#if>
                        <div class="form-group">
                            <label for="password" class="sr-only">密码</label>
                            <input type="password" class="form-control" name="userPassword" required minlength="6" maxlength="15" id="password" placeholder="密码" >
                        </div>
                    <#if userDetail??>
                        <@spring.bind "userDetail.userPassword" />
                        <@spring.showErrors "<br>"/>
                    </#if>
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
                            <input type="submit" style="width: 100%;" value="注册" class="btn btn-primary">
                        </div>
                    </div>

                </div>
            </form>
            <!-- END Sign In Form -->
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="${request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/messages_zh.js"></script>
<script>
    $.validator.setDefaults({
        submitHandler: function(form) {
            form.submit();
        }
    });
    $().ready(function() {

        <#if userOrEmailError??>
            alert("${userOrEmailError}");
        </#if>

        jQuery.validator.addMethod("regex",
                function(value, element, params) {
                    var exp = new RegExp(params);
                    return exp.test(value);
                }, "格式错误");

        $("#commentForm").validate({
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
                userEmail:{
                    required:true,

                    remote:{
                        type:'post',
                        url:'/ueIsEx',
                        data:{
                            userEmail:function () {
                                return $("#email").val();
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
                userEmail:{
                    remote:"邮箱已经被使用了"

                }
            }
        });
    });
</script>
</html>