package com.kf.controller;

import com.kf.pojo.User;
import com.kf.service.UserService;
import com.kf.util.CommonUtil;
import com.kf.util.CookieUtil;
import com.kf.util.Md5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

/**
 * Created by 18236 on 2017/9/24.
 */
@Controller
public class UserController {

    @Autowired
    public UserService userService;


    @PostMapping("/login")
    public ModelAndView login(User user, String remember, HttpServletRequest request, HttpServletResponse response){
        //用户名密码正确,当前用户存入session
        ModelAndView modelAndView = null;
        //如果用户输入了信息
        if(CommonUtil.isNotNullAndNotEmpty(user.getUserPassword())&&CommonUtil.isNotNullAndNotEmpty(user.getUserPassword())){
            user.setUserPassword(Md5Util.MD5("kf"+user.getUserPassword()+"cg"));
            User user1 = userService.getUser(user);
            if(user1!=null){
                HttpSession session = request.getSession();
                session.setAttribute("user",user1);
                //用户点击了记住我
                if(remember!=null&&!remember.isEmpty()){
                    CookieUtil.addCookie(response,"userName",user.getUserName());
                    CookieUtil.addCookie(response,"userPassword",user.getUserPassword());
                }
                //默认登陆后返回首页,如果session中有值,则返回用户点击登陆的页面
                String url="/index";
                if(session.getAttribute("lastedUrl")!=null){
                    url=(String)session.getAttribute("lastedUrl");
                }
                modelAndView = new ModelAndView("redirect:"+url);
            }else{
                modelAndView = new ModelAndView("login");
                modelAndView.addObject("error","用户名或密码错误!");
            }
        }else{
            modelAndView = new ModelAndView("login");
            modelAndView.addObject("error","请输入合法的信息!");
        }
        return modelAndView;
    }

    /**
     * 注销
     * @param request
     * @param response
     * @return
     */
    @GetMapping("logout")
    public ModelAndView logout(HttpServletRequest request,HttpServletResponse response){
        HttpSession session = request.getSession();
        //返回注销前的页面,默认返回index
        String url="/index";
        if(session.getAttribute("lastedUrl")!=null){
            url=(String)session.getAttribute("lastedUrl");
        }
        //移除session
        session.removeAttribute("user");
        //移除cookie
        CookieUtil.removeCookie(response,request,"userName");
        CookieUtil.removeCookie(response,request,"userPassword");
        ModelAndView modelAndView = new ModelAndView("redirect:"+url);
        return modelAndView;
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
    public ModelAndView register(@Valid @ModelAttribute("userDetail") User user,BindingResult br, String remember, HttpServletRequest request, HttpServletResponse response){
        ModelAndView modelAndView = null;
        //如果数据有误,返回注册
        if(br.hasErrors()){
            modelAndView = new ModelAndView("reg");
        }else{
            //对用户的密码进行md5加密,同时对密码自动加上前缀和后缀
            user.setUserPassword(Md5Util.MD5("kf"+user.getUserPassword()+"cg"));
            userService.addUser(user);
            HttpSession session = request.getSession();
            session.setAttribute("user",user);
            if(remember!=null&&!remember.isEmpty()){
                CookieUtil.addCookie(response,"userName",user.getUserName());
                CookieUtil.addCookie(response,"userPassword",user.getUserPassword());
            }
            modelAndView = new ModelAndView("redirect:/index");
        }
        return modelAndView;
    }

    @GetMapping("/login")
    public ModelAndView loginFtl(){
        ModelAndView modelAndView = new ModelAndView("login");
        return modelAndView;
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



}
