<#include "defaultLayout/defaultLayout.ftl">
<#assign base="${request.contextPath}"/>
<@header siteName="开封麦芒网"  base_css=["global","style","usercenter","bootstrap.min"] base_keywords="开封麦芒网" >

</@header>
<#--js-->
<@body title="修改资料" back=true>
<div class="panel-body">
    <form class="form-horizontal" role="form" id="alterInfo">
        <div class="form-group">
            <label for="name" class="col-sm-2">用户名</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="name" disabled value="${userInfo.userName}">
            </div>

        </div>
        <div class="form-group">
            <label for="Phone" class="col-sm-2">手机号</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="Phone" disabled value="${userInfo.userPhone!""}" minlength="11" maxlength="11">
            </div>
            <div class="col-sm-1">
                <button type="button" class="btn btn-primary" id="alterPhoneBtn">修改</button>
                <button type="button" class="btn btn-success" id="enterPhoneBtn" style="display: none;">确认</button>

            </div>
            <div class="col-sm-3">
                <span id="PhoneError"></span>
            </div>
        </div>
        <div class="form-group">
            <label for="Email" class="col-sm-2">邮箱</label>
            <div class="col-sm-4">
                <input type="email" class="form-control" id="Email" disabled value="${userInfo.userEmail!""}" name="email" >
            </div>
            <div class="col-sm-1">
                <button type="button" class="btn btn-primary"  id="alterEmailBtn">修改</button>
                <button type="button" class="btn btn-success" id="enterEmailBtn" style="display: none;">确认</button>
            </div>
            <div class="col-sm-3">
                <span id="EmailError"></span>
            </div>

        </div>
        <div class="form-group">
            <label for="ProfileInfo" class="col-sm-2">个人简介</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="ProfileInfo" disabled value="${userInfo.userDescription!""}" minlength="2" maxlength="100" name="profileInfo" >
            </div>
            <div class="col-sm-1">
                <button type="button" class="btn btn-primary" id="alterProfileInfoBtn">修改</button>
                <button type="button" class="btn btn-success" id="enterProfileInfoBtn" style="display: none;">确认</button>
            </div>
            <div class="col-sm-3">
                <span id="ProfileInfoError"></span>
            </div>
        </div>
    </form>
</div>

</@body>

<@footer base_js=["jq_min.211_1","bootstrap.min"]>

<script type="text/javascript" src="${base}/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${base}/js/messages_zh.js"></script>
</@footer>
<script>
    $.validator.setDefaults({
        submitHandler: function(form) {
            form.submit();
        }
    });

    $().ready(function() {

        $("#alterInfo").validate();


        var item = "Phone,Email,ProfileInfo".split(",");
        item.forEach(function (p1, p2, p3) {
            $("#alter"+p1+"Btn").click(function () {
                $("#"+p1).removeAttr("disabled");
                $("#alter"+p1+"Btn").css("display","none");
                $("#enter"+p1+"Btn").css("display","block");
            });

            $("#enter"+p1+"Btn").click(function () {
                $.ajax({
                    type:'get',
                    url:'${base}/user/alter'+p1+'?user'+p1+'='+$("#"+p1).val(),
                    success:function (result) {
                        var res = result.split(":");
                        if(res[0]==="ok"){
                            alert(res[1]);
                            $("#enter"+p1+"Btn").css("display","none");
                            $("#alter"+p1+"Btn").css("display","block");
                            $("#"+p1).attr("disabled","disabled");
                        }else{
                            $("#"+p1+"Error").html(res[1]);

                        }
                    }
                })
            });
        });
    });
</script>