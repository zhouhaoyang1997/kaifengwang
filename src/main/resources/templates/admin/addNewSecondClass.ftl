<#import "defaultLayout/defaultLayout.ftl" as defaultLayout>
<@defaultLayout.layout>

<div class="panel">
    <div class="panel-heading">
        <div class="right">
            <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
            <button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
        </div>
    </div>
    <form class="form-horizontal">
        <div class="form-group">
            <label for="inputClass" class="col-sm-1 control-label">按类别</label>
            <div class="col-sm-3">
                <select class="form-control">
                    <option>房产</option>
                    <option>二手货</option>
                    <option>招聘</option>
                    <option>生活</option>
                    <option>宠物</option>
                    <option>名企</option>
                </select>
            </div>
            <div class="col-sm-offset-10">
                <button class="btn btn-primary">查询</button>
            </div>
        </div>
    </form>
</div>

<div class="panel">
    <div class="panel-heading">
        <div class="right">
            <label class=" bg-danger btn" onclick="newAdmin()"><span style="color: white">新建子模块</span></label>
        </div>
    </div>
    <div class="panel-body">
        <table class="table">
            <thead>
            <tr>
                <th>主类</th>
                <th>关系</th>
                <th>子类</th>
                <th>创建日期</th>
                <th>&nbsp;&nbsp; 操作</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>房产</td>
                <td>包含</td>
                <td>不动产</td>
                <td>2017年9月29日23:40:33</td>
                <td><span class="text-info">修改</span>|<span class="text-danger">禁用</span></td>
            </tr>
            </tbody>
        </table>
    </div>

</div>

</@defaultLayout.layout>