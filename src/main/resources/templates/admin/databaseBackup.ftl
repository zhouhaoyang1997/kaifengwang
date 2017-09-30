<#import "defaultLayout/defaultLayout.ftl" as defaultLayout>
<@defaultLayout.layout>
<script>
    menuSelected("databaseBackup");
</script>
<div class="panel">
    <div class="panel-body">
        <form class="form-horizontal">
            <div class="form-group">
                <lable>
                    <button type="submit" class="btn btn-primary btn-lg">新建备份</button>
                </lable>
                <lable>
                    <button type="submit" class="btn btn-primary btn-lg">还原</button>
                </lable>
            </div>
        </form>
        <table class="table">
            <thead>
            <tr>
                <th>选择</th>
                <th>编号</th>
                <th>时间</th>
                <th>操作人</th>
                <th>文件名</th>
                <th>保存路径</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><input type="radio" name="databaseId" class="radio"></td>
                <td>1</td>
                <td>2017年9月29日17:36:33</td>
                <td>周浩洋</td>
                <td>2017-9-29.sql</td>
                <td>/backup</td>
            </tr>
            <tr>
                <td><input type="radio" name="databaseId" class="radio"></td>
                <td>1</td>
                <td>1</td>
                <td>Steve</td>
                <td>Jobs</td>
                <td>@steve</td>
            </tr>
            </tbody>
        </table>

    </div>
</div>
</@defaultLayout.layout>