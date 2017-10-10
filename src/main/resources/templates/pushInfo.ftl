<#include "public/default.ftl">
<#import "spring.ftl" as spring />
<#assign base="${request.contextPath}"/>
<#include "public/pushdefault.ftl">
<@header title="填写发布信息">
<link rel="stylesheet" href="${base}/css/style.css">
<link rel="stylesheet" href="${base}/css/menu.css">
<link rel="stylesheet" href="${base}/css/fileupload.css">
<link rel="stylesheet" href="${base}/css/default.css">
</@header>
<@push_header>
</@push_header>
<div class="mainPage">
    <div class="container_self2">
        <div class="row step2">
            <div class="col-xs-4"><span>1 ${choose.scName}</span><a href="${base}/push/choose" style="color:blue">重新选择</a></div>
            <div class="col-xs-4"><span class="span_1">2 填写信息内容</span></div>
            <div class="col-xs-4"><span>3 发布成功</span></div>
        </div>
        <div class="row" style="margin-top: 30px;">
            <form action="/push/info" method="post" enctype="multipart/form-data">
                <#if Session.user??>
                    <input type="hidden" name="userId" value="${user.userId!""}">
                </#if>
                <input type="hidden" name="piMc" value="${choose.mcId}">
                <input type="hidden" name="piSc" value="${choose.scId}">
                <div class="form-group row">
                    <div class="col-xs-8">
                    <label><span style="color:red">*</span>信息标题:</label>
                    <input type="text" name="piTitle" class="form-control" placeholder="请输入信息标题2-100字符">
                    </div>
                    <div class="col-sx-4">
                    <#if pushError??>
                    <@spring.bind "pushError.piTitle" />
                    <@spring.showErrors "<br>"/>
                    </#if>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-xs-2">
                        <label><span style="color:red">*</span>所属地区:</label>
                    </div>
                    <div class="col-xs-5">
                    <select name="piDistrict" id="district">
                    <#list districts as ds>
                        <option value="${ds.districtId}">${ds.districtName}</li></option>
                    </#list>
                    </select>
                    </div>
                    <div class="col-xs-5"></div>
                </div>

                <#list tags as tag>
                <div class="form-group row">
                    <div class="col-xs-2">
                    <label><span style="color:red">*</span>${tag.tagName}:</label>
                    </div>
                    <div class="col-xs-5">
                    <select name="tag${tag.tagId}">
                        <#list tag.tagContents as tc>
                            <option value="${tc.tcId}">${tc.tcName}</li></option>
                        </#list>

                    </select>
                    </div>
                    <div class="col-xs-5"></div>

                </div>
                </#list>

            <#list pushInfoClasses as pic>
                <div class="form-group row">
                    <div class="col-xs-2">
                        <label><span style="color:red">*</span>${pic.picName}:</label>
                    </div>
                    <div class="col-xs-5">
                        <input type="text" name="pic${pic.picId}" class="form-control">
                    </div>
                    <div class="col-xs-5"></div>

                </div>
            </#list>

                <label><span style="color:red">*</span>内容:</label>
            <div class="form-group row">
                <div class="col-xs-8">
                    <textarea name="piContent" style="width:800px;height:400px;visibility:hidden;"></textarea>
                </div>
                <div class="col-xs-4">
                <#if pushError??>
                    <@spring.bind "pushError.piContent" />
                    <@spring.showErrors "<br>"/>
                    </#if>
                </div>
            </div>


                <div class="form-group row">
                    <div class="col-xs-12">
                        <div class="row">
                            <div class="col-xs-3">
                                <div class="h4">添加图片</div>
                                <div class="fileinput fileinput-new" data-provides="fileinput" id="exampleInputUpload">
                                    <div class="fileinput-new thumbnail" style="width: 200px;height: auto;max-height:150px;">
                                        <img id='picImg' style="width: 100%;height: auto;max-height: 140px;"
                                             src="${base}/img/noimage.png" alt=""/>
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
                                             src="${base}/img/noimage.png" alt=""/>
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
                                             src="${base}/img/noimage.png" alt=""/>
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
                                             src="${base}/img/noimage.png" alt=""/>
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
                    <div class="col-xs-5">
                        <input type="text" name="piContactPerson" class="form-control">
                    </div>
                    <div class="col-xs-5">
                    <#if pushError??>
                    <@spring.bind "pushError.piContactPerson" />
                    <@spring.showErrors "<br>"/>
                    </#if>
                    </div>

                </div>
                <div class="form-group row">
                    <div class="col-xs-2">
                        <label><span style="color:red">*</span>联系电话:</label>
                    </div>
                    <div class="col-xs-5">
                        <input type="text" name="piPhone" class="form-control">
                    </div>
                    <div class="col-xs-5">
                    <#if pushError??>
                    <@spring.bind "pushError.piPhone" />
                    <@spring.showErrors "<br>"/>
                    </#if>
                    </div>

                </div>

                <div class="form-group row">
                    <div class="col-xs-2">
                        <label><span style="color:red">*</span>详细地址:</label>
                    </div>
                    <div class="col-xs-5">
                        <input type="text" name="piAddress" class="form-control">
                    </div>
                    <div class="col-xs-5">
                    <#if pushError??>
                    <@spring.bind "pushError.piAddress" />
                    <@spring.showErrors "<br>"/>
                    </#if>
                    </div>

                </div>

                <div class="form-group row">
                    <div class="col-xs-2">
                        <label>QQ:</label>
                    </div>
                    <div class="col-xs-5">
                        <input type="text" name="piQq" class="form-control">
                    </div>
                    <div class="col-xs-5"></div>
                </div>
                <div class="form-group">

                    <button type="submit" class="btn btn-info">确认提交</button>
                </div>

            </form>
        </div>
    </div>
</div>
<@push_footer>
<script type="text/javascript" src="${request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/fileupload.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/kindeditor-min.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/zh-CN.js"></script>
<script type="text/javascript">
    var editor;
    KindEditor.ready(function(K) {
        editor = K.create('textarea[name="piContent"]', {
            resizeType : 1,
            allowPreviewEmoticons : false,
            allowImageUpload : false,
            items : [
                'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                'insertunorderedlist', '|', 'emoticons', 'image', 'link']
        });
    });
</script>
</@push_footer>