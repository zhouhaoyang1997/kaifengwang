<#include "defaultLayout/defaultLayout.ftl">
<#assign baseUrl = "${request.contextPath}"/>

<@header siteName="麦芒网"  base_css=["global","style","login"] base_keywords="麦芒网">
<link rel="stylesheet" href="${baseUrl}/css/bootstrap.min.css">
<link rel="stylesheet" href="${baseUrl}/css/font-awesome.min.css">
</@header>

<@body title="麦芒网" back=true>
<div id="contactbar">
    <a href="/m/index" class="bottom_index">首页</a>
    <a href="/m/user/info" class="bottom_member_on">我的</a>
    <a href="${baseUrl}/m/about/cpdesc" class="bottom_history">推送</a>
    <a href="${baseUrl}/m/push/choose" class="bottom_post">发布</a>
</div>
<div class="fh5co-form">
    <div id="logRegTabCon">
        <div class="form-box" style="margin-top: 10px;">
            <form action="" id="phoneLoginForm">
                <div class="form-group input-group">
                    <label for="phone" class="sr-only">手机号</label>
                    <input type="text" class="form-control" id="phone" maxlength="11" minlength="11" name="phone" placeholder="手机号">
                    <span class="input-group-addon" style="background: none;border: none;padding: 0;"><input class="btn btn-success"  id="verify_refresh" type="button" onclick="getMsgNum(this)" value="免费获取验证码"></span>
                </div>
                <div class="form-group">
                    <label for="phoneCode" class="sr-only">动态码</label>
                    <input type="text" class="form-control" maxlength="6" minlength="6" id="phoneCode" required name="phoneCode" placeholder="动态码">
                </div>


                <span style="color:red" id="phoneError"></span>

                <div class="form-group row">
                    <div class="col-xs-5">
                        <label for="remember"><input type="checkbox" name="remember" value="true" id="phoneRemember">记住我?</label>
                    </div>
                    <div class="col-xs-7">
                        <p>没有账号? <a href="${baseUrl}/m/reg">注册</a> | <a href="${baseUrl}/verifyAccount">忘记密码?</a></p>
                    </div>

                </div>
                <div class="form-group">
                    <input type="button" value="登录" style="width: 100%;" onclick="validateNum()" class="btn btn-danger">
                </div>
            </form>

        </div>
    </div>
    <div class="login_ff">
        <div class="login_hezuo">
            使用其他方式登录：
            <div class="login_hezuo_mian">
                <ul>
                    <li class="bor" style=" margin:0 auto; float:none; border:none"><a href="${baseUrl}/m/login"><i class="hzico-qq"></i>使用账号密码登录</a></li>
                </ul>
            </div>
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
</@body>
<@footer base_js=["jquery.min","common_1","iscroll-probe","slider"]>
<script type="text/javascript" src="${request.contextPath}/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/messages_zh.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/message.js"></script>
<script>
    $(function() {
        function updateVerifyHtml() {
            $("#verifyCode").val("");
            var verify = document.getElementById("verify");
            verify.src = "${request.contextPath}/verify/code?date=" + new Date();
        }
        $("#phoneChangeImg").click(function () {
            $(".verify").attr("src","${request.contextPath}/verify/code?date=" + new Date().getTime());
        });

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
                            window.location.href="${request.contextPath}/m"+res[1];
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
</@footer>


