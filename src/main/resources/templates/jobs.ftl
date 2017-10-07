<!DOCTYPE HTML>
<html>
<head lang="zh">
    <title>开封城市网招聘</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/menu.css">
</head>
<body>
<#--头部开始 -->
<div class="header-area">
    <div class="container_self">
        <div class="row">
            <div class="col-xs-8">
                <div class="user-menu">
                    <ul>
                        <li><span>欢迎来到开封城市网!</span></li>
                        <li><a href="#"><i class="fa fa-heart"></i> 快速发布信息</a></li>
                        <li><a href="#"><i class="fa fa-user"></i> 修改/删除信息</a></li>
                        <li><a href="#"><i class="fa fa-phone"></i> 手机浏览</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-xs-4">
                <div class="header-right">
                    <ul class="list-unstyled list-inline">
                        <li><a href="#">回首页</a></li>
                        <li><a href="#">注册</a></li>
                        <li><a href="#">登录</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End header area -->

<div class="site-branding-area">
    <div class="container_self" style="width: 1200px;">
        <div class="row">
            <div class="col-sm-3">
                <div class="logo">
                    <h1><a href="/index">开封<span>招聘</span></a></h1>
                </div>
            </div>

            <div class="col-sm-5">
                <div class="search-box">
                    <form action="" method="post">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="输入你感兴趣的职位">
                            <span class="input-group-btn">
                                <button class="btn btn-danger" type="button">搜索</button>
                            </span>
                        </div>
                    </form>
                    <div class="quickClick">
                        <ul>
                            <li><a href="#">小时工</a></li>
                            <li><a href="#">保姆</a></li>
                            <li><a href="#" style="color: red;">厨师</a></li>
                            <li><a href="#">程序员</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="pushing-item">
                    <a href="#"><i class="fa fa-edit"></i>免费发布信息</a>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End site branding area -->

<!--轮播图 -->
<div class="slider_width" id="lunbotu">

    <div class="slider-area">
        <div id="slide-list" class="carousel carousel-fade slide" data-ride="carousel">

            <div class="slide-bulletz">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <ol class="carousel-indicators slide-indicators">
                                <li data-target="#slide-list" data-slide-to="0" class="active"></li>
                                <li data-target="#slide-list" data-slide-to="1"></li>
                                <li data-target="#slide-list" data-slide-to="2"></li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>

            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <div class="single-slide">
                        <div class="slide-bg slide-one"></div>
                        <div class="slide-text-wrapper">
                            <div class="slide-text">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-4 col-md-offset-8">
                                            <div class="slide-content">
                                                <h2>XXXXX公司</h2>
                                                <p>中国最具有影响力的游戏公司</p>
                                                <p>世界第一.</p>
                                                <a href="" class="readmore">加入我们</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="single-slide">
                        <div class="slide-bg slide-two"></div>
                        <div class="slide-text-wrapper">
                            <div class="slide-text">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-4 col-md-offset-8">
                                            <div class="slide-content">
                                                <h2>XXXXX公司</h2>
                                                <p>中国最具有影响力的游戏公司</p>
                                                <p>世界第一.</p>
                                                <a href="" class="readmore">加入我们</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="single-slide">
                        <div class="slide-bg slide-three"></div>
                        <div class="slide-text-wrapper">
                            <div class="slide-text">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-4 col-md-offset-8">
                                            <div class="slide-content">
                                                <h2>XXXXX公司</h2>
                                                <p>中国最具有影响力的游戏公司</p>
                                                <p>世界第一.</p>
                                                <a href="" class="readmore">加入我们</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

</div>

<!-- 下方显示职位类别及搜索-->
<div class="container_self">
    <div class="row">
        <div class="now_position">
            <i class="fa fa-home"></i><a href="/index">开封城市网</a>&nbsp;>&nbsp;<span>招聘</span>
        </div>
        <div class="panel panel_self now_position">
            <div class="panel-body">
                <div class="row" style="border-bottom: 1px #e6e6e6 dashed;">
                    <div class="col-xs-1"><span class="lanmutitle">栏目分类:</span></div>
                    <div class="col-xs-11">
                        <ul class="lanmu_ul">
                            <li class="active" id="notController"><a
                                    href="${request.contextPath}/list?mcId=${currMcId}&districtId=${currDistrictId!""}<#if currTags??&&(currTags?size>0)>&tagId=<#list currTags as ct>${ct.tagId}-${ct.tcId}--</#list></#if>">不限</a>
                            </li>
                        <#list zhaopin as zp>
                            <li id="lanmu${zp.scId}"><a
                                    href="${request.contextPath}/list?mcId=${currMcId}&districtId=${currDistrictId!""}&scId=${zp.scId}<#if currTags??&&(currTags?size>0)>&tagId=<#list currTags as ct>${ct.tagId}-${ct.tcId}--</#list></#if>">${zp.scName}</a>
                            </li>
                        </#list>
                        </ul>
                    </div>
                </div>
            <#list tags as tg>
                <div class="row" style="border-bottom: 1px #e6e6e6 dashed;">
                    <div class="col-xs-1"><span class="lanmutitle">${tg.tagName}:</span></div>
                    <div class="col-xs-11">
                        <ul class="lanmu_ul2">
                            <li class="active" id="tag${tg.tagId}"><a
                                    href="${request.contextPath}/list?mcId=${currMcId}&districtId=${currDistrictId!""}&scId=${currScId!""}&tagId=<#list currTags as ct><#if ct.tagId!=tg.tagId>${ct.tagId}-${ct.tcId}--</#if></#list>">不限</a>
                            </li>
                            <#list tg.tagContents as tagContent>
                                <li id="tagValue${tagContent.tcId}"><a
                                        href="${request.contextPath}/list?mcId=${currMcId}&districtId=${currDistrictId!""}&scId=${currScId!""}&tagId=${tg.tagId}-${tagContent.tcId}<#list currTags as ct><#if ct.tagId!=tg.tagId>--${ct.tagId}-${ct.tcId}</#if></#list>">${tagContent.tcName}</a>
                                </li>
                            </#list>
                        </ul>
                    </div>
                </div>
            </#list>
                <div class="row" style="border-bottom: 1px #e6e6e6 dashed;">
                    <div class="col-xs-1"><span class="lanmutitle">地点:</span></div>
                    <div class="col-xs-11">
                        <ul class="lanmu_ul2">
                            <li class="active" id="districtNo"><a
                                    href="${request.contextPath}/list?mcId=${currMcId}&scId=${currScId!""}<#if currTags??&&(currTags?size>0)>&tagId=<#list currTags as ct>${ct.tagId}-${ct.tcId}--</#list></#if>">不限</a>
                            </li>
                        <#list districts as ds>
                            <li id="district${ds.districtId}"><a
                                    href="${request.contextPath}/list?mcId=${currMcId}&scId=${currScId!""}&districtId=${ds.districtId}<#if currTags??&&(currTags?size>0)>&tagId=<#list currTags as ct>${ct.tagId}-${ct.tcId}--</#list></#if>">${ds.districtName}</a>
                            </li>
                        </#list>
                        </ul>
                    </div>
                </div>
            </div>
        </div>


        <div class="now_position">
            <div class="panel panel_self">
                <div class="panel-heading"><h4>开封招聘</h4></div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-11">
                        <#if pushInfos??&&(pushInfos?size>0)>
                            <#list pushInfos as pushInfo>
                                <div class="row hover_info">
                                    <div class="col-xs-5 padding-top1">
                                        <div class="info_title"><a href="#">${pushInfo.piTitle}</a></div>
                                        <#list pushInfo.tagValues as tagValue>
                                            <#if tagValue.tagName=='月薪'>
                                                <span class="label label-danger">${tagValue.tcName}&nbsp;元/月</span>
                                            <#else>
                                                <span class="label label-success">${tagValue.tcName}</span>
                                            </#if>

                                        </#list>
                                    </div>
                                    <div class="col-xs-3 padding_top">
                                        <#if pushInfo.otherInfos??&&(pushInfo.otherInfos?size>0)>
                                            <#list pushInfo.otherInfos as otherInfo>
                                                <#if otherInfo.picName??&&otherInfo.picName='公司名称'>
                                                    <span>${otherInfo.pcContent}</span>
                                                </#if>
                                            </#list>
                                        </#if>
                                        <#if currMcId??&&currMcId!=1>
                                            <span>${pushInfo.piContactPerson}</span>
                                        </#if>
                                    </div>
                                    <div class="col-xs-2 padding_top">
                                        <span>${(pushInfo.piDistrictName)!""}</span>
                                    </div>
                                    <div class="col-xs-2 padding_top">
                                        <span class="info_yuan">${(pushInfo.piPushDate)!""}</span>
                                    </div>
                                </div>
                            </#list>
                        <#else>
                            <div class="row hover_info">
                                <span>抱歉，暂时没有符合该条件的职位，请重新修改搜索条件后再搜索、筛选</span>
                            </div>
                        </#if>
                        </div>
                        <!-- 广告位-->
                        <div class="col-xs-1"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<#-- 页脚-->
<div class="footerPage" style="margin-top: 30px;background: none repeat scroll 0 0 #f4f4f4;">
    <div class="container_self">
        <div class="row">
            <div class="col-xs-3">
                <div class="logo">
                    <h1><a href="/index">开封<span>城市网</span></a></h1>
                </div>
            </div>
            <div class="col-xs-2">
                <div style="list-style: none">
                    <h4>关于我们</h4>
                    <li><p>本站公告</p></li>
                    <li><p>加盟与合作</p></li>
                    <li><p>网站地图</p></li>

                </div>
            </div>

            <div class="col-xs-2">
                <div style="list-style: none">
                    <h4>服务支持</h4>
                    <li><p>推广服务</p></li>
                    <li><p>渠道招商</p></li>
                    <li><p>举报平台</p></li>

                </div>
            </div>
            <div class="col-xs-2">
                <div style="list-style: none">
                    <h4>帮助中心</h4>
                    <li><p>常见问题</p></li>
                    <li><p>更多帮助</p></li>
                    <li><p>意见反馈</p></li>
                    <li><p>隐私权条款</p></li>
                </div>
            </div>
            <div class="col-xs-3">
                <div style="list-style: none">
                    <img src="img/二维码.png" alt="扫码访问手机版">
                </div>
            </div>
        </div>
        <div class="row">
            <p style="text-align: center">Copyright © 河南开封 ｜xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx所有</p>
            <p style="text-align: center">河南大学网站工作室</p>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/menu.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>
<#if currScId??||currDistrictId??||(currTags?size>0)>
<script type="text/javascript">
    $(function () {
        $("#lunbotu").css("display", "none");
    });
</script>
}
</#if>
<#if currScId??>
<script type="text/javascript">
    $(function () {
        $("#notController").removeClass("active");
        $("#lanmu${currScId}").addClass("active");
    });
</script>
</#if>
<#if currDistrictId??>
<script type="text/javascript">
    $(function () {
        $("#districtNo").removeClass("active");
        $("#district${currDistrictId}").addClass("active");
    })
</script>
</#if>
<script type="text/javascript">
    <#list currTags as ct>
    $(function () {
        $("#tag${ct.tagId}").removeClass("active");
        $("#tagValue${ct.tcId}").addClass("active");
    });
    </#list>
</script>
</body>
</html>