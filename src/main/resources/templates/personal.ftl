<#include "public/default.ftl">
<#include "public/pushdefault.ftl">
<#include "public/userdefault.ftl">
<#assign base="${request.contextPath}"/>
<@header title="麦芒网招聘">
<link rel="stylesheet" href="${base}/css/style.css">
<link rel="stylesheet" href="${base}/css/bootstrap-table.min.css">
<link rel="stylesheet" href="${base}/css/menu.css">
<link rel="stylesheet" href="${base}/css/userInfo.css">
</@header>
<@headerArea>
<li><a href="${base}/index">回首页</a></li>
</@headerArea>
<@user_nav>

<div class="col-md-3">
    <div class="user_bar"><h4><a href="${base}/user/personal" style="font-size: 18px;font-weight: 600">个人中心</a></h4></div>
</div>
<div class="col-md-3">
    <div class="user_bar"><h4><a href="${base}/user/info">账户设置</a></h4></div>
</div>
</@user_nav>

<div class="container_self" style="min-height: 800px;">
    <div class="row">
        <div class="col-md-2" style="width:20%">
            <!-- Contenedor -->
            <ul id="accordion" class="accordion">
                <li class="active open">
                    <div class="link"><i class="fa fa-paint-brush"></i>个人中心<i class="fa fa-chevron-down"></i></div>
                    <ul class="submenu" style="display: block;">
                        <li class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">我的发布</a>
                        </li>
                        <li><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">我的收藏</a></li>
                        <li><a href="${base}/about/help" target="_blank">帮助信息</a></li>
                    </ul>
                </li>
                <li>
                    <a href="${base}/user/info">
                        <div class="link"><i class="fa fa-code"></i>账户设置<i class="fa fa-chevron-down"></i></div>
                    </a>
                </li>
                <li>
                    <a href="${base}/user/extension" target="_blank">
                        <div class="link"><i class="fa fa-mobile"></i>推广中心</div>
                    </a>
                </li>
                <li>
                    <a href="${base}/user/attc" target="_blank">
                        <div class="link"><i class="fa fa-id-card-o"></i>公司认证</div>
                    </a>

                </li>
                <li><a href="${base}/user/resume"><div class="link"><i class="fa fa-globe"></i>我的简历</div></a></li>
            </ul>
        </div>
        <div class="col-md-9">
            <div style="margin-top: 20px;">
                <!-- Tab panes -->
                <div class="tab-content personal_tab">
                    <div role="tabpanel" class="tab-pane active" id="home">
                        <div class="panel panel-default">
                            <div class="panel-heading"><h3>我的发布</h3></div>
                            <div class="panel-body">
                                <div>
                                    <table class="table" id="table"></table>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div role="tabpanel" class="tab-pane" id="profile">
                        <div class="panel panel-default">
                            <div class="panel-heading"><h3>我的收藏</h3></div>
                            <div class="panel-body">
                                <p>提醒:如果您收藏的信息被发布者删除了,这条信息将不会出现在您的收藏列表中</p>
                                <table class="table" id="collectionTable">

                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                您确认删除该条信息吗?删除后不可恢复!
                <input type="hidden" id="piIdHidden" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" id="removeBtn" class="btn btn-primary">确认</button>
            </div>
        </div>
    </div>
</div>


<@push_footer>
<script type="text/javascript" src="${base}/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${base}/js/bootstrap-table.min.js"></script>
<script type="text/javascript" src="${base}/js/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript" src="${base}/js/personal.js"></script>
</@push_footer>


