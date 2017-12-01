<#include "public/default.ftl">
<#assign base="${request.contextPath}"/>
<@header title="填写信息">
<link rel="stylesheet" href="${base}/css/style.css">
<link rel="stylesheet" href="${base}/css/login.css">
</@header>
<div class="header-area">
    <div class="container_self">
        <div class="row">
            <div class="col-xs-8">
                <div class="user-menu">
                    <ul>
                        <li><p>欢迎来到开封麦芒网!</p></li>
                        <li><a href="${base}/push/choose"><i class="fa fa-heart"></i> 快速发布信息</a></li>
                        <li><a href="#"><i class="fa fa-user"></i> 修改/删除信息</a></li>
                        <li><a href="#"><i class="fa fa-phone"></i> 手机浏览</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-xs-4">
                <div class="header-right">
                    <ul class="list-unstyled list-inline">
                    <#if Session.user??>
                        <li><a href="#">${user.userName}</a></li>
                        <li><a href="#">注销</a></li>
                    <#else>
                        <li><a href="javascript:;" onclick="openModal()">登录</a></li>
                        <li><a href="${base}/register">注册</a></li>
                    </#if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End header area -->

<div class="mainPage">
    <div class="container_self" style="min-height: 500px;">
        <div class="row">
            <div class="col-xs-4">1 ${choose.mcName}<a href="${base}/push/choose" style="color:blue">重新选择</a></div>
            <div class="col-xs-4"><span style="color:red">2 填写信息内容</span></div>
            <div class="col-xs-4">3 发布成功</div>
        </div>
        <div class="row" style="margin-top: 30px;">
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" data-backdrop="static"
                 data-keyboard="false">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <div class="container fh5co-form" style="margin-top: 0;">
                                <h3 style="text-align: center">欢迎登录麦芒网</h3>
                                <div class="form-box">
                                    <ul class="nav nav-tabs" role="tablist">
                                        <li role="presentation" style="width: 50%;text-align: center" class="active"><a
                                                href="#userLogin" aria-controls="userLogin" role="tab"
                                                data-toggle="tab">用户名密码登录</a></li>
                                        <li role="presentation" style="width: 50%;text-align: center"><a
                                                href="#phoneLogin" aria-controls="phoneLogin" role="tab"
                                                data-toggle="tab">手机动态码登录</a></li>
                                    </ul>
                                    <div class="tab-content" style="margin-top: 20px;">
                                        <div role="tabpanel" class="tab-pane active" id="userLogin">
                                            <form id="loginForm">
                                                <input type="hidden" name="path"
                                                       value="/push/fill?mcId=${choose.mcId}&scId=${choose.scId}">
                                                <div class="form-group">
                                                    <label for="username" class="sr-only">用户名</label>
                                                    <input type="text" class="form-control" id="username" minlength="2"
                                                           maxlength="16" required name="userName" placeholder="用户名">
                                                </div>
                                                <div class="form-group">
                                                    <label for="password" class="sr-only">密码</label>
                                                    <input type="password" class="form-control" id="password"
                                                           minlength="6" required name="userPassword" placeholder="密码">
                                                </div>


                                                <div class="form-group input-group" id="verifyDiv">
                                                    <label for="verifyCode" class="sr-only">验证码</label>
                                                    <input type="text" class="form-control" id="verifyCode" required
                                                           name="verifyCode" placeholder="验证码">
                                                    <span class="input-group-addon"
                                                          style="background: none;border: none;">
                                            <a href="javascript:;" title="看不清?点击更换验证码" id="changeImg"><img
                                                    src="${request.contextPath}/verify/code" class="verify"
                                                    alt="验证码"></a>

                                        </span>
                                                </div>
                                                <span style="color:red" id="error"></span>
                                                <div class="form-group row">
                                                    <div class="col-xs-6">
                                                        <label for="remember"><input type="checkbox" name="remember"
                                                                                     value="true"
                                                                                     id="remember">记住我?</label>
                                                    </div>
                                                    <div class="col-xs-6">
                                                        <p>没有账号? <a href="${request.contextPath}/register">注册</a> | <a
                                                                href="javascript:;">忘记密码?</a></p>
                                                    </div>

                                                </div>
                                                <div class="form-group">
                                                    <input type="button" value="登录" style="width: 100%;" id="loginBtn"
                                                           class="btn btn-primary">
                                                </div>
                                            </form>
                                        </div>
                                        <div role="tabpanel" class="tab-pane" id="phoneLogin">
                                            <form action="" id="phoneLoginForm">
                                                <input type="hidden" name="path" id="path"
                                                       value="/push/fill?mcId=${choose.mcId}&scId=${choose.scId}">
                                                <div class="form-group input-group">
                                                    <label for="phone" class="sr-only">手机号</label>
                                                    <input type="text" class="form-control" id="phone" maxlength="11"
                                                           minlength="11" name="phone" placeholder="手机号">
                                                    <span class="input-group-addon"
                                                          style="background: none;border: none;"><input
                                                            class="btn btn-success" id="verify_refresh" type="button"
                                                            onclick="getMsgNum(this)" value="免费获取验证码"></span>
                                                </div>
                                                <div class="form-group">
                                                    <label for="phoneCode" class="sr-only">动态码</label>
                                                    <input type="text" class="form-control" id="phoneCode"
                                                           name="phoneCode" placeholder="动态码">
                                                </div>


                                                <span style="color:red" id="phoneError"></span>

                                                <div class="form-group row">
                                                    <div class="col-xs-6">
                                                        <label for="remember"><input type="checkbox" name="remember"
                                                                                     value="true" id="phoneRemember">记住我?</label>
                                                    </div>
                                                    <div class="col-xs-6">
                                                        <p>没有账号? <a href="${request.contextPath}/register">注册</a> | <a
                                                                href="javascript:;">忘记密码?</a></p>
                                                    </div>

                                                </div>
                                                <div class="form-group">
                                                    <input type="button" value="登录" style="width: 100%;"
                                                           onclick="validateNum()" class="btn btn-primary">
                                                </div>
                                            </form>
                                        </div>
                                    </div>


                                </div>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->
            </div>

            <div class="modal fade" id="verifyModal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">

                    <div class="modal-content">
                        <div class="modal-body" style="padding: 10% 16% 10% 16%">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <div class="container logo_login">
                                <p>请填写图片验证码</p>
                            </div>
                            <form action="">
                                <div class="form-group input-group" id="verifyDiv">
                                    <label for="verifyCode" class="sr-only">验证码</label>
                                    <input type="text" class="form-control" id="phoneVerifyCode" name="verifyCode"
                                           placeholder="验证码">
                                    <span class="input-group-addon" style="background: none;border: none;">
                             <a href="javascript:;" title="看不清?点击更换验证码" id="phoneChangeImg"><img
                                     src="${request.contextPath}/verify/code" class="verify" alt="验证码"></a>
                        </span>
                                </div>
                                <span id="verifyError"></span>
                                <div class="form-group">
                                    <input type="button" onclick="verifyNum()" class="btn btn-danger"
                                           style="width: 100%" value="确定">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


<@footer>
    <script type="text/javascript" src="${base}/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${base}/js/messages_zh.js"></script>
    <script type="text/javascript" src="${base}/js/message.js"></script>
    <script type="text/javascript">
        function openModal() {
            $("#myModal").modal("show");
        }


        $("#changImg").click(function () {
            var verify = document.getElementById("verify");
            verify.src = "${base}/verify/code?date=" + new Date();
        });

        function updateVerifyHtml() {
            $("#verifyCode").val("");
            var verify = document.getElementById("verify");
            verify.src = "${base}/verify/code?date=" + new Date();
        }

        function valForm() {
            return $("#loginForm").validate().form();
        }


        $("#loginBtn").click(function () {
            if (valForm()) {
                //下面的请求发多了,开始需要用户验证。
                $.ajax({
                    url: '${base}/login',
                    type: 'post',
                    data: $("#loginForm").serialize(),
                    success: function (result) {
                        var res = result.split(":");
                        if (res[0] == "ok") {
                            window.location.href = res[1];
                        } else {
                            updateVerifyHtml();
                            $("#error").text(res[1]);
                        }
                    }
                })
            }

        });

        $(function () {
            $("#myModal").modal("show");
        });
    </script>
</@footer>