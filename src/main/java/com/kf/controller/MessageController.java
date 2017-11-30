package com.kf.controller;

import com.aliyuncs.exceptions.ClientException;
import com.kf.exception.PhoneErrorException;
import com.kf.pojo.User;
import com.kf.service.UserService;
import com.kf.util.CookieUtil;
import com.kf.util.Md5Util;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import static com.kf.util.CommonUtil.createRandomNum;

/**
 * Created by 18236 on 2017/11/29.
 */
@Controller
public class MessageController {

    @Autowired
    private UserService userService;

    private Logger logger = LoggerFactory.getLogger(MessageController.class);
    private static final String KEY = "kfmm1230"; // KEY为自定义秘钥

    @PostMapping(value = "/sendMsg", headers = "Accept=application/json")
    @ResponseBody
    public Map<String, Object> sendMsg(@RequestBody Map<String,Object> requestMap) {
        String phoneNumber = requestMap.get("phoneNumber").toString();
        String randomNum = createRandomNum(6);// 生成随机数
        SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
        Calendar c = Calendar.getInstance();
        c.add(Calendar.MINUTE, 5);
        String currentTime = sf.format(c.getTime());// 生成5分钟后时间，用户校验是否过期
        Map<String, Object> resultMap = new HashMap<>();
        try{
            logger.debug("发送验证码!!");
            sendMsg(phoneNumber,randomNum); //此处执行发送短信验证码方法
        }catch (ClientException e){
            e.printStackTrace();
        }catch (PhoneErrorException e){
            resultMap.put("code","300");
            resultMap.put("message",e.getMsg());
        }

        String hash = Md5Util.MD5(KEY + "@" + currentTime + "@" + randomNum);//生成MD5值

        resultMap.put("hash", hash);
        resultMap.put("tamp", currentTime);
        resultMap.put("code","200");
        return resultMap; //将hash值和tamp时间返回给前端
    }

    private void sendMsg(String phone,String randomNum) throws ClientException,PhoneErrorException{

        String jsonContent = "{\"code\":\"" + randomNum + "\"}";

        Map<String, String> paramMap = new HashMap<>();
        paramMap.put("phoneNumber", phone);
        paramMap.put("msgSign", "麦芒网络科技");
        paramMap.put("templateCode", "SMS_114385489");
        paramMap.put("jsonContent", jsonContent);
        logger.debug("发送虚假验证码!!"+randomNum);
//        SendSmsResponse sendSmsResponse = AliyunMessageUtil.sendSms(paramMap);
//        if(!(sendSmsResponse.getCode() != null && sendSmsResponse.getCode().equals("OK"))) {
//            if(sendSmsResponse.getCode().equals("isv.MOBILE_NUMBER_ILLEGAL")) {
//                logger.debug("手机号错误!");
//                throw new PhoneErrorException("300","手机号错误!");
//            }
//            if(sendSmsResponse.getCode().equals("isv.MOBILE_COUNT_OVER_LIMIT")) {
//                throw new PhoneErrorException("300","手机号短信发送数量超过了限制!");
//            }
//        }
    }


    @PostMapping(value = "/validateNum",  headers = "Accept=application/json")
    @ResponseBody
    public Map<String, Object> validateNum(@RequestBody Map<String,String> requestMap, HttpServletRequest request, HttpServletResponse response)throws IOException {
        String requestHash = requestMap.get("hash");
        String tamp = requestMap.get("tamp");
        String msgNum = requestMap.get("msgNum");
        String remember = requestMap.get("remember");
        Map<String,Object> map = new HashMap<>();
        if(requestMap.get("phoneNum")==null){
            map.put("error","手机号不能为空");
        }else{
            String userPhone = requestMap.get("phoneNum");

            String hash = Md5Util.MD5(KEY + "@" + tamp + "@" + msgNum);
            Calendar c = Calendar.getInstance();
            SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");

            String currentTime = sf.format(c.getTime());

            if (tamp.compareTo(currentTime) > 0) {
                if (hash!=null&&hash.equalsIgnoreCase(requestHash)){
                    //校验成功
                    map.put("code","200");
                    User user = userService.getUser(userPhone);
                    if(user==null){
                        //说明不是本站会员
                        user = new User();
                        user.setUserName(randomName(userPhone));
                        user.setUserPassword(Md5Util.MD5("kf123456cg"));
                        Timestamp timestamp = new Timestamp(new Date().getTime());
                        user.setCreateTime(timestamp);//当前时间作为用户创建时间
                        user.setLastedTime(timestamp);//当前时间作为用户最后登陆时间
                    }else{
                        Timestamp time = new Timestamp(new Date().getTime());
                        userService.updateUserLastLoginTime(user.getUserId(),time);
                    }
                    HttpSession session = request.getSession();
                    session.setAttribute("user",user);
                    if(StringUtils.isNotBlank(remember)){
                        CookieUtil.addCookie(response,"userName",user.getUserName());
                        CookieUtil.addCookie(response,"userPassword",user.getUserPassword());
                    }


                }else {
                    //验证码不正确，校验失败
                    map.put("error","您输入的验证码不正确!");
                }
            } else {
                // 超时

                map.put("error","您的验证码已过期,请重新再试!");

            }
        }

        return map;
    }

    private String randomName(String phone){
        while (true){
            String randomStr = Md5Util.MD5("kfmm"+phone);
            if(StringUtils.isNotBlank(randomStr)){
                randomStr = randomStr.substring(9);
                if(userService.userNameIsNotExists(randomStr)){
                    return randomStr;
                }
            }
        }
    }
}
