<#include "public/default.ftl">
<#import "spring.ftl" as spring />
<#assign base="${request.contextPath}"/>
<#include "public/pushdefault.ftl">
<@header title="填写发布信息">
<link rel="stylesheet" href="${base}/css/style.css">
<link rel="stylesheet" href="${base}/css/menu.css">
<link rel="stylesheet" href="${base}/css/fileinput.min.css">
<link rel="stylesheet" href="${base}/css/default.css">
</@header>
<@push_header>
</@push_header>
<div class="mainPage">
    <div class="container_self2">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#base" data-toggle="tab">基础信息修改</a></li>
            <li><a href="#pic" data-toggle="tab">图片修改</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="base">
                <div class="row" style="margin-top: 30px;">
                    <form action="/user/alterBaseInfo" method="post" id="pushForm">
                        <input type="hidden" name="piId" value="${pushInfo.piId}">
                        <input type="hidden" name="piMc" value="${pushInfo.piMc}">
                        <div class="form-group row">
                            <div class="col-xs-8">
                                <label><span style="color:red">*</span>信息标题:</label>
                                <input type="text" name="piTitle" class="form-control" value="${pushInfo.piTitle}" placeholder="请输入信息标题" maxlength="100" minlength="3">
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
                                    <#if ds.districtId==pushInfo.piDistrict>
                                        <option value="${ds.districtId}" selected>${ds.districtName}</option>
                                    <#else>
                                        <option value="${ds.districtId}">${ds.districtName}</option>
                                    </#if>
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
                                        <#if tc.tcName=tagMap[tag.tagName]>
                                            <option value="${tc.tcId}" selected>${tc.tcName}</option>
                                        <#else>
                                            <option value="${tc.tcId}">${tc.tcName}</option>
                                        </#if>
                                    </#list>
                                </select>
                            </div>
                            <div class="col-xs-5"></div>
                        </div>
                    </#list>

                    <#list pushInfo.otherInfos as pic>
                        <div class="form-group row">
                            <div class="col-xs-2">
                                <label><span style="color:red">*</span>${pic.picName}:</label>
                            </div>
                            <div class="col-xs-5">
                                <input type="text" name="pic${pic.picId}" value="${pic.pcContent}" class="form-control">
                            </div>
                            <div class="col-xs-5"></div>
                        </div>
                    </#list>
                        <label><span style="color:red">*</span>内容:</label>
                        <div class="form-group row">
                            <div class="col-xs-8">
                                <textarea name="piContent" style="width:800px;height:400px;visibility:hidden;">${pushInfo.piContent}</textarea>
                            </div>
                            <div class="col-xs-4">
                            <#if pushError??>
                    <@spring.bind "pushError.piContent" />
                    <@spring.showErrors "<br>"/>
                    </#if>
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-xs-2">
                                <label><span style="color:red">*</span>联系人:</label>
                            </div>
                            <div class="col-xs-5">
                                <input type="text" name="piContactPerson" value="${pushInfo.piContactPerson}" minlength="2" maxlength="5" class="form-control">
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
                                <input type="text" name="piPhone" maxlength="11" value="${pushInfo.piPhone}" minlength="11" class="form-control">
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
                                <input type="text" name="piAddress" minlength="2" value="${pushInfo.piAddress}" maxlength="150" class="form-control">
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
                                <input type="text" name="piQq" value="${pushInfo.piQq!""}" class="form-control">
                            </div>
                            <div class="col-xs-5"></div>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-info">确认提交</button>
                        </div>

                    </form>
                </div>
            </div>

            <div class="tab-pane" style="margin-top: 30px;min-height: 600px" id="pic">
                <div class="form-group row">
                    <div class="col-xs-12">

                            <form enctype="multipart/form-data" >
                                <div class="form-group">
                                    <input id="picUpload" type="file" name="pic"   class="file-loading">
                                </div>

                            </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<@push_footer>
<script type="text/javascript" src="${base}/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${base}/js/fileinput.min.js"></script>
<script type="text/javascript" src="${base}/js/zh.js"></script>
<script type="text/javascript" src="${base}/js/theme.js"></script>
<script type="text/javascript" src="${base}/js/kindeditor-min.js"></script>
<script type="text/javascript" src="${base}/js/zh-CN.js"></script>
<script type="text/javascript" src="${base}/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${base}/js/messages_zh.js"></script>
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
    });
    $(function () {
        $.ajax({
            url:'${base}/user/initPic?piId='+${pushInfo.piId},
            type:'get',
            success:function (result) {
                initUpload(result);
            }
        });
//http://blog.csdn.net/github_36086968/article/details/72830855;;;;http://plugins.krajee.com/file-input#ajax-uploads
        function initUpload(result) {
            $("#picUpload").fileinput({
                uploadUrl:'${base}/user/uploadPic',
                uploadAsync:true,
                showUpload: true,//是否显示上传按钮
                showRemove: false,//是否显示删除按钮
                showCaption: true,//是否显示输入框
                showPreview:true,
                showCancel:true,
                dropZoneEnabled: false,
                maxFileCount: 4,
                initialPreviewShowDelete:true,
                msgFilesTooMany: "选择上传的文件数量 超过允许的最大数值！",
                initialPreview: initPhoto(result),
                previewFileIcon: '<i class="fa fa-file"></i>',
                allowedPreviewTypes: ['image'],
                initialPreviewConfig: initConfig(result)
            }).on('filepredelete',function(event, key, jqXHR, data) {
                if(!confirm("确定删除原文件？删除后不可恢复")){
                    return false;
                }});
        }

        function initPhoto(result) {
            var imgUrl = result.split("#");
            for(var i=0;i<imgUrl.length;i++){
                imgUrl[i]='<img src="${base}/'+imgUrl[i]+'" class="file-preview-image" style="width:200px;height:100px;"/>';
            }
            return imgUrl;
        }
        function initConfig(result){
            var config=new Array();
            var imgUrl = result.split("#");
            for(var i=0;i<imgUrl.length;i++){
                config[i]= {
                    caption: imgUrl[i].substring(imgUrl[i].lastIndexOf("/")+1),
                    width: '120px',
                    url: '${base}/user/picDelete',
                    key: 100,
                    extra: {id: i}
                };
            }
            return config;
        }
    })
</script>
</@push_footer>