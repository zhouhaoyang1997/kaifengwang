<#include "defaultLayout/defaultLayout.ftl">
<@header siteName="开封麦芒网"  base_css=["global","style","bootstrap.min","bootstrap-table.min"] base_keywords="开封麦芒网" >

</@header>
<@body title="我的收藏" back=true>
<div class="panel panel-default ">
    <div class="panel-body">
        <table class="table" id="collectionTable"></table>
    </div>
</div>

</@body>
<#--js-->
<@footer base_js=["jquery.min","bootstrap.min","bootstrap-table.min","bootstrap-table-zh-CN.min","personal"]></@footer>
