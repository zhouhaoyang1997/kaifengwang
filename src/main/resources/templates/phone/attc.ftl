<#include "defaultLayout/defaultLayout.ftl">
<@header siteName="开封麦芒网"  base_css=["global","style","bootstrap.min"] base_keywords="开封麦芒网" >
<link rel="stylesheet" href="${baseUrl}/css/userInfo.css">
<link rel="stylesheet" href="${baseUrl}/css/fileupload.css">
<link rel="stylesheet" href="${baseUrl}/css/default.css">
<link rel="stylesheet" href="${baseUrl}/css/fileinput.min.css">
<link rel="stylesheet" href="${baseUrl}/BeAlert/BeAlert.css"></@header>
<@body title="公司认证" back=true>
<div class="panel panel-default">
    <#switch status>
        <#case 1>
        <div class="panel-heading"><h3>开始认证</h3></div>
        <div class="panel-body">
            <form action="${baseUrl}/user/attc" enctype="multipart/form-data" method="post">
                <div class="form-group row">
                    <div class="col-xs-3">
                        <label><span style="color:red">*</span>上传凭证:</label>
                    </div>
                    <div><span style="color: red">恳请您上传有效、清晰的营业执照图片（最多上传1张，每张最大10M）</span></div>
                    <div class="col-xs-12 text-center">
                        <div class="fileinput fileinput-new" data-provides="fileinput"
                             id="exampleInputUpload">
                            <div class="fileinput-new thumbnail"
                                 style="width: 200px;height: auto;max-height:150px;">
                                <img id='picImg'
                                     style="width: 100%;height: auto;max-height: 140px;"
                                     src="${baseUrl}/img/noimage.png" alt=""/>
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
                    </div>
                    <div class="col-xs-12"></div>
                </div>

                <div class="form-group row">
                    <div class="col-xs-3">
                        <label><span style="color:red">*</span>企业名称:</label>
                    </div>
                    <div class="col-xs-8">
                        <input type="text" class="form-control" name="cpName"
                               placeholder="请输入企业名称">
                    </div>
                    <div class="col-xs-12"></div>
                </div>
                <div class="form-group row">
                    <div class="col-xs-3">
                        <label><span style="color:red">*</span>注册号:</label>
                    </div>
                    <div class="col-xs-8">
                        <input type="text" class="form-control" name="cpNum"
                               placeholder="请输入注册号">
                    </div>
                    <div class="col-xs-12"></div>
                </div>
                <div class="form-group row">
                    <div class="col-xs-3">
                        <label><span style="color:red">*</span>法人代表:</label>
                    </div>
                    <div class="col-xs-8">
                        <input type="text" class="form-control" name="cpContactPerson"
                               placeholder="请输入法人代表">
                    </div>
                    <div class="col-xs-12"></div>
                </div>
                <div class="form-group row">
                    <div class="col-xs-3">
                        <label><span style="color:red">*</span>联系方式:</label>
                    </div>
                    <div class="col-xs-8">
                        <input type="text" class="form-control" name="cpContact"
                               placeholder="请输入联系方式">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-xs-12"><p style="color: red">请务必输入可以接收到电话的联系方式,是否验证成功我们将通过短信告知!</p> </div>
                </div>


                <div class="row text-center">
                    <input type="submit" class="col-md-offset-6 col-md-3 btn btn-success" value="确认无误,提交">
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

</@body>
<#--js-->
<@footer></@footer>
<script type="text/javascript" src="${baseUrl}/js/jquery.min.js"></script>
<script type="text/javascript" src="${baseUrl}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${baseUrl}/js/fileupload.js"></script>
<#if status==0>
<script type="text/javascript" src="${baseUrl}/js/fileinput.min.js"></script>
<script type="text/javascript" src="${baseUrl}/js/zh.js"></script>
</#if>


<script type="text/javascript" src="${baseUrl}/BeAlert/BeAlert.js"></script>
<script type="text/javascript">


    $(function () {
        $("#CompanyBtn").click(function () {
            $.ajax({
                url:'${baseUrl}/user/alterCompanyInfo',
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
                        url: "${baseUrl}/user/reAttc",
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
            })
        });

    <#if status==0>
        $.ajax({
            url:'${baseUrl}/user/initCompanyPic',
            type:'get',
            success:function (result) {
                initUpload(result);
            }
        });
//http://blog.csdn.net/github_36086968/article/details/72830855;;;;http://plugins.krajee.com/file-input#ajax-uploads
        function initUpload(result) {
            $("#picUpload").fileinput({
                uploadUrl:'${baseUrl}/user/uploadCompanyPic',
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
                imgUrl[i]='<img src="${baseUrl}/'+imgUrl[i]+'" class="file-preview-image" style="width:200px;height:100px;"/>';
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
                    url: '${baseUrl}/user/picCompanyDelete',
                    key: i
                };
            }
            return config;
        }

    </#if>
    });
    <#if picError??>
    $(function () {
        alert("${picError}")
    });
    </#if>
</script>
