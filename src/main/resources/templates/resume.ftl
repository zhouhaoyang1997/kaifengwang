<#include "public/default.ftl">
<#include "public/pushdefault.ftl">
<#include "public/userdefault.ftl">
<#assign base="${request.contextPath}"/>
<@header title="麦芒网">
<link rel="stylesheet" href="${base}/css/style.css">
<link rel="stylesheet" href="${base}/css/bootstrap-table.min.css">
<link rel="stylesheet" href="${base}/css/menu.css">
<link rel="stylesheet" href="${base}/css/userInfo.css">
<link rel="stylesheet" href="${base}/css/fileupload.css">
<link rel="stylesheet" href="${base}/css/bootstrap-datetimepicker.min.css">
<style>
    .error {
        color: red;
        border-color:red;
    }

    .valid {
        color: black;
    }
</style>
</@header>
<@headerArea>
<li><a href="${base}/index">回首页</a></li>
</@headerArea>
<@user_nav>

<div class="col-md-3">
    <div class="user_bar"><h4><a href="${base}/user/personal">个人中心</a></h4></div>
</div>
<div class="col-md-3">
    <div class="user_bar"><h4><a href="${base}/user/info">账户设置</a></h4></div>
</div>
</@user_nav>

<div class="container_self" style="min-height: 800px;">
    <div class="row">
        <div class="col-md-2" style="width:20%">
            <!-- Contenedor -->
            <ul id="accordion" class="accordion">
                <li>
                    <a href="${base}/user/personal">
                        <div class="link"><i class="fa fa-paint-brush"></i>个人中心<i class="fa fa-chevron-down"></i></div>
                    </a>
                </li>
                <li>
                    <a href="${base}/user/info">
                        <div class="link"><i class="fa fa-code"></i>账户设置<i class="fa fa-chevron-down"></i></div>
                    </a>
                </li>
                <li>
                    <a href="${base}/user/extension">
                        <div class="link"><i class="fa fa-mobile"></i>推广中心</div>
                    </a>
                </li>
                <li>
                    <a href="${base}/user/attc">
                        <div class="link"><i class="fa fa-id-card-o"></i>公司认证</div>
                    </a>
                </li>
                <li>
                    <div class="link"><i class="fa fa-globe"></i>我的简历</div>
                </li>
            </ul>
        </div>
        <div class="col-md-9">
            <div style="margin-top: 20px;border: 1px solid #ddd;">
                <div class="panel ">
                    <div class="panel-heading"><h3>我的简历</h3>
                        <div class="alert alert-danger alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <strong>重要提示:</strong> 认真、真实、详细填写您的全职简历，有利于您快速获得职位!
                        </div>
                    </div>
                    <div class="panel-body">
                        <form action="" id="resumeForm">

                            <div class="panel panel-default">
                                <div class="panel-heading"><img src="${base}/img/btn/ico_01.jpg" alt=""><span class="pt_title"> 基本资料</span></div>
                                <div class="panel-body">
                                    <div class="form-group row">
                                        <div class="col-xs-4 input-group">
                                            <span  class="input-group-addon"><span style="color:red">*</span>姓名:</span>
                                            <input type="text" required class="form-control" minlength="2" maxlength="5" name="realName">
                                        </div>
                                        <div class="col-xs-4 input-group">
                                            <span  class="input-group-addon"><span style="color:red">*</span>出生:</span>
                                            <input type="text" required class="form-control form_datetime" readonly name="bornYear">
                                        </div>
                                        <div class="col-xs-4 input-group">
                                            <span  class="input-group-addon"><span style="color:red">*</span>性别:</span>
                                            <div style="margin-left: 15px;margin-top: 3px;">
                                                <label class="radio-inline">
                                                <input type="radio" name="gender" checked value="男">男
                                            </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="gender" value="女">女
                                                </label>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-xs-4 input-group">
                                            <span  class="input-group-addon"><span style="color:red">*</span>籍贯:</span>
                                            <input type="text" required class="form-control" name="jiguan">
                                        </div>
                                        <div class="col-xs-4 input-group">
                                            <span  class="input-group-addon"><span style="color:red">*</span>民族:</span>
                                            <input type="text" required class="form-control" name="minzu">
                                            <span class="input-group-addon">族</span>
                                        </div>
                                        <div class="col-xs-4 input-group">
                                            <span  class="input-group-addon"><span style="color:red">*</span>婚否:</span>
                                            <div style="margin-left: 15px;margin-top: 3px;">
                                                <label class="radio-inline">
                                                    <input type="radio" name="maritalStatus" checked value="0">未婚
                                                </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="maritalStatus" value="1">已婚
                                                </label>
                                            </div>

                                        </div>
                                    </div>


                                    <div class="form-group row">
                                        <div class="col-xs-4 input-group">
                                            <span  class="input-group-addon">身高:</span>
                                            <input type="text" class="form-control" name="tall">
                                            <span class="input-group-addon">厘米</span>
                                        </div>
                                        <div class="col-xs-4 input-group">
                                            <span  class="input-group-addon">体重:</span>
                                            <input type="text" maxlength="3" class="form-control" name="weight">
                                            <span class="input-group-addon">KG</span>
                                        </div>
                                        <div class="col-xs-4 input-group">
                                            <span  class="input-group-addon"><span style="color:red">*</span>健康:</span>
                                            <div style="margin-left: 15px;margin-top: 3px;">
                                                <label class="radio-inline">
                                                    <input type="radio" name="health" checked value="0">健康
                                                </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="health" value="1">残疾
                                                </label>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="fileinput fileinput-new" data-provides="fileinput" id="exampleInputUpload">
                                        <div class="fileinput-new thumbnail" style="width: 200px;height: auto;max-height:150px;">
                                        <#--<#if userInfo.userImg??>-->
                                            <#--<img id='picImg' style="width: 100%;height: auto;max-height: 140px;"-->
                                                 <#--src="${base}/${userInfo.userImg}"/>-->
                                        <#--<#else>-->
                                            <#--<img id='picImg' style="width: 100%;height: auto;max-height: 140px;"-->
                                                 <#--src="${base}/img/noImage.png"/>-->
                                        <#--</#if>-->
                                            <img id='picImg' style="width: 100%;height: auto;max-height: 140px;"
                                                 src="${base}/img/noImage.png"/>
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
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading"><img src="${base}/img/btn/ico_05.jpg" alt=""><span class="pt_title"> 教育背景</span></div>
                                <div class="panel-body">
                                    <div class="form-group row">
                                        <div class="col-xs-4 input-group">
                                            <span  class="input-group-addon"><span style="color:red">*</span>最高学历:</span>
                                            <select name="maxEdu" id="" class="form-control">
                                                <option value="小学">小学</option>
                                                <option value="初中">初中</option>
                                                <option value="高中/中专">高中/中专</option>
                                                <option value="大专">大专</option>
                                                <option value="本科">本科</option>
                                                <option value="硕士">硕士</option>
                                                <option value="其他">其他</option>
                                            </select>
                                        </div>
                                        <div class="col-xs-4 input-group">
                                            <span  class="input-group-addon"><span style="color:red">*</span>毕业学校:</span>
                                            <input type="text" required class="form-control" name="graColl">
                                        </div>
                                        <div class="col-xs-4 input-group">
                                            <span  class="input-group-addon"><span style="color:red">*</span>毕业时间:</span>
                                            <input type="text" required class="form-control form_datetime" readonly name="graDate">
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-xs-4 input-group">
                                            <span  class="input-group-addon">所学专业:</span>
                                            <input type="text"  class="form-control" name="stuPro">
                                        </div>
                                        <div class="col-xs-4 input-group">
                                            <span  class="input-group-addon">外语水平:</span>
                                            <input type="text"  class="form-control" name="english">
                                        </div>
                                        <div class="col-xs-4 input-group">
                                            <span  class="input-group-addon">电脑水平:</span>
                                            <input type="text"  class="form-control" name="computer">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-xs-10 input-group">
                                            <span class="input-group-addon">其他教育</span>
                                            <textarea name="otherStu" class="form-control" maxlength="200" id="" cols="20" rows="3"></textarea>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading"><img src="${base}/img/btn/ico_06.jpg" alt=""><span class="pt_title"> 工作经历</span></div>
                                <div class="panel-body">
                                    <div class="form-group row">
                                        <div class="col-xs-6 input-group">
                                            <span class="input-group-addon">截止今年我有</span>
                                            <select name="jobYear" id="" class="form-control">
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
                                        <div class="col-xs-10 input-group">
                                            <label for="">格式如：2006.11-2008.12,北京某某设计工作,担任设计师 (每行一条)</label>
                                            <textarea name="jobDetail" class="form-control" id="" cols="20" rows="3"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading"><img src="${base}/img/btn/ico_04.jpg" alt=""><span class="pt_title"> 求职意向</span></div>
                                <div class="panel-body">
                                    <div class="form-group row">
                                        <div class="col-xs-6 input-group">
                                            <span class="input-group-addon"><span style="color:red">*</span>希望岗位</span>
                                            <select name="dreamWork" id="" class="form-control">
                                                <#list zps as zp>
                                                    <option value="${zp.scId}">${zp.scName}</option>
                                                </#list>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-xs-4 input-group">
                                            <span  class="input-group-addon"><span style="color:red">*</span>期望月薪:</span>
                                            <select name="income" id="" class="form-control">
                                                <option value="面议">面议</option>
                                                <option value="1000-1500元">1000-1500元</option>
                                                <option value="1500-2000元">1500-2000元</option>
                                                <option value="2000-3000元">2000-3000元</option>
                                                <option value="3000-5000元">3000-5000元</option>
                                                <option value="5000-8000元">5000-8000元</option>
                                                <option value="8000元以上">8000元以上</option>
                                            </select>
                                        </div>
                                        <div class="col-xs-4 input-group">
                                            <span  class="input-group-addon">希望工作地区:</span>
                                            <select name="dream_district" class="form-control" id="">
                                                <#list districts as district>
                                                    <option value="${district.districtId}">${district.districtName}</option>
                                                </#list>
                                            </select>
                                        </div>
                                        <div class="col-xs-4 input-group">
                                            <span  class="input-group-addon">到岗时间:</span>
                                            <input type="text" class="form-control" value="可随时到岗" name="cpName">
                                            <span  class="input-group-addon">xx月后</span>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-xs-6 input-group">
                                            <span class="input-group-addon">擅长技能</span>
                                            <input type="text" class="form-control" name="jineng">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-xs-10 input-group">
                                            <span class="input-group-addon">自推荐言</span>
                                            <textarea name="zitui" maxlength="200" class="form-control" id="" cols="20" rows="3"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="panel panel-default">
                                <div class="panel-heading"><img src="${base}/img/btn/ico_02.jpg" alt=""><span class="pt_title"> 联系方式</span></div>
                                <div class="panel-body">
                                    <div class="form-group row">
                                        <div class="col-xs-6 input-group">
                                            <span class="input-group-addon">联系手机</span>
                                            <input type="text" class="form-control" name="phone">
                                        </div>
                                        <div class="col-xs-6 input-group">
                                            <span class="input-group-addon">电子邮件</span>
                                            <input type="text" class="form-control" name="email">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-xs-6 input-group">
                                            <span class="input-group-addon">腾讯QQ</span>
                                            <input type="text" class="form-control" name="qq">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <input type="submit" class="col-md-offset-4 col-md-3 btn btn-success" value="确认无误,提交">
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
<script type="text/javascript" src="${base}/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${base}/js/messages_zh.js"></script>
<script type="text/javascript" src="${base}/js/fileupload.js"></script>
<script type="text/javascript" src="${base}/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="${base}/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript" src="${base}/js/hhshare.js"></script>
<script>

    $(".form_datetime").datetimepicker({minView: "month",format: 'yyyy-mm-dd',language: 'zh-CN'});
    $(function () {
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
        $.goup({
            trigger: 100,
            bottomOffset: 150,
            locationOffset: 100,
            title: '回到顶部',
            titleAsText: true
        });
    })
</script>
</@push_footer>


