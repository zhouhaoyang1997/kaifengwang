package com.kf.controller;

import com.kf.exception.UserNotLoginException;
import com.kf.pojo.District;
import com.kf.pojo.Resume;
import com.kf.pojo.SecondClass;
import com.kf.service.DistrictService;
import com.kf.service.ResumeService;
import com.kf.service.SecondClassService;
import com.kf.util.BasePath;
import com.kf.util.FileUtil;
import com.kf.util.PageUtil;
import com.kf.util.SessionUtil;
import com.kf.vo.Flag;
import com.kf.vo.ResumeMin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.File;
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


    @Autowired
    private BasePath basePath;

    @GetMapping("/resume/list")
    public ModelAndView getResumeList(ResumeMin resumeMin,@RequestParam(defaultValue = "0") Integer pno){
        ModelAndView modelAndView = new ModelAndView("resumeList");
        List<SecondClass> secondClass = secondClassService.getAllSecondClass(1);
        List<District> districts = districtService.getAllDistrict();
        if(resumeMin!=null){
            resumeMin.setOpenFlag(1);
        }else{
            resumeMin = new ResumeMin();
            resumeMin.setOpenFlag(1);
        }
        PageUtil pageUtil = new PageUtil();
        List<Resume> resumes = resumeService.getResumeList(resumeMin,pno,pageUtil);
        modelAndView.addObject("resumes",resumes);
        modelAndView.addObject("districts",districts);
        modelAndView.addObject("secondClass",secondClass);
        modelAndView.addObject("pageUtil",pageUtil);
        return modelAndView;
    }


    private void base(ModelMap model,HttpServletRequest request)throws Exception{
        List<District> districts = districtService.getAllDistrict();
        List<SecondClass> zhaoPin = secondClassService.getAllSecondClass(1);
        Integer userId= SessionUtil.getUserId(request);
        if(userId==null){
            throw new UserNotLoginException("500","对不起,可能您的登录已经过期!请重新登录后再试试!");
        }
        Resume resume = resumeService.getResume(userId);

        model.addAttribute("resume",resume);
        model.addAttribute("zps",zhaoPin);
        model.addAttribute("districts",districts);
    }


    @GetMapping("/user/resume")
    public String resume(ModelMap model,HttpServletRequest request)throws Exception{
        base(model,request);
        return "resume";
    }



    @PostMapping("/user/addResume")
    public String addResume(@Valid @ModelAttribute("resume") Resume resume, BindingResult br, MultipartFile file, ModelMap model, HttpServletRequest request)throws Exception{
        Integer userId= SessionUtil.getUserId(request);
        if(userId==null){
            throw new UserNotLoginException("500","对不起,你的登录已经过期!");
        }
        resume.setUserId(userId);
        if(br.hasErrors()){
            base(model,request);
            return "resume";
        }else{
            String filePath = FileUtil.getFilePath(file,"img/resume/");
            resume.setCvImg(filePath);
            String savePath = basePath.getPathValue();
            resumeService.insertOrUpdateResume(resume,savePath);
            //存入图片
            File pic = new File(savePath+filePath);
            if(!pic.getParentFile().exists()){
                pic.getParentFile().mkdirs();
            }
            file.transferTo(pic);
        }
        return "redirect:/user/resume";
    }

    @GetMapping("/user/resume/open")
    @ResponseBody
    public String openFlag(Integer cvId,Integer flag){
        //更新当前简历是否公开
        resumeService.updateResumeOpenFlag(flag,cvId);

        return "ok";
    }

}
