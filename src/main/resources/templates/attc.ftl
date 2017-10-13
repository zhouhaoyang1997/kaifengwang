<#--认证页面 -->
<#include "public/default.ftl">
<#include "public/pushdefault.ftl">
<#include "public/userdefault.ftl">
<#assign base="${request.contextPath}"/>
<@header title="开封网招聘">
<link rel="stylesheet" href="${base}/css/style.css">
<link rel="stylesheet" href="${base}/css/menu.css">
<link rel="stylesheet" href="${base}/css/userInfo.css">
<link rel="stylesheet" href="${base}/css/fileupload.css">
</@header>
<@headerArea>
<li><a href="${base}/index">回首页</a></li>
</@headerArea>
<@user_nav>

<div class="col-md-3"><div class="user_bar"><h4><a href="#">个人中心</a></h4></div></div>
<div class="col-md-3"><div class="user_bar"><h4><a href="#">账户设置</a></h4></div></div>
</@user_nav>

<div class="container_self" style="min-height: 800px;">
    <div class="row">
        <div class="col-md-2" style="width:20%">
            <!-- Contenedor -->
            <ul id="accordion" class="accordion">
                <li >
                    <a href="${base}/user/personal"> <div class="link"><i class="fa fa-paint-brush"></i>个人中心<i class="fa fa-chevron-down"></i></div></a>
                   
                </li>
                <li>
                    <a href="${base}/user/info"> <div class="link"><i class="fa fa-code"></i>账户设置<i class="fa fa-chevron-down"></i></div></a>
                </li>
                <li>
                    <a href="${base}/user/extension"><div class="link"><i class="fa fa-mobile"></i>推广中心<i class="fa fa-chevron-down"></i></div></a>
                </li>
                <li class="active open">
                     <div class="link"><i class="fa fa-id-card-o"></i>公司认证<i class="fa fa-chevron-down"></i></div>
                    <ul class="submenu" style="display: block;">
                        <li class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">开始认证</a></li>
                        <li class="active"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">信息修改</a></li>
                    </ul>
                </li>
                <li><div class="link"><i class="fa fa-globe"></i>我的简历</div></li>
            </ul>
        </div>
        <div class="col-md-9">
            <div style="margin-top: 20px;">
                <!-- Tab panes -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="home">
                        <div class="panel panel-default">
                            <div class="panel-heading"><h3>开始认证</h3></div>
                            <div class="panel-body">
                                123123
                            </div>
                        </div>
                    </div>
                    <div role="tabpanel"  class="tab-pane" id="profile">
                        <div class="panel panel-default">
                            <div class="panel-heading"><h3>我的收藏</h3></div>
                            <div class="panel-body">

                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

</div>


<@push_footer>
<script type="text/javascript" src="${base}/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${base}/js/fileupload.js"></script>
</@push_footer>