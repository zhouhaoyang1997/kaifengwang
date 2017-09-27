package com.kf.controller;

import com.kf.pojo.District;
import com.kf.pojo.PushInfo;
import com.kf.pojo.SecondClass;
import com.kf.pojo.Tag;
import com.kf.service.DistrictService;
import com.kf.service.PushInfoService;
import com.kf.service.SecondClassService;
import com.kf.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by 18236 on 2017/9/26.
 */
@Controller
public class JobController {

    @Autowired
    public SecondClassService secondClassService;

    @Autowired
    private DistrictService districtService;

    @Autowired
    private TagService tagService;

    @Autowired
    private PushInfoService jobService;

    @RequestMapping("/jobs")
    public ModelAndView jobPage() {
        ModelAndView modelAndView = new ModelAndView("jobs");
        List<SecondClass> zhaopin = secondClassService.getAllSecondClass(1);
        List<District> districts = districtService.getAllDistrict();
        List<Tag> tags = tagService.getAllTag(1);
        List<PushInfo> jobInfos = jobService.getAllJob();
        //查询招聘类别
        modelAndView.addObject("zhaopin", zhaopin);
        //查询所有行政区域
        modelAndView.addObject("districts", districts);
        //查询所有标签
        modelAndView.addObject("tags", tags);
        modelAndView.addObject("jobInfos", jobInfos);

        return modelAndView;
    }
}