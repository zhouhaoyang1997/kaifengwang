package com.kf.controller;

import com.kf.pojo.*;
import com.kf.service.*;

import java.io.IOException;
import java.util.List;
import java.util.UUID;
import java.io.File;

import com.kf.util.BasePath;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by 18236 on 2017/9/27.
 */
@Controller
public class PushController {

    @Autowired
    public MainClassService mainClassService;


    @Autowired
    private PushInfoClassService pushInfoClassService;

    @Autowired
    private DistrictService districtService;


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
    /**
     * 选择主类及副类
     * @return
     */
    @RequestMapping("/push/chooseMc")
    public ModelAndView chooseMainClass(){
        ModelAndView modelAndView = new ModelAndView("chooseMc");
        List<MainClass> mainClass= mainClassService.getMainClass();
        modelAndView.addObject("mainClass",mainClass);
        return modelAndView;
    }


    /**
     * 填写信息,
     * @return
     */
    @RequestMapping("/push/fill")
    public ModelAndView chooseSecondClass(int mcId,int scId){
        ModelAndView modelAndView = new ModelAndView("pushInfo");
        List<District> districts = districtService.getAllDistrict();
        List<Tag> tags = tagService.getAllTag(mcId);
        List<PushInfoClass> pushInfoClasses = pushInfoClassService.getAllPush(mcId);
        modelAndView.addObject("mcId",mcId);
        modelAndView.addObject("scId",scId);
        modelAndView.addObject("districts",districts);
        modelAndView.addObject("tags",tags);
        modelAndView.addObject("pushInfoClasses",pushInfoClasses);
        return modelAndView;
    }


    /**
     * 堆填写的信息加以验证
     * @param pics
     * @param pushInfo
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/push/info",method = RequestMethod.POST)
    @ResponseBody
    public String pushInfo(@RequestParam("pic") MultipartFile pics[], PushInfo pushInfo, HttpServletRequest request)throws IOException{
        Integer mcId = pushInfo.getPiMc();
        if(mcId!=null&&mcId!=0){

            if(null != pics && pics.length > 0) {
                //配置获去图片存放路径        暂未规定图片大小
                String savePath = basePath.getPathValue();
                String sb = ""; //存入数据库图片路径
                for (MultipartFile pic : pics) {
                    if(!pic.isEmpty()){
                        String originalName = pic.getOriginalFilename();
                        String suffix = originalName.substring(originalName.lastIndexOf(".") + 1);
                        String filePath = "class"+mcId+"/"+UUID.randomUUID().toString() + "." + suffix;

                        pic.transferTo(new File(savePath + filePath));
                        sb=sb+"img/pushimg/"+filePath+"#";
                    }
                }
                //如果上传了图片,把图片路径存入数据库
                if(!sb.isEmpty()){
                    pushInfo.setPiImg(sb);
                }
            }

            //返回自增长的id
            Integer piId = pushInfoService.addPushInfo(pushInfo);
            //通过mcId获取搜有的tagId,并将所有的tag和他的之存储到数据库表push_info_tag中
            List<Integer> tagsId = tagService.getAllTagId(mcId);
            for(Integer tagId:tagsId){
                Integer value = Integer.valueOf(request.getParameter("tag"+tagId));
                pushInfoTagService.addPushInfoTag(tagId,piId,value);
            }
            //获取所有的其他信息id 并将信息插入数据库
            List<Integer> picsId= pushInfoClassService.getAllPushId(mcId);
            for(Integer picId:picsId){
                String value = request.getParameter("pic"+picId);
                picContentService.addPicContent(picId,piId,value);
            }
        }

        return pushInfo.getPiTitle();
    }

}
