package com.kf.controller;

import com.kf.pojo.Advert;
import com.kf.pojo.HotSearch;
import com.kf.pojo.SecondClass;
import com.kf.service.AdvertService;
import com.kf.service.HotSearchService;
import com.kf.service.SecondClassService;

import java.nio.file.Paths;
import java.util.List;

import com.kf.util.AdvertUtil;
import com.kf.util.BasePath;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by 18236 on 2017/9/25.
 */
@Controller
public class IndexController {


    @Autowired
    private SecondClassService secondClassService;

    @Autowired
    private BasePath basePath;

    @Autowired
    private AdvertService advertService;

    @Autowired
    private ResourceLoader resourceLoader;

    @Autowired
    private HotSearchService hotSearchService;

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
        //广告图片
        List<Advert> adverts = advertService.getAdvertByPage("index");
        modelAndView.addObject("advertMap", AdvertUtil.conversionMap(adverts));
        return modelAndView;
    }

    @RequestMapping("/phone/index")
    public ModelAndView phoneIndex(){
        ModelAndView modelAndView = new ModelAndView("phone/index");
        return modelAndView;
    }

    @GetMapping("/hotSearch")
    @ResponseBody
    public List<HotSearch> getHotSearch(){
        return hotSearchService.getHotSearch(5);
    }



}
