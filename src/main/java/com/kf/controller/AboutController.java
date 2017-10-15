package com.kf.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by 18236 on 2017/10/14.
 */
@Controller
public class AboutController {

    @GetMapping("/about/charge")
    public String charge(){
        return "about/charge";
    }

    @GetMapping("/about/service")
    public String service(){
        return "about/service";
    }

    @GetMapping("/about/cpdesc")
    public String cpdesc(){
        return "about/cpdesc";
    }

    @GetMapping("/about/contact")
    public String contact(){
        return "about/contact";
    }
    @GetMapping("/about/attc")
    public String attc(){
        return "about/attc";
    }
    @GetMapping("/about/help")
    public String help(){
        return "about/help";
    }
    @GetMapping("/about/law")
    public String law(){
        return "about/law";
    }
    @GetMapping("/about/friend")
    public String friend(){
        return "about/friend";
    }
}
