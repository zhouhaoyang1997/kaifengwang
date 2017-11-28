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
                    <div class="panel-heading"><h3>修改密码</h3></div>
                    <div class="panel-body">
                        <form class="form-horizontal" id="alterPwdForm" action="${base}/user/alterPwd" method="post">
                            <div class="form-group">
                                <label for="name" class="col-sm-2">原密码</label>
                                <div class="col-sm-4">
                                    <input type="password" class="form-control" required id="oldPwd" name="oldPwd">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="phone" class="col-sm-2">新密码</label>
                                <div class="col-sm-4">
                                    <input type="password" class="form-control" minlength="6" maxlength="20" id="newPwd" name="newPwd">
                                </div>
                                <div class="col-sm-4">${alterPwdError!""}</div>
                            </div>
                            <div class="form-group">
                                <label for="email" class="col-sm-2">确认</label>
                                <div class="col-sm-4">
                                    <input type="password" class="form-control" minlength="6" maxlength="20" equalTo="#newPwd" id="repPwd" name="repPwd" >
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-1 col-sm-6">
                                    <button type="submit" class="btn btn-primary">保存修改</button>
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

    $().ready(function() {
        $("#alterPwdForm").validate();
    });
</script>
</@push_footer>


