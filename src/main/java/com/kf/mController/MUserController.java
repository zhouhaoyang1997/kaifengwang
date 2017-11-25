package com.kf.mController;

import com.kf.pojo.BaseInfo;
import com.kf.pojo.User;
import com.kf.service.PushInfoService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@RequestMapping("/m")
@Controller
public class MUserController {
    @Autowired
    PushInfoService pushInfoService;

    @GetMapping("/login")
    public String index(@RequestParam(value = "path",required = false) String path, ModelMap modelMap){
        if(StringUtils.isNotBlank(path)){
            modelMap.addAttribute("path",path);
        }
        return "phone/login";
    }
    @GetMapping("/user/info")
    public ModelAndView My(HttpSession session){
        ModelAndView modelAndView = new ModelAndView( "phone/my");
        User user = (User) session.getAttribute("user");
        if(user!=null){
            Integer userId = user.getUserId();
            //获取用户收藏数
            Integer clCounts = pushInfoService.getCollectionCountByUserId(userId);
            //获取用户发布数
            Integer pushCounts = pushInfoService.getPushCountByUserId(userId);
            modelAndView.addObject("clCounts",clCounts)
                    .addObject("pushCounts",pushCounts);
        }

        return modelAndView;
    }
    @GetMapping("/user/personal")
    public ModelAndView myCollections(){
        ModelAndView modelAndView = new ModelAndView("phone/myCollections");
        return  modelAndView;
    }
    @GetMapping("/user/pushing")
    public ModelAndView myPushing(){
        ModelAndView modelAndView = new ModelAndView("phone/myPushing");
        return  modelAndView;
    }
    @GetMapping("/user/attc")
    public String myCv(){
        return "phone/myCv";
    }

}
