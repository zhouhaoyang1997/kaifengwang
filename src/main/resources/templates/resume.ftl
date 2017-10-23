<#include "public/default.ftl">
<#include "public/pushdefault.ftl">
<#include "public/userdefault.ftl">
<#assign base="${request.contextPath}"/>
<@header title="开封网招聘">
<link rel="stylesheet" href="${base}/css/style.css">
<link rel="stylesheet" href="${base}/css/bootstrap-table.min.css">
<link rel="stylesheet" href="${base}/css/menu.css">
<link rel="stylesheet" href="${base}/css/userInfo.css">
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
            <div style="margin-top: 20px;">
                <div class="panel ">
                    <div class="panel-heading"><h3>我的简历</h3>
                    <p style="color: #ff552e;">重要提示:认真、真实、详细填写您的全职简历，有利于您快速获得职位 </p>
                    </div>
                    <div class="panel-body">
                        <form action="">
                            <div class="panel panel-default">
                                <div class="panel-heading">基本资料</div>
                                <div class="panel-body">
                                    <div class="form-group row">
                                        <div class="col-xs-4 input-group">
                                            <span  class="input-group-addon"><span style="color:red">*</span>姓名:</span>
                                            <input type="text" class="form-control" name="cpName">
                                        </div>
                                        <div class="col-xs-4 input-group">
                                            <span  class="input-group-addon"><span style="color:red">*</span>出生:</span>
                                            <input type="text" class="form-control" name="cpName">
                                            <span class="input-group-addon">年-月-日</span>
                                        </div>
                                        <div class="col-xs-4 input-group">
                                            <span  class="input-group-addon"><span style="color:red">*</span>性别:</span>
                                            <div style="margin-left: 15px;margin-top: 3px;">
                                                <label class="radio-inline">
                                                <input type="radio" name="gender" value="男">男
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
                                            <input type="text" class="form-control" name="cpName">
                                        </div>
                                        <div class="col-xs-4 input-group">
                                            <span  class="input-group-addon"><span style="color:red">*</span>民族:</span>
                                            <input type="text" class="form-control" name="cpName">
                                            <span class="input-group-addon">族</span>
                                        </div>
                                        <div class="col-xs-4 input-group">
                                            <span  class="input-group-addon"><span style="color:red">*</span>婚否:</span>
                                            <div style="margin-left: 15px;margin-top: 3px;">
                                                <label class="radio-inline">
                                                    <input type="radio" name="gender" value="0">未婚
                                                </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="gender" value="1">已婚
                                                </label>
                                            </div>

                                        </div>
                                    </div>


                                    <div class="form-group row">
                                        <div class="col-xs-4 input-group">
                                            <span  class="input-group-addon"><span style="color:red">*</span>身高:</span>
                                            <input type="text" class="form-control" name="cpName">
                                            <span class="input-group-addon">厘米</span>
                                        </div>
                                        <div class="col-xs-4 input-group">
                                            <span  class="input-group-addon"><span style="color:red">*</span>体重:</span>
                                            <input type="text" class="form-control" name="cpName">
                                            <span class="input-group-addon">KG</span>
                                        </div>
                                        <div class="col-xs-4 input-group">
                                            <span  class="input-group-addon"><span style="color:red">*</span>健康:</span>
                                            <div style="margin-left: 15px;margin-top: 3px;">
                                                <label class="radio-inline">
                                                    <input type="radio" name="gender" value="0">健康
                                                </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="gender" value="1">残疾
                                                </label>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">教育背景</div>
                                <div class="panel-body">
                                    <div class="form-group row">
                                        <div class="col-xs-4 input-group">
                                            <span  class="input-group-addon"><span style="color:red">*</span>最高学历:</span>
                                            <input type="text" class="form-control" name="cpName">
                                        </div>
                                        <div class="col-xs-4 input-group">
                                            <span  class="input-group-addon"><span style="color:red">*</span>毕业学校:</span>
                                            <input type="text" class="form-control" name="cpName">
                                        </div>
                                        <div class="col-xs-4 input-group">
                                            <span  class="input-group-addon"><span style="color:red">*</span>毕业时间:</span>
                                            <div style="margin-left: 15px;margin-top: 3px;">
                                                <label class="radio-inline">
                                                    <input type="radio" name="gender" value="男">男
                                                </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="gender" value="女">女
                                                </label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-xs-4 input-group">
                                            <span  class="input-group-addon"><span style="color:red">*</span>所学专业:</span>
                                            <input type="text" class="form-control" name="cpName">
                                        </div>
                                        <div class="col-xs-4 input-group">
                                            <span  class="input-group-addon"><span style="color:red">*</span>外语水平:</span>
                                            <input type="text" class="form-control" name="cpName">
                                        </div>
                                        <div class="col-xs-4 input-group">
                                            <span  class="input-group-addon"><span style="color:red">*</span>电脑水平:</span>
                                            <div style="margin-left: 15px;margin-top: 3px;">
                                                <label class="radio-inline">
                                                    <input type="radio" name="gender" value="0">未婚
                                                </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="gender" value="1">已婚
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-xs-10 input-group">
                                            <span class="input-group-addon">其他教育</span>
                                            <textarea name="" class="form-control" id="" cols="20" rows="3"></textarea>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">工作经历</div>
                                <div class="panel-body">
                                    <div class="form-group row">
                                        <div class="col-xs-8 input-group">
                                            <span class="input-group-addon">截止今年我有</span>
                                            <input type="text" class="form-control" name="">
                                            <span class="input-group-addon">年工作经验</span>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-xs-10 input-group">
                                            <label for="">格式如：2006.11-2008.12,北京某某设计工作,担任设计师 (每行一条)</label>
                                            <textarea name="" class="form-control" id="" cols="20" rows="3"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">求职意向</div>
                                <div class="panel-body">
                                    <div class="form-group row">
                                        <div class="col-xs-6 input-group">
                                            <span class="input-group-addon"><span style="color:red">*</span>希望岗位</span>
                                            <input type="text" class="form-control" name="">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-xs-4 input-group">
                                            <span  class="input-group-addon"><span style="color:red">*</span>期望月薪:</span>
                                            <input type="text" class="form-control" name="cpName">
                                        </div>
                                        <div class="col-xs-4 input-group">
                                            <span  class="input-group-addon"><span style="color:red">*</span>希望工作地区:</span>
                                            <input type="text" class="form-control" name="cpName">
                                        </div>
                                        <div class="col-xs-4 input-group">
                                            <span  class="input-group-addon"><span style="color:red">*</span>到岗时间:</span>
                                            <input type="text" class="form-control" value="可随时到岗" name="cpName">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-xs-6 input-group">
                                            <span class="input-group-addon"><span style="color:red">*</span>擅长技能</span>
                                            <input type="text" class="form-control" name="">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-xs-10 input-group">
                                            <span class="input-group-addon">自推荐言</span>
                                            <textarea name="" class="form-control" id="" cols="20" rows="3"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="panel panel-default">
                                <div class="panel-heading">联系方式</div>
                                <div class="panel-body">
                                    <div class="form-group row">
                                        <div class="col-xs-6 input-group">
                                            <span class="input-group-addon">联系手机</span>
                                            <input type="text" class="form-control" name="">
                                        </div>
                                        <div class="col-xs-6 input-group">
                                            <span class="input-group-addon">电子邮件</span>
                                            <input type="text" class="form-control" name="">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-xs-6 input-group">
                                            <span class="input-group-addon">腾讯QQ</span>
                                            <input type="text" class="form-control" name="">
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
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                您确认删除该条信息吗?删除后不可恢复!
                <input type="hidden" id="piIdHidden" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" id="removeBtn" class="btn btn-primary">确认</button>
            </div>
        </div>
    </div>
</div>


<@push_footer>
<script type="text/javascript" src="${base}/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${base}/js/bootstrap-table.min.js"></script>
<script type="text/javascript" src="${base}/js/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript" src="${base}/js/personal.js"></script>
</@push_footer>


