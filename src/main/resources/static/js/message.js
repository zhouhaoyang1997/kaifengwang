var messageData;
var wait = 120; // 短信验证码120秒后才可获取下一个


jQuery.validator.addMethod("regex",
    function(value, element, params) {
        var exp = new RegExp(params);
        return exp.test(value);
    }, "格式错误");

function regPhone() {
    return $("#phoneLoginForm").validate(
        {
            rules:{
                phone:{
                    required:true,
                    regex:/^((13[0-9])|(15[^4])|(18[0,2,3,5-9])|(17[0-8])|(147))\d{8}$/
                }
            },
            messages:{
                phone:{
                    required:"请输入手机号",
                    regex:'请输入合法的手机号'
                }
            }
        }
    ).form();
}

function regPhone2() {
    return $("#phoneLoginForm").validate(
        {
            rules:{
                phone:{
                    required:true,
                    regex:/^((13[0-9])|(15[^4])|(18[0,2,3,5-9])|(17[0-8])|(147))\d{8}$/
                },
                phoneCode:{
                    required:true,
                    regex:/^\d{6}$/
                }
            },
            messages:{
                phone:{
                    required:'请输入手机号',
                    regex:'请输入合法的手机号'
                },
                phoneCode:{
                    required:'请输入6位验证码',
                    regex:'请输入6位验证码'
                }
            }
        }
    ).form();
}


/**
 * 获取验证码
 * @param that
 */


function regGetMsgNum() {
    var phoneNumber = $('#phone').val();
    var reg = /^((13[0-9])|(15[^4])|(18[0,2,3,5-9])|(17[0-8])|(147))\d{8}$/;
    if(reg.test(phoneNumber)){
        $("#verifyModal").modal("show");
    }else{
        alert("请输入合法的手机号!");
    }
}

function verifyNum() {
    var data={
        phoneNumber:$('#phone').val(),
        verify:$("#phoneVerifyCode").val()
    };
    $.ajax({
        url:'/sendMsg',
        type:'post',
        dataType: 'json',
        contentType: "application/json",
        async: false, //false 同步
        data: JSON.stringify(data),
        xhrFields: {
            withCredentials: true
        },
        success:function (result) {


            if(result.code=='200'){
                setButtonStatus($("#verify_refresh"));
                messageData = result;
                $("#verifyModal").modal("hide");

            }else
            if(result.code=='300'){
                $("#verifyError").text(result.message);
            }
            else {
                alert("错误码:" + result.code + " 错误信息:" + result.message);
            }
        }
    })
}

/**
 * 设置按钮状态
 */
function setButtonStatus(that) {
    if (wait == 0) {
        that.removeAttr("disabled");
        that.val("免费获取验证码");
        wait = 60;
    } else {
        that.attr("disabled",true);
        that.val(wait+"秒后可以重新发送");
        wait--;
        setTimeout(function() {
            setButtonStatus(that)
        }, 1000)
    }
}
/**
 * 确认按钮
 */
function validateNum() {
    if(messageData==undefined){
        alert("请先获取手机动态码!");
        return false;
    }
    if($("#phoneCode").val().length!=6){
        alert("请输入6位动态码!");
        return false;
    }
    if(regPhone2()){
        var data = {
            code: $("#phoneCode").val(),
            phoneNum:$("#phone").val(),
            tamp: messageData.tamp,
            hash: messageData.hash,
            remember: $("#phoneRemember").val(),
            path:$("#path").val()
        };
        $.ajax({
            url:  '/validateNum', // 验证接口
            type: 'POST',
            data: data,
            success: function (result) {
                var res = result.split(":");
                if(res[0]=='200'){
                    window.location.href=res[1];
                }else{
                    alert(res[1]);
                }
            }
        });
    }

}

function verifyRegNum() {
    var data={
        phoneNumber:$('#phone').val(),
        verify:$("#phoneVerifyCode").val()
    };
    $.ajax({
        url:'/sendMsg',
        type:'post',
        dataType: 'json',
        contentType: "application/json",
        async: false, //false 同步
        data: JSON.stringify(data),
        xhrFields: {
            withCredentials: true
        },
        success:function (result) {
            if(result.code=='200'){
                setButtonStatus($("#verify_refresh"));
                $("#hash").val(result.hash);
                $("#tamp").val(result.tamp);
                $("#verifyModal").modal("hide");
            }else
            if(result.code=='300'){
                $("#verifyError").text(result.message);
            }
            else {
                alert("错误码:" + result.code + " 错误信息:" + result.message);
            }
        }
    })
}