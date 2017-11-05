<#include "public/default.ftl">
<#assign base="${request.contextPath}"/>
<@header title="麦芒网求职简历">
<link rel="stylesheet" href="${base}/css/style.css">
<link rel="stylesheet" href="${base}/css/menu.css">
<link rel="stylesheet" href="${base}/css/list.css">
</@header>

<@headerArea>
<li><a href="${base}/index">回首页</a></li>
</@headerArea>

<#-- 广告-->
<div class="advert">
    <div class="container_self">
        <div class="gg_box" style="background:url(${request.contextPath}/img/advert.jpg) no-repeat">
        </div>
    </div>
</div>

<#macro url>${base}/resume/list</#macro>
<@searchArea>
<h1><a href="${base}/index">开封<span>求职简历</span></a></h1>
</@searchArea>



<!-- 下方显示职位类别及搜索-->
<div class="container_self">
    <div class="now_position">
        <i class="fa fa-home"></i><a href="/index">开封城市网</a>&nbsp;>&nbsp;<span>求职简历</span>
    </div>
    <div class="panel panel_self now_position" >
        <div class="panel-body">
            <div class="row" style="border-bottom: 1px #e6e6e6 dashed;">
                <div class="col-xs-1"><span class="lanmutitle">栏目分类:</span></div>
                <div class="col-xs-11">
                    <ul class="lanmu_ul">
                        <li class="active" id="notController"><a href="<@url><#if currDistrictId??>?districtId=${currDistrictId}</#if></@url>">不限</a></li>
                    <#list secondClass as sc>
                        <li id="lanmu${sc.scId}"><a href="<@url>?scId=${sc.scId}<#if currDistrictId??>&districtId=${currDistrictId}</#if></@url>">${sc.scName}</a></li>
                    </#list>
                    </ul>
                </div>
            </div>
            <div class="row" style="border-bottom: 1px #e6e6e6 dashed;">
                <div class="col-xs-1"><span class="lanmutitle">地点:</span></div>
                <div class="col-xs-11">
                    <ul class="lanmu_ul2">
                        <li class="active" id="districtNo"><a href="<@url><#if currScId??>?scId=${currScId}</#if></@url>">不限</a></li>
                    <#list districts as ds>
                        <li id="district${ds.districtId}"><a href="<@url><#if currScId??>?scId=${currScId}</#if>&districtId=${ds.districtId}</@url>">${ds.districtName}</a></li>
                    </#list>
                    </ul>
                </div>
            </div>
            <div class="row" style="border-bottom: 1px #e6e6e6 dashed;">
                <div class="col-xs-1"><span class="lanmutitle">学历:</span></div>
                <div class="col-xs-11">
                    <ul class="lanmu_ul2">
                        <li><a href="">不限</a></li>
                        <li><a href="">初中</a></li>
                        <li><a href="">高中/中专</a></li>
                        <li><a href="">大专</a></li>
                        <li><a href="">本科</a></li>
                        <li><a href="">硕士</a></li>
                    </ul>
                </div>
            </div>

            <div class="row" style="border-bottom: 1px #e6e6e6 dashed;">
                <div class="col-xs-1"><span class="lanmutitle">性别:</span></div>
                <div class="col-xs-11">
                    <ul class="lanmu_ul2">
                        <li><a href="">不限</a></li>
                        <li><a href="">男</a></li>
                        <li><a href="">女</a></li>
                    </ul>
                </div>
            </div>

        </div>
    </div>


    <div class="now_position">
        <div class="panel panel-default">
            <div class="panel-heading ">
                <div class="row">
                    <div class="col-xs-8">
                        <h4 style="color: #ff552e;">开封求职简历</h4>
                    </div>
                    <div class="col-xs-4">
                        <span>您知道吗？ <a href="${base}/about/service" style="color: #ff552e">置顶</a>发布的信息可使成交率提高50%！</span>
                    </div>
                </div>
            </div>
            <div class="panel-body" style="min-height: 1000px;">
                <div class="row">
                    <div class="col-xs-10">
                        <div class="row hover_info">
                            <div class="col-xs-4 padding-top1">
                                <div class="info_title "><strong>求职位</strong></div>
                            </div>
                            <div class="col-xs-2 padding_top">
                                <strong>性别</strong>
                            </div>
                            <div class="col-xs-2 padding_top">
                                <strong>工作年限</strong>
                            </div>
                            <div class="col-xs-2 padding_top">
                                <strong>学历</strong>
                            </div>
                            <div class="col-xs-2 padding_top">
                                <strong>更新时间</strong>
                            </div>
                        </div>
                    <#list resumes as resume>
                        <div class="row hover_info">
                            <div class="col-xs-4 padding-top1">
                                <div class="info_title">${resume.realName}</div>
                                <span class="label label-info">${resume.scName}</span>
                                <span class="label label-success">${resume.districtName}</span>
                            </div>
                            <div class="col-xs-2 padding_top">
                                ${resume.gender}
                            </div>
                            <div class="col-xs-2 padding_top">
                                ${resume.jobYear}
                            </div>
                            <div class="col-xs-2 padding_top">
                                ${resume.maxEdu}
                            </div>
                            <div class="col-xs-2 padding_top">
                                ${resume.updateTime?string("yyyy-MM-dd")}
                            </div>
                        </div>
                    </#list>
                    </div>

                    <!-- 广告位-->
                    <div class="col-xs-2">
                        <img src="${base}/img/advert/gg_fz.jpg" class="img-thumbnail" style="width: 170px;height: 600px" alt="">
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="col-md-offset-2 col-xs-8">
                    <div class="container">
                        <div id="kkpager"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>




<@footer>
<script src="${base}/js/hhshare.js"></script>
<script type="text/javascript" src="${base}/js/kkpager.min.js"></script>
<script type="text/javascript">

    function getParameter(name) {
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r!=null) return unescape(r[2]); return null;
    }

    //init
    $(function(){
        //回到顶部
        $.goup({
            trigger: 100,
            bottomOffset: 150,
            locationOffset: 100,
            title: '回到顶部',
            titleAsText: true
        });



        var totalPage = ${pageUtil.pageNums};
        var totalRecords = ${pageUtil.total};
        var pageNo = getParameter('pno');
        if(!pageNo){
            pageNo = 1;
        }
        //生成分页
        //有些参数是可选的，比如lang，若不传有默认值
        kkpager.generPageHtml({
            pno : pageNo,
            //总页码
            total : totalPage,
            //总数据条数
            totalRecords : totalRecords,
            //链接前部
            hrefFormer : '<@url></@>',
            //链接尾部
            hrefLatter : '',
            getLink : function(n){
                return this.hrefFormer + this.hrefLatter + "&pno="+n;
            }
        });
    });
</script>
</@footer>