<#--认证页面 -->
<#include "public/default.ftl">
<#include "public/pushdefault.ftl">
<#include "public/userdefault.ftl">
<#assign base="${request.contextPath}"/>
<@header title="麦芒网招聘">
<link rel="stylesheet" href="${base}/css/style.css">
<link rel="stylesheet" href="${base}/css/menu.css">
<link rel="stylesheet" href="${base}/css/userInfo.css">
<link rel="stylesheet" href="${base}/css/fileupload.css">
<link rel="stylesheet" href="${base}/css/default.css">
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
                        <#if Session.user??>
                        <#if user.userAttc??&&user.userAttc!=1>
                            <li class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">我的认证</a></li>
                        <#else>
                            <li class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">开始认证</a></li>
                        </#if>
                        </#if>
                        <li><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">信息修改</a></li>
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
                            <#switch user.userAttc>
                                <#case 1>
                                    <div class="panel-heading"><h3>开始认证</h3></div>
                                    <div class="panel-body">
                                        <form action="${base}/user/attc" method="post">
                                            <div class="form-group row">
                                                <div class="col-xs-2">
                                                    <label><span style="color:red">*</span>企业名称:</label>
                                                </div>
                                                <div class="col-xs-5">
                                                    <input type="text" class="form-control" name="cpName" placeholder="请输入企业名称">
                                                </div>
                                                <div class="col-xs-5"></div>
                                            </div>
                                            <div class="form-group row">
                                                <div class="col-xs-2">
                                                    <label><span style="color:red">*</span>注册号:</label>
                                                </div>
                                                <div class="col-xs-5">
                                                    <input type="text" class="form-control" name="cpNum" placeholder="请输入注册号">
                                                </div>
                                                <div class="col-xs-5"></div>
                                            </div>
                                            <div class="form-group row">
                                                <div class="col-xs-2">
                                                    <label><span style="color:red">*</span>法人代表:</label>

                                                </div>
                                                <div class="col-xs-5">
                                                    <input type="text" class="form-control" name="cpContactPerson" placeholder="请输入法人代表">
                                                </div>
                                                <div class="col-xs-5"></div>
                                            </div>
                                            <div class="form-group row">
                                                <div class="col-xs-2">
                                                    <label><span style="color:red">*</span>上传凭证:</label>
                                                </div>
                                                <div class="col-xs-8">
                                                    <div class="fileinput fileinput-new" data-provides="fileinput" id="exampleInputUpload">
                                                        <div class="fileinput-new thumbnail" style="width: 200px;height: auto;max-height:150px;">
                                                            <img id='picImg' style="width: 100%;height: auto;max-height: 140px;"
                                                                 src="${base}/img/noimage.png" alt=""/>
                                                        </div>
                                                        <div><span>恳请您上传有效、清晰的营业执照图片（最多上传1张，每张最大10M）</span></div>
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
                                                </div>
                                                <div class="col-xs-5"></div>
                                            </div>

                                            <div class="form-group row">
                                                <div class="col-sm-offset-4 col-sm-4">
                                                    <button type="submit" class="btn btn-danger">确认提交</button>
                                                </div>
                                            </div>
                                        </form>

                                    </div>
                                    <#break>
                                <#case 2>
                                <div class="panel-heading">
                                    <h3>我的认证</h3>
                                </div>
                                <div class="panel-body">
                                    <p>你的认证正在审核中...... 我们的将在3-5个工作日回复您!</p>
                                </div>
                                    <#break>
                                <#case 0>
                                <div class="panel-heading">
                                    <h3>我的认证</h3>
                                </div>
                                <div class="panel-body">
                                    <p>您已经认证</p>
                                </div>
                                        <#break>
                            </#switch>

                        </div>
                    </div>
                    <div role="tabpanel"  class="tab-pane" id="profile">
                        <div class="panel panel-default">
                            <div class="panel-heading"><h3>信息修改</h3></div>
                            <div class="panel-body">
                                <form action="">
                                    <div class="form-group row">
                                        <div class="col-xs-2">
                                            <label><span style="color:red">*</span>企业名称:</label>
                                        </div>
                                        <div class="col-xs-5">
                                            <input type="text" class="form-control" disabled>
                                        </div>
                                        <div class="col-xs-5">
                                            <span>修改企业名称,企业营业执照,企业法人,企业注册号,恳请您重新认证企业!</span>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-xs-2">
                                            <label><span style="color:red">*</span>企业地址:</label>

                                        </div>
                                        <div class="col-xs-5">
                                            <input type="text" class="form-control" >
                                        </div>
                                        <div class="col-xs-5"></div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-xs-2">
                                            <label><span style="color:red">*</span>企业网址:</label>

                                        </div>
                                        <div class="col-xs-5">
                                            <input type="text" class="form-control" >
                                        </div>
                                        <div class="col-xs-5"></div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-xs-2">
                                            <label><span style="color:red">*</span>企业简介:</label>

                                        </div>
                                        <div class="col-xs-8">
                                            <textarea name="piContent" style="width:600px;height:400px;visibility:hidden;"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-offset-4 col-sm-4">
                                            <button type="submit" class="btn btn-danger">确认提交</button>
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
<script type="text/javascript" src="${request.contextPath}/js/kindeditor-min.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/zh-CN.js"></script>
<script type="text/javascript">
    var editor;
    KindEditor.ready(function(K) {
        editor = K.create('textarea[name="piContent"]', {
            resizeType : 1,
            allowPreviewEmoticons : false,
            allowImageUpload : false,
            items : [
                'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                'insertunorderedlist', '|', 'emoticons', 'image', 'link']
        });
    });
</script>
</@push_footer>