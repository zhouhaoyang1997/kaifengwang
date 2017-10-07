package com.kf.controller;

import com.kf.pojo.User;
import com.kf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by 18236 on 2017/9/24.
 */
@Controller
public class UserController {

    @Autowired
    public UserService userService;


    @RequestMapping(value = "/lg", method = RequestMethod.POST)
    public ModelAndView login(User user, String remember, HttpServletRequest request, HttpServletResponse response) {
        //用户名密码正确,当前用户存入session
        ModelAndView modelAndView = null;
        if (userService.getUser(user) != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            //用户点击了记住我
            if (remember != null && !remember.isEmpty()) {
                Cookie cookie = new Cookie("userName", user.getUserName());
                Cookie passCookie = new Cookie("userPassword", user.getUserPassword());
                response.addCookie(cookie);
                response.addCookie(passCookie);
            }
            modelAndView = new ModelAndView("redirect:/index");
        } else {
            modelAndView = new ModelAndView("login");
            modelAndView.addObject("error", "用户名或密码错误");
        }
        return modelAndView;
    }

    @RequestMapping(value = "reg", method = RequestMethod.POST)
    public ModelAndView register(User user) {
        ModelAndView modelAndView = new ModelAndView("redirect:/index");
        return modelAndView;
    }

    @RequestMapping("/login")
    public ModelAndView loginFtl() {
        ModelAndView modelAndView = new ModelAndView("login");
        return modelAndView;
    }

    @RequestMapping("/register")
    public ModelAndView regFtl() {
        ModelAndView modelAndView = new ModelAndView("reg");
        return modelAndView;
    }
}
