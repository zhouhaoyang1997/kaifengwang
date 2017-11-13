<#include "public/default.ftl">
<#assign base="${request.contextPath}"/>
<@header title="麦芒网求职简历">
<link rel="stylesheet" href="${base}/css/style.css">
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

<@searchArea>
<h1><img src="/img/kflogo2.png" width="48" height="48" alt="网站logo"><a href="${base}/index">开封<span>求职简历</span></a></h1>
</@searchArea>



<!-- 下方显示职位类别及搜索-->
<div class="container_self">
    <div class="now_position">
        <i class="fa fa-home"></i><a href="/index">开封城市网</a>&nbsp;>&nbsp;<span>求职简历</span>
    </div>
    <div class="panel panel_self now_position" >
        <div class="panel-body">
            <div class="row info_tag">
                <div class="col-xs-1"><span class="lanmutitle">栏目分类:</span></div>
                <div class="col-xs-11">
                    <ul class="lanmu_ul2">
                        <li class="active" id="notController"><a href="${base}/resume/list<#if resumeMin.districtId??>?districtId=${resumeMin.districtId}</#if>">不限</a></li>
                    <#list secondClass as sc>
                        <li id="lanmu${sc.scId}"><a href="${base}/resume/list?dreamWork=${sc.scId}<#if resumeMin.districtId??>&districtId=${resumeMin.districtId}</#if>">${sc.scName}</a></li>
                    </#list>
                    </ul>
                </div>
            </div>
            <div class="row info_tag">
                <div class="col-xs-1"><span class="lanmutitle">地点:</span></div>
                <div class="col-xs-11">
                    <ul class="lanmu_ul2">
                        <li class="active" id="districtNo"><a href="${base}/resume/list<#if resumeMin.dreamWork??>?dreamWork=${resumeMin.dreamWork}</#if>">不限</a></li>
                    <#list districts as ds>
                        <li id="district${ds.districtId}"><a href="${base}/resume/list?districtId=${ds.districtId}<#if resumeMin.dreamWork??>&dreamWork=${resumeMin.dreamWork}</#if>">${ds.districtName}</a></li>
                    </#list>
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
                        <h4 class="list_title">开封求职简历</h4>
                    </div>
                    <div class="col-xs-4">
                        <span>共为您找到了 <a href="${base}/about/service" target="_blank" style="color: #ff552e">${pageUtil.total}</a>条信息！</span>
                    </div>
                </div>
            </div>
            <div class="panel-body" style="min-height: 1000px;">
                <div class="row">
                    <div class="col-xs-10">
                        <#list resumes as resume>
                            <div class="grid row hover_info">
                                <div class="col-xs-4 padding-top1">
                                    <a href="${base}/resume/info?cvId=${resume.cvId}">
                                    <div class="info_title">${resume.realName} </div><#if resume.cvImg??><span class="label label-primary">有图</span></#if>
                                    <span class="label label-info">${resume.scName}</span>
                                    <span class="label label-success">${resume.districtName}</span></a>
                                    <div class="inforbox">
                                            <div class="arrow"> <em></em> <span></span> </div>
                                        <div class="tipsbox">
                                            <a href="${base}/resume/info?cvId=${resume.cvId}" class="ib-btn">查看详情</a>
                                            <h3>${resume.realName}(${resume.gender})</h3>
                                            <ul class="lists">
                                                <li> <span>薪资待遇：</span> <font color="#F70">${resume.income}</font> </li>
                                                <li> <span>工作地点：</span> ${resume.districtName}</li>
                                                <li> <span>工作经验：</span> ${resume.jobYear} </li>
                                                <li> <span>最高学历：</span> ${resume.maxEdu} </li>
                                                <li> <span>寻求职位：</span> ${resume.scName} </li>
                                            </ul>
                                            <dl class="content"><span class="infoDesc">求职自推: </span>
                                                <#if resume.zitui??>
                                                    <#if resume.zitui?length gt 100>
                                                    ${resume.zitui[0..100]}
                                                    <#else>
                                                    ${resume.zitui}
                                                    </#if>
                                                <#else>
                                                欢迎您联系我!
                                                </#if> </dl>
                                            <dl class="warning">
                                                <strong> 麦芒网提醒：</strong> 让你提前汇款，或者价格明显低于市价，均有骗子嫌疑，不要轻易相信。
                                            </dl>
                                        </div>
                                    </div>
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
<script src="${base}/js/floating.js"></script>
<script type="text/javascript" src="${base}/js/kkpager.min.js"></script>
    <@floating/>
<script type="text/javascript">

    function getParameter(name) {
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r!=null) return unescape(r[2]); return null;
    }




    //init
    $(function(){


        //回到顶部
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
            hrefFormer : '${base}/resume/list?<#if resumeMin.districtId??>districtId=${resumeMin.districtId}&</#if><#if resumeMin.dreamWork??>dreamWork=${resumeMin.dreamWork}</#if>',
            //链接尾部
            hrefLatter : '',
            getLink : function(n){
                return this.hrefFormer + this.hrefLatter + "&pno="+n;
            }
        });
    <#if resumeMin.dreamWork??>
        $("#notController").removeClass("active");
        $("#lanmu${resumeMin.dreamWork}").addClass("active");
    </#if>
    <#if resumeMin.districtId??>
        $("#districtNo").removeClass("active");
        $("#district${resumeMin.districtId}").addClass("active");
    </#if>
    });
</script>
</@footer>