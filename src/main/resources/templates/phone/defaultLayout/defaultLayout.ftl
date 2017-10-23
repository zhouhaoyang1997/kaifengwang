<#macro layout>
<html>
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
<#--js-->
    <script type="text/javascript" src="../js/admin/jquery.min.js"></script>
    <script src="../js/admin/bootstrap.min.js"></script>
    <script src="../js/admin/klorofil-common.js"></script>
    <script src="../js/admin/index.js"></script>

</head>
<body>
    <#include "header.ftl">
    <#include "sidebar.ftl">
<div class="main">
    <!-- MAIN CONTENT -->
    <div class="main-content">
        <div class="container-fluid">
            <#nested >
        </div>
    </div>
    <!-- END MAIN CONTENT -->
</div>
    <#include "footer.ftl">
</body>
</html>

</#macro>