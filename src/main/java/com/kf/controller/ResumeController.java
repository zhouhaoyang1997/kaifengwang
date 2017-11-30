package com.kf.controller;

import com.kf.exception.PiIdNotFoundException;
import com.kf.exception.ServerException;
import com.kf.exception.UserNotLoginException;
import com.kf.pojo.Advert;
import com.kf.pojo.District;
import com.kf.pojo.Resume;
import com.kf.pojo.SecondClass;
import com.kf.service.AdvertService;
import com.kf.service.DistrictService;
import com.kf.service.ResumeService;
import com.kf.service.SecondClassService;
import com.kf.util.*;
import com.kf.vo.ResumeMin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
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
    private AdvertService advertService;

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
        List<Advert> adverts = advertService.getAdvertByPage("list");
        modelAndView.addObject("resumes",resumes);
        modelAndView.addObject("districts",districts);
        modelAndView.addObject("secondClass",secondClass);
        modelAndView.addObject("pageUtil",pageUtil);
        modelAndView.addObject("resumeMin",resumeMin);
        modelAndView.addObject("advertMap", AdvertUtil.conversionMap(adverts));
        return modelAndView;
    }



    private void base(ModelMap model,HttpServletRequest request){
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
    public String addResume(@Valid @ModelAttribute("resume") Resume resume, BindingResult br, MultipartFile file, ModelMap model, HttpServletRequest request, Device device){
        Integer userId= SessionUtil.getUserId(request);
        if(userId==null){
            throw new UserNotLoginException("500","对不起,你的登录已经过期!");
        }
        resume.setUserId(userId);
        if(br.hasErrors()){
            base(model,request);
            //判断是否移动端
            if (device.isMobile()||device.isTablet()) {
                return "phone/myCv";
            }else {
                return "resume";
            }
        }else{
            //如果用户上传了图片
            String savePath = basePath.getPathValue();
            boolean deletePicFlag=false;
            if(file!=null&&!file.isEmpty()){
                if(file.getSize()<1024*1024){
                    String filePath = FileUtil.getFilePath(file,"img/resume/");
                    resume.setCvImg(filePath);
                    //存入图片
                    File pic = new File(savePath+filePath);
                    if(!pic.getParentFile().exists()){
                        pic.getParentFile().mkdirs();
                    }
                    try{
                        file.transferTo(pic);
                        deletePicFlag=true;
                    }catch (IOException e){
                        throw new ServerException("500","上传图片失败,服务器发生了异常!请稍后再试!",e.getMessage());
                    }
                }else{
                    base(model,request);
                    model.addAttribute("picError","对不起,您上传的图片过大,换一张试试?");
                    //判断是否移动端
                    if (device.isMobile()||device.isTablet()) {
                       return "phone/myCv";
                    }else {
                        return "resume";
                    }
                }
            }
            //更新用户的操作
            resume.setUpdateTime(new Timestamp(new Date().getTime()));
            resumeService.insertOrUpdateResume(resume,savePath,deletePicFlag);
        }
        //判断是否移动端
        if (device.isMobile()||device.isTablet()) {
            return "phone/myCv";
        }else {
            return "redirect:/user/resume";
        }
    }

    @GetMapping("/user/resume/open")
    @ResponseBody
    public String openFlag(Integer cvId,Integer flag){
        //更新当前简历是否公开
        resumeService.updateResumeOpenFlag(flag,cvId);

        return "ok";
    }


    @GetMapping("/resume/info")
    public String infoResume(Integer cvId,ModelMap modelMap){
        Resume resume = resumeService.getResumeByCvId(cvId);
        List<Advert> adverts = advertService.getAdvertByPage("content");
        if(resume!=null){
            if(resume.getStatus()!=1){
                throw new PiIdNotFoundException("404","您查看的信息违反了网站的规约,现在已经被管理员拿下了!Sorry");
            }else{
                modelMap.addAttribute("advertMap",AdvertUtil.conversionMap(adverts));
                modelMap.addAttribute("info",resume);
                return "resumeInfo";
            }
        }else{
            throw new PiIdNotFoundException("404","对不起,您访问的资源飞到了外太空去了emmmmmm");
        }

    }

}
