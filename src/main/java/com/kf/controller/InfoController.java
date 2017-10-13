package com.kf.controller;

import com.kf.pojo.PushInfo;
import com.kf.service.PushInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by 18236 on 2017/10/2.
 */
@Controller
public class InfoController {

    @Autowired
    private PushInfoService pushInfoService;

    @RequestMapping("/info")
    public ModelAndView Info(Integer piId){
        ModelAndView modelAndView = new ModelAndView("info");
        if(piId!=null){
            PushInfo pushInfo = pushInfoService.getInfoByPiId(piId);
            modelAndView.addObject("info",pushInfo);
        }
        return modelAndView;
    }
}
