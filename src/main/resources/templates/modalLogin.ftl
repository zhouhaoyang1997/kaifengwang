<#include "public/default.ftl">
<#assign base="${request.contextPath}"/>
<@header title="填写信息">
<link rel="stylesheet" href="${base}/css/style.css">
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
            <div class="col-xs-4">1 ${choose.mcName}<a href="${base}/push/choose" style="color:blue">重新选择</a> </div>
            <div class="col-xs-4"><span style="color:red">2 填写信息内容</span></div>
            <div class="col-xs-4">3 发布成功</div>
        </div>
        <div class="row" style="margin-top: 30px;">
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <div class="container logo_login">
                                    <h1>开封<span>麦芒网</span></h1>
                                    <p >欢迎你的登陆</p>
                                </div>
                            <div class="container loginForm">
                                <form id="loginForm" >
                                    <input type="hidden" name="path" value="/push/fill?mcId=${choose.mcId}&scId=${choose.scId}">
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="userName" placeholder="用户名">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control" name="userPassword" placeholder="密码">
                                    </div>
                                    <div class="form-group row" id="verifyDiv">
                                        <label for="verifyCode" class="sr-only">验证码</label>
                                        <input type="text" class="col-xs-5" style="margin-left: 20px" id="verifyCode"required name="verifyCode" placeholder="验证码">
                                        <div class="col-xs-6">
                                            <img src="${request.contextPath}/verify/code" id="verify" alt="验证码">
                                            <a href="javascript:;" id="changImg">看不清？</a>
                                        </div>
                                    </div>

                                    <span style="color:red" id="error"></span>
                                    <div class="form-group">
                                        <label for="remember"><input type="checkbox" name="remember" value="true" id="remember">记住我?</label>
                                    </div>
                                    <div class="form-group">
                                        <p>没有账号? <a href="${base}/register">注册</a> | <a href="javascript:;">忘记密码?</a></p>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-9">
                                            <div class="form-group" style="margin-top:20px">
                                                <input type="button" value="登录" id="loginBtn" style="width: 100px" class="btn btn-danger">
                                            </div>
                                        </div>
                                        <div class="col-xs-3">
                                            <a href="#"><div class="qq_lg"></div><span>QQ登陆</span></a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
        </div>
    </div>
</div>


<@footer>
<script type="text/javascript" src="${request.contextPath}/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/messages_zh.js"></script>
<script type="text/javascript">
    function openModal() {
        $("#myModal").modal("show");
    }


    $("#changImg").click(function () {
        var verify = document.getElementById("verify");
        verify.src = "${request.contextPath}/verify/code?date=" + new Date();
    });

    function updateVerifyHtml() {
        $("#verifyCode").val("");
        var verify = document.getElementById("verify");
        verify.src = "${request.contextPath}/verify/code?date=" + new Date();
    }

    function valForm() {
        return $("#loginForm").validate().form();
    }



    $("#loginBtn").click(function () {
        if(valForm()){
            //下面的请求发多了,开始需要用户验证。
            $.ajax({
                url:'${request.contextPath}/login',
                type:'post',
                data:$("#loginForm").serialize(),
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

    });

    $(function () {
        $("#myModal").modal("show");
    });
</script>
</@footer>