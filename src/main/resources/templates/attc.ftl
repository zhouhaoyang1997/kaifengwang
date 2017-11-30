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
<link rel="stylesheet" href="${base}/css/fileinput.min.css">
<link rel="stylesheet" href="${base}/BeAlert/BeAlert.css">
</@header>
<@headerArea>
<li><a href="${base}/index">回首页</a></li>
</@headerArea>
<@user_nav>

<div class="col-md-3">
    <div class="user_bar"><h4><a href="#">个人中心</a></h4></div>
</div>
<div class="col-md-3">
    <div class="user_bar"><h4><a href="#">账户设置</a></h4></div>
</div>
</@user_nav>

<div class="container_self" style="min-height: 800px;">
    <div class="row">
        <div class="col-md-2" style="width:20%">
            <!-- Contenedor -->
            <ul id="accordion" class="accordion">
                <li>
                    <a href="${base}/user/personal">
                        <div class="link"><i class="fa fa-paint-brush"></i>个人中心<i class="fa fa-chevron-down"></i></div>
                    </a>

                </li>
                <li>
                    <a href="${base}/user/info">
                        <div class="link"><i class="fa fa-code"></i>账户设置<i class="fa fa-chevron-down"></i></div>
                    </a>
                </li>
                <li>
                    <a href="${base}/user/extension" target="_blank">
                        <div class="link"><i class="fa fa-mobile"></i>推广中心<i class="fa fa-chevron-down"></i></div>
                    </a>
                </li>
                <li class="active open">
                    <div class="link"><i class="fa fa-id-card-o"></i>公司认证<i class="fa fa-chevron-down"></i></div>
                    <ul class="submenu" style="display: block;">
                    <#switch status>
                        <#case 1>
                            <li class="active"><a href="#home" aria-controls="home" role="tab"
                                                  data-toggle="tab">开始认证</a></li>
                            <#break>
                        <#case 0>
                            <li class="active"><a href="#home" aria-controls="home" role="tab"
                                                  data-toggle="tab">我的认证</a></li>
                            <li><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">信息修改</a></li>
                            <#break>
                        <#case 2>
                            <li class="active"><a href="#home" aria-controls="home" role="tab"
                                                  data-toggle="tab">我的认证</a></li>
                            <#break>
                    </#switch>
                    </ul>
                </li>
                <li><a href="${base}/user/resume">
                    <div class="link"><i class="fa fa-globe"></i>我的简历</div>
                </a></li>
            </ul>
        </div>
        <div class="col-md-9">
            <div style="margin-top: 20px;">
                <!-- Tab panes -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="home">
                        <div class="panel panel-default">
                        <#switch status>
                            <#case 1>
                                <div class="panel-heading"><h3>开始认证</h3></div>
                                <div class="panel-body">
                                    <form action="${base}/user/attc" enctype="multipart/form-data" method="post">
                                        <div class="form-group row">
                                            <div class="col-xs-2">
                                                <label><span style="color:red">*</span>企业名称:</label>
                                            </div>
                                            <div class="col-xs-5">
                                                <input type="text" class="form-control" name="cpName"
                                                       placeholder="请输入企业名称">
                                            </div>
                                            <div class="col-xs-5"></div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-xs-2">
                                                <label><span style="color:red">*</span>注册号:</label>
                                            </div>
                                            <div class="col-xs-5">
                                                <input type="text" class="form-control" name="cpNum"
                                                       placeholder="请输入注册号">
                                            </div>
                                            <div class="col-xs-5"></div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-xs-2">
                                                <label><span style="color:red">*</span>法人代表:</label>
                                            </div>
                                            <div class="col-xs-5">
                                                <input type="text" class="form-control" name="cpContactPerson"
                                                       placeholder="请输入法人代表">
                                            </div>
                                            <div class="col-xs-5"></div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-xs-2">
                                                <label><span style="color:red">*</span>联系方式:</label>
                                            </div>
                                            <div class="col-xs-5">
                                                <input type="text" class="form-control" name="cpContact"
                                                       placeholder="请输入联系方式">
                                            </div>
                                            <div class="col-xs-5">请务必输入可以接收到电话的联系方式,是否验证成功我们将通过短信告知</div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-xs-2">
                                                <label><span style="color:red">*</span>上传凭证:</label>
                                            </div>
                                            <div class="col-xs-8">
                                                <div class="fileinput fileinput-new" data-provides="fileinput"
                                                     id="exampleInputUpload">
                                                    <div class="fileinput-new thumbnail"
                                                         style="width: 200px;height: auto;max-height:150px;">
                                                        <img id='picImg'
                                                             style="width: 100%;height: auto;max-height: 140px;"
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
                                    <p>您已经认证,<a href="javascript:;" style="color: #ff552e;" id="reAttc">重新认证</a></p>
                                </div>
                                <#break>
                        </#switch>

                        </div>
                    </div>

                    <#if status==0>
                    <div role="tabpanel" class="tab-pane" id="profile">
                        <div class="panel panel-default">
                            <div class="panel-heading"><h3>基础信息</h3></div>
                            <div class="panel-body">
                                <form id="companyForm">
                                    <div class="form-group row">
                                        <div class="col-xs-2">
                                            <label><span style="color:red">*</span>企业名称:</label>
                                        </div>
                                        <div class="col-xs-5">
                                            <input type="text" value="${company.cpName!""}" class="form-control" disabled>
                                        </div>
                                        <div class="col-xs-5">
                                            <span>修改企业名称,企业营业执照,企业法人,企业注册号,恳请您重新认证企业!</span>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-xs-2">
                                            <label>企业地址:</label>

                                        </div>
                                        <div class="col-xs-5">
                                            <input type="text" name="cpAddress" value="${company.cpAddress!""}" class="form-control">
                                        </div>
                                        <div class="col-xs-5"></div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-xs-2">
                                            <label>企业网址:</label>

                                        </div>
                                        <div class="col-xs-5">
                                            <input type="text" name="cpNet" value="${company.cpNet!""}" class="form-control">
                                        </div>
                                        <div class="col-xs-5"></div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-xs-2">
                                            <label>企业简介:</label>

                                        </div>
                                        <div class="col-xs-8">
                                            <textarea name="cpDescription"
                                                      style="width:600px;height:400px;">${company.cpDescription!""}</textarea>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-offset-4 col-sm-4">
                                            <button type="button" id="CompanyBtn" class="btn btn-danger">确认提交</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading"><h3>公司图片</h3></div>
                            <div class="panel-body">
                                <form enctype="multipart/form-data" >
                                    <label for="">您最多只能上传4张图片,且所有图片大小不能大于4M</label>
                                    <div class="form-group">
                                        <input id="picUpload" type="file" name="pic" multiple  class="file-loading">
                                    </div>

                                </form>
                            </div>
                        </div>

                    </div>
                    </#if>
                </div>

            </div>
        </div>
    </div>

</div>


<@push_footer>
<script type="text/javascript" src="${base}/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${base}/js/fileupload.js"></script>
<script type="text/javascript" src="${base}/js/zh-CN.js"></script>
<#if status==0>
<script type="text/javascript" src="${base}/js/fileinput.min.js"></script>
</#if>

<script type="text/javascript" src="${base}/js/zh.js"></script>
<script type="text/javascript" src="${base}/BeAlert/BeAlert.js"></script>
<script type="text/javascript">


    $(function () {
        $("#CompanyBtn").click(function () {
            $.ajax({
                url:'${base}/user/alterCompanyInfo',
                type:'post',
                data:$("#companyForm").serialize(),
                success:function (result) {
                    alert(result);
                }
            })
        });

        $("#reAttc").click(function () {
            confirm("您确认重新认证码?", "这将导致您的原有认证信息被删除,因此将产生的问题本网站概不负责!", function (isConfirm) {
                if (isConfirm) {
                    $.ajax({
                        url: "${base}/user/reAttc",
                        type: "get",
                        success: function (result) {
                            if (result == "ok") {
                                window.location.href = "/user/attc";
                            } else {
                                alert("发生了异常,请稍后再试!");
                            }

                        },
                        error: function () {
                            alert("发生了异常,请稍后再试!");
                        }
                    })
                }
            });
        });

        <#if status==0>
        $.ajax({
            url:'${base}/user/initCompanyPic',
            type:'get',
            success:function (result) {
                initUpload(result);
            }
        });
//http://blog.csdn.net/github_36086968/article/details/72830855;;;;http://plugins.krajee.com/file-input#ajax-uploads
        function initUpload(result) {
            $("#picUpload").fileinput({
                uploadUrl:'${base}/user/uploadCompanyPic',
                uploadAsync:false,
                showUpload: true,//是否显示上传按钮
                showRemove: false,//是否显示删除按钮
                showCaption: true,//是否显示输入框
                showPreview:true,
                showCancel:false,
                showClose:false,
                layoutTemplates:{
                    actionUpload:''
                },
                dropZoneEnabled: false,
                maxFileSize:1024*4,
                language:'zh',
                maxFileCount: 4,
                overwriteInitial: false,
                initialPreviewFileType: 'image',
                initialPreviewShowDelete:true,
                validateInitialCount:true,
                msgFilesTooMany: "选择上传的文件数量 超过允许的最大数值！",
                initialPreview: initPhoto(result),
                previewFileIcon: '<i class="fa fa-file"></i>',
                initialPreviewConfig: initConfig(result)
            }).on('filebatchuploadsuccess',function (event,data) {
                //同步上传上传成功后执行此事件
                if(data.response.flag==="true"){
                    alert("图片已上传!");
                }else{
                    alert("图片上传失败,服务器出错了!")
                }
            }).on('filepredelete',function (jqXHR) {
                var abort=true;
                if (confirm("你确定要删除该文件吗?删除后不可恢复")) {
                    abort = false;
                }
                return abort;
            })
        }

        function initPhoto(result) {
            if(result===""){
                return "";
            }
            var imgUrl = result.split("#");
            for(var i=0;i<imgUrl.length;i++){
                imgUrl[i]='<img src="${base}/'+imgUrl[i]+'" class="file-preview-image" style="width:200px;height:100px;"/>';
            }
            return imgUrl;
        }
        function initConfig(result){
            if(result===""){
                return "";
            }
            var config=new Array();
            var imgUrl = result.split("#");
            for(var i=0;i<imgUrl.length;i++){
                config[i]= {
                    caption: imgUrl[i].substring(imgUrl[i].lastIndexOf("/")+1),
                    width: '120px',
                    url: '${base}/user/picCompanyDelete',
                    key: i
                };
            }
            return config;
        }
    });
        </#if>

        <#if picError??>
        $(function () {
            alert("${picError}")
        });
        </#if>
</script>
</@push_footer>