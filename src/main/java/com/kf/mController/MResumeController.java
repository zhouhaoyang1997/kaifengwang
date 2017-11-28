package com.kf.mController;

import com.kf.controller.PicController;
import com.kf.exception.UserNotLoginException;
import com.kf.pojo.District;
import com.kf.pojo.Resume;
import com.kf.pojo.SecondClass;
import com.kf.service.DistrictService;
import com.kf.service.ResumeService;
import com.kf.service.SecondClassService;
import com.kf.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author zhy
 * @create 2017-11-27 23:41
 **/
@RequestMapping("/m")
@Controller
public class MResumeController {
    @Autowired
    DistrictService districtService;
    @Autowired
    ResumeService resumeService;
    @Autowired
    SecondClassService secondClassService;

    @GetMapping("/user/resume")
    public String myCv(ModelMap model,HttpServletRequest request){
        base(model,request);
        return "phone/myCv";
    }

    private void base(ModelMap model, HttpServletRequest request){
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
}
