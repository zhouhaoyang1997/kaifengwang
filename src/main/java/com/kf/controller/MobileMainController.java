package com.kf.controller;

import com.kf.pojo.SecondClass;
import com.kf.service.SecondClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author zhy
 * @create 2017-09-25 21:04
 **/
@RestController
@RequestMapping(value = "/m")
public class MobileMainController {

    @Autowired
    public SecondClassService secondClassService;

    @GetMapping("/index")
    public ModelAndView phoneIndex(){
        ModelAndView modelAndView = new ModelAndView("phone/index");

        return modelAndView;
    }

    @GetMapping("/zhaopin")
    public ModelAndView quanzhizhaopin(){
        return new ModelAndView("phone/infolist");
    }
    @GetMapping("/information")
    public ModelAndView information(){
        return new ModelAndView("phone/information");
    }

    @GetMapping("/menulist")
    public ModelAndView menulist() {
        ModelAndView modelAndView = new ModelAndView("phone/menulist");
        List<SecondClass> zhaopin = secondClassService.getAllSecondClass(1);
        List<SecondClass> fangchan = secondClassService.getAllSecondClass(2);
        List<SecondClass> ershou = secondClassService.getAllSecondClass(3);
        List<SecondClass> shenghuo = secondClassService.getAllSecondClass(4);
        List<SecondClass> chongwu = secondClassService.getAllSecondClass(5);
        List<SecondClass> mingqi = secondClassService.getAllSecondClass(6);
        modelAndView.addObject("zhaopin", zhaopin);
        modelAndView.addObject("fangchan", fangchan);
        modelAndView.addObject("ershou", ershou);
        modelAndView.addObject("shenghuo", shenghuo);
        modelAndView.addObject("chongwu", chongwu);
        modelAndView.addObject("mingqi", mingqi);
        return modelAndView;
    }

}
