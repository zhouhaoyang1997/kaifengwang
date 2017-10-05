package com.kf.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by 18236 on 2017/10/2.
 */
@Controller
public class UserInfoController {

    @GetMapping("/user/info")
    public ModelAndView userInfo(Integer userId){
        ModelAndView modelAndView = new ModelAndView("userInfo");
        return modelAndView;
    }

    @GetMapping("/user/personal")
    public ModelAndView personal(Integer userId){
        ModelAndView modelAndView = new ModelAndView("personal");
        return modelAndView;
    }

    @GetMapping("/user/attc")
    public ModelAndView attc(Integer userId){
        ModelAndView modelAndView = new ModelAndView("attc");
        return modelAndView;
    }

    @GetMapping("/user/extension")
    public ModelAndView extension(Integer userId){
        ModelAndView modelAndView = new ModelAndView("extension");
        return modelAndView;
    }
}
