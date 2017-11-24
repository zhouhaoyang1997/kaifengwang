package com.kf.mController;

import com.kf.exception.PiIdNotFoundException;
import com.kf.pojo.Advert;
import com.kf.pojo.Company;
import com.kf.pojo.PushInfo;
import com.kf.pojo.User;
import com.kf.service.*;
import com.kf.util.AdvertUtil;
import com.kf.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by 18236 on 2017/11/23.
 */
@Controller
public class mInfoController {


    @Autowired
    private PushInfoService pushInfoService;

    @Autowired
    private UserService userService;

    @Autowired
    private AdvertService advertService;

    @Autowired
    private CompanyService companyService;

    @Autowired
    private TipService tipService;

    @GetMapping("/m/info")
    public String Info(Integer piId, ModelMap modelMap, HttpServletRequest request)throws Exception{
        //下面这行的user是userId
        Integer user= SessionUtil.getUserId(request);
        if(piId!=null){
            PushInfo pushInfo = pushInfoService.getInfoByPiId(piId);
            Integer userId = null;
            try{
                //更新数据库
                pushInfoService.updateInfoScan(pushInfo.getPiId());
                userId = pushInfo.getUserId();
            }
            catch (Exception e){
                throw new PiIdNotFoundException("404","对不起,可能您要查看的信息已经被删除");
            }
            User infoUser = userService.getUserByUserId(userId);
            //如果进行了公司认证
            if(infoUser.getUserAttc()==0){
                Company company = companyService.getCompany(infoUser.getUserId());
                modelMap.addAttribute("company",company);
            }
            List<Advert> adverts = advertService.getAdvertByPage("content");
            modelMap.addAttribute("advertMap", AdvertUtil.conversionMap(adverts));
            modelMap.addAttribute("info",pushInfo);
            modelMap.addAttribute("infoUser",infoUser);
            //用户是否收藏了该信息
            modelMap.addAttribute("collected",user!=null&&pushInfoService.collectionIsExists(user,piId));
        }else{
            throw new PiIdNotFoundException("404","对不起,您查看的信息不存在");
        }
        return "phone/info";
    }
}
