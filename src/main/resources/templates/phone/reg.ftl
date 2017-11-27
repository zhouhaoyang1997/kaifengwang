<#include "defaultLayout/defaultLayout.ftl">
<#import "/spring.ftl" as spring />
<#assign baseUrl = "${request.contextPath}"/>

<@header siteName="麦芒网"  base_css=["global","style","login"] base_keywords="麦芒网">

</@header>

<@body title="欢迎你注册成为麦芒会员" back=true>
<div id="contactbar">
    <a href="/m/index" class="bottom_index">首页</a>
    <a href="/m/user/info" class="bottom_member_on">我的</a>
    <a href="#" class="bottom_history">推送</a>
    <a href="${baseUrl}/m/push/choose" class="bottom_post">发布</a>
</div>
<div class="m311 log_reg_box">
    <div id="logRegTabCon">
        <div class="log_reg_item">
            <form action="${request.contextPath}/register" id="commentForm" method="post">
                <input type="hidden" name="method" value="mobile">
                <ul id="pptul" class="passport-login-input-ul">


                    <li id="loginUserNameLi" class="passport-login-input-li">
                        <span class="passport-login-input-span">用&nbsp;户&nbsp;名</span>
                        <input type="text" class="passport-login-input passport-login-input-username" name="userName" required id="name" minlength="4" maxlength="16" placeholder="用户名" >

                    </li>
                    <#if userDetail??>
                        <@spring.bind "userDetail.userName" />
                        <@spring.showErrors "<br>"/>
                    </#if>
                    <li id="loginUserEmailLi" class="passport-login-input-li">
                        <span class="passport-login-input-span">邮&nbsp;&nbsp;箱</span>
                        <input type="email" class="passport-login-input passport-login-input-username" name="userEmail" id="email" placeholder="邮箱" >
                    </li>
                    <#if userDetail??>
                        <@spring.bind "userDetail.userEmail" />
                        <@spring.showErrors "<br>"/>
                    </#if>
                    <li id="loginPasswordLi" class="passport-login-input-li">
                        <span class="passport-login-input-span">密&nbsp;&nbsp;&nbsp;&nbsp;码</span>
                        <input type="password" class="passport-login-input passport-login-input-password" id="password" minlength="6" required name="userPassword" placeholder="密码">
                    </li>
                    <#if userDetail??>
                        <@spring.bind "userDetail.userPassword" />
                        <@spring.showErrors "<br>"/>
                    </#if>
                    <li id="loginRepeatPasswordLi" class="passport-login-input-li">
                        <span class="passport-login-input-span">密&nbsp;&nbsp;&nbsp;&nbsp;码</span>
                        <input type="password" class="passport-login-input passport-login-input-password" equalTo="#password" id="re-password" minlength="6" required  placeholder="确认密码">
                    </li>

                    <li id="loginCheckcodeLi" class="passport-login-input-li">
                        <span class="passport-login-input-span">验证码</span>
                        <input type="text" class="passport-login-input passport-login-input-username" id="verifyCode" required name="verifyCode" placeholder="验证码">
                    </li>
                    <div style="margin-top:10px; text-align:center">
                        <img src="${request.contextPath}/verify/code" id="verify" alt="验证码" style="cursor:pointer; border:1px #ddd solid;" onClick="this.src=this.src+'?'">
                    </div>


                    <label for="remember"><input type="checkbox" name="remember" value="true" id="remember">记住我?</label>
                    <span style="color:red" id="error"></span>

                    <li id="loginButtonLi" class="passport-login-input-li">
                        <span class="passport-login-input-span" jqmoldstyle="block" style="display: none;">&nbsp;</span>
                        <label><input type="submit" value="注册" class="passport-login-button btn_log"></label>
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
<@footer base_js=["jquery.min","common_1","iscroll-probe","slider"]>
<script type="text/javascript" src="${request.contextPath}/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/messages_zh.js"></script>
<script>
    $.validator.setDefaults({
        submitHandler: function(form) {
            form.submit();
        }
    });
    $().ready(function() {
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
</@footer>


