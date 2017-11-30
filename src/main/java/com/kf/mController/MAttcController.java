package com.kf.mController;

import com.kf.exception.UserNotLoginException;
import com.kf.pojo.Company;
import com.kf.service.CompanyService;
import com.kf.service.UserService;
import com.kf.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * @author zhy
 * @create 2017-11-28 23:08
 **/
@Controller
@RequestMapping("/m")
public class MAttcController {
    @Autowired
    UserService userService;
    @Autowired
    CompanyService companyService;

    @GetMapping("/user/attc")
    public String attc(ModelMap modelMap, HttpServletRequest request){
        Integer userId= SessionUtil.getUserId(request);
        if(userId==null){
            throw new UserNotLoginException("500","对不起,你还未登录,您的访问不合法");
        }
        Integer status = userService.getUserByUserId(userId).getUserAttc();
        //如果用户已经认证
        if(status==0){
            Company company = companyService.getCompany(userId);
            modelMap.addAttribute("company",company);
        }
        modelMap.addAttribute("status",status);
        return "phone/attc";
    }

}
