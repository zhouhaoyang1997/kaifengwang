package com.kf.controller;

import com.kf.pojo.PushInfo;
import com.kf.pojo.User;
import com.kf.service.PushInfoService;
import com.kf.service.UserService;
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

    @Autowired
    private UserService userService;

    @RequestMapping("/info")
    public ModelAndView Info(Integer piId){
        ModelAndView modelAndView = new ModelAndView("info");
        if(piId!=null){
            PushInfo pushInfo = pushInfoService.getInfoByPiId(piId);
            Integer userId = pushInfo.getUserId();
            User infoUser = userService.getUserByUserId(userId);
            modelAndView.addObject("info",pushInfo);
            modelAndView.addObject("infoUser",infoUser);
        }
        return modelAndView;
    }
}
