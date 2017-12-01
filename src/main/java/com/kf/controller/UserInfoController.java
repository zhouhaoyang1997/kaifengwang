package com.kf.controller;

import com.kf.exception.UserNotLoginException;
import com.kf.pojo.User;
import com.kf.service.UserService;
import com.kf.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

/**
 * Created by 18236 on 2017/10/2.
 */
@Controller
public class UserInfoController {

    @Autowired
    public UserService userService;

    @Autowired
    public BasePath basePath;


    /**
     * 显示信息
     * @param request
     * @return
     */
    @GetMapping("/user/info")
    public ModelAndView userInfo(HttpServletRequest request){
        Integer userId= SessionUtil.getUserId(request);
        if(userId==null){
            throw new UserNotLoginException("500","对不起,您的登录已经过期!请重新登录");
        }
        User user = userService.getUserByUserId(userId);
        ModelAndView modelAndView = new ModelAndView("user/userInfo");
        modelAndView.addObject("userInfo",user);
        return modelAndView;
    }


    @GetMapping("/user/info/pic")
    public ModelAndView pic(HttpServletRequest request){
        Integer userId= SessionUtil.getUserId(request);
        ModelAndView modelAndView = new ModelAndView("user/pic");
        try{
            String userImg = userService.getUserByUserId(userId).getUserImg();
            modelAndView.addObject("userImg",userImg);
        }catch (Exception e){
            throw new UserNotLoginException("500","对不起,您的登录已经过期!请重新登录");
        }
        return modelAndView;
    }

    @GetMapping("/user/info/pwd")
    public ModelAndView pwd(HttpServletRequest request){
        return new ModelAndView("user/pwd");
    }

    @GetMapping("/user/info/alterInfo")
    public ModelAndView info(HttpServletRequest request){
        Integer userId= SessionUtil.getUserId(request);
        if(userId==null){
            throw new UserNotLoginException("500","对不起,您的登录已经过期!请重新登录");
        }
        User user = userService.getUserByUserId(userId);
        ModelAndView modelAndView = new ModelAndView("user/alterInfo");
        modelAndView.addObject("userInfo",user);
        return modelAndView;
    }

    /**
     * 修改密码
     * @param request
     * @param oldPwd
     * @param newPwd
     * @return
     */
    @PostMapping("/user/alterPwd")
    public ModelAndView alterPwd(HttpServletRequest request, String oldPwd, String newPwd,Device device){
        ModelAndView modelAndView=new ModelAndView("user/pwd");
        Integer userId=SessionUtil.getUserId(request);
        if(userId==null){
            throw new UserNotLoginException("500","对不起,您的登录已经过期!请重新登录");
        }else{
            if(CommonUtil.isNotstrContainsBackspace(oldPwd)&&CommonUtil.isNotstrContainsBackspace(newPwd)){
                HttpSession session = request.getSession();
                User user = (User)session.getAttribute("user");
                oldPwd= Md5Util.MD5("kf"+oldPwd+"cg");
                //和用户原密码匹配,如果通过,可以进行修改
                if(oldPwd!=null&&oldPwd.equals(user.getUserPassword())){
                    //如果原密码新密码不相同,更新数据库
                    if(newPwd.length()>=6&&newPwd.length()<=20){
                        newPwd=Md5Util.MD5("kf"+newPwd+"cg");
                        userService.updateUserPwd(userId,newPwd);
                        //清除session
                        session.removeAttribute("user");
                        modelAndView=new ModelAndView("redirect:/login");
                    }else{
                        modelAndView.addObject("alterPwdError","新密码输入不合法,请输入6-20位合法字符");
                    }
                }else{
                    modelAndView.addObject("alterPwdError","原密码输入不正确");
                }
            }else{
                modelAndView.addObject("alterPwdError","输入不合法");
            }
        }
        //判断是否移动端
        if (device.isMobile()||device.isTablet()) {
            modelAndView.setViewName("phone/alterPwd");
        }
        return modelAndView;
    }
    /**
     * 用户修改手机号
     * @return
     */
    @GetMapping("/user/alterPhone")
    @ResponseBody
    public String alterUserInfo(String userPhone,HttpServletRequest request){
        Integer userId=SessionUtil.getUserId(request);
        if(userId==null){
            throw new UserNotLoginException("500","对不起,您的登录已经过期!请重新登录");
            //验证手机号是否符合规则

        }else{
            if(CommonUtil.isPhoneNum(userPhone)){
                //验证手机号是否已经存在,验证邮箱是否被除自己之外人使用
                boolean phoneExists = userService.userPhoneIsNotExists(userId,userPhone);
                if(!phoneExists){
                    return "no:手机号已经被使用了!";
                }else{
                    userService.updateUserPhone(userId,userPhone);
                    return "ok:手机号修改成功!";
                }
            }else{
                return "no:你输入的手机号不合法!";
            }
        }
    }

    /**
     * 修改邮箱
     * @param userEmail
     * @param request
     * @return
     */
    @GetMapping("/user/alterEmail")
    @ResponseBody
    public String alterUserEmail(String userEmail,HttpServletRequest request){
        Integer userId=SessionUtil.getUserId(request);
        if(userId==null){
            throw new UserNotLoginException("500","对不起,您的登录已经过期!请重新登录");
        }else{
            if(CommonUtil.isEmail(userEmail)){
                boolean emailExists = userService.userEmailIsNotExists(userId,userEmail);
                if(!emailExists){
                    return "no:邮箱已经被使用了!";
                }else{
                    userService.updateUserEmail(userId,userEmail);
                    return "ok:邮箱修改成功!";
                }
            }else{
                return "no:你输入的邮箱不合法!";
            }
        }
    }


    /**
     * 修改头像
     * @param request
     * @param file
     * @return
     */
    @PostMapping("/user/alterHead")
    public ModelAndView alterUserHead(HttpServletRequest request, MultipartFile file,Device device){
        Integer userId=SessionUtil.getUserId(request);
        if(userId==null){
            throw new UserNotLoginException("500","对不起,您的登录已经过期!请重新登录");
        }else{
            ModelAndView modelAndView = null;
            if(file==null||file.isEmpty()){
                modelAndView = pic(request);
                modelAndView.addObject("headInfo","修改头像失败，文件上传为空");
                //判断是否移动端
                if (device.isMobile()||device.isTablet()) {
                    modelAndView.setViewName("phone/alterInfo");
                }
                return modelAndView;
            }else{
                if(file.getSize()>1024*1024){
                    modelAndView = pic(request);
                    modelAndView.addObject("headInfo","修改头像失败,上传文件过大,请上传1M以下图片");
                    //判断是否移动端
                    if (device.isMobile()||device.isTablet()) {
                        modelAndView.setViewName("phone/alterInfo");
                    }
                    return modelAndView;
                }
                String filePath = FileUtil.getFilePath(file,"img/headimg/");
                try {
                    System.out.println(basePath.getPathValue()+filePath);
                    file.transferTo(new File(basePath.getPathValue()+filePath));
                    //将图片路径存入数据库
                    userService.updateUserImg(filePath,userId,basePath.getPathValue());
                    if (device.isMobile()||device.isTablet()) {
                        modelAndView=new ModelAndView("redirect:/m/user/alterInfo");
                    }else {
                        modelAndView = new ModelAndView("redirect:/user/info");

                    }

                } catch (IOException e) {
                    modelAndView = pic(request);
                    modelAndView.addObject("headInfo","修改头像失败,上传图片发生异常，请稍后再试");
                    //判断是否移动端
                    if (device.isMobile()||device.isTablet()) {
                        modelAndView.setViewName("phone/alterInfo");
                    }
                    return modelAndView;
                }
            }

            return modelAndView;
        }
    }

    /**
     * 修改个人信息
     * @param userProfileInfo
     * @param request
     * @return
     */
    @GetMapping("/user/alterProfileInfo")
    @ResponseBody
    public String alterUserProfileInfo(String userProfileInfo,HttpServletRequest request){
        Integer userId=SessionUtil.getUserId(request);
        if(userId==null){
            throw new UserNotLoginException("500","对不起,您的登录信息已过期,请重新登录!");

        }else{
            userService.updateUserDescription(userProfileInfo,userId);
            return "ok:个人信息修改成功!";
        }
    }






    @GetMapping("/user/extension")
    public ModelAndView extension(){
        ModelAndView modelAndView = new ModelAndView("about/service");
        return modelAndView;
    }


}
