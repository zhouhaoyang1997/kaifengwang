package com.kf.controller;

import com.kf.pojo.District;
import com.kf.pojo.Resume;
import com.kf.pojo.SecondClass;
import com.kf.service.DistrictService;
import com.kf.service.ResumeService;
import com.kf.service.SecondClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

/**
 * Created by 18236 on 2017/11/2.
 */
@Controller
public class ResumeController {



    @Autowired
    private SecondClassService secondClassService;

    @Autowired
    private DistrictService districtService;

    @Autowired
    private ResumeService resumeService;

    @GetMapping("/user/resume")
    public ModelAndView resume(ModelMap model){
        List<District> districts = districtService.getAllDistrict();
        List<SecondClass> zhaoPin = secondClassService.getAllSecondClass(1);
        model.addAttribute("zps",zhaoPin);
        model.addAttribute("districts",districts);
        return new ModelAndView("resume");
    }

    @PostMapping("/user/addResume")
    public ModelAndView addResume(@Valid @ModelAttribute("resume") Resume resume, BindingResult br, ModelMap model){
        if(br.hasErrors()){
            return new ModelAndView("resume");
        }else{
            resumeService.insertResume(resume);
        }
        return new ModelAndView("resume");
    }
}
