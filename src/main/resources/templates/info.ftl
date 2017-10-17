<#include "public/default.ftl">
<#assign base="${request.contextPath}"/>
<@header title="开封网招聘">
<link rel="stylesheet" href="${base}/css/style.css">
<link rel="stylesheet" href="${base}/css/menu.css">
<link rel="stylesheet" href="${base}/css/info.css">

</@header>
<@headerArea>
<li><a href="${base}/index">回首页</a></li>
</@headerArea>

<div class="container_self">
    <div class="row">
        <div class="col-md-3">
            <div class="logo">
                <h1><a href="${base}/index">开封<span>${info.mcName!""}</span></a></h1>
            </div>
        </div>
        <div class="col-md-7"></div>
        <div class="col-md-2">
            <div style="margin-top:15px">
                <button onclick="" class="btn btn-info">发布信息</button>
                <#if info.mcName="招聘">
                    <button onclick="" class="btn btn-info">登记简历</button>
                </#if>
            </div>
        </div>
    </div>
</div>

<div class="container_self">
    <div class="row">
        <div class="now_position">
            <i class="fa fa-home"></i><a href="/index">开封城市网</a>&nbsp;>&nbsp;<a href="/list?mcId=${info.piMc}">${info.mcName}</a>&nbsp;>&nbsp;<a href="/list?mcId=${info.piMc}&scId=${info.piSc}">${info.scName}</a>
        </div>
    </div>
    <div class="row">
        <div class="info_box">
            <div class="row">
                <div class="col-md-4 push_base_static">
                    <span>发布时间:${info.piPushDate?string("yyyy-MM-dd")}</span> <span>浏览量:${info.piScan}</span>
                </div>
                <div class="col-md-4"></div>
                <div class="col-md-4 push_base_static">
                    <span id="collect">
                        <#if collected>
                            <i class="fa fa-calendar"></i> 已收藏
                        <#else>
                            <a href="javascript:;" style="margin-right: 0;" id="collect_a"><i class="fa fa-calendar"></i> 收藏</a>
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
                    <h1>${info.piTitle}</h1>
                </div>
            </div>
            <div class="row push_base_data">
                <div class="col-md-7">
                    <div>
                        <!-- 轮播（Carousel）内容 -->
                        <div class="carousel-inner">

                            <div class="imgnav" id="imgnav">
                                <div id="img">
                                <#if info.piImg??>
                                    <#list info.piImg?split("#") as piImg>
                                            <img src="${base}/${piImg}" class="img-thumbnail" width="100%" height="400"/>
                                    </#list>
                                <#else>
                                    <img src="${base}/img/noimage.png" class="img-thumbnail" width="100%" height="400"/>
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
                <div class="col-md-5">
                    <table class="push_base_list">
                    <#list info.tagValues as tv>
                        <tr>
                            <td class="tag_name">${tv.tagName}&nbsp;</td><td class="tag_content">:&nbsp;${tv.tcName}</td>
                        </tr>
                    </#list>
                        <#list info.otherInfos as oi>
                        <tr>
                            <td class="tag_name">${oi.picName}&nbsp;</td><td class="tag_content">:&nbsp;${oi.pcContent}</td>
                        </tr>
                        </#list>
                        <tr><td class="tag_name">地区&nbsp;</td><td class="tag_content">:&nbsp;${info.piDistrictName}</td></tr>
                    </table>
                </div>
            </div>
            <div class="row push_base_other">
                <div class="col-md-8">
                    <p>联系人: <span style="margin-left: 30px;">${info.piContactPerson}</span></p>
                    <p>联系电话: <span style="margin-left: 30px;">${info.piPhone}</span></p>
                <#if info.piQq??>
                    <p>qq: <span style="margin-left: 30px;">${info.piQq}</span></p>
                </#if>
                    <p>详细地址: <span style="margin-left: 30px;">${info.piAddress}</span></p>
                </div>
                <div class="col-md-4 jinggao">
                    <img src="${base}/img/warning.png" width="30px" height="30px"><span style="font-size: 16px">开封城市网提醒你：</span>让你提前汇款，或者价格明显低于市价，均有骗子嫌疑，不要轻易相信。
                </div>
            </div>
        </div>

        <div class="person_box">

        <#if infoUser.userImg??>
            <img src="${base}/${infoUser.userImg}" class="img-circle touxiang" alt="">
        <#else>
            <img src="${base}/img/noimage.png" class="img-circle touxiang" alt="">
        </#if>
            <h4 style="text-align: center">${info.piUser}</h4>
            <h5 style="text-align: center">${infoUser.createTime?datetime}注册</h5>
        </div>
    </div>
    <div class="row">
        <div class="panel info_box">
            <div class="panel-heading"><h3>信息描述</h3></div>
            <div class="panel-body">
                ${info.piContent}
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
<script>
    $(function () {
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