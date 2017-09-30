package com.kf.controller;

import com.kf.pojo.SecondClass;
import com.kf.service.SecondClassService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by 18236 on 2017/9/25.
 */
@Controller
public class IndexController {


    @Autowired
    public SecondClassService secondClassService;

    @RequestMapping("/index")
    public ModelAndView index(){
        ModelAndView modelAndView = new ModelAndView("index");
        List<SecondClass> zhaoPin = secondClassService.getAllSecondClass(1);
        List<SecondClass> fangchan = secondClassService.getAllSecondClass(2);
        List<SecondClass> ershou  = secondClassService.getAllSecondClass(3);
        List<SecondClass> shenghuo = secondClassService.getAllSecondClass(4);
        List<SecondClass> chongwu = secondClassService.getAllSecondClass(5);
        List<SecondClass> mingqi = secondClassService.getAllSecondClass(6);
        modelAndView.addObject("zhaopin",zhaoPin);
        modelAndView.addObject("fangchan",fangchan);
        modelAndView.addObject("ershou",ershou);
        modelAndView.addObject("shenghuo",shenghuo);
        modelAndView.addObject("chongwu",chongwu);
        modelAndView.addObject("mingqi",mingqi);
        return modelAndView;
    }

    @RequestMapping("/phone/index")
    public ModelAndView phoneIndex(){
        ModelAndView modelAndView = new ModelAndView("phone/index");
        return modelAndView;
    }


}
