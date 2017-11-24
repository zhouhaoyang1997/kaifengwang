package com.kf.mController;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MUserController {
    @GetMapping("/m/login")
    public String index(@RequestParam(value = "path",required = false) String path, ModelMap modelMap){
        if(StringUtils.isNotBlank(path)){
            modelMap.addAttribute("path",path);
        }
        return "phone/login";
    }
}
