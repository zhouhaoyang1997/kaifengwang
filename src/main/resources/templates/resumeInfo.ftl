<#include "public/default.ftl">
<#assign base="${request.contextPath}"/>
<@header title="麦芒网">
<link rel="stylesheet" href="${base}/css/style.css">
<link rel="stylesheet" href="${base}/css/info.css">
<style>
    .resume_title{
        padding-right:10px ;
        font-size:16px;
        color: #aaa;
    }

</style>
</@header>
<@headerArea>
<li><a href="${base}/index">回首页</a></li>
</@headerArea>

<div style="background: #ff552e">
    <div class="container_self">
        <div class="row">
            <div class="col-md-4">
                <div class="info_logo">
                    <h1><img src="/img/kflogo2_rev.png" width="48" height="48" alt="网站logo"><a href="${base}/index">开封<span>求职简历</span></a></h1>
                </div>
            </div>
            <div class="col-md-3"><span style="margin-top: 15px;font-size:20px;color: #fff;float: left;">--专业的信息服务平台</span><span style="color: #fff;float: left;">全新升级,新品牌,新服务</span></div>
            <div class="col-md-offset-3 col-md-2">
                <a href="${base}/push/choose" class="btn push_btn">发布信息</a>
                <a href="${base}/user/resume" class="btn push_btn">登记简历</a>
            </div>
        </div>
    </div>
</div>

<div class="container_self" style="margin-bottom: 30px;">
    <div class="row">
        <div class="now_position">
            <i class="fa fa-home"></i><a href="/index">开封麦芒网</a>&nbsp;>&nbsp;<a href="/resume/list">求职简历</a>&nbsp;>&nbsp;<a href="/resume/list?dreamWorkStr=${info.scName!""}">${info.scName!""}</a>
        </div>
    </div>
    <div class="row">
        <div class="col-md-9 self_left" style="background: #ffffff">
            <div class="row" >
                <div class="col-md-4 push_base_static">
                    <span>发布时间:${info.updateTime?string("yyyy-MM-dd")}</span>
                </div>
                <div class="col-md-4"></div>
                <div class="col-md-4 push_base_static">
                <#if Session.user??>
                    <a href="#tipInfo" data-toggle="modal"><i class="fa fa-hand-paper-o"></i> 举报</a>
                <#else>
                    <a href="#loginModal" data-toggle="modal"><i class="fa fa-hand-paper-o"></i> 举报</a>
                </#if>   <a href="${base}/about/service" target="_blank" style="color:red;"><i class="fa fa-level-up"></i>推广服务</a>
                    <img class="tuijian" src="${base}/img/tuijian.png" alt="">
                </div>
            </div>

            <div id="header" class="row">

                <div class="col-sm-3">
                <#if info.cvImg??>
                    <img class="img-circle img-thumbnail" src="${base}/${info.cvImg}" alt="" width="144px" height="144px">
                <#else>
                    <img class="img-circle" src="${base}/img/noimage.png" alt="" width="144px" height="144px">
                </#if>

                </div>
                <div class="col-sm-9">
                    <div class="cv-title">
                        <div class="row">
                            <div class="col-sm-7">
                                <h2>求职人:${info.realName!"未知"}</h2>
                            </div>
                        </div>
                        <h3>寻求职位:${info.scName!"未知"} </h3>
                    </div>
                    <div class="row resume-base-info">

                        <div class="col-sm-2">
                            <ul class="list-unstyled resume-base-title">
                                <li>工作经验: </li>
                                <li>最高学历: </li>
                                <li>薪资待遇: </li>
                            </ul>
                        </div>
                        <div class="col-sm-2">
                            <ul class="list-unstyled resume-base-content">
                                <li>${info.jobYear!"未知"} </li>
                                <li>${info.maxEdu!"未知"} </li>
                                <li>${info.income!"未知"}</li>
                            </ul>
                        </div>

                        <div class="col-sm-2">
                            <ul class="list-unstyled resume-base-title">
                                <li>手机: </li>
                                <li>邮箱: </li>
                                <li>QQ: </li>
                            </ul>
                        </div>
                        <div class="col-sm-2">
                            <ul class="list-unstyled resume-base-content">
                                <li>
                                <#if Session.user??>
                                    <a class="btn btn-danger" style="margin-top: -10px;" href="#completedNum" data-toggle="modal">点击查看号码</a>
                                <#else>
                                    <a class="btn btn-danger" style="margin-top: -10px;" href="#loginModal" data-toggle="modal">点击查看号码</a>
                                </#if>
                                </li>
                                <li>${info.email!"未知"} </li>
                                <li>${info.qq!"未知"}</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>


            <div class="panel panel-self">
                <div class="panel-heading"><h3>求职意向</h3></div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-2">
                            <ul class="list-unstyled resume-base-title">
                                <li>希望岗位: </li>
                                <li>期望月薪: </li>
                                <li>希望工作区域: </li>
                            </ul>
                        </div>
                        <div class="col-xs-2">
                            <ul class="list-unstyled resume-base-content">
                                <li>${info.scName!"未知"} </li>
                                <li>${info.income!"未知"} </li>
                                <li>${info.districtName!"未知"} </li>
                            </ul>
                        </div>
                        <div class="col-xs-2">
                            <ul class="list-unstyled resume-base-title">
                                <li>到岗时间: </li>
                                <li>擅长技能: </li>
                            </ul>
                        </div>
                        <div class="col-xs-2">
                            <ul class="list-unstyled resume-base-content">
                                <li>${info.workTime!"未知"} </li>
                                <li>${info.jineng!"未知"}</li>
                            </ul>
                        </div>
                    </div>
                    <p><span class="resume_title">自推荐言: </span>${info.zitui!"暂未填写"}</p>
                </div>
            </div>


            <div class="panel panel-self">
                <div class="panel-heading"><h3>个人简介</h3></div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-sm-2">
                            <ul class="list-unstyled resume-base-title">
                                <li>婚否: </li>
                                <li>性别: </li>
                                <li>生日: </li>
                            </ul>
                        </div>
                        <div class="col-sm-2">
                            <ul class="list-unstyled resume-base-content">
                                <li><#if info.maritalStatus??&&info.maritalStatus==0>未婚<#else>已婚</#if></li>
                                <li>${info.gender} </li>
                                <li>${info.bornYear!"未知"} </li>
                            </ul>
                        </div>
                        <div class="col-xs-2">
                            <ul class="list-unstyled resume-base-title">
                                <li>身高: </li>
                                <li>体重: </li>
                            </ul>
                        </div>
                        <div class="col-xs-2">
                            <ul class="list-unstyled resume-base-content">
                                <li><#if info.tall??>${info.tall}厘米<#else>未知</#if> </li>
                                <li><#if info.weight??>${info.weight}kg<#else>未知</#if></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>


            <div class="panel panel-self">
                <div class="panel-heading"><h3>工作经历</h3></div>
                <div class="panel-body">
                    <p>1.截至今年我有${info.jobYear!""}工作经验</p>
                    <p><span class="resume_title">工作经历: </span>${info.jobDetail!""}</p>
                </div>
            </div>


            <div class="panel panel-self">
                <div class="panel-heading"><h3>教育背景</h3></div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-2">
                            <ul class="list-unstyled resume-base-title">
                                <li>毕业院校: </li>
                                <li>毕业时间: </li>
                                <li>所学专业: </li>
                            </ul>
                        </div>
                        <div class="col-xs-2">
                            <ul class="list-unstyled resume-base-content">
                                <li>${info.graColl!"未知"} </li>
                                <li>${info.graDate} </li>
                                <li>${info.stuPro!"未知"} </li>
                            </ul>
                        </div>
                        <div class="col-xs-2">
                            <ul class="list-unstyled resume-base-title">
                                <li>外语水平: </li>
                                <li>电脑水平: </li>
                            </ul>
                        </div>
                        <div class="col-xs-2">
                            <ul class="list-unstyled resume-base-content">
                                <li>${info.english!"未知"} </li>
                                <li>${info.computer!"未知"}</li>
                            </ul>
                        </div>
                    </div>
                    <p><span class="resume_title">其他教育: </span>${info.otherStu!""}</p>
                </div>
            </div>

        </div>
        <div class="col-md-3">
            <div class="panel panel-self" style="border: none;margin-top: 0;">
                <div class="panel-heading">
                    <h3 style="border-left: 5px solid #ff552e;padding-left: 10px;">求职信息推荐</h3>
                </div>
                <div class="panel-body" style="min-height: 350px;">
                    <ul class="list-unstyled" id="data">
                        <div id="loader" style="width: 80px;height: 80px;" ></div>
                    </ul>
                </div>
            </div>

            <div class="panel panel-self" style="border: none;">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" style="height: 200px;" role="listbox">
                        <div class="item active">
                            <img src="${base}${advertMap["content_gg_1"].advertUrl}" width="306px" alt="...">
                        </div>
                        <div class="item">
                            <img src="${base}${advertMap["content_gg_2"].advertUrl}" width="306px" alt="...">
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>



<#if Session.user??>
    <div class="modal fade" id="completedNum" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">

            <div class="modal-content">
                <div class="modal-body">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <div class="container logo_login">
                        <p >查看联系方式</p>
                    </div>

                    <div class="container alterInfo">
                        <div class="alert alert-danger alert-dismissable" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>

                            <img src="${base}/img/warning.png" width="30px" height="30px"><span style="font-size: 16px">开封城市网提醒你：</span>让你提前汇款，或者价格明显低于市价，均有骗子嫌疑，不要轻易相信。
                        </div>
                    </div>
                    <div class="container phoneNum">
                        <img src="${base}/img/phone.png" alt="手机图标" width="60px" height="60px">
                        <span>${info.phone!""}</span>
                    </div>
                    <div class="person_contact" style="margin-top: 10px;">
                        <p style="text-align: center">联系人:${info.realName!""}</p>
                    </div>
                </div>
                <div class="modal-footer"><span>期待您对此信息满意!</span></div>
            </div>
        </div>
    </div>
<#else>
    <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <div class="container logo_login">
                        <h1>开封<span>麦芒网</span></h1>
                        <p >欢迎你的登陆</p>
                    </div>
                    <div class="container loginForm">
                        <form id="loginForm" >
                            <input type="hidden" name="path" value="/resume/info?cvId=${info.cvId}">
                            <div class="form-group">
                                <input type="text" class="form-control" name="userName" placeholder="用户名">
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" name="userPassword" placeholder="密码">
                            </div>
                            <span style="color:red" id="error"></span>
                            <div class="form-group">
                                <label for="remember"><input type="checkbox" name="remember" value="true" id="remember">记住我?</label>
                            </div>
                            <div class="form-group">
                                <p>没有账号? <a href="${base}/register">注册</a> | <a href="javascript:;">忘记密码?</a></p>
                            </div>
                            <div class="row">
                                <div class="col-xs-9">
                                    <div class="form-group" style="margin-top:20px">
                                        <input type="button" value="登录" id="loginBtn" style="width: 100px" class="btn btn-danger">
                                    </div>
                                </div>
                                <div class="col-xs-3">
                                    <a href="#"><div class="qq_lg"></div><span>QQ登陆</span></a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</#if>



    <div class="modal fade" id="tipInfo" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <div class="container logo_login">
                        <p >信息举报中心</p>
                    </div>
                    <div class="container loginForm">
                        <form id="tipForm" action="${base}/tipInfo" method="post">
                            <div class="form-group">
                                <label for="">信息Id:</label>
                                <input type="text" readonly class="form-control"  name="piId"  value="${info.cvId}">
                            </div>

                            <div class="form-group">
                                <label for="">举报信息</label>
                                <input type="text" disabled class="form-control" name="piTitle"  value="${info.realName!""}">
                            </div>

                            <div class="form-group">
                                <label for="">您的意见</label>
                                <textarea class="form-control" required minlength="5" maxlength="240" name="tipContent"></textarea>
                            </div>
                            <div class="row">
                                <div class="col-xs-9">
                                    <div class="form-group" style="margin-top:20px">
                                        <input type="submit" value="确认举报" style="width: 100px" class="btn btn-danger">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>


                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</div>

<div class="advert" style="margin-top: 50px;">
    <div class="container_self">
        <div class="row">
            <a href="${advertMap["content_gg_bottom"].advertForward}" target="_blank">
                <img src="${base}${advertMap["content_gg_bottom"].advertUrl}" alt="开学那点事">
            </a>
        </div>
    </div>
</div>

<@footer>
<script src="${base}/js/silder.js" type="text/javascript"></script>
<script type="text/javascript" src="${base}/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${base}/js/messages_zh.js"></script>
    <@floating/>
<script>
    $(function () {

        $.ajax({
            url:'${base}/resume/recommend',
            type:'get',
            beforeSend:function () {
                $("#loader").html('<img src="${base}/img/loading.gif" width="50%" style="text-align:center;margin:0 auto;"><p style="color:#999;font-size:14px">加载中，请稍后……</p>')

            },
            error:function () {
                alert("错误");
            },
            success:function (result) {
                $('#loading').fadeOut(1000);
                var html = "";
                for(var i=0;i<result.length;i++){
                    var title=result[i].realName+"("+result[i].gender+")";

                    html+='<li class="recommend"><a href="${base}/resume/info?cvId='+result[i].cvId+'"><h4>'+title+'</h4><p class="re_income">'+result[i].income+'</p><p class="re_district">'+result[i].districtName+'</p></a></li>';
                }
                $("#data").html(html);
            }
        });


        $("#tipForm").validate({
            submitHandler:function (form) {
                $.ajax({
                    url:'${base}/tipInfo',
                    type:'post',
                    data:$("#tipForm").serialize(),
                    success:function (result) {
                        var res=result.split(":");
                        //如果举报成功,关闭模态框,提示举报成功
                        if(res[0]==="ok"){
                            $("#tipInfo").modal('hide');
                            alert(res[1]);
                        }else{
                            alert(res[1]);
                        }
                    }
                })
            }
        });
        $("#loginBtn").click(function () {
            $.ajax({
                url:'/login',
                type:'post',
                data:$("#loginForm").serialize(),
                success:function (result) {
                    var res=result.split(":");
                    if(res[0]=="ok"){
                        window.location.href=res[1];
                    }else{
                        $("error").text(res[1]);
                    }
                }
            })
        })
    });


</script>

</@footer>