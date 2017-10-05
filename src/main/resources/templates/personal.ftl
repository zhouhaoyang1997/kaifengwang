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

<div class="col-md-3"><div class="user_bar"><h4><a href="#"  class="active">个人中心</a></h4></div></div>
<div class="col-md-3"><div class="user_bar"><h4><a href="#">账户设置</a></h4></div></div>
</@user_nav>

<div class="container_self" style="min-height: 800px;">
    <div class="row">
        <div class="col-md-2" style="width:20%">
            <!-- Contenedor -->
            <ul id="accordion" class="accordion">
                <li class="active open">
                    <div class="link"><i class="fa fa-paint-brush"></i>个人中心<i class="fa fa-chevron-down"></i></div>
                    <ul class="submenu"  style="display: block;">
                        <li class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">我的发布</a></li>
                        <li><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">我的收藏</a></li>
                        <li><a href="#changeInfo" aria-controls="changeInfo" role="tab" data-toggle="tab">帮助信息</a></li>
                    </ul>
                </li>
                <li>
                    <a href="${base}/user/info"> <div class="link"><i class="fa fa-code"></i>账户设置<i class="fa fa-chevron-down"></i></div></a>
                </li>
                <li>
                    <a href="${base}/user/extension"> <div class="link"><i class="fa fa-mobile"></i>推广中心<i class="fa fa-chevron-down"></i></div></a>
                </li>
                <li>
                    <a href="${base}/user/attc"> <div class="link"><i class="fa fa-id-card-o"></i>公司认证<i class="fa fa-chevron-down"></i></div></a>

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
                            <div class="panel-heading"><h3>我的发布</h3></div>
                            <div class="panel-body">
                                <div>
                                    <!-- Nav tabs -->
                                    <ul class="nav nav-tabs" role="tablist">
                                        <li role="presentation" class="active"><a href="#newInfo" aria-controls="home" role="tab" data-toggle="tab">最新消息</a></li>
                                        <li role="presentation"><a href="#showInfo" aria-controls="profile" role="tab" data-toggle="tab">显示中的消息</a></li>
                                        <li role="presentation"><a href="#checkInfo" aria-controls="messages" role="tab" data-toggle="tab">审核中的消息</a></li>
                                        <li role="presentation"><a href="#deleteInfo" aria-controls="settings" role="tab" data-toggle="tab">已删除的信息</a></li>
                                        <li role="presentation"><a href="#noShowInfo" aria-controls="settings" role="tab" data-toggle="tab">未显示的信息</a></li>
                                    </ul>

                                    <!-- Tab panes -->
                                    <div class="tab-content">
                                        <div role="tabpanel" class="tab-pane active" id="newInfo">
                                            xxxxxx
                                        </div>
                                        <div role="tabpanel" class="tab-pane" id="showInfo">...</div>
                                        <div role="tabpanel" class="tab-pane" id="checkInfo">...</div>
                                        <div role="tabpanel" class="tab-pane" id="deleteInfo">...</div>
                                        <div role="tabpanel" class="tab-pane" id="noShowInfo">...</div>
                                    </div>

                                </div>
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
                    <div role="tabpanel"  class="tab-pane" id="changeInfo">
                        <div class="panel panel-default">
                            <div class="panel-heading"><h3>帮助中心</h3></div>
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


