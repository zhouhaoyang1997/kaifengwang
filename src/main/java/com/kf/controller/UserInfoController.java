package com.kf.controller;

import com.kf.pojo.User;
import com.kf.service.UserService;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import com.kf.util.BasePath;
import com.kf.util.CommonUtil;
import com.kf.util.Md5Util;
import com.kf.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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

    @Autowired
    public BasePath basePath;


    /**
     * 显示信息
     * @param request
     * @return
     */
    @GetMapping("/user/info")
    public ModelAndView userInfo(HttpServletRequest request){
        ModelAndView modelAndView = null;
        Integer userId= SessionUtil.getUserId(request);
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

    /**
     * 修改密码
     * @param request
     * @param oldPwd
     * @param newPwd
     * @return
     */
    @PostMapping("/user/alterPwd")
    public ModelAndView alterPwd(HttpServletRequest request, String oldPwd, String newPwd){
        ModelAndView modelAndView = null;
        Integer userId=SessionUtil.getUserId(request);
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
     * 用户修改手机号
     * @return
     */
    @GetMapping("/user/alterPhone")
    @ResponseBody
    public String alterUserInfo(String userPhone,HttpServletRequest request){
        Integer userId=SessionUtil.getUserId(request);
        if(userId!=null){
            //验证手机号是否符合规则
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
        }else{
            return "no:服务器开小差了!请刷新后再试!";
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
        if(userId!=null){
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
        }else{
            return "no:服务器开小差了!请刷新后再试!";
        }
    }


    /**
     * 修改头像
     * @param request
     * @param file
     * @return
     */
    @PostMapping("/user/alterHead")
    public ModelAndView alterUserHead(HttpServletRequest request, MultipartFile file){
        Integer userId=SessionUtil.getUserId(request);
        ModelAndView modelAndView = null;
        if(userId!=null){
            modelAndView= userInfo(request);
            if(file==null||file.isEmpty()){
                modelAndView.addObject("headInfo","修改头像失败，文件上传为空");
                return modelAndView;
            }else{
                if(file.getSize()>1024*1024){
                    modelAndView.addObject("headInfo","修改头像失败,上传文件过大,请上传1M以下图片");
                    return modelAndView;
                }
                String originalName = file.getOriginalFilename();
                String suffix = originalName.substring(originalName.lastIndexOf(".") + 1);
                String savePath = basePath.getHeadImgPath();
                String filePath = UUID.randomUUID().toString() + "." + suffix;
                try {
                    file.transferTo(new File(savePath+filePath));
                } catch (IOException e) {
                    modelAndView.addObject("headInfo","修改头像失败,上传图片发生异常，请稍后再试");
                    return modelAndView;
                }
                //将图片路径存入数据库
                String imgUrl = "img/headImg/"+filePath;
                userService.updateUserImg(imgUrl,userId);
                modelAndView.addObject("headInfo","修改头像成功!");
            }
        }else{
            modelAndView = new ModelAndView("redirect:/login");
        }
        return modelAndView;
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
        if(userId!=null){
            userService.updateUserDescription(userProfileInfo,userId);
            return "ok:个人信息修改成功!";
        }
        else{
            return "no:服务器开小差了!请刷新后再试!";
        }
    }




    @GetMapping("/user/attc")
    public ModelAndView attc(){
        ModelAndView modelAndView = new ModelAndView("about/attc");
        return modelAndView;
    }

    @GetMapping("/user/extension")
    public ModelAndView extension(){
        ModelAndView modelAndView = new ModelAndView("about/service");
        return modelAndView;
    }

    @GetMapping("/user/resume")
    public ModelAndView resume(){
        return new ModelAndView("resume");
    }
}
