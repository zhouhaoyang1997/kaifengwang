package com.kf.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author zhy
 * @create 2017-09-25 21:04
 **/
@RestController
@RequestMapping(value = "/m")
public class MobileMainController {

    @GetMapping("/index")
    public ModelAndView phoneIndex(){
        ModelAndView modelAndView = new ModelAndView("phone/index");
        return modelAndView;
    }

    @GetMapping("/quanzhizhaopin")
    public ModelAndView quanzhizhaopin(){
        return new ModelAndView("phone/quanzhizhaopin");
    }
}
