<#import "defaultLayout/defaultLayout.ftl" as defaultLayout>
<@defaultLayout.layout>
<div class="panel">
    <div class="panel-heading">
        <div class="right">
            <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
            <button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
        </div>
    </div>
    <div class="panel-body" style="display: block;">
        <form class="form-horizontal">
            <div class="form-group">
                <label for="inputClass" class="col-sm-1 control-label">按类别</label>
                <div class="col-sm-10">
                    <select class="form-control">
                        <option>房产</option>
                        <option>二手货</option>
                        <option>招聘</option>
                        <option>生活</option>
                        <option>宠物</option>
                        <option>名企</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="inputKeyWrod" class="col-sm-1 control-label">按关键词</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="inputKeyWrod" placeholder="请输入关键词">
                </div>
            </div>
            <div class="form-group">
                <label for="inputUserName" class="col-sm-1 control-label">按用户</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="inputUserName" placeholder="请输入用户名">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-5 col-sm-10">
                    <button type="submit" class="btn btn-default">查询</button>
                </div>
            </div>
        </form>
    </div>
</div>
<div class="clear"></div>
<!-- BASIC TABLE -->
<div class="panel">
    <div class="panel-body">
        <table class="table">
            <thead>
            <tr>
                <th>信息标题</th>
                <th>所属主类</th>
                <th>所属次类</th>
                <th>发布人</th>
                <th>发布日期</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>1</td>
                <td>Steve</td>
                <td>Jobs</td>
                <td>@steve</td>
                <td>@steve</td>
                <td>@steve</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<!-- END BASIC TABLE -->

</@defaultLayout.layout>