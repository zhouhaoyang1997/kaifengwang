<#include "defaultLayout/defaultLayout.ftl">
<#import "/spring.ftl" as spring />
<#assign base="${request.contextPath}"/>
<@header siteName="开封麦芒网" base_css=["global","style","all","bootstrap.min1"] base_keywords="开封麦芒网">
<link rel="stylesheet" href="${base}/css/fileupload.css">
<link rel="stylesheet" href="${base}/css/default.css">
</@header>

<@body title="发布信息" back=true>
<div id="contactbar">
    <a href="/m/index" class="bottom_index">首页</a>
    <a href="/m/user/info" class="bottom_member">我的</a>
    <a href="#" class="bottom_history">推送</a>
    <a href="${baseUrl}/m/push/choose" class="bottom_post_on">发布</a>
</div>
<div class="panel">
    <div class="panel-body">
        <form class="form-horizontal" id="pushForm" role="form" enctype="multipart/form-data" method="post" action="/push/info">
            <input type="hidden" value="mobile" name="method">
            <#if Session.user??>
                <input type="hidden" name="userId" value="${user.userId!""}">
            </#if>
            <input type="hidden" name="piMc" value="${choose.mcId}">
            <input type="hidden" name="piSc" value="${choose.scId}">
            <div class="form-group">
                <label for="firstname" class="col-xs-3"><span style="color:red">*</span>信息标题</label>
                <div class="col-xs-9">
                    <input type="text" class="form-control" id="userId" name="piTitle" placeholder="请输入信息标题" maxlength="100" minlength="3" >
                </div>
            </div>

            <div class="form-group">
                <label for="firstname" class="col-xs-3"><span style="color:red">*</span>所属地区</label>
                <div class="col-xs-9">
                    <select class="form-control" name="piDistrict">
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
                        <input type="text" required name="pic${pic.picId}" class="form-control">
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
            <div class="form-group row">
                <div class="col-xs-3">
                    <label><span style="color:red">*</span>详细地址:</label>
                </div>
                <div class="col-xs-9">
                    <input type="text" name="piAddress" minlength="2" maxlength="150" class="form-control">
                </div>
                <div class="col-xs-12">
                    <#if pushError??>
                    <@spring.bind "pushError.piAddress" />
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
            <div class="form-group row">
                <div class="col-xs-12">
                    <div class="row">
                        <div class="col-xs-6">
                            <div class="fileinput fileinput-new" data-provides="fileinput" id="exampleInputUpload">
                                <div class="fileinput-new thumbnail" style="width: 130px;height: auto;max-height:150px;">
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
                        <div class="col-xs-6">
                            <div class="fileinput fileinput-new" data-provides="fileinput" id="exampleInputUpload">
                                <div class="fileinput-new thumbnail" style="width: 130px;height: auto;max-height:150px;">
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
                <div class="col-xs-12">
                    <div class="row">
                        <div class="col-xs-6">
                            <div class="fileinput fileinput-new" data-provides="fileinput" id="exampleInputUpload">
                                <div class="fileinput-new thumbnail" style="width: 130px;height: auto;max-height:150px;">
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
                        <div class="col-xs-6">
                            <div class="fileinput fileinput-new" data-provides="fileinput" id="exampleInputUpload">
                                <div class="fileinput-new thumbnail" style="width: 130px;height: auto;max-height:150px;">
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

        <#--此处后期检查字数-->
            <div class="form-group">
                <div class="col-xs-12">
                    <label for="name">详细信息<span style="color:red">你知道吗?描述的清除的信息的成功率会高30%!(请输入至少10个字符)</span></label>
                </div>
                <div class="col-xs-12">
                    <textarea class="form-control" name="piContent" style="width: 330px;height: 160px;"></textarea>
                </div>
                <div class="col-xs-12">
                    <#if pushError??>
                    <@spring.bind "pushError.piContent" />
                    <@spring.showErrors "<br>"/>
                    </#if>
                </div>
            </div>
            <div class="form-group text-center">
                <button type="submit" class="btn btn-info">确认提交</button>
            </div>

        </form>
    </div>
</div>
</@body>

<@footer base_js=["jq_min.211","common","bxslider"]>
<script type="text/javascript" src="${base}/js/fileupload.js"></script>
<script type="text/javascript" src="${base}/js/kindeditor-min.js"></script>
<script type="text/javascript" src="${base}/js/zh-CN.js"></script>
<script type="text/javascript" src="${base}/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${base}/js/messages_zh.js"></script>
<script>
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
</@footer>

<#--自定义脚本区-->
