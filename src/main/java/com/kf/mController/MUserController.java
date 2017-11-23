package com.kf.mController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MUserController {
    @GetMapping("/m/login")
    public String index(){
        return "phone/login";
    }
}
