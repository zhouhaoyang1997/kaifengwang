package com.kf.controller;

import com.kf.pojo.User;
import com.kf.service.UserService;

import java.util.List;

import com.kf.util.CommonUtil;
import com.kf.util.Md5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by 18236 on 2017/10/2.
 */
@Controller
public class UserInfoController {

    @Autowired
    public UserService userService;


    /**
     * 通用从session中获取id的方法
     * @param request
     * @return
     */
    private Integer getUserId(HttpServletRequest request){
        HttpSession session = request.getSession();
        if(session.getAttribute("user")!=null){
            User user = (User)session.getAttribute("user");
            return user.getUserId();
        }
        return null;
    }



    @GetMapping("/user/info")
    public ModelAndView userInfo(HttpServletRequest request){
        ModelAndView modelAndView = null;
        Integer userId= getUserId(request);
        if(userId!=null){
            User user = userService.getUserByUserId(userId);
            List<Integer> piIds = userService.getAllPiIdByUserId(userId);
            modelAndView = new ModelAndView("userInfo");
            modelAndView.addObject("userInfo",user);
        }else{
            modelAndView = new ModelAndView("redirect:/login");
        }
        return modelAndView;
    }

    @PostMapping("/user/alterPwd")
    public ModelAndView alterPwd(HttpServletRequest request, String oldPwd, String newPwd){
        ModelAndView modelAndView = null;
        Integer userId=getUserId(request);
        if(userId!=null){
            //如果字符串不为null且value不含空格
            if(CommonUtil.isNotstrContainsBackspace(oldPwd)&&CommonUtil.isNotstrContainsBackspace(newPwd)){
                HttpSession session = request.getSession();
                User user = (User)session.getAttribute("user");
                oldPwd= Md5Util.MD5("kf"+oldPwd+"cg");
                //和用户原密码匹配,如果通过,可以进行修改
                if(oldPwd!=null&&oldPwd.equals(user.getUserPassword())){
                    //如果原密码新密码不相同,更新数据库
                    if(newPwd.length()>6&&newPwd.length()<20){
                        newPwd=Md5Util.MD5("kf"+newPwd+"cg");
                        userService.updateUserPwd(userId,newPwd);
                        //清除session
                        session.removeAttribute("user");
                        modelAndView=new ModelAndView("redirect:/login");
                    }else{
                        modelAndView=userInfo(request);
                        modelAndView.addObject("alterPwdError","新密码输入不合法,请输入6-20位合法字符");
                    }
                }else{
                    modelAndView= userInfo(request);
                    modelAndView.addObject("alterPwdError","原密码输入不正确");
                }
            }else{
                modelAndView=userInfo(request);
                modelAndView.addObject("alterPwdError","输入不合法");
            }
        }else{
            modelAndView = new ModelAndView("redirect:/login");
        }
        return modelAndView;
    }

    /**
     * 用户修改信息
     * @return
     */
    @GetMapping("/user/alterPhone")
    @ResponseBody
    public String alterUserInfo(String userPhone,HttpServletRequest request){
        Integer userId=getUserId(request);
        if(userId!=null){
            //验证手机号是否符合规则
            System.out.println(userPhone);
            if(CommonUtil.isPhoneNum(userPhone)){
                //验证手机号是否已经存在,验证邮箱是否被使用
                boolean phoneExists = userService.userPhoneIsNotExists(userPhone);
                if(!phoneExists){
                    return "no:手机号已经被使用了!";
                }else{
                    userService.updateUserPhone(userId,userPhone);
                    return "ok:手机号修改成功!";
                }
            }else{
                return "no:你输入的手机号不合法!";
            }
        }else{
            return "no:服务器开小差了!请刷新后再试!";
        }
    }

    @GetMapping("/user/personal")
    public ModelAndView personal(){

        ModelAndView modelAndView = new ModelAndView("personal");
        return modelAndView;
    }

    @GetMapping("/user/attc")
    public ModelAndView attc(){
        ModelAndView modelAndView = new ModelAndView("attc");
        return modelAndView;
    }

    @GetMapping("/user/extension")
    public ModelAndView extension(){
        ModelAndView modelAndView = new ModelAndView("extension");
        return modelAndView;
    }
}
