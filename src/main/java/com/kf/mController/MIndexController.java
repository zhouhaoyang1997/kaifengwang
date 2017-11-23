package com.kf.mController;

import com.kf.pojo.MainClass;
import com.kf.pojo.SecondClass;
import com.kf.service.MainClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by 18236 on 2017/11/23.
 */
@Controller
public class MIndexController {

    @Autowired
    public MainClassService mainClassService;


    @GetMapping("/m/index")
    public String index(){
        return "phone/index";
    }

    @GetMapping("/m/index2")
    public String index2(){
        return "phone/_index";
    }

    @GetMapping("/m/menulist")
    public String menulist(ModelMap modelMap) {
        List<MainClass> mainClass= mainClassService.getMainClass();
        modelMap.addAttribute("mainClass",mainClass);

        return "phone/menulist";
    }

}
