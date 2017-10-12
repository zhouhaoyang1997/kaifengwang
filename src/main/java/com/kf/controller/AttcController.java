package com.kf.controller;

import com.kf.pojo.Company;
import com.kf.service.CompanyService;
import com.kf.service.UserService;
import com.kf.util.BasePath;
import com.kf.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * 该controller作为公司认证
 * Created by 18236 on 2017/10/12.
 */
@Controller
public class AttcController {

    @Autowired
    private BasePath basePath;

    @Autowired
    private UserService userService;

    @Autowired
    private CompanyService companyService;

    @PostMapping("/user/attc")
    public ModelAndView attc(Company company, HttpServletRequest request){
        ModelAndView modelAndView = null;
        Integer userId= SessionUtil.getUserId(request);
        if(userId!=null){
            modelAndView = new ModelAndView("attc");
            company.setCpUser(userId);
            companyService.insertCompany(company);
            userService.updateUserAttc(userId,0);
        }else{
            //不符合要求默认跳转首页
            modelAndView = new ModelAndView("redirect:/index");
        }
        return modelAndView;
    }

}
