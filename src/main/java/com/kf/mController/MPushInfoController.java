package com.kf.mController;

import com.kf.pojo.District;
import com.kf.pojo.MainClass;
import com.kf.pojo.PushInfoClass;
import com.kf.pojo.Tag;
import com.kf.service.*;
import com.kf.util.BasePath;
import com.kf.vo.Choose;
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
public class MPushInfoController {


    @Autowired
    public MainClassService mainClassService;


    @Autowired
    private PushInfoClassService pushInfoClassService;

    @Autowired
    private DistrictService districtService;

    @Autowired
    private UserService userService;

    @Autowired
    private TagService tagService;


    @Autowired
    private BasePath basePath;

    @Autowired
    private PushInfoTagService pushInfoTagService;

    @Autowired
    private PicContentService picContentService;

    @Autowired
    private PushInfoService pushInfoService;


    @Autowired
    private SecondClassService secondClassService;

    @GetMapping("/m/push/choose")
    public String choose(ModelMap modelMap){
        List<MainClass> mainClass= mainClassService.getMainClass();
        modelMap.addAttribute("mainClass",mainClass);

        return "phone/choose";
    }

    private ModelAndView toChoose(Choose choose,String toPage){
        ModelAndView modelAndView=null;
        //如果用户没有选择或条件缺失或条件有误,返回选择页面
        if(choose!=null){
            String mcName = mainClassService.getMcName(choose.getMcId());
            String scName = secondClassService.getScName(choose.getScId());
            if(mcName!=null&&scName!=null){
                choose.setMcName(mcName);
                choose.setScName(scName);
                modelAndView = new ModelAndView(toPage);
            }else{
                modelAndView = new ModelAndView("redirect:/push/choose");
            }
        }else{
            modelAndView = new ModelAndView("redirect:/push/choose");
        }
        return modelAndView;
    }

    @GetMapping("/m/push/fill")
    public ModelAndView chooseSecondClass(Choose choose){
        ModelAndView modelAndView = toChoose(choose,"phone/pushInfo");
        if(modelAndView!=null&&modelAndView.getViewName().equals("phone/pushInfo")){
            List<District> districts = districtService.getAllDistrict();
            List<Tag> tags = tagService.getAllTag(choose.getMcId());
            List<PushInfoClass> pushInfoClasses = pushInfoClassService.getAllPush(choose.getMcId());
            modelAndView.addObject("choose",choose);
            modelAndView.addObject("districts",districts);
            modelAndView.addObject("tags",tags);
            modelAndView.addObject("pushInfoClasses",pushInfoClasses);
        }
        return modelAndView;
    }
}
