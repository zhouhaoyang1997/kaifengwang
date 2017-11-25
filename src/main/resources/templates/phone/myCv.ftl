<#include "defaultLayout/defaultLayout.ftl">
<@header siteName="开封麦芒网"  base_css=["global","style","bootstrap.min"] base_keywords="开封麦芒网" >

</@header>

<@body title="我的简历" back=true>
<div id="contactbar">
    <a href="/m/index" class="bottom_index">首页</a>
    <a href="/m/user/info" class="bottom_member_on">我的</a>
    <a href="#" class="bottom_history">推送</a>
    <a href="${baseUrl}/m/push/choose" class="bottom_post">发布</a>
</div>
<div class="text-center">
    <ul id="myTab" class="nav nav-tabs">
        <li class="active" >
            <a href="#baseInfo" data-toggle="tab">
                基本资料
            </a>
        </li>
        <li><a href="#2" data-toggle="tab">教育背景</a></li>
        <li><a href="#3" data-toggle="tab">工作经历</a></li>
        <li><a href="#4" data-toggle="tab">求职意向</a></li>
    </ul>
    <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade in active" id="baseInfo">
            <form class="form-horizontal" role="form">
                <div class="form-group">
                    <label  class="col-xs-2 control-label"><span style="color:red">*</span>姓名:</label>
                    <div class="col-xs-9">
                        <input type="text" required class="form-control" <#if resume??> value="${resume.realName!""}"</#if> minlength="2" maxlength="5" name="realName">
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-xs-2 control-label"><span style="color:red">*</span>出生:</label>
                    <div class="col-xs-9">
                        <input type="date" required class="form-control" <#if resume??> value="${resume.bornYear!""}"</#if> minlength="2" maxlength="5" name="bornYear">
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-xs-2 control-label"><span style="color:red">*</span>性别:</label>
                    <div class="col-xs-9">
                        <label class="radio-inline">
                            <input type="radio" name="gender"  <#if resume??><#if resume.gender=="男">checked</#if><#else>checked</#if> value="男">男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="gender" <#if resume??><#if resume.gender=="女">checked</#if></#if> value="女">女
                        </label>                    </div>
                </div>

            </form>
        </div>
    </div>
        <div class="tab-pane fade" id="ios">
            <p>iOS 是一个由苹果公司开发和发布的手机操作系统。最初是于 2007 年首次发布 iPhone、iPod Touch 和 Apple
                TV。iOS 派生自 OS X，它们共享 Darwin 基础。OS X 操作系统是用在苹果电脑上，iOS 是苹果的移动版本。</p>
        </div>
        <div class="tab-pane fade" id="jmeter">
            <p>jMeter 是一款开源的测试软件。它是 100% 纯 Java 应用程序，用于负载和性能测试。</p>
        </div>
        <div class="tab-pane fade" id="ejb">
            <p>Enterprise Java Beans（EJB）是一个创建高度可扩展性和强大企业级应用程序的开发架构，部署在兼容应用程序服务器（比如 JBOSS、Web Logic 等）的 J2EE 上。
            </p>
        </div>
    </div>
</div>
</@body>
<#--js-->
<@footer base_js=["jquery.min","bootstrap.min"]></@footer>