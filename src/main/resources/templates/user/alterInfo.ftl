<#include "../public/default.ftl">
<#include "../public/pushdefault.ftl">
<#include "../public/userdefault.ftl">
<#assign base="${request.contextPath}"/>
<@header title="麦芒网">
<link rel="stylesheet" href="${base}/css/style.css">
<link rel="stylesheet" href="${base}/css/menu.css">
<link rel="stylesheet" href="${base}/css/userInfo.css">

</@header>
<@headerArea>
<li><a href="${base}/index">回首页</a></li>
</@headerArea>
<@user_nav>
<div class="col-md-3">
    <div class="user_bar"><h4><a href="${base}/user/personal">个人中心</a></h4></div>
</div>
<div class="col-md-3">
    <div class="user_bar"><h4><a href="${base}/user/info" style="font-size: 18px;font-weight: 600">账户设置</a></h4></div>
</div>
</@user_nav>

<div class="container_self" style="min-height: 800px;">
    <div class="row">
        <div class="col-md-2" style="width:20%">
            <!-- Contenedor -->
            <ul id="accordion" class="accordion">
                <li>
                    <a href="${base}/user/personal"><div class="link"><i class="fa fa-paint-brush"></i>个人中心<i class="fa fa-chevron-down"></i></div></a>

                </li>
                <li class="active open">
                    <div class="link"><i class="fa fa-code"></i>账户设置<i class="fa fa-chevron-down"></i></div>
                    <ul class="submenu" style="display: block;">
                        <li><a href="${base}/user/info">个人资料</a></li>
                        <li><a href="${base}/user/info/pwd">密码设置</a></li>
                        <li><a href="${base}/user/info/pic">头像设置</a></li>
                        <li><a href="${base}/user/info/alterInfo">修改资料</a></li>
                    </ul>
                </li>
                <li>
                    <a href="${base}/user/extension" target="_blank"><div class="link"><i class="fa fa-mobile"></i>推广中心</div></a>
                </li>
                <li>
                    <a href="${base}/user/attc"><div class="link"><i class="fa fa-id-card-o"></i>公司认证</div></a>
                </li>
                <li><a href="${base}/user/resume"><div class="link"><i class="fa fa-globe"></i>我的简历</div></a></li>
            </ul>


        </div>
        <div class="col-md-9">
            <div style="margin-top: 20px;">
                <div class="panel panel-default">
                    <div class="panel-heading"><h3>修改信息</h3></div>
                    <div class="panel-body">
                        <form class="form-horizontal" role="form" id="alterInfo">
                            <div class="form-group">
                                <label for="name" class="col-sm-2">用户名</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="name" disabled value="${userInfo.userName}">
                                </div>

                            </div>
                            <div class="form-group">
                                <label for="Phone" class="col-sm-2">手机号</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="Phone" disabled value="${userInfo.userPhone!""}" minlength="11" maxlength="11">
                                </div>
                                <div class="col-sm-1">
                                    <button type="button" class="btn btn-primary" id="alterPhoneBtn">修改</button>
                                    <button type="button" class="btn btn-success" id="enterPhoneBtn" style="display: none;">确认</button>

                                </div>
                                <div class="col-sm-3">
                                    <span id="PhoneError"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="Email" class="col-sm-2">邮箱</label>
                                <div class="col-sm-4">
                                    <input type="email" class="form-control" id="Email" disabled value="${userInfo.userEmail!""}" name="email" >
                                </div>
                                <div class="col-sm-1">
                                    <button type="button" class="btn btn-primary"  id="alterEmailBtn">修改</button>
                                    <button type="button" class="btn btn-success" id="enterEmailBtn" style="display: none;">确认</button>
                                </div>
                                <div class="col-sm-3">
                                    <span id="EmailError"></span>
                                </div>

                            </div>
                            <div class="form-group">
                                <label for="ProfileInfo" class="col-sm-2">个人简介</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="ProfileInfo" disabled value="${userInfo.userDescription!""}" minlength="2" maxlength="100" name="profileInfo" >
                                </div>
                                <div class="col-sm-1">
                                    <button type="button" class="btn btn-primary" id="alterProfileInfoBtn">修改</button>
                                    <button type="button" class="btn btn-success" id="enterProfileInfoBtn" style="display: none;">确认</button>
                                </div>
                                <div class="col-sm-3">
                                    <span id="ProfileInfoError"></span>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>


<@push_footer>
<script type="text/javascript" src="${base}/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${base}/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${base}/js/messages_zh.js"></script>
<script>
    $.validator.setDefaults({
        submitHandler: function(form) {
            form.submit();
        }
    });

    $().ready(function() {

        $("#alterInfo").validate();


        var item = "Phone,Email,ProfileInfo".split(",");
        item.forEach(function (p1, p2, p3) {
            $("#alter"+p1+"Btn").click(function () {
                $("#"+p1).removeAttr("disabled");
                $("#alter"+p1+"Btn").css("display","none");
                $("#enter"+p1+"Btn").css("display","block");
            });

            $("#enter"+p1+"Btn").click(function () {
                $.ajax({
                    type:'get',
                    url:'${base}/user/alter'+p1+'?user'+p1+'='+$("#"+p1).val(),
                    success:function (result) {
                        var res = result.split(":");
                        if(res[0]==="ok"){
                            alert(res[1]);
                            $("#enter"+p1+"Btn").css("display","none");
                            $("#alter"+p1+"Btn").css("display","block");
                            $("#"+p1).attr("disabled","disabled");
                        }else{
                            $("#"+p1+"Error").html(res[1]);

                        }
                    }
                })
            });
        });
    });
</script>
</@push_footer>


