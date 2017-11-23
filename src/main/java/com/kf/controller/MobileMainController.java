package com.kf.controller;

import com.kf.pojo.*;
import com.kf.service.*;
import com.kf.util.BasePath;
import com.kf.util.FileUtil;
import com.kf.vo.CurrMain;
import com.kf.vo.TagValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * @author zhy
 * @create 2017-09-25 21:04
 **/

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
    @Autowired
    PushInfoTagService pushInfoTagService;
    @Autowired
    PicContentService picContentService;
    @Autowired
    private BasePath basePath;

    @Autowired
    private ResourceLoader resourceLoader;


//    @GetMapping("/index")
//    public ModelAndView phoneIndex() {
//        ModelAndView modelAndView = new ModelAndView("phone/index");
//
//        return modelAndView;
//    }
//    @GetMapping("/index1")
//    public ModelAndView phoneIndex1() {
//        ModelAndView modelAndView = new ModelAndView("phone/_index");
//
//        return modelAndView;
//    }

    @GetMapping("/push")
    public ModelAndView infoTable(String mcId, String scId) {
        ModelAndView modelAndView = new ModelAndView("phone/_infoUpload");
        List<District> districts = districtService.getAllDistrict();
        List<Tag> tags = tagService.getAllTag(Integer.valueOf(mcId));
        List<PushInfoClass> pushInfoClasses = pushInfoClassService.getAllPush(Integer.valueOf(mcId));
        modelAndView.addObject("districts", districts);
        modelAndView.addObject("tags", tags);
        modelAndView.addObject("pushInfoClasses", pushInfoClasses);
        modelAndView.addObject("mcId", mcId);
        modelAndView.addObject("scId", scId);
        return modelAndView;
    }

    @RequestMapping(value = "/push1",method = RequestMethod.POST)
    public ModelAndView infoUpload(@Valid @ModelAttribute("pushError")PushInfo pushInfo,BindingResult result, HttpServletRequest request) {
        ModelAndView modelAndView;
        int mcId = pushInfo.getPiMc();
        int scId = pushInfo.getPiSc();
        System.out.println(pushInfo);
        if(result.hasErrors()){
             return new ModelAndView("redirect:/m/push?mcId="+pushInfo.getPiMc()+"&scId="+pushInfo.getPiSc());
        }
//        设置当前时间
        Timestamp ts = new Timestamp(new Date().getTime());
        pushInfo.setPiPushDate(ts);
//        返回自增长的id
        Integer piId = pushInfoService.addPushInfo(pushInfo);

//        通过mcId获取搜有的tagId,并将所有的tag和他的之存储到数据库表push_info_tag中
        List<Integer> tagsId = tagService.getAllTagId(mcId);
        for(Integer tagId:tagsId){
            Integer value = Integer.valueOf(request.getParameter("tag"+tagId));
            if(value!=null){
                pushInfoTagService.addPushInfoTag(tagId,piId,value);
            }
        }
//        获取所有的其他信息id 并将信息插入数据库
        List<Integer> picsId= pushInfoClassService.getAllPushId(mcId);
        for(Integer picId:picsId){
            String value = request.getParameter("pic"+picId);
            if(value!=null&&!value.trim().isEmpty()){
                picContentService.addPicContent(picId,piId,value);
            }
        }
        return new ModelAndView("redirect:/m/push2");
    }

    @GetMapping("/push2")
    public ModelAndView picTable() {
        return new ModelAndView("phone/_picUpload");
    }



//    @RequestMapping("/infolist")
//    public ModelAndView quanzhizhaopin(Integer mcId, @RequestParam(required = false) Integer scId, @RequestParam(required = false) Integer districtId,
//                                       @RequestParam(required = false) String[] tagId) {
//        ModelAndView modelAndView = new ModelAndView("phone/_infolist");
//        List<Tag> tags = tagService.getAllTag(mcId);
//        List<SecondClass> secondClass = secondClassService.getAllSecondClass(mcId);
//        List<District> districts = districtService.getAllDistrict();
//        List<TagValue> newTagId = new ArrayList<>();
//        List<String> tagValue = getTagValue(tagId, newTagId);
//        List<PushInfo> pushInfos = pushInfoService.getAllJob(mcId, scId, districtId, tagValue, tagValue.size());
//        //查询二级类别
//        modelAndView.addObject("secondClass", secondClass);
//        //查询所有行政区域
//        modelAndView.addObject("districts", districts);
//        //查询所有标签
//        modelAndView.addObject("tags", tags);
//        modelAndView.addObject("pushInfos", pushInfos);
//        //设置当前的大类
//        CurrMain currMain = new CurrMain();
//        currMain.setMcId(mcId);
//        currMain.setMcName(mainClassService.getMcName(mcId));
//        modelAndView.addObject("currMc", currMain);
//        //设置当前栏目
//        modelAndView.addObject("currScId", scId);
//
//        //当前tag类
//        modelAndView.addObject("currTags", newTagId);
//        //当前所选地区
//        modelAndView.addObject("currDistrictId", districtId);
//        return modelAndView;
//    }

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
        return new ModelAndView("phone/_infomation");
    }

//    @RequestMapping("/menulist")
//    public ModelAndView menulist(String methon) {
//        ModelAndView modelAndView = new ModelAndView("phone/_menulist");
//
//        if ("push".equals(methon)) {
//            modelAndView = new ModelAndView("phone/push");
//        }
//
//        List<SecondClass> zhaopin = secondClassService.getAllSecondClass(1);
//        List<SecondClass> fangchan = secondClassService.getAllSecondClass(2);
//        List<SecondClass> ershou = secondClassService.getAllSecondClass(3);
//        List<SecondClass> shenghuo = secondClassService.getAllSecondClass(4);
//        List<SecondClass> chongwu = secondClassService.getAllSecondClass(5);
//        List<SecondClass> mingqi = secondClassService.getAllSecondClass(6);
//        modelAndView.addObject("zhaopin", zhaopin);
//        modelAndView.addObject("fangchan", fangchan);
//        modelAndView.addObject("ershou", ershou);
//        modelAndView.addObject("shenghuo", shenghuo);
//        modelAndView.addObject("chongwu", chongwu);
//        modelAndView.addObject("mingqi", mingqi);
//        return modelAndView;
//    }

    @PostMapping("/push3")
    public String picUpload(@RequestParam(value = "pic", required = true) MultipartFile pics[]) throws IOException {
        if(null != pics && pics.length > 0){
            //配置获去图片存放路径        暂未规定图片大小
            String savePath = basePath.getPathValue();
            String sb = FileUtil.addPic(pics,"img/pushimg/",savePath);//存入数据库图片路径
            //更新信息
            sb=sb.substring(0,sb.length()-1);
            pushInfoService.updatePicUrl(sb,21,1);

        }
        return "ok";
    }
        @GetMapping("/img/pushimg/{filename:.+}")
        @ResponseBody
        public ResponseEntity<?> getFile(@PathVariable String filename) {
            try {
                return ResponseEntity.ok(resourceLoader.getResource("file:" + Paths.get(basePath.getPathValue()+"/img/pushimg/",filename).toString()));
            } catch (Exception e) {
                return ResponseEntity.notFound().build();
            }
        }
}