<#import "defaultLayout/defaultLayout.ftl" as defaultLayout>
<@defaultLayout.layout>
<script>
    menuSelected("users");
</script>
<div class="panel">
    <div class="panel-body" style="display: block;">
        <form class="form-horizontal">
            <div class="form-group">
                <label for="inputUserName" class="col-sm-1 control-label">用户名</label>
                <div class="col-sm-5">
                    <input type="password" class="form-control" id="inputUserName" placeholder="请输入用户名">
                </div>
                <div class=" col-sm-2">
                    <button type="submit" class="C">查询</button>
                </div>
            </div>
        </form>
    </div>
</div>
<div class="panel">
    <div class="panel-heading">
        <div class="alert alert-success alert-dismissible" role="alert">
            <i class="fa fa-info-circle"></i><span>查询结果</span>
            <label class=" bg-danger btn" style="float: right" onclick="joinBlackList()"><span style="color: white">拉入黑名单</span></label>
        </div>
    </div>
    <div class="panel-body">
        <form class="form-horizontal" role="form">
            <div class="form-group">
                <label for="firstname" class="col-sm-1 control-label">ID</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="userId">
                </div>
            </div>

            <div class="form-group">
                <label for="firstname" class="col-sm-1 control-label">用户名</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="userName">
                </div>
            </div>
            <div class="form-group">
                <label for="lastname" class="col-sm-1 control-label">手机号</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="userPhone">
                </div>
            </div>
            <div class="form-group">
                <label for="lastname" class="col-sm-1 control-label">电子邮箱</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="userEmail">
                </div>
            </div>
            <div class="form-group ">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="reset" class=" btn btn-primary btn-lg "/>
                    <input type="submit" class=" btn btn-primary btn-lg"/>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    function joinBlackList() {
        var mymessage = confirm("确认加入将xx加入黑名单？");
        if (mymessage == true) {
            document.write("加入");
        }
        else if (mymessage == false) {
            document.write("不加入");
        }
    }
</script>
</@defaultLayout.layout>