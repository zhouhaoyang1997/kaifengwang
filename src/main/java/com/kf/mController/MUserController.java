package com.kf.mController;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
@RequestMapping("/m")
@Controller
public class MUserController {
    @GetMapping("/login")
    public String index(@RequestParam(value = "path",required = false) String path, ModelMap modelMap){
        if(StringUtils.isNotBlank(path)){
            modelMap.addAttribute("path",path);
        }
        return "phone/login";
    }
    @GetMapping("/user/info")
    public String My(){
        return "phone/my";
    }
    @GetMapping("/user/personal")
    public String myCollections(){
        return "phone/myCollections";
    }
    @GetMapping("/user/attc")
    public String myCv(){
        return "phone/myCv";
    }
}
