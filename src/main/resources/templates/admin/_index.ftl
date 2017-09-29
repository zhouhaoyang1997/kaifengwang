<#macro layout>
<html lang="en">

<head>
    <title>Dashboard | Klorofil - Free Bootstrap Dashboard Template</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="../css/admin/bootstrap.min.css">
    <link rel="stylesheet" href="../css/admin/font-awesome.min.css">
    <link rel="stylesheet" href="../css/admin/style.css">
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="../css/admin/main.css">
    <!-- ICONS -->
    <link rel="apple-touch-icon" sizes="76x76" href="../img/admin/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="../img/admin/favicon.png">
</head>

<body>
<!-- WRAPPER -->
<div id="wrapper">
    <!-- NAVBAR -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="brand">
            <a href="index.html"><img src="../img/admin/logo-dark.png" alt="Klorofil Logo" class="img-responsive logo"></a>
        </div>
        <div class="container-fluid">
            <div class="navbar-btn">
                <button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
            </div>
        </div>
    </nav>
    <!-- END NAVBAR -->
    <!-- LEFT SIDEBAR -->
    <div id="sidebar-nav" class="sidebar">
        <div class="sidebar-scroll">
            <nav>
                <ul class="nav">
                    <li><a href="index.html" class="active"><i class="lnr lnr-home"></i> <span>菜单列表</span></a></li>
                    <li><a href="elements.html" class=""><i class="lnr lnr-code"></i> <span>发布信息管理</span></a></li>
                    <li><a href="panels.html" class=""><i class="lnr lnr-cog"></i> <span>广告管理</span></a></li>
                    <li><a href="notifications.html" class=""><i class="lnr lnr-alarm"></i> <span>数据库备份</span></a></li>
                    <li>
                        <a href="#subPages" data-toggle="collapse" class="collapsed"><i class="lnr lnr-file-empty"></i>
                            <span>会员管理</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                        <div id="subPages" class="collapse ">
                            <ul class="nav">
                                <li><a href="page-profile.html" class="">修改会员信息</a></li>
                                <li><a href="page-login.html" class="">查看会员信息</a></li>
                                <li><a href="page-lockscreen.html" class="">增加会员</a></li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a href="#subPages" data-toggle="collapse" class="collapsed"><i class="lnr lnr-file-empty"></i>
                            <span>管理员</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                        <div id="subPages" class="collapse ">
                            <ul class="nav">
                                <li><a href="page-profile.html" class="">添加管理员</a></li>
                                <li><a href="page-login.html" class="">删除管理员</a></li>
                                <li><a href="page-lockscreen.html" class="">管理员列表</a></li>
                            </ul>
                        </div>
                    </li>
                    <li><a href="tables.html" class=""><i class="lnr lnr-dice"></i> <span>信息分类管理</span></a></li>
                    <li><a href="typography.html" class=""><i class="lnr lnr-text-format"></i> <span>竞价管理</span></a>
                    </li>
                    <!--<li><a href="icons.html" class=""><i class="lnr lnr-linearicons"></i> <span>Icons</span></a></li>-->
                </ul>
            </nav>
        </div>
    </div>
    <!-- END LEFT SIDEBAR -->
    <!-- MAIN -->
    <div class="main">
        <!-- MAIN CONTENT -->
        <div class="main-content">
            <div class="container-fluid">
                12
            </div>
        </div>
        <!-- END MAIN CONTENT -->
    </div>
    <!-- END MAIN -->
    <div class="clearfix"></div>
    <footer>
        <div class="container-fluid">
            <p class="copyright">&copy; 2017 <a href="#" target="_blank">Theme I Need</a>. All Rights Reserved. More
                Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a
                        href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
        </div>
    </footer>
</div>
<!-- END WRAPPER -->
<!-- Javascript -->
<script src="../js/admin/jquery.min.js"></script>
<script src="../js/admin/bootstrap.min.js"></script>
<#--<script src="../js/admin/jquery.slimscroll.min.js"></script>-->
<#--<script src="../js/admin/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>-->
<#--<script src="../js/admin/chartist/js/chartist.min.js"></script>-->
<script src="../js/admin/klorofil-common.js"></script>
</body>

</html>
</#macro>