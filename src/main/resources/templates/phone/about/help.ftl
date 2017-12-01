<#include "../defaultLayout/defaultLayout.ftl">
<#assign base="${request.contextPath}"/>
<@header siteName="开封麦芒网" base_css=["global","style","bootstrap.min"] base_keywords="开封麦芒网">
<link rel="stylesheet" href="${base}/css/font-awesome.min.css"></@header>

<@body title="使用帮助" back=true>
<div id="contactbar">
    <a href="${base}/m/index" class="bottom_index">首页</a>
    <a href="${base}/m/user/info" class="bottom_member">我的</a>
    <a href="${base}/m/about/cpdesc" class="bottom_history_on">推送</a>
    <a href="${base}/m/push/choose" class="bottom_post">发布</a>
</div>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">手机导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" style="padding: 0" href="#">
                <img alt="麦芒网络" src="${base}/ico/mmfavicon.ico">
                使用帮助
            </a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li ><a href="${base}/m/about/cpdesc">公司简介</a></li>
                <li><a href="${base}/m/about/contact">联系方式</a></li>
                <li><a href="${base}/m/about/service">推广服务</a></li>
                <li><a href="${base}/m/about/charge">收费标准</a></li>
                <li class="active"><a href="${base}/m/about/help">使用帮助</a></li>
                <li><a href="${base}/m/about/law">网站申明</a></li>
                <li ><a href="${base}/m/about/friend">友情链接</a></li>
            </ul>

        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<div class="container">
    <div class="row">
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3>使用帮助</h3>
                </div>
                <div class="panel-body">
                    <ul class=" list-group left_menu">
                        <a href="#tab1" style="text-decoration: none" data-toggle="tab"><li class="list-group-item">提示信息待审核，怎么办？</li></a>
                        <a href="#tab2" style="text-decoration: none" data-toggle="tab"><li class="list-group-item">点了发布按钮却没有反应？</li></a>
                        <a href="#tab3" style="text-decoration: none" data-toggle="tab"><li class="list-group-item">为什么我发布的信息没有了？</li></a>
                        <a href="#"><li class="list-group-item">提示信息待审核，怎么办？</li></a>
                        <a href="#"><li class="list-group-item">提示信息待审核，怎么办？</li></a>
                    </ul>
                </div>
            </div>

        </div>
        <div class="col-md-8">
            <div class="tab-content">
                <div class="tab-pane active" id="tab1">
                    <div class="panel panel-default">
                        <div class="panel-heading red">
                            提示信息待审核，怎么办？
                        </div>
                        <div class="panel-body">
                            只要您发布的信息不属于违法信息、不属于重复发布的信息，我们会在工作时间段内及时将您的信息审核通过，通过审核后您的信息就会正常发布显示到新郑网上面，不用再次发布，请勿重复发布相同性质、相同内容的信息。
                            <br>哪些原因会让信息进入待审核箱？
                            <br>只有以下三种情况需要审核：
                            <br>1、当前使用的网络IP地址不属于郑州市；
                            <br>2、重复发布的信息或者与他人发布的信息标题一样；
                            <br>3、每天早上9之前/下午6点之后发布的信息都需要审核；
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="tab2">
                    <div class="panel panel-default">
                        <div class="panel-heading red">
                            发布信息时，点了“写好了，立即发布”按钮没反应？
                        </div>
                        <div class="panel-body">
                            出现此类情况，请您仔细检查一下以下几项：
                            1、信息标题：您书写的标题需要超过五个汉字才可以
                            2、信息内容：您书写的内容需要超过十五个汉字才可以
                            3、带*号的必填项：没有填写必填项内容，要填写完整
                            4、联系方式：电话、手机号、QQ号、微信号，至少要填写一种联系方式
                            5、验证码：要填写正确，或者点击 验证码图片 换一个，重新填写
                            6、信息标题中不能包含特殊字符 (如：。、！、~、* ...)
                            7、信息标题以及内容中没有违法、违规的东西
                            8、描述清楚、选择了正确的类别、没有重复冗余的内容
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="tab3">
                    <div class="panel panel-default">
                        <div class="panel-heading red">
                            为什么我发布的信息没有了？
                        </div>
                        <div class="panel-body">
                            可能是您发布的信息属于重复信息，或者违反信息发布规则被删除了，发布信息时请遵守版规。
                            发布招聘信息必须写明公司名称、公司地址、职务、薪资待遇、联系人称呼。
                            禁止发布职介、网络兼职、加盟、代理、承包、招生等非招聘性质之类信息。
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

</@body>

<@footer base_js=["jq_min.211","bootstrap.min"]>

</@footer>

<#--自定义脚本区-->
