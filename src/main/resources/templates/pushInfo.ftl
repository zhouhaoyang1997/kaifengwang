<!DOCTYPE HTML>
<html>
<head lang="zh">
    <title>免费发布信息</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="${request.contextPath}/css/bootstrap.min.css" >
    <link rel="stylesheet" href="${request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${request.contextPath}/css/menu.css">
    <link rel="stylesheet" href="${request.contextPath}/css/fileupload.css">
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
            <form action="/push/info" method="post" enctype="multipart/form-data">

                <input type="hidden" name="piMc" value="${mcId}">
                <input type="hidden" name="piSc" value="${scId}">
                <div class="form-group row">
                    <div class="col-xs-6">
                    <label><span style="color:red">*</span>信息标题:</label>
                    <input type="text" name="piTitle" class="form-control" placeholder="请把长度控制在100个中文字符内">
                    </div>
                    <div class="col-sx-6"></div>
                </div>
                <div class="form-group row">
                    <div class="col-xs-2">
                        <label><span style="color:red">*</span>所属地区:</label>
                    </div>
                    <div class="col-xs-4">
                    <select name="piDistrict" id="district">
                    <#list districts as ds>
                        <option value="${ds.districtId}">${ds.districtName}</li></option>
                    </#list>
                    </select>
                    </div>
                    <div class="col-xs-6"></div>
                </div>

                <#list tags as tag>
                <div class="form-group row">
                    <div class="col-xs-2">
                    <label><span style="color:red">*</span>${tag.tagName}:</label>
                    </div>
                    <div class="col-xs-4">
                    <select name="tag${tag.tagId}">
                        <#list tag.tagContents as tc>
                            <option value="${tc.tcId}">${tc.tcName}</li></option>
                        </#list>

                    </select>
                    </div>
                    <div class="col-xs-6"></div>

                </div>
                </#list>

            <#list pushInfoClasses as pic>
                <div class="form-group row">
                    <div class="col-xs-2">
                        <label><span style="color:red">*</span>${pic.picName}:</label>
                    </div>
                    <div class="col-xs-4">
                        <input type="text" name="pic${pic.picId}" class="form-control">
                    </div>
                    <div class="col-xs-6"></div>

                </div>
            </#list>

                <label><span style="color:red">*</span>内容:</label>
            <div class="form-group row">
                <div class="col-xs-6">
                <textarea name="piContent" class="form-control" cols="50" rows="15">

                </textarea>
                </div>
            </div>


                <div class="form-group row">
                    <div class="col-xs-8">
                        <div class="row">
                            <div class="col-xs-3">
                                <div class="h4">添加图片</div>
                                <div class="fileinput fileinput-new" data-provides="fileinput" id="exampleInputUpload">
                                    <div class="fileinput-new thumbnail" style="width: 200px;height: auto;max-height:150px;">
                                        <img id='picImg' style="width: 100%;height: auto;max-height: 140px;"
                                             src="${request.contextPath}/img/noimage.png" alt=""/>
                                    </div>
                                    <div class="fileinput-preview fileinput-exists thumbnail"
                                         style="max-width: 200px; max-height: 150px;"></div>
                                    <div>
                        <span class="btn btn-primary btn-file">
                            <span class="fileinput-new">选择文件</span>
                            <span class="fileinput-exists">换一张</span>
                            <input type="file" name="pic" id="picID" accept="image/gif,image/jpeg,image/x-png"/>
                        </span>
                                        <a href="javascript:;" class="btn btn-warning fileinput-exists"
                                           data-dismiss="fileinput">移除</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-3">
                                <div class="h4">添加图片</div>
                                <div class="fileinput fileinput-new" data-provides="fileinput" id="exampleInputUpload">
                                    <div class="fileinput-new thumbnail" style="width: 200px;height: auto;max-height:150px;">
                                        <img id='picImg' style="width: 100%;height: auto;max-height: 140px;"
                                             src="${request.contextPath}/img/noimage.png" alt=""/>
                                    </div>
                                    <div class="fileinput-preview fileinput-exists thumbnail"
                                         style="max-width: 200px; max-height: 150px;"></div>
                                    <div>
                        <span class="btn btn-primary btn-file">
                            <span class="fileinput-new">选择文件</span>
                            <span class="fileinput-exists">换一张</span>
                            <input type="file" name="pic" id="picID" accept="image/gif,image/jpeg,image/x-png"/>
                        </span>
                                        <a href="javascript:;" class="btn btn-warning fileinput-exists"
                                           data-dismiss="fileinput">移除</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-3">
                                <div class="h4">添加图片</div>
                                <div class="fileinput fileinput-new" data-provides="fileinput" id="exampleInputUpload">
                                    <div class="fileinput-new thumbnail" style="width: 200px;height: auto;max-height:150px;">
                                        <img id='picImg' style="width: 100%;height: auto;max-height: 140px;"
                                             src="${request.contextPath}/img/noimage.png" alt=""/>
                                    </div>
                                    <div class="fileinput-preview fileinput-exists thumbnail"
                                         style="max-width: 200px; max-height: 150px;"></div>
                                    <div>
                        <span class="btn btn-primary btn-file">
                            <span class="fileinput-new">选择文件</span>
                            <span class="fileinput-exists">换一张</span>
                            <input type="file" name="pic" id="picID" accept="image/gif,image/jpeg,image/x-png"/>
                        </span>
                                        <a href="javascript:;" class="btn btn-warning fileinput-exists"
                                           data-dismiss="fileinput">移除</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-3">
                                <div class="h4">添加图片</div>
                                <div class="fileinput fileinput-new" data-provides="fileinput" id="exampleInputUpload">
                                    <div class="fileinput-new thumbnail" style="width: 200px;height: auto;max-height:150px;">
                                        <img id='picImg' style="width: 100%;height: auto;max-height: 140px;"
                                             src="${request.contextPath}/img/noimage.png" alt=""/>
                                    </div>
                                    <div class="fileinput-preview fileinput-exists thumbnail"
                                         style="max-width: 200px; max-height: 150px;"></div>
                                    <div>
                        <span class="btn btn-primary btn-file">
                            <span class="fileinput-new">选择文件</span>
                            <span class="fileinput-exists">换一张</span>
                            <input type="file" name="pic" id="picID" accept="image/gif,image/jpeg,image/x-png"/>
                        </span>
                                        <a href="javascript:;" class="btn btn-warning fileinput-exists"
                                           data-dismiss="fileinput">移除</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>



                </div>

                <div class="form-group row">
                    <div class="col-xs-2">
                        <label><span style="color:red">*</span>联系人:</label>
                    </div>
                    <div class="col-xs-4">
                        <input type="text" name="piContactPerson" class="form-control">
                    </div>
                    <div class="col-xs-6"></div>

                </div>
                <div class="form-group row">
                    <div class="col-xs-2">
                        <label><span style="color:red">*</span>联系电话:</label>
                    </div>
                    <div class="col-xs-4">
                        <input type="text" name="piPhone" class="form-control">
                    </div>
                    <div class="col-xs-6"></div>

                </div>

                <div class="form-group row">
                    <div class="col-xs-2">
                        <label><span style="color:red">*</span>详细地址:</label>
                    </div>
                    <div class="col-xs-5">
                        <input type="text" name="piAddress" class="form-control">
                    </div>
                    <div class="col-xs-5"></div>

                </div>

                <div class="form-group row">
                    <div class="col-xs-2">
                        <label>QQ:</label>
                    </div>
                    <div class="col-xs-4">
                        <input type="text" name="piQq" class="form-control">
                    </div>
                    <div class="col-xs-6"></div>
                </div>
                <div class="form-group">

                    <button type="submit" class="btn btn-info">确认提交</button>
                </div>

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
<script type="text/javascript" src="${request.contextPath}/js/fileupload.js"></script>
</body>
</html>