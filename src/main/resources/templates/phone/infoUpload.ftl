<!DOCTYPE html>
<html lang="zh-CN" class="index_page">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport"
          content="initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,minimal-ui"/>
    <meta name="format-detection" content="telephone=no"/>
    <meta name="format-detection" content="email=no"/>
    <meta name="format-detection" content="address=no;">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="default"/>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <meta name="keywords" content="开封城市网"/>
    <meta name="description" content="开封城市网手机版"/>
    <title>开封城市网-手机版</title>
    <link type="text/css" rel="stylesheet" href="../css/phone/global.css">
    <link type="text/css" rel="stylesheet" href="../css/phone/style.css">
    <link type="text/css" rel="stylesheet" href="../css/phone/all.css">
    <link type="text/css" rel="stylesheet" href="../css/phone/bootstrap.min1.css">
    <link type="text/css" rel="stylesheet" href="../css/phone/fileinput.css">
</head>

<body class="orange">
<div class="wrapper">
    <script src="../js/phone/jq_min.211_1.js"></script>
    <script src="../js/phone/common_1.js"></script>
    <script src="../js/phone/bootstrap.min.js"></script>
    <script src="../js/phone/fileinput.js"></script>
    <script src="../js/phone/fileinput_locale_zh.js"></script>
    <div class="header">
        <div id="ipageTitle">信息分类</div>
        <div class="search left8" id="search" onclick="searchOnClik()"></div>
    </div>
    <div id="contactbar">
        <a href="#" class="bottom_index_on">首页</a>
        <a href="#" class="bottom_member">我的</a>
        <a href="#" class="bottom_history">历史</a>
        <a href="#" class="bottom_post">发布</a>
    </div>

</div>
<div class="panel">
    <div class="panel-body">
        <form class="form-horizontal" role="form"  method="post" action="/#">
            <div class="form-group">
                <label for="firstname" class="col-xs-3 control-label"><span style="color:red">*</span>信息标题</label>
                <div class="col-xs-9">
                    <input type="text" class="form-control" id="userId">
                </div>
            </div>

            <div class="form-group">
                <label for="firstname" class="col-xs-3 control-label"><span style="color:red">*</span>所属地区</label>
                <div class="col-xs-9">
                    <select class="form-control">
                    <#list districts as ds>
                        <option value="${ds.districtId}">${ds.districtName}</li></option>
                    </#list>
                    </select>
                </div>
            </div>

        <#list tags as tag>
            <div class="form-group ">
                <div class="col-xs-3">
                    <label><span style="color:red">*</span>${tag.tagName}:</label>
                </div>
                <div class="col-xs-9">
                    <select class="form-control" name="tag${tag.tagId}">
                        <#list tag.tagContents as tc>
                            <option value="${tc.tcId}">${tc.tcName}</li></option>
                        </#list>

                    </select>
                </div>
                <div class="col-xs-5"></div>

            </div>
        </#list>

        <#list pushInfoClasses as pic>
            <div class="form-group ">
                <div class="col-xs-3">
                    <label><span style="color:red">*</span>${pic.picName}:</label>
                </div>
                <div class="col-xs-9">
                    <input type="text" name="pic${pic.picId}" class="form-control">
                </div>
                <div class="col-xs-5"></div>
            </div>
        </#list>
            <div class="form-group ">
                <div class="col-xs-3">
                    <label><span style="color:red">*</span>联系人:</label>
                </div>
                <div class="col-xs-9">
                    <input type="text" name="piContactPerson" minlength="2" maxlength="5" class="form-control">
                </div>
                <div class="col-xs-12">
                <#if pushError??>
                    <@spring.bind "pushError.piContactPerson" />
                    <@spring.showErrors "<br>"/>
                    </#if>
                </div>
            </div>
            <div class="form-group ">
                <div class="col-xs-3">
                    <label><span style="color:red">*</span>联系电话:</label>
                </div>
                <div class="col-xs-9">
                    <input type="text" name="piPhone" maxlength="11" minlength="11" class="form-control">
                </div>
                <div class="col-xs-12">
                <#if pushError??>
                    <@spring.bind "pushError.piPhone" />
                    <@spring.showErrors "<br>"/>
                    </#if>
                </div>
            </div>
            <#--<div class="form-group">-->
                <#--<label for="" class="col-xs-12 control-label">要上传的图片</label>-->
                <#--<div class="col-xs-12 tl th">-->
                    <#--<form enctype="multipart/form-data" >-->
                    <#--<input type="file" name="image[]" id="picUpload" multiple/>-->
                    <#--<p class="help-block">支持jpg、jpeg、png、gif格式，大小不超过2.0M</p>-->
                    <#--</form>-->
                <#--</div>-->
            <#--</div>-->

        <#--此处后期检查字数-->
            <div class="form-group">
                <div class="col-xs-3">
                    <label for="name">详细信息</label>
                </div>
                <div class="col-xs-12">
                    <textarea class="form-control" style="width: 330px;height: 160px;"></textarea>
                </div>
            </div>
            <div class="form-group text-center">
                <button type="submit" class="btn btn-info">下一步</button>
            </div>

        </form>
    </div>
</div>
<div class="clear"></div>
<p class="footer_02">&copy;copyright开封城市网版权所有. </p>
<p class="footer_02">
    <script>
        var _hmt = _hmt || [];
        (function () {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?ae4a3d4eac699abe92f1094e6af10cfb";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();</script>
</p>
<div class="windowIframe" id="windowIframe" style="display:none;">
    <div class="header"><a href="javascript:;" class="back left8 close">返回</a><span id="windowIframeTitle"></span></div>
    <div class="body" id="windowIframeBody"></div>
</div>
<div class="footer">
    <!--360自动提交收录代码-->
    <script>
        (function () {
            var src = (document.location.protocol == "http:") ? "http://js.passport.qihucdn.com/11.0.1.js?78760c6b4ad8a664271f522d3f7d9027" : "https://jspassport.ssl.qhimg.com/11.0.1.js?78760c6b4ad8a664271f522d3f7d9027";
            document.write('<script src="' + src + '" id="sozz"><\/script>');
        })();
    </script>
    <!--百度自动提交收录代码-->
    <script>(function () {
        var bp = document.createElement('script');
        var curProtocol = window.location.protocol.split(':')[0];
        if (curProtocol === 'https') {
            bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
        }
        else {
            bp.src = 'http://push.zhanzhang.baidu.com/push.js';
        }
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(bp, s);
    })();
    </script>
    <#--<script type="text/javascript">-->
        <#--$(function () {-->
<#--//            alert("a");-->
        <#--// 文件上传框-->
            <#--$("#picUpload").fileinput({-->
                <#--uploadUrl: "#",-->
                <#--showUpload: false,//是否显示上传按钮-->
                <#--showRemove: false,//是否显示删除按钮-->
                <#--showCaption: true,//是否显示输入框-->
                <#--showPreview:true,-->
                <#--showCancel:false,-->
                <#--showClose:false,-->
                <#--dropZoneEnabled: false,-->
                <#--layoutTemplates:{-->
                    <#--actionUpload:'', //设置为空可去掉上传按钮-->
                    <#--//actionDelete:''; //设置为空可去掉删除按钮-->
                <#--},-->
                <#--maxFileCount: 4,-->
                <#--maxFileSize:1024*3,-->
                <#--language:'zh',-->
            <#--})-->
        <#--});-->
    <#--</script>-->
</body>

</html>