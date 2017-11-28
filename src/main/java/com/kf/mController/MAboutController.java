package com.kf.mController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by 18236 on 2017/11/27.
 */
@Controller
@RequestMapping("/m/about")
public class MAboutController {

    @GetMapping("/service")
    public String service(){
        return "phone/about/service";
    }

    @GetMapping("/charge")
    public String charge(){
        return "phone/about/charge";
    }


    @GetMapping("/cpdesc")
    public String cpdesc(){
        return "phone/about/cpdesc";
    }

    @GetMapping("/contact")
    public String contact(){
        return "phone/about/contact";
    }

    @GetMapping("/help")
    public String help(){
        return "phone/about/help";
    }
    @GetMapping("/law")
    public String law(){
        return "phone/about/law";
    }
    @GetMapping("/friend")
    public String friend(){
        return "phone/about/friend";
    }
}
