<#include "defaultLayout/defaultLayout.ftl">
<@base siteName="开封麦芒网" base_js=["jq_min.211_1","common_1","bootstrap.min","fileinput","fileinput_locale_zh"] base_css=["global","style","all","bootstrap.min1","fileinput"] base_keywords="开封麦芒网" title="首页">
<div class="panel">
    <div class="panel-body">
        <form class="form-horizontal required-validate"  enctype="multipart/form-data" method="post" id="picform">

            <div class="form-group">
                <label for="" class="col-md-1 control-label">请选择图片</label>
                <div class="col-md-10 tl th">
                    <input type="file" name="pic" id="picUpload" class="projectfile" value="" multiple/>
                    <p class="help-block">支持jpg、jpeg、png、gif格式，大小不超过2.0M</p>
                </div>
            </div>
            <div class="form-group text-center ">
                <div class="col-md-10 col-md-offset-1">
                    <button type="button" class="btn btn-primary btn-lg" id="btn">保存</button>
                </div>
            </div>
        </form>
    </div>
</div>
</@base>
<#--自定义js-->
<script type="text/javascript">
    $(function () {
        // 文件上传框
        $("#picUpload").fileinput({
            uploadUrl: "push3",
            showUpload: false,//是否显示上传按钮
            showRemove: false,//是否显示删除按钮
            showCaption: true,//是否显示输入框
            showPreview:true,
            showCancel:false,
            showClose:false,
            uploadAsync:false,
            dropZoneEnabled: false,
            layoutTemplates:{
                actionUpload:'', //设置为空可去掉上传按钮
                //actionDelete:''; //设置为空可去掉删除按钮
            },
            maxFileCount: 4,
            maxFileSize:1024*3,
            language:'zh',
        })
    });
</script>
<script>
    $("#btn").click(function () {
        alert("aaa");
        if($('#picUpload').fileinput("getFilesCount")<=0){          //获取文件个数
            alert("请至少上传一张详情图片!");
            return;
        }
        $('#picUpload').fileinput('upload');
    })
</script>