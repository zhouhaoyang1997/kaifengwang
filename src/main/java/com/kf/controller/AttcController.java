package com.kf.controller;

import com.kf.exception.UserNotLoginException;
import com.kf.pojo.Company;
import com.kf.service.CompanyService;
import com.kf.service.UserService;
import com.kf.util.BasePath;
import com.kf.util.FileUtil;
import com.kf.util.SessionUtil;
import com.kf.vo.Flag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import javax.websocket.Session;
import java.io.File;
import java.io.IOException;

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


    @GetMapping("/user/attc")
    public String attc(ModelMap modelMap,HttpServletRequest request){
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
        return "attc";
    }


    @PostMapping("/user/attc")
    public String attc(ModelMap modelMap, @Valid @ModelAttribute("company") Company company,MultipartFile pic, BindingResult br, HttpServletRequest request){
        Integer userId= SessionUtil.getUserId(request);
        if(userId==null){
            throw new UserNotLoginException("500","对不起,你还未登录,请您先登录");
        }else{
            if(br.hasErrors()||pic==null||pic.isEmpty()){
                modelMap.addAttribute("status",1);
            }else{
                if(pic.getSize()>1024*1024*2){
                    modelMap.addAttribute("picError","图片大小超过了上限,请上传2M以下的图片");
                    modelMap.addAttribute("status",1);
                }else{
                    company.setCpUser(userId);

                    String filePath = FileUtil.getFilePath(pic,"img/company/");
                    try {
                        pic.transferTo(new File(basePath.getPathValue() + filePath));
                    }catch(IOException e){
                        modelMap.addAttribute("picError","上传图片时服务器发生了异常,请稍后再试!");
                        modelMap.addAttribute("status",1);
                        return "attc";
                    }
                    //设置状态为待审核状态
                    company.setCpPzImg(filePath);
                    companyService.insertCompany(company);
                    userService.updateUserAttc(userId,2);
                    modelMap.addAttribute("status",2);
                }
            }
            return "attc";
        }
    }

    @GetMapping("/user/reAttc")
    @ResponseBody
    @Transactional
    public String reAttc(HttpServletRequest request){
        Integer userId = SessionUtil.getUserId(request);
        if(userId==null){
            throw new UserNotLoginException("500","对不起,你还未登录,请您先登录");
        }else{
            //更新user数据,变为未认证状态
            userService.updateUserAttc(userId,1);
            //从company中删除原有信息

            companyService.deleteCompany(userId);
            return "ok";
        }
    }

    @GetMapping("/user/initCompanyPic")
    @ResponseBody
    public String initPic(HttpServletRequest request){
        Integer userId=SessionUtil.getUserId(request);
        return companyService.getCompany(userId).getCpImg();
    }

    @PostMapping("/user/uploadCompanyPic")
    @ResponseBody
    public Flag uploadCompanyPic(@RequestParam("pic")MultipartFile[] pic,HttpServletRequest request){
        Integer userId = SessionUtil.getUserId(request);
        String baseImgStr = companyService.getCompany(userId).getCpImg();
        String otherImgUrl = "";
        try{
            otherImgUrl = FileUtil.addPic(pic,"img/company/",basePath.getPathValue());
        }catch(IOException e){
            return new Flag("false");
        }
        if(baseImgStr!=null){
            otherImgUrl = baseImgStr+"#"+otherImgUrl;
        }
        if(!otherImgUrl.isEmpty()){
            //更新数据库
            companyService.updateCompanyCpImg(userId,otherImgUrl.substring(0,otherImgUrl.length()-1));
        }
        return new Flag("true");
    }

    @PostMapping("/user/picCompanyDelete")
    @ResponseBody
    public Flag deleteCompanyPic(Integer key,HttpServletRequest request){

        Integer userId=SessionUtil.getUserId(request);
        String baseImgStr = companyService.getCompany(userId).getCpImg();
        String imgUrl = FileUtil.getDeleteImg(baseImgStr,key,basePath);
        companyService.updateCompanyCpImg(userId,imgUrl);
        return new Flag("true");
    }

    @PostMapping("/user/alterCompanyInfo")
    @ResponseBody
    public String alterCompanyInfo(Company company,HttpServletRequest request){
        Integer userId = SessionUtil.getUserId(request);
        companyService.updateCompany(userId,company);
        return "修改成功!";
    }

}
