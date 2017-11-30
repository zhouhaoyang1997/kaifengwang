<#include "defaultLayout/defaultLayout.ftl">
<@header siteName="开封麦芒网"  base_css=["global","style","bootstrap.min"] base_keywords="开封麦芒网" >
<link rel="stylesheet" href="${baseUrl}/css/userInfo.css">
<link rel="stylesheet" href="${baseUrl}/css/fileupload.css">
<link rel="stylesheet" href="${baseUrl}/css/default.css">
<link rel="stylesheet" href="${baseUrl}/css/fileinput.min.css">
<link rel="stylesheet" href="${baseUrl}/BeAlert/BeAlert.css"></@header>
<@body title="公司认证" back=true>


</@body>
<#--js-->
<@footer base_js=["jquery.min","bootstrap.min"]></@footer>
<script type="text/javascript" src="${baseUrl}/js/fileupload.js"></script>
<script type="text/javascript" src="${baseUrl}/js/zh-CN.js"></script>
<#if status==0>
<script type="text/javascript" src="${baseUrl}/js/fileinput.min.js"></script>
</#if>
<script type="text/javascript" src="${baseUrl}/js/zh.js"></script>
<script type="text/javascript" src="${baseUrl}/BeAlert/BeAlert.js"></script>
<script type="text/javascript">

    $(function () {
        $("#CompanyBtn").click(function () {
            $.ajax({
                url: '${baseUrl}/user/alterCompanyInfo',
                type: 'post',
                data: $("#companyForm").serialize(),
                success: function (result) {
                    alert(result);
                }
            })
        });

        $("#reAttc").click(function () {
            confirm("您确认重新认证吗?", "这将导致您的原有认证信息被删除,因此将产生的问题本网站概不负责!", function (isConfirm) {
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
            });
        });

    <#if status==0>
        $.ajax({
            url: '${baseUrl}/user/initCompanyPic',
            type: 'get',
            success: function (result) {
                initUpload(result);
            }
        });

//http://blog.csdn.net/github_36086968/article/details/72830855;;;;http://plugins.krajee.com/file-input#ajax-uploads
        function initUpload(result) {
            $("#picID").fileinput({
                uploadUrl: '${baseUrl}/user/uploadCompanyPic',
                uploadAsync: false,
                showUpload: true,//是否显示上传按钮
                showRemove: false,//是否显示删除按钮
                showCaption: true,//是否显示输入框
                showPreview: true,
                showCancel: false,
                showClose: false,
                layoutTemplates: {
                    actionUpload: ''
                },
                dropZoneEnabled: false,
                maxFileSize: 1024 * 4,
                language: 'zh',
                maxFileCount: 4,
                overwriteInitial: false,
                initialPreviewFileType: 'image',
                initialPreviewShowDelete: true,
                validateInitialCount: true,
                msgFilesTooMany: "选择上传的文件数量 超过允许的最大数值！",
                initialPreview: initPhoto(result),
                previewFileIcon: '<i class="fa fa-file"></i>',
                initialPreviewConfig: initConfig(result)
            }).on('filebatchuploadsuccess', function (event, data) {
                //同步上传上传成功后执行此事件
                if (data.response.flag === "true") {
                    alert("图片已上传!");
                } else {
                    alert("图片上传失败,服务器出错了!")
                }
            }).on('filepredelete', function (jqXHR) {
                var abort = true;
                if (confirm("你确定要删除该文件吗?删除后不可恢复")) {
                    abort = false;
                }
                return abort;
            })
        }

        function initPhoto(result) {
            if (result === "") {
                return "";
            }
            var imgUrl = result.split("#");
            for (var i = 0; i < imgUrl.length; i++) {
                imgUrl[i] = '<img src="${baseUrl}/' + imgUrl[i] + '" class="file-preview-image" style="width:200px;height:100px;"/>';
            }
            return imgUrl;
        }

        function initConfig(result) {
            if (result === "") {
                return "";
            }
            var config = new Array();
            var imgUrl = result.split("#");
            for (var i = 0; i < imgUrl.length; i++) {
                config[i] = {
                    caption: imgUrl[i].substring(imgUrl[i].lastIndexOf("/") + 1),
                    width: '120px',
                    url: '${baseUrl}/user/picCompanyDelete',
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
    $(function () {
        alert("${status}")
    });
</script>
