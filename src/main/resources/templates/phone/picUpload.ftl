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
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="http://malsup.github.io/jquery.form.js"></script>
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
    <script type="text/javascript">
        $(function () {
        // 文件上传框
            $("#picUpload").fileinput({
                uploadUrl: "picUpload",
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
</body>

</html>