<#import "defaultLayout/defaultLayout.ftl" as defaultLayout>
<@defaultLayout.layout>
<link type="text/css" rel="stylesheet" href="../css/admin/fileinput.css"/>
<script type="text/javascript" src="../js/admin/fileinput.js"></script>
<script type="text/javascript" src="../js/admin/fileinput_locale_zh.js"></script>

<div class="panel panel-headline">
    <div class="panel-heading">
        <h3 class="panel-title text-danger text-center">广告图片上传</h3>
    </div>
</div>
<form class="form-horizontal required-validate" action="" enctype="multipart/form-data" method="post"
      onsubmit="return iframeCallback(this, pageAjaxDone)">
    <div class="form-group">
        <label for="inputClass" class="col-sm-2 control-label">请选择要上传的图片位置</label>
        <div class="col-sm-9">
            <select class="form-control">
                <option>房产</option>
                <option>二手货</option>
                <option>招聘</option>
                <option>生活</option>
                <option>宠物</option>
                <option>名企</option>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label for="" class="col-md-2 control-label">要上传的图片</label>
        <div class="col-md-9 tl th">
            <input type="file" name="image" class="projectfile" value=""/>
            <p class="help-block">支持jpg、jpeg、png、gif格式，大小不超过2.0M</p>
        </div>
    </div>
    <div class="form-group text-center ">
        <div class="col-md-10 col-md-offset-1">
            <button type="submit" class="btn btn-primary btn-lg">保存</button>
        </div>
    </div>
</form>
    <script type="text/javascript">
        var projectfileoptions = {
            showUpload: false,
            showRemove: false,
            language: 'zh',
            allowedPreviewTypes: ['image'],
            allowedFileExtensions: ['jpg', 'png', 'gif'],
            maxFileSize: 20000,
        };
        // 文件上传框
        $('input[class=projectfile]').each(function () {
            var imageurl = $(this).attr("value");
            if (imageurl) {
                var op = $.extend({
                    initialPreview: [ // 预览图片的设置
                        "<img src='" + imageurl + "' class='file-preview-image'>",]
                }, projectfileoptions);

                $(this).fileinput(op);
            } else {
                $(this).fileinput(projectfileoptions);
            }
        });
    </script>
</@defaultLayout.layout>