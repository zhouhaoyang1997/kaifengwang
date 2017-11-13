package com.kf.controller;

import com.kf.pojo.BaseInfo;
import com.kf.service.PushInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
@Controller
public class RecommendController {

    @Autowired
    private PushInfoService pushInfoService;

    @GetMapping("/info/recommend")
    @ResponseBody
    public List<BaseInfo> getRecommend(Integer mcId,Integer scId){
        List<BaseInfo> recommend = pushInfoService.getRecommend(mcId,scId);

        return recommend;
    }

}
