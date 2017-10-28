<#include "defaultLayout/defaultLayout.ftl">
<@base siteName="开封麦芒网" base_js=["jq_min.211_1","common_1","bootstrap.min"] base_css=["global","style","all","bootstrap.min1"] base_keywords="开封麦芒网" title="首页">
<div class="panel">
    <div class="panel-body">
        <form class="form-horizontal" role="form"  method="post" action="/m/push1">
            <input type="hidden" name="piMc" value="${mcId}">
            <input type="hidden" name="piSc" value="${scId}">
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
                        <input type="text" name="pic${pic.picId}" class="form-control">
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
        <#--<div class="form-group">-->
        <#--<label for="" class="col-xs-12 control-label">要上传的图片</label>-->
        <#--<div class="col-xs-12 tl th">-->
        <#--<form enctype="multipart/form-data" >-->
        <#--<input type="file" name="image[]" id="picUpload" multiple/>-->
        <#--<p class="help-block">支持jpg、jpeg、png、gif格式，大小不超过2.0M</p>-->
        <#--</form>-->
        <#--</div>-->
        <#--</div>-->

        <#--此处后期检查字数-->
            <div class="form-group">
                <div class="col-xs-3">
                    <label for="name">详细信息</label>
                </div>
                <div class="col-xs-12">
                    <textarea class="form-control" name="piContent" style="width: 330px;height: 160px;"></textarea>
                </div>
            </div>
            <div class="form-group text-center">
                <button type="submit" class="btn btn-info">下一步</button>
            </div>

        </form>
    </div>
</div>
</@base>
