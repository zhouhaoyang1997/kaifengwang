package com.kf.controller;

import com.kf.pojo.District;
import com.kf.pojo.PushInfo;
import com.kf.pojo.SecondClass;
import com.kf.pojo.Tag;
import com.kf.service.DistrictService;
import com.kf.service.PushInfoService;
import com.kf.service.SecondClassService;
import com.kf.service.TagService;
import com.kf.vo.TagValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

/**
 * @author zhy
 * @create 2017-09-25 21:04
 **/
@RestController
@RequestMapping(value = "/m")
public class MobileMainController {

    @Autowired
    public SecondClassService secondClassService;

    @Autowired
    private DistrictService districtService;

    @Autowired
    private TagService tagService;

    @Autowired
    private PushInfoService pushInfoService;

    @GetMapping("/index")
    public ModelAndView phoneIndex(){
        ModelAndView modelAndView = new ModelAndView("phone/index");

        return modelAndView;
    }

    @GetMapping("/infolist")
    public ModelAndView quanzhizhaopin(Integer mcId, @RequestParam(required = false) Integer scId, @RequestParam(required = false) Integer districtId,
                                       @RequestParam(required = false) String tagId) {
        ModelAndView modelAndView = new ModelAndView("phone/infolist");
        List<Tag> tags = tagService.getAllTag(mcId);
        List<TagValue> tagValues = new ArrayList<TagValue>();
        //切分tagId
        if (tagId != null && !tagId.isEmpty()) {
            String[] allTags = tagId.split("--");
            System.out.print(allTags[0]);
            for (String tagStr : allTags) {
                String[] fromTag = tagStr.split("-");
                TagValue tagValue = new TagValue();
                tagValue.setTagId(Integer.valueOf(fromTag[0]));
                tagValue.setTcId(Integer.valueOf(fromTag[1]));
                tagValues.add(tagValue);
            }
        }
        List<SecondClass> secondClassList = secondClassService.getAllSecondClass(mcId);
        List<District> districts = districtService.getAllDistrict();

        //查询符合条件的所有信息
        List<PushInfo> pushInfos = pushInfoService.getAllJob(mcId, scId, districtId, tagValues, tagValues.size());
        //查询二级类别
        modelAndView.addObject("secondClassList", secondClassList);
        //查询所有行政区域
        modelAndView.addObject("districts", districts);
        //查询所有标签
        modelAndView.addObject("tags", tags);
        modelAndView.addObject("pushInfos", pushInfos);
        //设置当前的栏目
        modelAndView.addObject("currScId", scId);
        //设置当前大类
        modelAndView.addObject("currMcId", mcId);

        //当前tag类
        modelAndView.addObject("currTags", tagValues);
        //当前所选地区
        modelAndView.addObject("currDistrictId", districtId);
        return modelAndView;
    }

    @GetMapping("/infomation")
    public ModelAndView information(){
        return new ModelAndView("phone/infomation");
    }

    @GetMapping("/menulist")
    public ModelAndView menulist() {
        ModelAndView modelAndView = new ModelAndView("phone/menulist");
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

}
