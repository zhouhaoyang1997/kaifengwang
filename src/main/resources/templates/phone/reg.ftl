<#include "defaultLayout/defaultLayout.ftl">
<#assign baseUrl = "${request.contextPath}"/>

<@header siteName="麦芒网"  base_css=["global","style","login"] base_keywords="麦芒网">

</@header>

<@body title="麦芒网">
<div class="m311 log_reg_box">
    <div id="logRegTabCon">
        <div class="log_reg_item">
            <form id="commentForm">
                <input type="hidden" name="returnurl" value="">
                <ul id="pptul" class="passport-login-input-ul">
                    <li style="display:none" class="passport-login-input-li">
                        <span id="loginTip" class="passport-login-tip"></span>
                    </li>

                    <li id="loginUserNameLi" class="passport-login-input-li">
                        <span class="passport-login-input-span">用&nbsp;户&nbsp;名</span>
                        <input type="text" class="passport-login-input passport-login-input-username" id="username" minlength="2" maxlength="16" required name="userName" placeholder="用户名">
                    </li>

                    <li id="loginPasswordLi" class="passport-login-input-li">
                        <span class="passport-login-input-span">密&nbsp;&nbsp;&nbsp;&nbsp;码</span>
                        <input type="password" class="passport-login-input passport-login-input-password" id="password" minlength="6" required name="userPassword" placeholder="密码">
                    </li>


                    <li id="loginCheckcodeLi" class="passport-login-input-li">
                        <span class="passport-login-input-span">验证码</span>
                        <input type="text" class="passport-login-input passport-login-input-username" style="margin-left: 20px" id="verifyCode" required name="verifyCode" placeholder="验证码">
                    </li>
                    <div style="margin-top:10px; text-align:center">
                        <img src="${request.contextPath}/verify/code" id="verify" alt="验证码" style="cursor:pointer; border:1px #ddd solid;" onClick="this.src=this.src+'?'">
                    </div>


                    <label for="remember"><input type="checkbox" name="remember" value="true" id="remember">记住我?</label>
                    <span style="color:red" id="error"></span>

                    <li id="loginButtonLi" class="passport-login-input-li">
                        <span class="passport-login-input-span" jqmoldstyle="block" style="display: none;">&nbsp;</span>
                        <label><input type="button" name="button" id="loginBtn" value="登录" class="passport-login-button btn_log"></label>
                    </li>
                </ul>
            </form>
        </div>
    </div>
    <div class="login_ff">
        <div class="login_ffmain">
            <a class="login_ffleft" href="javascript:;">忘记密码?</a><a class="login_ffleft" href="${baseUrl}/m/login">登录</a>
        </div>
    </div>
</div>
</@body>
<@footer base_js=["jquery.min","common_1","iscroll-probe","slider","jquery.validate.min","messages_zh"]>
<script>
    $(function() {
        function updateVerifyHtml() {
            $("#verifyCode").val("");
            var verify = document.getElementById("verify");
            verify.src = "${request.contextPath}/verify/code?date=" + new Date();
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
</@footer>


