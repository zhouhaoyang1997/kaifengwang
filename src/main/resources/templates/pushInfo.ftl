<#include "public/default.ftl">

<#assign base="${request.contextPath}"/>
<#include "public/pushdefault.ftl">
<#import "spring.ftl" as spring />
<@header title="填写发布信息">
<link rel="stylesheet" href="${base}/css/style.css">
<link rel="stylesheet" href="${base}/css/menu.css">
<link rel="stylesheet" href="${base}/css/fileupload.css">
<link rel="stylesheet" href="${base}/css/default.css">
<link rel="stylesheet" href="${base}/css/lightbox.min.css">
</@header>
<@push_header>
</@push_header>
<div class="mainPage">
    <div class="container_self" >
        <div class="row step2">
            <div class="col-xs-4"><span>1 ${choose.scName}</span><a href="${base}/push/choose" style="color:blue">重新选择</a></div>
            <div class="col-xs-4"><span class="span_1">2 填写信息内容</span></div>
            <div class="col-xs-4"><span>3 发布成功</span></div>
        </div>
        <div class="row" style="margin-top: 30px;padding-left: 100px;background: #fff;">
            <form action="/push/info" method="post" id="pushForm" enctype="multipart/form-data">
                <#if Session.user??>
                    <input type="hidden" name="userId" value="${user.userId!""}">
                </#if>
                <input type="hidden" name="piMc" value="${choose.mcId}">
                <input type="hidden" name="piSc" value="${choose.scId}">
                <div class="form-group row">
                    <div class="col-xs-8">
                    <label><span style="color:red">*</span>信息标题:</label>
                        <input type="text" name="piTitle" class="form-control" placeholder="请输入信息标题" maxlength="100" minlength="3">
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
                        <input type="text" required name="pic${pic.picId}" class="form-control">
                    </div>
                    <div class="col-xs-5"></div>
                </div>
            </#list>
                <label><span style="color:red">*</span>内容: <span style="color:red">你知道吗?描述的清除的信息的成功率会高30%!(请输入至少10个字符)</span></label>
            <div class="form-group row">
                <div class="col-xs-8">
                    <textarea name="piContent" minlength="10" maxlength="2000" style="width:800px;height:400px;visibility:hidden;"></textarea>
                </div>
                <div class="col-xs-4">
                <#if pushError??>
                    <@spring.bind "pushError.piContent" />
                    <@spring.showErrors "<br>"/>
                    </#if>
                </div>
            </div>
                <#if choose.mcId==2||choose.mcId==3>


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
                    </#if>
                <div class="form-group row">
                    <div class="col-xs-2">
                        <label><span style="color:red">*</span>联系人:</label>
                    </div>
                    <div class="col-xs-5">
                        <input type="text" name="piContactPerson" minlength="2" maxlength="5" class="form-control">
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
                        <input type="text" name="piPhone" maxlength="11" minlength="11" class="form-control">
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
                        <input type="text" name="piAddress" minlength="2" maxlength="150" class="form-control">
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
                    <div class="row">
                        <div class="col-xs-8">
                            <div class="container alterInfo">
                                <div class="alert alert-danger alert-dismissable" role="alert">
                                    <p>马上使用麦芒网 <a href="${base}/about/service" style="font-size: 18px;color: blue;">
                                        置顶推广</a> 使用置顶推广您的信息帖子效果可提升约 3~5倍！效果预览:<a data-lightbox="image-1" style="font-size: 18px;color: blue;" href="/img/push_effect.png">查看大图</a>
                                    </p>
                                    <img src="${base}/img/push_effect.png" style="width: 80%;" alt="推广效果">
                                </div>
                            </div>
                        </div>
                    </div>



                <div class="form-group" >
                    <button type="submit" class="btn btn-info" style="margin-left: 200px;">确认提交</button>
                </div>

            </form>
        </div>
    </div>
</div>

<@push_footer>
<script type="text/javascript" src="${base}/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${base}/js/fileupload.js"></script>
<script type="text/javascript" src="${base}/js/kindeditor-min.js"></script>
<script type="text/javascript" src="${base}/js/zh-CN.js"></script>
<script type="text/javascript" src="${base}/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${base}/js/messages_zh.js"></script>
<script type="text/javascript" src="${base}/js/lightbox.min.js"></script>

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
                'insertunorderedlist' ]
        });
    });

    $(function () {

        <#if picError??>
            alert("${picError}");
        </#if>

        jQuery.validator.addMethod("regex",
                function(value, element, params) {
                    var exp = new RegExp(params);
                    return exp.test(value);
                }, "格式错误");
        $("#pushForm").validate({
            rules:{
                piTitle:{
                    required:true,
                    regex:/^[a-zA-Z0-9\u4e00-\u9fa5]+$/
                },
                piContactPerson:{
                    required:true,
                    regex:/^[\u4e00-\u9fa5]+$/
                },
                piPhone:{
                    required:true,
                    regex:/^((13[0-9])|(15[^4])|(18[0,2,3,5-9])|(17[0-8])|(147))\d{8}$/
                }
            },
            messages:{
                piTitle:{
                    regex:'标题仅可以使用数字,中文,英文'
                },
                piContactPerson:{
                    regex:'请输入合适的联系人,如王女士'
                },
                piPhone:{
                    regex:'请输入合法的手机号'
                }
            }
        })
    })
</script>
</@push_footer>