<!DOCTYPE HTML>
<html>
<head lang="zh">
    <title>首页</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="css/bootstrap.min.css" >
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/menu.css">
</head>
<body>
<#--头部开始 -->
<div class="header-area">

    <div class="container_self" style="width: 1200px;">
        <div class="row">
            <div class="col-xs-8">
                <div class="user-menu">
                    <ul>
                        <li><p>欢迎来到开封城市网!</p></li>
                        <li><a href="#"><i class="fa fa-heart"></i> 快速发布信息</a></li>
                        <li><a href="#"><i class="fa fa-user"></i> 修改/删除信息</a></li>
                        <li><a href="#"><i class="fa fa-phone"></i> 手机浏览</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-xs-4">
                <div class="header-right">
                    <ul class="list-unstyled list-inline">
                        <li><a href="#">注册</a></li>
                        <li><a href="#">登录</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End header area -->

<div class="site-branding-area">
    <div class="container_self" style="width: 1200px;">
        <div class="row">
            <div class="col-sm-3">
                <div class="logo">
                    <h1><a href="/index">开封<span>城市网</span></a></h1>
                </div>
            </div>

            <div class="col-sm-5">
                <div class="search-box">
                    <form action="" method="post">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="输入你感兴趣信息">
                            <span class="input-group-btn" >
                                <button class="btn btn-danger"  type="button">搜索</button>
                            </span>
                        </div>
                    </form>
                    <div class="quickClick">
                        <ul>
                            <li><a href="#">丽人坊</a></li>
                            <li><a href="#">找宠物</a></li>
                            <li><a href="#" style="color: red;">农家乐</a></li>
                            <li><a href="#">名车4s店</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="pushing-item">
                    <a href="#"><i class="fa fa-edit"></i>免费发布信息</a>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End site branding area -->
<#-- 菜单栏-->
<div class="mainmenu-area">
    <div class="container_self" style="width: 1200px;">
        <div class="row">
            <ul class="megamenu skyblue">
                <li class="active grid"><a class="color1" href="#">首页</a>
                <li class="grid" style="margin-left: 3px;"><a class="color1" href="#">招聘<span class="caret"></span></a>
                    <div class="megapanel">
                        <ul class="menu_ul">
                            <#list zhaopin as zp>
                                <li><a href="#">${zp.scName}</a></li>
                            </#list>
                        </ul>
                        <div class="img_box">
                            <img src="img/zp_logo.png" alt="">
                        </div>
                    </div>
                </li>
                <li class="grid"><a class="color1" href="#">二手市场<span class="caret"></span></a>
                    <div class="megapanel">
                        <ul class="menu_ul">
                        <#list ershou as es>
                            <li><a href="#">${es.scName}</a></li>
                            </#list>
                        </ul>
                    </div>
                </li>
                <li><a class="color1" href="#">房产信息<span class="caret"></span></a>
                    <div class="megapanel">
                        <ul class="menu_ul">
                        <#list fangchan as fc>
                            <li><a href="#">${fc.scName}</a></li>
                            </#list>
                        </ul>
                    </div>
                </li>
                <li><a class="color1" href="#">生活服务<span class="caret"></span></a>
                    <div class="megapanel">
                        <ul class="menu_ul">
                        <#list shenghuo as sh>
                            <li><a href="#">${sh.scName}</a></li>
                            </#list>
                        </ul>
                    </div>
                </li>
                <li><a class="color1" href="#">名企招聘</a></li>
                <li><a class="color1" href="#">个人简历</a></li>
            </ul>
        </div>
    </div>
</div> <!-- End mainmenu area -->
<#-- 广告-->
<div class="advert">
    <div class="container">
        <div class="row">
            <img src="img/advert.jpg" alt="开学那点事">
        </div>
    </div>
</div>
<#-- 主功能模块-->
<div class="mainPage">

    <div class="container_self" style="width:1200px;">
        <div class="row">
            <div class="col-xs-8">
                <div class="panel panel_self">
                    <div class="panel-body">
                        <div class="row iconDiv">
                            <div class="col-xs-2">
                                <div style="width:55px;margin: 0 auto;">
                                    <img src="img/zp_icon.png" width="55px" height="55px" alt="">
                                </div>

                                <p><a href="#" target="_blank">招聘</a></p>
                                <p style="font-size: 12px;"><a href="#">全职</a> / <a href="#">兼职</a> / <a href="#">简历</a></p>
                            </div>
                            <div class="col-xs-2">
                                <div style="width:55px;margin: 0 auto;">
                                    <img src="img/jjz.png" width="55px" height="55px" alt="">
                                </div>
                                <p><a href="#" target="_blank">二手市场</a></p>
                                <p style="font-size: 12px;"><a href="#">全职</a> / <a href="#">兼职</a> / <a href="#">简历</a></p>
                            </div>
                            <div class="col-xs-2">
                                <div style="width:55px;margin: 0 auto;">
                                    <img src="img/jz.png" width="55px" height="55px" alt="">
                                </div>
                                <p><a href="#" target="_blank">房产</a></p>
                                <p style="font-size: 12px;"><a href="#">全职</a> / <a href="#">兼职</a> / <a href="#">简历</a></p>
                            </div>
                            <div class="col-xs-2">
                                <div style="width:55px;margin: 0 auto;">
                                    <img src="img/zp_icon.png" width="55px" height="55px" alt="">
                                </div>
                                <p><a href="#" target="_blank">二手车</a></p>
                                <p style="font-size: 12px;"><a href="#">全职</a> / <a href="#">兼职</a> / <a href="#">简历</a></p>
                            </div>
                            <div class="col-xs-2">
                                <div style="width:55px;margin: 0 auto;">
                                    <img src="img/cw_icon.png" width="55px" height="55px" alt="">
                                </div>

                                <p><a href="#" target="_blank">宠物</a></p>
                                <p style="font-size: 12px;"><a href="#">全职</a> / <a href="#">兼职</a> / <a href="#">简历</a></p>
                            </div>
                            <div class="col-xs-2">
                                <div style="width:55px;margin: 0 auto;">
                                    <img src="img/jz.png" width="55px" height="55px" alt="">
                                </div>
                                <p><a href="#" target="_blank">装饰建材</a></p>
                                <p style="font-size: 12px;"><a href="#">全职</a> / <a href="#">兼职</a> / <a href="#">简历</a></p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="col-xs-4">
                <div class="panel panel_self">
                    <div class="panel-heading"><h4>到家生活服务</h4></div>
                    <div class="panel-body">
                        <span class="label label-info">月嫂</span>
                        <span class="label label-success">保洁</span>
                        <span class="label label-warning">育儿嫂</span>
                        <span class="label label-default">保姆</span>
                        <span class="label label-primary">美甲</span>
                    </div>
                </div>
            </div>
        </div>


        <div class="row">
            <div class="col-xs-2">
                <div class="panel panel_self">
                    <div class="panel-heading"><h4>房产信息</h4></div>
                    <div class="panel-body">
                        <ul class="list_clear">

                        <#list fangchan as fc>
                            <li><a href="#">${fc.scName}</a></li>
                        </#list>
                        </ul>
                    </div>
                </div>
                <div class="panel panel_self">
                    <div class="panel-heading"><h4>宠物</h4></div>
                    <div class="panel-body">
                        <ul class="list_clear">

                        <#list chongwu as cw>
                            <li><a href="#">${cw.scName}</a></li>
                        </#list>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-xs-2">
                <div class="panel panel_self">
                    <div class="panel-heading"><h4>二手市场</h4></div>
                    <div class="panel-body">
                        <ul class="list_clear">

                        <#list ershou as es>
                            <li><a href="#">${es.scName}</a></li>
                        </#list>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-xs-4">
                <div class="panel panel_self">
                    <div class="panel-heading"><h4>招聘</h4></div>
                    <div class="panel-body" >

                        <ul class="list_clear">
                        <#list zhaopin as zp>
                            <li><a href="#">${zp.scName}</a></li>
                        </#list>
                        </ul>
                    </div>
                </div>

                <div class="panel panel_self">
                    <div class="panel-heading"><h4>名企招聘</h4></div>
                    <div class="panel-body" >

                        <ul class="list_clear">
                        <#list mingqi as mq>
                            <li><a href="#">${mq.scName}</a></li>
                        </#list>

                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-xs-4">
                <div class="panel panel_self">
                    <div class="panel-heading"><h4>生活服务</h4></div>
                    <div class="panel-body">
                        <ul class="list_clear" style="width: 160px;float: left">

                        <#list shenghuo as sh>
                            <li><a href="#">${sh.scName}</a></li>
                        </#list>
                        </ul>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<#-- 广告-->
<div class="advert">
    <div class="container">
        <div class="row">
            <img src="img/advert.jpg" alt="开学那点事">
        </div>
    </div>
</div>
<#-- 页脚-->
<div class="footerPage" style="margin-top: 30px;background: none repeat scroll 0 0 #f4f4f4;">
    <div class="container_self">
        <div class="row">
            <div class="col-xs-3">
                <div class="logo">
                    <h1><a href="/index">开封<span>城市网</span></a></h1>
                </div>
            </div>
            <div class="col-xs-2">
                <div style="list-style: none">
                    <h4>关于我们</h4>
                    <li><p>本站公告</p></li>
                    <li><p>加盟与合作</p></li>
                    <li><p>网站地图</p></li>

                </div>
            </div>

            <div class="col-xs-2">
                <div style="list-style: none">
                    <h4>服务支持</h4>
                    <li><p>推广服务</p></li>
                    <li><p>渠道招商</p></li>
                    <li><p>举报平台</p></li>

                </div>
            </div>
            <div class="col-xs-2">
                <div style="list-style: none">
                    <h4>帮助中心</h4>
                    <li><p>常见问题</p></li>
                    <li><p>更多帮助</p></li>
                    <li><p>意见反馈</p></li>
                    <li><p>隐私权条款</p></li>
                </div>
            </div>
            <div class="col-xs-3">
                <div style="list-style: none">
                    <img src="img/二维码.png" alt="扫码访问手机版">
                </div>
            </div>
        </div>
        <div class="row">
            <p style="text-align: center">Copyright © 河南开封 ｜xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx所有</p>
            <p style="text-align: center">河南大学网站工作室</p>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/menu.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>