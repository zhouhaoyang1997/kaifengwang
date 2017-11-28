package com.kf.util;

import org.springframework.web.servlet.ModelAndView;

/**
 * @author zhy
 * @create 2017-11-27 19:11
 **/
public class ViewUtil {
    public  static ModelAndView toMobileView(ModelAndView modelAndView){
        String viewName = modelAndView.getViewName();
        viewName = viewName.replaceFirst("/","/m/");
        System.out.println(viewName);
        modelAndView.setViewName(viewName);
        return modelAndView;
    }
    public  static String toStringView(String viewName){
        viewName = viewName.replaceFirst("/","/m/");
        System.out.println(viewName);
        return viewName;
    }
}
