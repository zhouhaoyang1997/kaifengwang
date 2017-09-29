<#import "defaultLayout/defaultLayout.ftl" as defaultLayout>
<@defaultLayout.layout>
<div class="panel">
    <div class="panel-heading">
        <div>
            <label class=" bg-danger btn" style="float: right" onclick="newAdmin()"><span
                    style="color: white">新建管理员</span></label>
        </div>
    </div>
    <div class="panel-body">
        <table class="table">
            <thead>
            <tr>
                <th>用户名</th>
                <th>姓名</th>
                <th>类型</th>
                <th>创建日期</th>
                <th>&nbsp;&nbsp; 操作</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>zhy</td>
                <td>周浩洋</td>
                <td>root</td>
                <td>2017年9月29日23:40:33</td>
                <td><span class="text-info">修改</span>|<span class="text-danger">禁用</span></td>
            </tr>
            </tbody>
        </table>
    </div>

</div>

</@defaultLayout.layout>