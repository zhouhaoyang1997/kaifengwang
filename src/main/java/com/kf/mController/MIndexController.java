package com.kf.mController;

import com.kf.pojo.*;
import com.kf.service.DistrictService;
import com.kf.service.MainClassService;
import com.kf.service.PushInfoService;
import com.kf.util.AdvertUtil;
import com.kf.util.PageUtil;
import com.kf.vo.CurrMain;
import com.kf.vo.TagValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 18236 on 2017/11/23.
 */
@RequestMapping("/m")
@Controller
public class MIndexController {

    @Autowired
    public MainClassService mainClassService;

    @Autowired
    private PushInfoService pushInfoService;

    @Autowired
    private DistrictService districtService;

    @GetMapping("/index")
    public String index(ModelMap modelMap){
        List<MainClass> mainClass= mainClassService.getMainClass();
        modelMap.addAttribute("mainClass",mainClass);

        return "phone/index";
    }


    @GetMapping("/menulist")
    public String menulist(ModelMap modelMap) {
        List<MainClass> mainClass= mainClassService.getMainClass();
        modelMap.addAttribute("mainClass",mainClass);

        return "phone/menulist";
    }


    @GetMapping("/searchPage")
    public String search(){
        return "phone/search";
    }

    @GetMapping("/search")
    public String searchPage(String key,@RequestParam(required = false) Integer districtId,ModelMap modelMap,@RequestParam(defaultValue = "0") Integer pno){

        PageUtil pageUtil = new PageUtil();
        List<PushInfo> pushInfos = pushInfoService.getAllInfoByKeyWords(key,districtId,pno,pageUtil);
        List<District> districts = districtService.getAllDistrict();
        modelMap.addAttribute("districts",districts);
        modelMap.addAttribute("pageUtil",pageUtil);
        modelMap.addAttribute("pushInfos",pushInfos);
        modelMap.addAttribute("currDistrictId",districtId);
        modelMap.addAttribute("keyWords",key);
        return "phone/searchResult";
    }

}
