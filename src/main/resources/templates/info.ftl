<#include "public/default.ftl">
<#assign base="${request.contextPath}"/>
<@header title="麦芒网">
<link rel="stylesheet" href="${base}/css/style.css">
<link rel="stylesheet" href="${base}/css/menu.css">
<link rel="stylesheet" href="${base}/css/info.css">
</@header>
<@headerArea>
<li><a href="${base}/index">回首页</a></li>
</@headerArea>

<div style="background: #ff552e">
    <div class="container_self">
        <div class="row">
            <div class="col-md-4">
                <div class="info_logo">
                    <h1><img src="/img/kflogo2_rev.png" width="48" height="48" alt="网站logo"><a href="${base}/index">开封<span>${info.mcName!""}</span></a></h1>
                </div>
            </div>
            <div class="col-md-3"><span style="margin-top: 15px;font-size:20px;color: #fff;float: left;">--专业的信息服务平台</span><span style="color: #fff;float: left;">全新升级,新品牌,新服务</span></div>
            <div class="col-md-offset-3 col-md-2">
                    <a href="${base}/push/choose" class="btn push_btn">发布信息</a>
                <#if info.mcName="招聘">
                    <a href="${base}/user/resume" class="btn push_btn">登记简历</a>
                </#if>
            </div>
        </div>
    </div>
</div>


<div class="container_self" style="margin-bottom: 30px;">
    <div class="row">
        <div class="now_position">
            <i class="fa fa-home"></i><a href="/index">开封城市网</a>&nbsp;>&nbsp;<a href="/list?mcId=${info.piMc}">${info.mcName}</a>&nbsp;>&nbsp;<a href="/list?mcId=${info.piMc}&scId=${info.piSc}">${info.scName}</a>
        </div>
    </div>
    <div class="row">
        <div class="col-md-9 self_left">
            <div class="row">
                <div class="col-md-4 push_base_static">
                    <span>发布时间:${info.piPushDate?string("yyyy-MM-dd")}</span> <span>浏览量:${info.piScan}</span>
                </div>
                <div class="col-md-4"></div>
                <div class="col-md-4 push_base_static">
                    <span id="collect">
<#if Session.user??>
    <#if collected>
        <i class="fa fa-calendar"></i> 已收藏
    <#else>
        <a href="javascript:;" style="margin-right: 0;" id="collect_a"><i class="fa fa-calendar"></i> 收藏</a>
    </#if>
    <#else>
        <a href="#myModal" style="margin-right: 0;" data-toggle="modal"><i class="fa fa-calendar"></i> 收藏</a>
</#if>


                    </span>
                <#if Session.user??>
                    <a href="#tipInfo" data-toggle="modal"><i class="fa fa-hand-paper-o"></i> 举报</a>
                <#else>
                    <a href="#myModal" data-toggle="modal"><i class="fa fa-hand-paper-o"></i> 举报</a>
                </#if>   <a href="${base}/about/service" style="color:red;"><i class="fa fa-level-up"></i>推广服务</a>
                </div>
            </div>
            <div class="row push_base_title">
                <div class="col-md-8">
                    <h1><#if info.piTitle?length gt 13>${info.piTitle[0..14]}...<#else>${info.piTitle}</#if></h1>
                </div>
            </div>
            <div class="row push_base_data">
                <div class="col-md-7">
                    <div>
                        <!-- 轮播（Carousel）内容 -->
                        <div class="carousel-inner">
                            <div id="wrapper">
                                <!--滚动看图-->
                                <div id="picSlideWrap" class="clearfix">
                                    <div class="imgnav" id="imgnav">
                                        <div id="img">
                                        <#if info.piImg??>
                                            <#list info.piImg?split("#") as piImg>
                                                    <img src="${base}/${piImg}" class="img-thumbnail" width="522px" height="400px"/>
                                            </#list>
                                        <#else>
                                            <img src="${base}/img/noimage.png" class="img-thumbnail" width="522px" height="400px"/>
                                        </#if>
                                            <div id="front" title="上一张"><a href="javaScript:void(0)" class="pngFix"></a></div>
                                            <div id="next" title="下一张"><a href="javaScript:void(0)" class="pngFix"></a></div>
                                        </div>
                                        <div id="cbtn">
                                            <i class="picSildeLeft"><img src="${base}/img/picSlideLeft.gif"/></i>
                                            <i class="picSildeRight"><img src="${base}/img/picSlideRight.gif"/></i>
                                            <div id="cSlideUl">
                                                <ul>
                                                <#if info.piImg??>
                                                    <#list info.piImg?split("#") as piImg>
                                                        <li><img src="${base}/${piImg}" class="img-thumbnail" /></li>
                                                    </#list>
                                                <#else>
                                                    <li><img src="${base}/img/noimage.png" class="img-thumbnail" /></li>
                                                </#if>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-5" >
                    <ul class="list-unstyled self_ul_1" style="min-height: 420px">
                        <li>
                            <span>联系人:&nbsp; </span>
                            <span>${info.piContactPerson}</span>
                        </li>
                        <li>
                            <span>联系电话:&nbsp; </span>
                            <span><span class="contact_method">${info.piPhone?replace(info.piPhone?substring(7,11),"****")}</span></span>
                        </li>
                        <li>
                            <span></span>
                            <span><a class="btn btn-danger" href="#completedNum" data-toggle="modal">点击查看完整号码</a></span>
                        </li>
                        <li>
                            <span>qq:&nbsp; </span>
                            <span>${info.piQq}</span>
                        </li>
                        <li>
                            <span>详细地址:&nbsp; </span>
                            <span>${info.piAddress}asdsadsadasdasdas</span>
                        </li>
                    </ul>
                    <div class="alert alert-danger alert-dismissable" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>

                        <img src="${base}/img/warning.png" width="30px" height="30px"><span style="font-size: 16px">开封城市网提醒你：</span>让你提前汇款，或者价格明显低于市价，均有骗子嫌疑，不要轻易相信。
                    </div>
                </div>
            </div>
            <div class="push_base_other row">
                <div class="col-md-10">
                    <ul class="list-unstyled self_ul">
                        <li><span class="s_title">地区:</span ><span class="s_content">${info.piDistrictName}</span></li>
                        <#list info.tagValues as tv>
                            <li><span class="s_title">${tv.tagName}:</span><span class="s_content">${tv.tcName}</span></li>
                        </#list>
                        <#list info.otherInfos as oi>
                            <li><span class="s_title">${oi.picName}:</span><span class="s_content">${oi.pcContent}</span></li>
                        </#list>
                    </ul>
                </div>

            </div>

            <div class="panel panel-self">
                <div class="panel-heading"><h3>信息描述</h3></div>
                <div class="panel-body">
                ${info.piContent}
                </div>
            </div>
            <#if company??>
                <div class="panel panel-self">
                    <div class="panel-heading"><h3>公司介绍</h3></div>
                    <div class="panel-body">
                        <h3>${company.cpName}</h3>
                        <p>${company.cpDescription!""}</p>
                    </div>
                </div>
            </#if>
        </div>
        <div class="col-md-3" >
            <div style="background: #fff;padding: 30px 0 20px 0;">
                <div align="center">
                    <#if infoUser.userImg??>
                        <img src="${base}/${infoUser.userImg}" class="img-circle img-thumbnail" alt="">
                    <#else>
                        <img src="${base}/img/noimage.png" class="img-circle img-thumbnail" alt="">
                    </#if>
                </div>
                <h4 style="margin-top: 20px;text-align: center">${info.piUser}</h4>
                <#if company??>
                    <p style="text-align: center;background: url(img/attc.png) no-repeat 80px;padding-left: 24px"> 已公司认证</p>
                <#else>
                    <p style="text-align: center;background: url(img/attc_none.png) no-repeat 80px;padding-left: 24px"> 未公司认证</p>
                </#if>

                <h5 style="text-align: center">${infoUser.createTime?string("yyyy-MM-dd")}注册</h5>
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
                            <img src="${base}/img/123.jpg" width="306px" alt="...">
                        </div>
                        <div class="item">
                            <img src="${base}/img/123.jpg" width="306px" alt="...">
                        </div>
                    </div>

                </div>
            </div>
            <div class="panel panel-self" style="border: none;">
                <div class="panel-heading">
                    <h3 style="border-left: 5px solid #ff552e;padding-left: 10px;">同类信息推荐</h3>
                </div>
                <div class="panel-body" style="min-height: 350px;">
                    <ul class="list-unstyled" id="data">
                        <div id="loader" style="width: 80px;height: 80px;" ></div>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="completedNum" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">

            <div class="modal-content">
                <div class="modal-body">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <div class="container logo_login">
                        <p >查看联系方式</p>
                    </div>

                    <div class="container alterInfo">
                        <span>联系时,就说是在开封城市网看到的。谢谢!</span>
                    </div>
                    <div class="container phoneNum">
                        <img src="${base}/img/phone.png" alt="手机图标" width="60px" height="60px">
                        <span>${info.piPhone}</span>
                    </div>
                    <div class="person_contact" style="margin-top: 10px;">
                        <p style="text-align: center">联系人:${info.piContactPerson}</p>
                    </div>
                </div>
                <div class="modal-footer"><span>期待您对此信息满意!</span></div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <div class="container logo_login">
                        <h1>开封<span>城市网</span></h1>
                        <p >欢迎你的登陆</p>
                    </div>
                    <div class="container loginForm">
                        <form action="${base}/login" method="post">
                            <div class="form-group">
                                <input type="text" class="form-control" name="userName" placeholder="用户名">
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" name="userPassword" placeholder="密码">
                            </div>
                            <span style="color:red">${error!""}</span>
                            <div class="form-group">
                                <label for="remember"><input type="checkbox" name="remember" value="true" id="remember">记住我?</label>
                            </div>
                            <div class="form-group">
                                <p>没有账号? <a href="${base}/register">注册</a> | <a href="javascript:;">忘记密码?</a></p>
                            </div>
                            <div class="row">
                                <div class="col-xs-9">
                                    <div class="form-group" style="margin-top:20px">
                                        <input type="submit" value="登录" style="width: 100px" class="btn btn-danger">
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
                                <input type="text" readonly class="form-control"  name="piId"  value="${info.piId}">
                            </div>

                            <div class="form-group">
                                <label for="">举报信息</label>
                                <input type="text" disabled class="form-control" name="piTitle"  value="${info.piTitle}">
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
<@footer>
<script src="${base}/js/silder.js" type="text/javascript"></script>
<script type="text/javascript" src="${base}/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${base}/js/messages_zh.js"></script>
<script type="text/javascript" src="${base}/js/jquery.shCircleLoader.js"></script>
    <@floating/>
<script>
    $(function () {

        $.ajax({
            url:'${base}/info/recommend?mcId=${info.piMc}&scId=${info.piSc}',
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
                    var title=result[i].piTitle;
                    if(title.length>13){
                        title=result[i].piTitle.substr(0,13);
                    }
                    html+='<li class="recommend"><a href="${base}/info?piId='+result[i].piId+'"><h4>'+title+'</h4><p class="re_income">'+result[i].piUser+'</p><p class="re_district">'+result[i].piDistrictName+'</p></a></li>';
                }
                $("#data").html(html);
            }
        });

        $("#collect_a").click(function () {
            $.ajax({
                url:'${base}/collect?piId=${info.piId}',
                type:'get',
                success:function (result) {
                    var res=result.split(":");
                    if(res[0]==="ok"){
                        $("#collect").html('<i class="fa fa-calendar"></i> 已收藏');
                    }else{
                        alert(res[1]);
                    }
                }
            })
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
    });


</script>

</@footer>