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
<div class="col-md-3"><div class="user_bar"><h4><a href="#" class="active">账户设置</a></h4></div></div>
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
                        <li class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">个人资料</a></li>
                        <li><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">密码设置</a></li>
                        <li><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">头像设置</a></li>
                        <li><a href="#changeInfo" aria-controls="changeInfo" role="tab" data-toggle="tab">修改资料</a></li>
                    </ul>
                </li>
                <li>
                    <a href="${base}/user/extension"><div class="link"><i class="fa fa-mobile"></i>推广中心<i class="fa fa-chevron-down"></i></div></a>
                </li>
                <li>
                    <a href="${base}/user/attc"><div class="link"><i class="fa fa-id-card-o"></i>公司认证<i class="fa fa-chevron-down"></i></div></a>
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
                            <div class="panel-heading"><h3>我的资料</h3></div>
                            <div class="panel-body">
                                <div class="profile-left">
                                    <!-- PROFILE HEADER -->
                                    <div class="profile-header">
                                        <div class="overlay"></div>
                                        <div class="profile-main">
                                            <img src="${base}/img/user-medium.png" class="img-circle" alt="Avatar">
                                            <h3 class="name">张三</h3>
                                            <span>开封城市网欢迎你</span>
                                        </div>
                                        <div class="profile-stat">
                                            <div class="row">
                                                <div class="col-md-4 stat-item">
                                                    45 <span>发布</span>
                                                </div>
                                                <div class="col-md-4 stat-item">
                                                    15 <span>收藏</span>
                                                </div>
                                                <div class="col-md-4 stat-item">
                                                    2017-01-05 <span>最后登陆时间</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- END PROFILE HEADER -->
                                    <!-- PROFILE DETAIL -->
                                    <div class="profile-detail">
                                        <div class="profile-info">
                                            <h4 class="heading">基础信息</h4>
                                            <ul class="list-unstyled list-justify">
                                                <li>用户名 <span>张三</span></li>
                                                <li>手机号 <span>18236556108</span></li>
                                                <li>邮箱 <span>samuel@mydomain.com</span></li>
                                            </ul>
                                        </div>
                                        <div class="profile-info">
                                            <h4 class="heading">个人简介</h4>
                                            <p>开封XXX公司总经理.</p>
                                        </div>
                                    </div>
                                    <!-- END PROFILE DETAIL -->
                                </div>
                            </div>
                        </div>


                    </div>
                    <div role="tabpanel"  class="tab-pane" id="profile">
                        <div class="panel panel-default">
                            <div class="panel-heading"><h3>修改密码</h3></div>
                            <div class="panel-body">
                                <form class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <label for="name" class="col-sm-2">原密码</label>
                                        <div class="col-sm-4">
                                            <input type="text" class="form-control" id="name" name="userName">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="phone" class="col-sm-2">新密码</label>
                                        <div class="col-sm-4">
                                            <input type="text" class="form-control" id="phone" >
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="email" class="col-sm-2">确认</label>
                                        <div class="col-sm-4">
                                            <input type="text" class="form-control" id="email" name="email" >
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-1 col-sm-6">
                                            <button type="submit" class="btn btn-default">保存修改</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                    <div role="tabpanel"  class="tab-pane" id="changeInfo">
                        <div class="panel panel-default">
                            <div class="panel-heading"><h3>修改信息</h3></div>
                            <div class="panel-body">
                                <form class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <label for="name" class="col-sm-2">用户名</label>
                                        <div class="col-sm-4">
                                            <input type="text" class="form-control" id="name" disabled name="userName">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="phone" class="col-sm-2">手机号</label>
                                        <div class="col-sm-4">
                                            <input type="text" class="form-control" id="phone" >
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="email" class="col-sm-2">邮箱</label>
                                        <div class="col-sm-4">
                                            <input type="email" class="form-control" id="email" name="email" >
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="email" class="col-sm-2">个人简介</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="profileInfo" name="profileInfo" >
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-1 col-sm-6">
                                            <button type="submit" class="btn btn-default">保存修改</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                    <div role="tabpanel"  class="tab-pane" id="messages">
                        <div class="panel panel-default">
                            <div class="panel-heading"><h3>修改头像</h3></div>
                            <div class="panel-body">
                                <form class="form-horizontal" role="form">
                                    <div class="fileinput fileinput-new" data-provides="fileinput" id="exampleInputUpload">
                                        <div class="fileinput-new thumbnail" style="width: 200px;height: auto;max-height:150px;">
                                            <img id='picImg' style="width: 100%;height: auto;max-height: 140px;"
                                                 src="${base}/img/noimage.png" alt=""/>
                                        </div>
                                        <div class="fileinput-preview fileinput-exists thumbnail"
                                             style="max-width: 200px; max-height: 150px;"></div>
                                        <div>
                        <span class="btn btn-primary btn-file">
                            <span class="fileinput-new">选择文件</span>
                            <span class="fileinput-exists">换一张</span>
                            <input type="file" name="pic" id="picID" accept="image/gif,image/jpeg,image/x-png"/>
                        </span>
                                            <a href="javascript:;" class="btn btn-warning fileinput-exists"
                                               data-dismiss="fileinput">移除</a>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-1 col-sm-6">
                                            <button type="submit" class="btn btn-default">保存修改</button>
                                        </div>
                                    </div>
                                </form>
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


