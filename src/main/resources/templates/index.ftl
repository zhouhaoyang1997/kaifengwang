<#include "public/default.ftl">
<@header title="首页">
<link rel="stylesheet" href="${base}/css/style.css">
<link rel="stylesheet" href="${base}/css/menu.css">
</@header>
<#--头部开始 -->
<@headerArea>
</@headerArea>

<#-- 广告-->
<div class="advert">
    <div class="container_self">
        <div class="gg_box" style="background:url(${request.contextPath}/img/index_gg.jpg) no-repeat">
        </div>
    </div>
</div>

<div class="site-branding-area">
    <div class="container_self">
        <div class="row">
            <div class="col-sm-3">
                <div class="logo">
                    <h1>
                        <img src="${base}/img/kflogo2.png" width="60" height="60" alt="网站logo"><a href="${base}/index">开封<span>麦芒网</span></a></h1>
                </div>
            </div>

            <div class="col-sm-6">
                <div class="search-box">
                    <form action="" method="post">
                        <div class="input-group">
                            <input type="text" class="form-control search_box" placeholder="输入你感兴趣信息">
                            <span class="input-group-btn" >
                                <button class="btn btn_search"  type="button">搜索</button>
                            </span>
                        </div>
                    </form>
                    <div class="quickClick">
                        <ul>
                            <li><a href="#">丽人坊</a></li>
                            <li><a href="#">找宠物</a></li>
                            <li><a href="#" style="color: red;">农家乐</a></li>
                            <li><a href="#">名车4s店</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="pushing-item">
                    <a href="${base}/push/choose"><i class="fa fa-edit"></i>免费发布信息</a>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End site branding area -->
<#-- 菜单栏-->
<div class="mainmenu-area">
    <div class="container_self" style="width: 1200px;">
        <div class="row">
            <ul class="megamenu skyblue">
                <li class="active grid">
                    <a class="color1" href="/index">首页</a>
                </li>
                <li class="grid"><a class="color1" href="${base}/list?mcId=1">招聘<span class="caret"></span></a>
                    <div class="megapanel">
                        <ul class="menu_ul">
                            <#list zhaopin as zp>
                                <li><a href="${base}/list?mcId=1&scId=${zp.scId}">${zp.scName}</a></li>
                            </#list>
                        </ul>
                    </div>
                </li>
                <li class="grid"><a class="color1" href="${base}/list?mcId=3">二手市场<span class="caret"></span></a>
                    <div class="megapanel">
                        <ul class="menu_ul">
                        <#list ershou as es>
                            <li><a href="${base}/list?mcId=3&scId=${es.scId}">${es.scName}</a></li>
                            </#list>
                        </ul>
                    </div>
                </li>
                <li><a class="color1" href="${base}/list?mcId=2">房产信息<span class="caret"></span></a>
                    <div class="megapanel">
                        <ul class="menu_ul">
                        <#list fangchan as fc>
                            <li><a href="${base}/list?mcId=2&scId=${fc.scId}">${fc.scName}</a></li>
                            </#list>
                        </ul>
                    </div>
                </li>
                <li><a class="color1" href="${base}/list?mcId=4">生活服务<span class="caret"></span></a>
                    <div class="megapanel">
                        <ul class="menu_ul">
                        <#list shenghuo as sh>
                            <li><a href="${base}/list?mcId=4&scId=${sh.scId}">${sh.scName}</a></li>
                            </#list>
                        </ul>
                    </div>
                </li>
                <li><a class="color1" href="#">名企招聘</a></li>
                <li><a class="color1" href="#">求职简历</a></li>
            </ul>
        </div>
    </div>
</div> <!-- End mainmenu area -->

<#-- 主功能模块-->
<div class="mainPage">
    <div class="container_self" style="width:1200px;">
        <div class="row">
            <div class="col-xs-8">
                <div class="panel panel_self">
                    <div class="panel-body">
                        <div class="row iconDiv">
                            <div class="col-xs-2">
                                <a href="${base}/list?mcId=1" target="_blank">
                                <div>
                                    <img src="img/zp_icon.png" width="55px" height="55px" alt="">
                                </div>
                                <p>招聘</p></a>
                            </div>
                            <div class="col-xs-2">
                                <a href="${base}/list?mcId=3" target="_blank">
                                <div>
                                    <img src="img/kf_ershou.png" width="55px" height="55px" alt="">
                                </div>
                                <p>二手市场</p></a>
                            </div>
                            <div class="col-xs-2">
                                <a href="${base}/list?mcId=2" target="_blank">
                                <div>
                                    <img src="img/kf_fangchan.png" width="55px" height="55px" alt="">
                                </div>
                                <p>房产</p></a>
                            </div>
                            <div class="col-xs-2">
                                <a href="${base}/list?mcId=4" target="_blank">
                                <div>
                                    <img src="img/kf_shenghuo.png" width="55px" height="55px" alt="">
                                </div>
                                <p>生活服务</p></a>
                            </div>
                            <div class="col-xs-2">
                                <a href="${base}/list?mcId=5" target="_blank">
                                <div>
                                    <img src="img/kf_mingshi.png" width="55px" height="55px" alt="">
                                </div>

                                <p>名师培优</p></a>
                            </div>
                            <div class="col-xs-2">
                                <a href="${request.contextPath}/list?mcId=6" target="_blank">
                                <div>
                                    <img src="img/jz.png" width="55px" height="55px" alt="">
                                </div>
                                <p>名企招聘</p></a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="col-xs-4">
                <div class="panel panel_self">
                    <div class="panel-heading row">
                        <div class="col-sm-4"><h4 style="color: #00AAFF">推广服务</h4></div>
                        <div class="col-sm-8"><span style="float: right">置顶推广效果将提升 <span style="color: #ff552e;">10</span> 倍以上</span></div>
                    </div>
                    <div class="panel-body">
                        <span class="label label-info"><a href="${base}/about/attc">公司认证</a></span>
                        <span class="label label-success"><a href="${base}/about/service">大类置顶</a></span>
                        <span class="label label-warning"><a href="${base}/about/service">竞价排行</a></span>
                    </div>
                </div>
            </div>
        </div>


        <div class="row">
            <div class="col-xs-2">
                <div class="panel panel_self">
                    <div class="panel-heading">
                        <h4><a href="${base}/list?mcId=2">房产信息</a></h4>
                    </div>
                    <div class="panel-body">
                        <ul class="list_clear">
                        <#list fangchan as fc>
                            <li><a href="${base}/list?mcId=2&scId=${fc.scId}">${fc.scName}</a></li>
                        </#list>
                        </ul>
                        <div class="gg_img">
                            <img src="${base}/img/gg_fz.jpg" class="img-thumbnail" style="width: 170px;height: 400px" alt="">
                        </div>
                    </div>
                </div>

            </div>
            <div class="col-xs-2">
                <div class="panel panel_self">
                    <div class="panel-heading"><h4><a href="${base}/list?mcId=3">二手市场</a></h4></div>
                    <div class="panel-body">
                        <ul class="list_clear">
                        <#list ershou as es>
                            <li><a href="${base}/list?mcId=3&scId=${es.scId}">${es.scName}</a></li>
                        </#list>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-xs-4">
                <div class="panel panel_self">
                    <div class="panel-heading"><h4><a href="${base}/list?mcId=1">招聘</a></h4></div>
                    <div class="panel-body" >
                        <ul class="list_clear">
                        <#list zhaopin as zp>
                            <li><a href="${base}/list?mcId=1&scId=${zp.scId}">${zp.scName}</a></li>
                        </#list>
                        </ul>
                        <div class="gg_img">
                            <img src="${base}/img/gg_zp.png" class="img-thumbnail" style="width: 350px;height: 100px" alt="">
                        </div>
                    </div>
                </div>

                <div class="panel panel_self">
                    <div class="panel-heading"><h4><a href="${request.contextPath}/list?mcId=6">名企招聘</a></h4></div>
                    <div class="panel-body" >
                        <ul class="list_clear">
                        <#list mingqi as mq>
                            <li><a href="${base}/list?mcId=6&scId=${mq.scId}">${mq.scName}</a></li>
                        </#list>

                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-xs-4">
                <div class="panel panel_self">
                    <div class="panel-heading"><h4><a href="${base}/list?mcId=4">生活服务</a></h4></div>
                    <div class="panel-body">
                        <ul class="list_clear" style="min-height: 280px;float: left;">
                        <#list shenghuo as sh>
                            <li style="margin-right: 10px;"><a href="${base}/list?mcId=4&scId=${sh.scId}">${sh.scName}</a></li>
                        </#list>
                        </ul>
                        <div class="gg_img">
                            <img src="${base}/img/ul_gg.png" class="img-thumbnail" style="width: 350px;height: 100px" alt="">
                        </div>
                    </div>
                </div>

                <div class="panel panel_self">
                    <div class="panel-heading"><h4><a href="${base}/list?mcId=5">名师培优</a></h4></div>
                    <div class="panel-body">
                        <ul class="list_clear">
                        <#list chongwu as cw>
                            <li><a href="${base}/list?mcId=5&scId=${cw.scId}">${cw.scName}</a></li>
                        </#list>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<#-- 广告-->
<div class="advert">
    <div class="container">
        <div class="row">
            <img src="${base}/img/advert.jpg" alt="开学那点事">
        </div>
    </div>
</div>
<@footer>
<script type="text/javascript" src="${base}/js/menu.js"></script>
<script src="${base}/js/owl.carousel.min.js"></script>
<script src="${base}/js/main.js"></script>
</@footer>