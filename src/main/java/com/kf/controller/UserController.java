package com.kf.controller;

import com.kf.pojo.User;
import com.kf.service.MainClassService;
import com.kf.service.SecondClassService;
import com.kf.service.UserService;
import com.kf.util.CommonUtil;
import com.kf.util.CookieUtil;
import com.kf.util.Md5Util;
import com.kf.util.SessionUtil;
import com.kf.vo.MsgCode;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by 18236 on 2017/9/24.
 */
@Controller
public class UserController{

    private static final String KEY = "kfmm1230"; // KEY为自定义秘钥

    private static Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    public UserService userService;

    @Autowired
    public MainClassService mainClassService;


    @Autowired
    private SecondClassService secondClassService;

    @PostMapping("/login")
    @ResponseBody
    public String login(User user, String verifyCode,String remember, String path,HttpServletRequest request, HttpServletResponse response){
        //用户名密码正确,当前用户存入session
        String name="";
        boolean access = false;
        HttpSession session = request.getSession();
//        Integer ipCount = SessionUtil.getIpCount(request);
        String verCode = (String)session.getAttribute("verCode");
//        if(ipCount!=null&&ipCount>3){
        if(StringUtils.isNotBlank(verifyCode)){
            if(verifyCode.equals(verCode)){
                access = true;
            }else{
                return "error:验证码输入有误";
            }
        }else{
            return "error:请输入验证码";
        }
//        }else{
//            access = true;
//        }

        //如果用户输入了信息
        if(user!=null&&StringUtils.isNotBlank(user.getUserName())&&StringUtils.isNotBlank(user.getUserPassword())&&access){
            user.setUserPassword(Md5Util.MD5("kf"+user.getUserPassword()+"cg"));
            User user1 = userService.getUser(user);
            if(user1!=null){
                //修改最后登陆日期
                Timestamp time = new Timestamp(new Date().getTime());
                userService.updateUserLastLoginTime(user1.getUserId(),time);
                //session记住当前用户

                session.setAttribute("user",user1);
                //用户点击了记住我
                if(remember!=null&&!remember.isEmpty()){
                    CookieUtil.addCookie(response,"userName",user.getUserName());
                    CookieUtil.addCookie(response,"userPassword",user.getUserPassword());
                }
                //默认登陆后返回首页,如果session中有值,则返回用户点击登陆的页面
                //清除用户的ip登录次数
//                String ip = request.getRemoteAddr();
//                session.removeAttribute(ip);
                if(path!=null&& StringUtils.isNotBlank(path)){
                    name="ok:"+path;
                }else{
                    name="ok:/index";
                }

            }else{
//                Integer ipTempCount = updateCount(request);
                name="error:你输入的用户名或密码错误:";
            }
        }else{
//            Integer ipTempCount = updateCount(request);
            name="error:请输入合法的信息:";
        }
        return name;
    }

    private Integer updateCount(HttpServletRequest request){
        HttpSession session = request.getSession();
        Integer countIp = SessionUtil.getIpCount(request);
        String ip = request.getRemoteAddr();
        if(countIp!=null){
            session.setAttribute(ip,countIp+1);
            return countIp+1;
        }else{
            session.setAttribute(ip,1);
            return 1;
        }

    }

    /**
     * 注销
     * @param request
     * @param response
     * @return
     */
    @GetMapping("logout")
    @ResponseBody
    public boolean logout(HttpServletRequest request,HttpServletResponse response){
        HttpSession session = request.getSession();
        //返回注销前的页面,默认返回index
//        String url="/index";
//        if(session.getAttribute("lastedUrl")!=null){
//            url=(String)session.getAttribute("lastedUrl");
//        }
        //移除session
        if(session.getAttribute("user")!=null){
            session.removeAttribute("user");
        }
        //移除cookie
        CookieUtil.removeCookie(response,request,"userName");
        CookieUtil.removeCookie(response,request,"userPassword");
//        ModelAndView modelAndView = new ModelAndView("redirect:"+url);
//        return modelAndView;
        return true;
    }

    /**
     * 指定ModelAttribute 用于避免将bean暴露给视图
     * @param user
     * @param remember
     * @param request
     * @param response
     * @return
     */
    @PostMapping("/register")
    @ResponseBody
    public Map<String,String> register(@Valid @ModelAttribute("userDetail") User user, BindingResult br, MsgCode msgCode,
                                       @RequestParam(value = "method",defaultValue = "pc") String method, String remember,
                                       HttpServletRequest request, HttpServletResponse response){

        Map<String,String> map = new HashMap<String,String>();
        if(CommonUtil.isLawMsgCode(msgCode)){
            String hash = Md5Util.MD5(KEY + "@" + msgCode.getTamp() + "@" + msgCode.getCode());
            Calendar c = Calendar.getInstance();
            SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
            String currentTime = sf.format(c.getTime());
            //手机验证码是否过期

            if (msgCode.getTamp().compareTo(currentTime) > 0) {
                //验证码是否正确
                if (hash != null && hash.equalsIgnoreCase(msgCode.getHash())) {
                    //如果数据有误,返回注册
                    if(!br.hasErrors()){
                        //再次判断用户名和密码是否被占用
                        boolean access = userService.userNameIsNotExists(user.getUserName())&&userService.userPhoneIsNotExists(user.getUserPhone());
                        if(access){
                            //对用户的密码进行md5加密,同时对密码自动加上前缀和后缀
                            user.setUserPassword(Md5Util.MD5("kf"+user.getUserPassword()+"cg"));
                            user.setCreateTime(new Timestamp(new Date().getTime()));//当前时间作为用户创建时间
                            user.setLastedTime(new Timestamp(new Date().getTime()));//当前时间作为用户最后登陆时间
                            userService.addUser(user);
                            HttpSession session = request.getSession();
                            session.setAttribute("user",user);
                            if(remember!=null&&!remember.isEmpty()){
                                CookieUtil.addCookie(response,"userName",user.getUserName());
                                CookieUtil.addCookie(response,"userPassword",user.getUserPassword());
                            }
                            map.put("msg","ok");
                            if(method.equals("mobile")){
                                map.put("url","/m/index");
                            }else{
                                map.put("url","/index");
                            }
                        }
                        else{
                            map.put("msg","用户名或者手机号已经存在,请检查后重试!");
                        }

                    }else{
                        map.put("msg","您输入的信息有误,请检查后重试!");
                    }
                }else{
                    map.put("msg","您输入的手机动态码不正确,请检查后重试!");
                }
            }else{
                map.put("msg","你的手机动态码已过期,请检查后重试!");
            }
        }else{
            map.put("msg","请输入您的手机动态码!");
        }
        return map;
    }

    @GetMapping("/login")
    public String loginFtl(ModelMap modelMap,HttpServletRequest request){
        Integer ipCount = SessionUtil.getIpCount(request);
        logger.debug("ip数值:"+ipCount);
        if(ipCount!=null&&ipCount>3){
            modelMap.addAttribute("verify","true");
        }
        return "login";
    }
    @GetMapping("/register")
    public ModelAndView regFtl(){
        ModelAndView modelAndView = new ModelAndView("reg");
        return modelAndView;
    }

    @GetMapping("/timeout")
    public ModelAndView timeout(){
        ModelAndView modelAndView = new ModelAndView("timeout");
        return modelAndView;
    }

    @PostMapping("/unIsEx")
    @ResponseBody
    public boolean unIsEx(String userName){

        return StringUtils.isNotBlank(userName)&&userService.userNameIsNotExists(userName);
    }

    @PostMapping("/upIsEx")
    @ResponseBody
    public boolean ueIsEx(String userPhone){

        return StringUtils.isNotBlank(userPhone)&&userService.userPhoneIsNotExists(userPhone);
    }

    @GetMapping("/verifyAccount")
    public String verify(){
        return "alterPass/phone";
    }

    @PostMapping("/verifyAccount")
    public String verifyAccount(String phoneNum,ModelMap modelMap,Device device){
        if(StringUtils.isNotBlank(phoneNum)&&CommonUtil.isPhoneNum(phoneNum)){
            //确定该用户存在
            if(!userService.userPhoneIsNotExists(phoneNum)){
                modelMap.addAttribute("phone",phoneNum);
                if(device.isMobile()||device.isTablet()){
                    return "phone/alterPass/forget";
                }else {
                    return "alterPass/forget";
                }
            }else{
                modelMap.addAttribute("error","您还不是本站会员,请注册!");
            }
        }else{
            modelMap.addAttribute("error","请输入合法的手机号!");
        }
        if(device.isMobile()||device.isTablet()){
            return "phone/alterPass/phone";
        }else {
            return "alterPass/phone";
        }

    }


    @PostMapping("/resetPass")
    public String resetPass(MsgCode msgCode, ModelMap modelMap, Device device){
        //考虑该用户未注册进入这里的情况...
        if(CommonUtil.isLawMsgCode(msgCode)) {
            String hash = Md5Util.MD5(KEY + "@" + msgCode.getTamp() + "@" + msgCode.getCode());
            Calendar c = Calendar.getInstance();
            SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
            String currentTime = sf.format(c.getTime());
            if (msgCode.getTamp().compareTo(currentTime) > 0) {
                //验证码是否正确
                if (hash != null && hash.equalsIgnoreCase(msgCode.getHash())) {
                    //重新hash值,设置将次hash值中带入手机号,以免非法输入其他的手机号
                    msgCode.setHash(Md5Util.MD5(KEY+"@"+msgCode.getTamp()+"@"+msgCode.getCode()+"@"+msgCode.getPhoneNum()));
                    modelMap.addAttribute("msgCode",msgCode);
                    if(device.isMobile()||device.isTablet()){
                        return "phone/alterPass/resetPass";
                    }else {
                        return "alterPass/resetPass";
                    }
                }else {
                    modelMap.addAttribute("tamp",msgCode.getTamp());
                    modelMap.addAttribute("hash",msgCode.getHash());
                    modelMap.addAttribute("phone",msgCode.getPhoneNum());
                    modelMap.addAttribute("error","验证码输入不正确");
                }
            }else{
                modelMap.addAttribute("phone",msgCode.getPhoneNum());
                modelMap.addAttribute("error","验证码已经过期");
            }
        }else{
            modelMap.addAttribute("error","请输入合法的信息");
        }
        if(device.isMobile()||device.isTablet()){
            return "phone/alterPass/forget";
        }else {
            return "alterPass/forget";
        }
    }

    @PostMapping("/alterPassword")
    public String resetPass(String userPassword,MsgCode msgCode,ModelMap modelMap,HttpSession session,Device device){
        if(StringUtils.isNotBlank(userPassword)&&userPassword.length()>=6&&userPassword.length()<=16){
            logger.debug("进入:"+userPassword);
            if(CommonUtil.isLawMsgCode(msgCode)) {
                //对重新hash的数值进行比较
                String hash = Md5Util.MD5(KEY + "@" + msgCode.getTamp() + "@" + msgCode.getCode()+"@"+msgCode.getPhoneNum());
                Calendar c = Calendar.getInstance();
                SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
                String currentTime = sf.format(c.getTime());
                if (msgCode.getTamp().compareTo(currentTime) > 0) {
                    //验证是否正确,全部验证完毕,进行修改数据库
                    if (hash != null && hash.equalsIgnoreCase(msgCode.getHash())) {
                        modelMap.addAttribute("hash",msgCode.getHash());
                        modelMap.addAttribute("tamp",msgCode.getTamp());
                        //对密码进行加密
                        userPassword = Md5Util.MD5("kf"+userPassword+"cg");
                        userService.updateUserPassByUserPhone(userPassword,msgCode.getPhoneNum());
                        User user = userService.getUser(msgCode.getPhoneNum());
                        session.setAttribute("user",user);
                        if(device.isMobile()||device.isTablet()){
                            return "phone/alterPass/resetPassOk";
                        }else {
                            return "alterPass/resetPassOk";
                        }
                    }else {
                        modelMap.addAttribute("phone",msgCode.getPhoneNum());
                        modelMap.addAttribute("error","错误的请求");
                        if(device.isMobile()||device.isTablet()){
                            return "phone/alterPass/verifyAccount";
                        }else {
                            return "alterPass/verifyAccount";
                        }
                    }
                }else{
                    modelMap.addAttribute("phone",msgCode.getPhoneNum());
                    modelMap.addAttribute("error","您的请求已过期");
                    if(device.isMobile()||device.isTablet()){
                        return "phone/alterPass/verifyAccount";
                    }else {
                        return "alterPass/verifyAccount";
                    }
                }
            }else{
                modelMap.addAttribute("error","错误的请求");
                if(device.isMobile()||device.isTablet()){
                    return "phone/alterPass/verifyAccount";
                }else {
                    return "alterPass/verifyAccount";
                }
            }

        }else{
            modelMap.addAttribute("error","对不起,您输入的密码不合法!");
            if(device.isMobile()||device.isTablet()){
                return "phone/alterPass/resetPass";
            }else {
                return "alterPass/resetPass";
            }
        }
    }

}
