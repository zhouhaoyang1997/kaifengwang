<#include "defaultLayout/defaultLayout.ftl">
<@header siteName="开封麦芒网"  base_css=["global","style","bootstrap.min","cv"] base_keywords="开封麦芒网" >
<link rel="stylesheet" href="${baseUrl}/css/fileupload.css">
<link rel="stylesheet" href="${baseUrl}/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" href="${baseUrl}/css/bootstrap-switch.min.css">
<link rel="stylesheet" href="${baseUrl}/BeAlert/BeAlert.css">
</@header>

<@body title="我的简历" back=true>
<div id="contactbar">
    <a href="/m/index" class="bottom_index">首页</a>
    <a href="/m/user/info" class="bottom_member_on">我的</a>
    <a href="${baseUrl}/m/about/cpdesc" class="bottom_history">推送</a>
    <a href="${baseUrl}/m/push/choose" class="bottom_post">发布</a>
</div>
<div class="text-center">
<form action="${baseUrl}/user/addResume" enctype="multipart/form-data" method="post" id="resumeForm">
    <div class="panel panel-default">
        <div class="panel-heading"><img src="${baseUrl}/img/btn/ico_01.jpg" alt=""><span class="pt_title"> 基本资料</span></div>
        <div class="panel-body">
            <div class="fileinput fileinput-new" data-provides="fileinput" id="exampleInputUpload">
                <div class="fileinput-new thumbnail" style="width: 200px;height: auto;max-height:150px;">
                    <#if resume??&&resume.cvImg??>
                        <img id='picImg' style="width: 100%;height: auto;max-height: 140px;"
                             src="${baseUrl}/${resume.cvImg}"/>
                    <#else>
                        <img id='picImg' style="width: 100%;height: auto;max-height: 140px;"
                             src="${baseUrl}/img/noImage.png"/>
                    </#if>
                </div>
                <div class="fileinput-preview fileinput-exists thumbnail"
                     style="max-width: 200px; max-height: 150px;"></div>
                <div>
                        <span class="btn btn-primary btn-file">
                            <span class="fileinput-new">选择文件</span>
                            <span class="fileinput-exists">换一张</span>
                            <input type="file" name="file" id="picID" accept="image/gif,image/jpeg,image/x-png"/>
                        </span>
                    <a href="javascript:;" class="btn btn-warning fileinput-exists"
                       data-dismiss="fileinput">移除</a>
                </div>
            </div>

            <div class="form-group row">
                <div class="col-xs-12 input-group">
                    <span  class="input-group-addon"><span style="color:red">*</span>姓名:</span>
                    <input type="text" required class="form-control" <#if resume??> value="${resume.realName!""}"</#if> minlength="2" maxlength="5" name="realName">
                </div>
            </div>
            <#if userDetail??>
                <@spring.bind "resume.realName" />
                <@spring.showErrors "<br>"/>
            </#if>
            <div class="form-group row">
              <div class="col-xs-6 input-group">
                    <span  class="input-group-addon"><span style="color:red">*</span>出生:</span>
                    <input type="text" required  <#if resume??>value="${resume.bornYear!""}"</#if> class="form-control form_datetime"  name="bornYear">
                </div>

                <div class="col-xs-6 input-group">
                    <span  class="input-group-addon"><span style="color:red">*</span>性别:</span>
                    <div>
                        <select class="form-control"  name="gender">
                            <option  <#if resume??><#if resume.gender=="男">selected</#if></#if> value="男">男</option>
                            <option <#if resume??><#if resume.gender=="女">selected</#if></#if> value="女">女</option>
                        </select>
                    </div>
                </div>
                <#if userDetail??>
                    <@spring.bind "resume.bornYear" />
                    <@spring.showErrors "<br>"/>
                </#if>
                <#if userDetail??>
                    <@spring.bind "resume.gender" />
                    <@spring.showErrors "<br>"/>
                </#if>
            </div>

            <div class="form-group row">
                <div class="col-xs-12 input-group">
                    <span  class="input-group-addon"><span style="color:red">*</span>籍贯:</span>
                    <input type="text" required class="form-control" maxlength="20" <#if resume??>value="${resume.jiguan!""}"</#if> name="jiguan">
                </div>
            </div>
            <#if userDetail??>
                <@spring.bind "resume.jiguan" />
                <@spring.showErrors "<br>"/>
            </#if>

            <div class="form-group row">
                <div class="col-xs-6 input-group">
                    <span  class="input-group-addon"><span style="color:red">*</span>民族:</span>
                    <input type="text" required class="form-control" maxlength="10" <#if resume??>value="${resume.minzu!""}"</#if> name="minzu">
                    <span class="input-group-addon">族</span>
                </div>

                <div class="col-xs-6 input-group">
                    <span  class="input-group-addon"><span style="color:red">*</span>婚否:</span>
                    <div>
                        <select class="form-control"  name="maritalStatus">
                            <option  <#if resume??><#if resume.maritalStatus==0>selected</#if></#if> value="0">未婚</option>
                            <option  <#if resume??><#if resume.maritalStatus==1>selected</#if></#if> value="1">已婚</option>
                        </select>
                    </div>
                    <#--<div style="margin-left: 15px;margin-top: 3px;">-->
                        <#--<label class="radio-inline">-->
                            <#--<input type="radio" <#if resume??><#if resume.maritalStatus==0>checked</#if><#else>checked</#if> value="0">未婚-->
                        <#--</label>-->
                        <#--<label class="radio-inline">-->
                            <#--<input type="radio" name="maritalStatus" <#if resume??><#if resume.maritalStatus==1>checked</#if></#if> value="1">已婚-->
                        <#--</label>-->
                    <#--</div>-->
                </div>
            </div>
            <#if userDetail??>
                <@spring.bind "resume.maritalStatus" />
                <@spring.showErrors "<br>"/>
            </#if>
            <#if userDetail??>
                <@spring.bind "resume.minzu" />
                <@spring.showErrors "<br>"/>
            </#if>

            <div class="form-group row">
                <div class="col-xs-6 input-group">
                    <span  class="input-group-addon">身高:</span>
                    <input type="text" class="form-control" name="tall" maxlength="3" <#if resume??>value="${resume.tall!""}"</#if>>
                    <span class="input-group-addon">厘米</span>
                </div>
                <div class="col-xs-6 input-group">
                    <span  class="input-group-addon">体重:</span>
                    <input type="text" maxlength="3" class="form-control" maxlength="3" <#if resume??> value="${resume.weight!""}"</#if> name="weight">
                    <span class="input-group-addon">KG</span>
                </div>
            </div>

            <div class="form-group row">
                <div class="col-xs-12 input-group">
                <span  class="input-group-addon"><span style="color:red">*</span>健康:</span>
                <div style="margin-left: 15px;margin-top: 3px;">
                    <label class="radio-inline">
                        <input type="radio" name="health"  <#if resume??><#if resume.health==0>checked</#if><#else>checked</#if> value="0">健康
                    </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <label class="radio-inline">
                        <input type="radio" name="health" <#if resume??><#if resume.health==1>checked</#if></#if>  value="1">残疾
                    </label>
                </div>
            </div>
            </div>
            <#if userDetail??>
                <@spring.bind "resume.health" />
                <@spring.showErrors "<br>"/>
            </#if>

        </div>
    </div>
<#--教育-->
    <div class="panel panel-default">
        <div class="panel-heading"><img src="${baseUrl}/img/btn/ico_05.jpg" alt=""><span class="pt_title"> 教育背景</span></div>
        <div class="panel-body">
            <div class="form-group row">
                <div class="col-xs-12 input-group">
                    <span  class="input-group-addon"><span style="color:red">*</span>毕业学校:</span>
                    <input type="text" required class="form-control" maxlength="20"  <#if resume??>value="${resume.graColl!""}"</#if> name="graColl">
                </div>
            </div>
            <div class="form-group row">
                <div class="col-xs-12 input-group">
                    <span  class="input-group-addon"><span style="color:red">*</span>最高学历:</span>
                    <select name="maxEdu" id="maxSelect" class="form-control">
                        <option selected value="初中">初中</option>
                        <option value="高中/中专">高中/中专</option>
                        <option value="大专">大专</option>
                        <option value="本科">本科</option>
                        <option value="硕士">硕士</option>
                        <option value="其他">其他</option>
                    </select>
                </div>
            </div>
            <div class="form-group row">

            <div class="col-xs-12 input-group">
                    <span  class="input-group-addon"><span style="color:red">*</span>毕业时间:</span>
                    <input type="text" required  <#if resume??>value="${resume.graDate!""}"</#if> class="form-control form_datetime"  name="graDate">
                </div>
            </div>
            <#if userDetail??>
                <@spring.bind "resume.graColl" />
                <@spring.showErrors "<br>"/>
            </#if>

            <div class="form-group row">
                <div class="col-xs-6 input-group">
                    <span  class="input-group-addon">所学专业:</span>
                    <input type="text" maxlength="20" <#if resume??>value="${resume.stuPro!""}"</#if> class="form-control" name="stuPro">
                </div>
                <div class="col-xs-6 input-group">
                    <span  class="input-group-addon">外语水平:</span>
                    <input type="text" maxlength="10"  <#if resume??>value="${resume.english!""}"</#if>  class="form-control" name="english">
                </div>
            </div>
            <div class="form-group row">
                <div class="col-xs-12 input-group">
                    <span class="input-group-addon">其他教育</span>
                    <textarea name="otherStu" class="form-control" maxlength="200" style="width: 100%!important;" rows="3"> <#if resume??>${resume.otherStu!""}</#if></textarea>
                </div>
            </div>

        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading"><img src="${baseUrl}/img/btn/ico_06.jpg" alt=""><span class="pt_title"> 工作经历</span></div>
        <div class="panel-body">
            <div class="form-group row">
                <div class="col-xs-12 input-group">
                    <span class="input-group-addon">截止今年我有</span>
                    <select name="jobYear" id="jobSelect" class="form-control">
                        <option value="1年以下">1年以下</option>
                        <option value="1-2年">1-2年</option>
                        <option value="2-3年">2-3年</option>
                        <option value="3-5年">3-5年</option>
                        <option value="5年以上">5年以上</option>
                    </select>
                    <span class="input-group-addon">工作经验</span>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-xs-12 input-group">
                    <label for="">格式如：2006.11-2008.12,北京某某设计工作,担任设计师 (每行一条)</label>
                    <textarea name="jobDetail" class="form-control" id="" maxlength="200" cols="20" rows="3"> <#if resume??>${resume.jobDetail}</#if></textarea>
                </div>
            </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading"><img src="${baseUrl}/img/btn/ico_04.jpg" alt=""><span class="pt_title"> 求职意向</span></div>
        <div class="panel-body">
            <div class="form-group row">
                <div class="col-xs-12 input-group">
                    <span class="input-group-addon"><span style="color:red">*</span>希望岗位</span>
                    <select name="dreamWork" id="" class="form-control">
                        <#list zps as zp>
                            <#if resume??>
                                <#if zp.scId==resume.dreamWork>
                                    <option value="${zp.scId}" selected>${zp.scName}</option>
                                <#else>
                                    <option value="${zp.scId}">${zp.scName}</option>
                                </#if>
                            <#else>
                                <option value="${zp.scId}">${zp.scName}</option>
                            </#if>
                        </#list>
                    </select>
                </div>
            </div>
            <#if userDetail??>
                <@spring.bind "resume.dreamWork" />
                <@spring.graDate "<br>"/>
            </#if>
            <div class="form-group row">
                <div class="col-xs-12 input-group">
                    <span  class="input-group-addon"><span style="color:red">*</span>期望月薪:</span>
                    <select name="income" id="incomeSelect" class="form-control">
                        <option value="面议">面议</option>
                        <option value="1000-1500元">1000-1500元</option>
                        <option value="1500-2000元">1500-2000元</option>
                        <option value="2000-3000元">2000-3000元</option>
                        <option value="3000-5000元">3000-5000元</option>
                        <option value="5000-8000元">5000-8000元</option>
                        <option value="8000元以上">8000元以上</option>
                    </select>
                </div>
            </div>
                <#if userDetail??>
                    <@spring.bind "resume.income" />
                    <@spring.graDate "<br>"/>
                </#if>
            <div class="form-group row">
            <div class="col-xs-12 input-group">
                    <span  class="input-group-addon">希望工作地区:</span>
                    <select name="dreamDistrict" class="form-control" id="">
                        <#list districts as district>
                            <#if resume??>
                                <#if resume.dreamDistrict==district.districtId>
                                    <option value="${district.districtId}" selected>${district.districtName}</option>
                                <#else>
                                    <option value="${district.districtId}">${district.districtName}</option>
                                </#if>
                            <#else>
                                <option value="${district.districtId}">${district.districtName}</option>
                            </#if>
                        </#list>
                    </select>
                </div>
            </div>
            <div class="form-group row">
            <div class="col-xs-12 input-group">
                    <span  class="input-group-addon">到岗时间:</span>
                    <#if resume??>
                        <input type="text" class="form-control" maxlength="2" value="${resume.workTime}" name="workTime">
                    <#else>
                        <input type="text" class="form-control" maxlength="2" value="不限" name="workTime">
                    </#if>

                    <span  class="input-group-addon">xx月后</span>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-xs-12 input-group">
                    <span class="input-group-addon">擅长技能</span>
                    <input type="text" class="form-control" maxlength="20"  <#if resume??>value="${resume.jineng!""}"</#if> name="jineng">
                </div>
            </div>
            <div class="form-group row">
                <div class="col-xs-12 input-group">
                    <span class="input-group-addon">自推荐言</span>
                    <textarea name="zitui" maxlength="200" class="form-control" id="" cols="20" rows="3"> <#if resume??>${resume.zitui!""}</#if></textarea>
                </div>
            </div>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading"><img src="${baseUrl}/img/btn/ico_02.jpg" alt=""><span class="pt_title"> 联系方式</span></div>
        <div class="panel-body">
            <div class="form-group row">
                <div class="col-xs-12 input-group">
                    <span class="input-group-addon">联系手机</span>
                    <input type="text" class="form-control" maxlength="11" minlength="11"  <#if resume??>value="${resume.phone!""}"</#if> name="phone">
                </div>
            </div>
            <div class="form-group row">
            <div class="col-xs-12 input-group">
                    <span class="input-group-addon">电子邮件</span>
                    <input type="email" class="form-control" maxlength="30"  <#if resume??>value="${resume.email!""}"</#if> name="email">
                </div>
            </div>

            <div class="form-group row">
                <div class="col-xs-12 input-group">
                    <span class="input-group-addon">腾讯QQ</span>
                    <input type="text" class="form-control" maxlength="20" <#if resume??>value="${resume.qq!""}"</#if> name="qq">
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <input type="submit" class="col-md-offset-4 col-md-3 btn btn-success" value="确认无误,提交">
    </div>
</form>
</@body>
<#--js-->
<@footer base_js=["jquery.min","bootstrap.min"]></@footer>
    <script type="text/javascript" src="${baseUrl}/js/fileupload.js"></script>

    <script type="text/javascript" src="${baseUrl}/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${baseUrl}/js/messages_zh.js"></script>

    <script type="text/javascript" src="${baseUrl}/js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="${baseUrl}/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
    <script type="text/javascript" src="${baseUrl}/js/bootstrap-switch.min.js"></script>
    <script type="text/javascript" src="${baseUrl}/BeAlert/BeAlert.js"></script>
<script>
    <#if picError??>
    alert("${picError}");
    </#if>
    $(".form_datetime").datetimepicker({minView: "month",format: 'yyyy-mm-dd',language: 'zh-CN'});
    <#if resume??>
    $("[name='my-checkbox']").bootstrapSwitch({
        onText:"公开",
        offText:"关闭",
        onSwitchChange:function(event,state){
            if(state==true){
                //打开状态:
                $.ajax({
                    url:"/user/resume/open?cvId=${resume.cvId}&flag=1",
                    type:"get",
                    success:function (result) {
                        if(result=="ok"){
                            alert("打开成功!");
                        }else{
                            alert("打开失败!")
                        }
                    }
                })
            }else{
                $.ajax({
                    url:"/user/resume/open?cvId=${resume.cvId}&flag=0",
                    type:"get",
                    success:function (result) {
                        if(result=="ok"){
                            alert("关闭成功!");
                        }else{
                            alert("关闭失败!")
                        }
                    }
                })
            }
        }});
    </#if>

    $(function () {


    <#if resume??>
        $("#maxSelect").val("${resume.maxEdu}");
        $("#incomeSelect").val("${resume.income}");
        $("#jobSelect").val("${resume.jobYear}");
    </#if>

        $("#resumeForm").validate({
            errorClass: "error",
            success: "valid",
            errorPlacement:function (error,element) {
                if ($(element).next("div").hasClass("tooltip")) {
                    $(element).attr("data-original-title", $(error).text()).tooltip("show");
                } else {
                    $(element).attr("title",
                            $(error).text()).tooltip("show");
                }
            }
        });
    })
</script>