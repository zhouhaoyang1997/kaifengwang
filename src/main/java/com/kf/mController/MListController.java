package com.kf.mController;

import com.kf.pojo.*;
import com.kf.service.*;
import com.kf.util.AdvertUtil;
import com.kf.util.PageUtil;
import com.kf.vo.CurrMain;
import com.kf.vo.TagValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 18236 on 2017/11/23.
 */
@RequestMapping("/m")
@Controller
public class MListController {

    @Autowired
    public MainClassService mainClassService;

    @Autowired
    public SecondClassService secondClassService;

    @Autowired
    private DistrictService districtService;

    @Autowired
    private TagService tagService;

    @Autowired
    private AdvertService advertService;

    @Autowired
    private PushInfoService pushInfoService;

    @Autowired
    private BannerService bannerService;


    @GetMapping("/list")
    public ModelAndView jobPage(Integer mcId, @RequestParam(required = false) Integer scId, @RequestParam(required = false) Integer districtId,
                                @RequestParam(required = false)String[] tagId, @RequestParam(defaultValue = "0") Integer pno){
        ModelAndView modelAndView=new ModelAndView("phone/list");
        List<Tag> tags = tagService.getAllTag(mcId);
        List<SecondClass> secondClass = secondClassService.getAllSecondClass(mcId);
        List<District> districts = districtService.getAllDistrict();
        List<TagValue> newTagId = new ArrayList<TagValue>();
        List<String> tagValue = getTagValue(tagId,newTagId);
        //默认每页显示
        PageUtil pageUtil = new PageUtil();
        List<PushInfo> pushInfos = pushInfoService.getAllJob(mcId,scId,districtId,tagValue,tagValue.size(),
                pno,pageUtil);
        //查询二级类别
        List<Banner> banners = bannerService.getBannerByMcId(mcId);

        List<Advert> adverts = advertService.getAdvertByPage("list");
        modelAndView.addObject("advertMap", AdvertUtil.conversionMap(adverts));
        modelAndView.addObject("banners",banners);
        modelAndView.addObject("secondClass",secondClass);
        //查询所有行政区域
        modelAndView.addObject("districts",districts);
        //查询所有标签
        modelAndView.addObject("tags",tags);
        modelAndView.addObject("pushInfos",pushInfos);
        //设置当前的大类
        CurrMain currMain = new CurrMain();
        currMain.setMcId(mcId);
        currMain.setMcName(mainClassService.getMcName(mcId));
        modelAndView.addObject("currMc",currMain);
        //设置当前栏目
        modelAndView.addObject("currScId",scId);

        //当前tag类
        if(newTagId.size()!=0){
            modelAndView.addObject("currTags",newTagId);
        }

        //当前所选地区
        modelAndView.addObject("currDistrictId",districtId);

        //page对象返回页面
        modelAndView.addObject("pageUtil",pageUtil);


        return modelAndView;
    }


    //对前台发来的url去重
    private List<String>  getTagValue(String[] tagId,List<TagValue> newTagId){
        List<String> tagValue = new ArrayList<String>();
        if(tagId!=null&&tagId.length>0){
            List<String> tagName=new ArrayList<String>();
            for(String str:tagId){
                String[] tag = str.split("-");
                if(!tagName.contains(tag[0])&&!tag[1].equals("0")){
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

}
