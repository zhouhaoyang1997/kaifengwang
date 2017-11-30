<#assign base = "${request.contextPath}"/>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title> ${ex.msg} </title>
    <link rel="stylesheet" href="/css/404.css">
</head>
<body>
<div class="wavetext">
    <div class="wavetop">
        <div class="wavelx">
            <img src="/img/404/404.svg">
        </div>
        <div class="wavets">
        ${ex.msg}
        </div>
    </div>
    <div class="waveqcz">
    </div>
    <div class="wavegohome waveinput">
        <a href="/index">回到本站首页</a>
    </div>
    <#--<div class="waveqcz">-->
        <#--<a href="${base}/login">登录</a>-->
    <#--</div>-->
    <div class="waveqczfd">
    </div>
</div>
<div class="waveWrapper waveAnimation">
    <div class="waveWrapperInner bgTop">
        <div class="wave waveTop" style="background-image: url('/img/404/wave-top.png')">
        </div>
    </div>
    <div class="waveWrapperInner bgMiddle">
        <div class="wave waveMiddle" style="background-image: url('/img/404/wave-mid.png')">
        </div>
    </div>
    <div class="waveWrapperInner bgBottom">
        <div class="wave waveBottom" style="background-image: url('/img/404/wave-bot.png')">
        </div>
    </div>
</div>
</body>
</html>
