package com.kf.controller;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * @author zhy
 * @create 2017-09-28 19:31
 **/
@RestController
public class AdminController extends WebMvcConfigurerAdapter {
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/admin").setViewName("/admin/index");
        registry.addViewController("/pushInfoManage").setViewName("/admin/pushInfoManage");
        registry.addViewController("/ADManage").setViewName("/admin/AdManage");
        registry.addViewController("/databaseBackup").setViewName("/admin/databaseBackup");
    }


}
