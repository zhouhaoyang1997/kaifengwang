package com.kf.controller;

import com.kf.pojo.*;
import com.kf.service.*;
import com.kf.vo.CurrMain;
import com.kf.vo.TagValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * @author zhy
 * @create 2017-09-25 21:04
 **/
@RestController
@RequestMapping(value = "/m")
public class MobileMainController {
    @Autowired
    public MainClassService mainClassService;

    @Autowired
    public SecondClassService secondClassService;

    @Autowired
    private DistrictService districtService;

    @Autowired
    private TagService tagService;

    @Autowired
    private PushInfoService pushInfoService;

    @Autowired
    private PushInfoClassService pushInfoClassService;

    @GetMapping("/index")
    public ModelAndView phoneIndex() {
        ModelAndView modelAndView = new ModelAndView("phone/index");

        return modelAndView;
    }

    @GetMapping("/push1")
    public ModelAndView infoUpload(String mcId, String scId) {
        ModelAndView modelAndView = new ModelAndView("phone/infoUpload");
        List<District> districts = districtService.getAllDistrict();
        List<Tag> tags = tagService.getAllTag(Integer.valueOf(mcId));
        List<PushInfoClass> pushInfoClasses = pushInfoClassService.getAllPush(Integer.valueOf(mcId));
        modelAndView.addObject("districts", districts);
        modelAndView.addObject("tags", tags);
        modelAndView.addObject("pushInfoClasses", pushInfoClasses);
        return modelAndView;
    }

    @GetMapping("/push2")
    public ModelAndView picTable() {
        ModelAndView modelAndView = new ModelAndView("phone/picUpload");
        return modelAndView;
    }

    @PostMapping("/push")
    public ModelAndView infpTable() {
        ModelAndView modelAndView = new ModelAndView("phone/pushTable");
        return modelAndView;
    }


    @RequestMapping("/infolist")
    public ModelAndView quanzhizhaopin(Integer mcId, @RequestParam(required = false) Integer scId, @RequestParam(required = false) Integer districtId,
                                       @RequestParam(required = false) String[] tagId) {
        ModelAndView modelAndView = new ModelAndView("phone/infolist");
        List<Tag> tags = tagService.getAllTag(mcId);
        List<SecondClass> secondClass = secondClassService.getAllSecondClass(mcId);
        List<District> districts = districtService.getAllDistrict();
        List<TagValue> newTagId = new ArrayList<>();
        List<String> tagValue = getTagValue(tagId, newTagId);
        List<PushInfo> pushInfos = pushInfoService.getAllJob(mcId, scId, districtId, tagValue, tagValue.size());
        //查询二级类别
        modelAndView.addObject("secondClass", secondClass);
        //查询所有行政区域
        modelAndView.addObject("districts", districts);
        //查询所有标签
        modelAndView.addObject("tags", tags);
        modelAndView.addObject("pushInfos", pushInfos);
        //设置当前的大类
        CurrMain currMain = new CurrMain();
        currMain.setMcId(mcId);
        currMain.setMcName(mainClassService.getMcName(mcId));
        modelAndView.addObject("currMc", currMain);
        //设置当前栏目
        modelAndView.addObject("currScId", scId);

        //当前tag类
        modelAndView.addObject("currTags", newTagId);
        //当前所选地区
        modelAndView.addObject("currDistrictId", districtId);
        return modelAndView;
    }

    //对前台发来的url去重
    private List<String> getTagValue(String[] tagId, List<TagValue> newTagId) {
        List<String> tagValue = new ArrayList<>();
        if (tagId != null && tagId.length > 0) {
            List<String> tagName = new ArrayList<String>();
            for (String str : tagId) {
                String[] tag = str.split("-");
                if (!tagName.contains(tag[0]) && !tag[1].equals("0")) {
                    tagValue.add(tag[1]);
                    TagValue tagValue1 = new TagValue();
                    tagValue1.setTagId(Integer.valueOf(tag[0]));
                    tagValue1.setTcId(Integer.valueOf(tag[1]));
                    newTagId.add(tagValue1);
                }
                tagName.add(tag[0]);
            }
        }
        return tagValue;
    }


    @GetMapping("/infomation")
    public ModelAndView information() {
        return new ModelAndView("phone/infomation");
    }

    @RequestMapping("/menulist")
    public ModelAndView menulist(String methon) {
        ModelAndView modelAndView = null;
        if ("view".equals(methon)) {
            modelAndView = new ModelAndView("phone/menulist");
        }
        if ("push".equals(methon)) {
            modelAndView = new ModelAndView("phone/push");
        }

        List<SecondClass> zhaopin = secondClassService.getAllSecondClass(1);
        List<SecondClass> fangchan = secondClassService.getAllSecondClass(2);
        List<SecondClass> ershou = secondClassService.getAllSecondClass(3);
        List<SecondClass> shenghuo = secondClassService.getAllSecondClass(4);
        List<SecondClass> chongwu = secondClassService.getAllSecondClass(5);
        List<SecondClass> mingqi = secondClassService.getAllSecondClass(6);
        modelAndView.addObject("zhaopin", zhaopin);
        modelAndView.addObject("fangchan", fangchan);
        modelAndView.addObject("ershou", ershou);
        modelAndView.addObject("shenghuo", shenghuo);
        modelAndView.addObject("chongwu", chongwu);
        modelAndView.addObject("mingqi", mingqi);
        return modelAndView;
    }

    @PostMapping("/picUpload")
    public String picUpload(@RequestParam(value = "pic", required = true) MultipartFile pics[]) throws IOException {
        if (null != pics && pics.length > 0) {
            //配置获去图片存放路径        暂未规定图片大小
            String savePath = "/users/zhy/Pictures";
            String sb = ""; //存入数据库图片路径
            for (MultipartFile pic : pics) {
                if (!pic.isEmpty()) {
                    String originalName = pic.getOriginalFilename();
                    String suffix = originalName.substring(originalName.lastIndexOf(".") + 1);
                    String filePath = UUID.randomUUID().toString() + "." + suffix;
                    pic.transferTo(new File(savePath + filePath));
//                    sb=sb+"img/pushimg/"+filePath+"#";
                }
            }
        }
        return "ok";
    }
}