<#import "defaultLayout/defaultLayout.ftl" as defaultLayout>
<@defaultLayout.layout>
<div class="panel">
    <div class="panel-body">
        <table class="table">
            <thead>
            <tr>
                <th>ID</th>
                <th>用户名</th>
                <th>拉黑时间</th>
                <th>操作人</th>
                <th>原因</th>
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
        </table>
    </div>
</div>
<div class="panel">
    <div class="panel-default text-center">
        <ul class="pagination  pagination-lg">
            <li><a href="#">&laquo;</a></li>
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li><a href="#">&raquo;</a></li>
        </ul>
    </div>

</@defaultLayout.layout>