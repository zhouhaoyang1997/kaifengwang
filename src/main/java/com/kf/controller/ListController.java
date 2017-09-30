package com.kf.controller;

import com.kf.pojo.District;
import com.kf.pojo.PushInfo;
import com.kf.pojo.SecondClass;
import com.kf.pojo.Tag;
import com.kf.service.DistrictService;
import com.kf.service.PushInfoService;
import com.kf.service.SecondClassService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kf.service.TagService;
import com.kf.vo.TagValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by 18236 on 2017/9/26.
 */
@Controller
public class ListController {

    @Autowired
    public SecondClassService secondClassService;

    @Autowired
    private DistrictService districtService;

    @Autowired
    private TagService tagService;

    @Autowired
    private PushInfoService jobService;

    /**
     * 使用cookie记住当前用户的选择
     * @param mcId
     * @param scId
     * @param tagId 此id为前台拼接的id
     * @return
     */
    @RequestMapping("/list")
    public ModelAndView jobPage(Integer mcId, @RequestParam(required = false) Integer scId,@RequestParam(required = false) Integer districtId,
                                @RequestParam(required = false)String tagId){
        ModelAndView modelAndView=new ModelAndView("jobs");
        List<Tag> tags = tagService.getAllTag(mcId);
        List<TagValue> tagValues = new ArrayList<TagValue>();
        //切分tagId
        if(tagId!=null&&!tagId.isEmpty()) {
            String[] allTags=tagId.split("--");
            System.out.print(allTags[0]);
            for(String tagStr:allTags){
                String[] fromTag = tagStr.split("-");
                TagValue tagValue = new TagValue();
                tagValue.setTagId(Integer.valueOf(fromTag[0]));
                tagValue.setTcId(Integer.valueOf(fromTag[1]));
                tagValues.add(tagValue);
            }
        }
        List<SecondClass> zhaopin = secondClassService.getAllSecondClass(mcId);
        List<District> districts = districtService.getAllDistrict();

        //查询符合条件的所有信息
        List<PushInfo> pushInfos = jobService.getAllJob(mcId,scId,districtId,tagValues,tagValues.size());
        //查询二级类别
        modelAndView.addObject("zhaopin",zhaopin);
        //查询所有行政区域
        modelAndView.addObject("districts",districts);
        //查询所有标签
        modelAndView.addObject("tags",tags);
        modelAndView.addObject("pushInfos",pushInfos);
        //设置当前的栏目
        modelAndView.addObject("currScId",scId);
        //设置当前大类
        modelAndView.addObject("currMcId",mcId);

        //当前tag类
        modelAndView.addObject("currTags",tagValues);
        //当前所选地区
        modelAndView.addObject("currDistrictId",districtId);
        return modelAndView;
    }


}
