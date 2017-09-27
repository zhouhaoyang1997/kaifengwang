package com.kf.controller;

import com.kf.pojo.District;
import com.kf.pojo.MainClass;
import com.kf.pojo.Tag;
import com.kf.service.DistrictService;
import com.kf.service.MainClassService;
import java.util.List;

import com.kf.service.TagService;
import com.kf.vo.TagValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by 18236 on 2017/9/27.
 */
@Controller
public class PushController {

    @Autowired
    public MainClassService mainClassService;


    @Autowired
    private DistrictService districtService;


    @Autowired
    private TagService tagService;
    /**
     * 选择主类及副类
     * @return
     */
    @RequestMapping("/push/chooseMc")
    public ModelAndView chooseMainClass(){
        ModelAndView modelAndView = new ModelAndView("chooseMc");
        List<MainClass> mainClass= mainClassService.getMainClass();
        modelAndView.addObject("mainClass",mainClass);
        return modelAndView;
    }


    /**
     * 填写信息,
     * @return
     */
    @RequestMapping("/push/fill")
    public ModelAndView chooseSecondClass(int mcId,int scId){
        ModelAndView modelAndView = new ModelAndView("pushInfo");
        List<District> districts = districtService.getAllDistrict();
        List<Tag> tags = tagService.getAllTag(mcId);
        modelAndView.addObject("districts",districts);
        modelAndView.addObject("tags",tags);
        return modelAndView;

    }
}
