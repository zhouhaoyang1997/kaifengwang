<!DOCTYPE HTML>
<html>
<head lang="zh">
    <title>免费发布信息</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="${request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${request.contextPath}/css/menu.css">
</head>
<body>
<div class="site-branding-area">
    <div class="container_self" style="width: 1200px;">
        <div class="row">
            <div class="col-sm-3">
                <div class="logo">
                    <h1><a href="/index">开封<span>城市网</span></a></h1>
                </div>
            </div>

            <div class="col-sm-offset-6 col-sm-3" style="padding-top:50px;">
                <p><a href="#">注册</a>&nbsp;|&nbsp;<a href="#">登录</a></p>
            </div>
        </div>
    </div>
</div> <!-- End site branding area -->
<div class="mainPage">
    <div class="container_self">
        <div class="row">
            <div class="col-xs-4">1 选择分类信息</div>
            <div class="col-xs-4">2 填写信息内容</div>
            <div class="col-xs-4">3 发布成功</div>
        </div>
        <div class="row" style="margin-top: 30px;">
            <form action="#" method="post">
                <div class="form-group">
                    <label>信息标题:</label>
                    <input type="text" class="form-control" placeholder="请把长度控制在100个中文字符内">
                </div>
                <div class="form-group">
                    <label>所属地区:</label>

                    <select name="district" id="district">
                    <#list districts as ds>
                        <option value="${ds.districtName}">${ds.districtName}</li></option>
                    </#list>

                    </select>
                </div>

            <#list tags as tag>
                <div class="form-group">
                    <label>${tag.tagName}:</label>

                    <select name="district" id="district">
                        <#list tag.tagContents as tc>
                            <option value="${tc.tcName}">${tc.tcName}</li></option>
                        </#list>

                    </select>


                </div>
            </#list>


                <div class="form-group">
                    <label for="exampleInputFile">File input</label>
                    <input type="file" id="exampleInputFile">
                    <p class="help-block">Example block-level help text here.</p>
                </div>
                <button type="submit" class="btn btn-default">提交</button>
            </form>
        </div>
    </div>
</div>
<div class="footerPage" style="margin-top: 30px;background: none repeat scroll 0 0 #f4f4f4;">
    <div class="container_self">
        <div class="row">
            <p style="text-align: center">Copyright © 河南开封 ｜xxxxx版权所有</p>
            <p style="text-align: center">河南大学网站工作室</p>
        </div>
    </div>
</div>
<script type="text/javascript" src="${request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/bootstrap.min.js"></script>
</body>
</html>