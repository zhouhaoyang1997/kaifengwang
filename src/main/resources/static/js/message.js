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
function getMsgNum(that) {
    // if(regPhone()){
        var phoneNumber = $('#phone').val();
        setButtonStatus(that); // 设置按钮倒计时
        var obj = {
            phoneNumber: phoneNumber
        };
        $.ajax({
            url: '/sendMsg', // 后台短信发送接口
            type: 'POST',
            dataType: 'json',
            contentType: "application/json",
            async: false, //false 同步
            data: JSON.stringify(obj),
            xhrFields: {
                withCredentials: true
            },
            success: function (result) {
                if(result.code == '200') {
                    messageData = result;
                }else {
                    alert("错误码:" + result.code + " 错误信息:" + result.message);
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log(XMLHttpRequest.status);
                console.log(XMLHttpRequest.readyState);
                console.log(textStatus);
            }
        });
    // }
}
/**
 * 设置按钮状态
 */
function setButtonStatus(that) {
    if (wait == 0) {
        that.removeAttribute("disabled");
        that.value="免费获取验证码";
        wait = 60;
    } else {
        that.setAttribute("disabled", true);
        that.value=wait+"秒后可以重新发送";
        wait--;
        setTimeout(function() {
            setButtonStatus(that)
        }, 1000)
    }
}
/**
 * 注册按钮
 */
function validateNum() {

    if(regPhone2()){
        var data = {
            msgNum: $("#phoneCode").val(),
            phoneNum:$("#phone").val(),
            tamp: messageData.tamp,
            hash: messageData.hash,
            remember: $("#phoneRemember").val()
        };
        $.ajax({
            url:  '/validateNum', // 验证接口
            type: 'POST',
            dataType: 'json',
            contentType: "application/json",
            data: JSON.stringify(data),
            async: false, //false 同步
            success: function (result) {
                if(result.code=='200'){
                    window.location.href="/index";
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log(XMLHttpRequest.status);
                console.log(XMLHttpRequest.readyState);
                console.log(textStatus);
            }
        });
    }

}