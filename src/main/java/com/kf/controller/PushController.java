package com.kf.controller;

import com.kf.pojo.*;
import com.kf.service.*;

import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.io.File;

import com.kf.util.BasePath;
import com.kf.util.FileUtil;
import com.kf.vo.Choose;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

/**
 * Created by 18236 on 2017/9/27.
 */
@Controller
public class PushController {

    @Autowired
    private ResourceLoader resourceLoader;

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


    @Autowired
    private SecondClassService secondClassService;
    /**
     * 选择主类及副类
     * @return
     */
    @RequestMapping("/push/choose")
    public ModelAndView chooseMainClass(){
        ModelAndView modelAndView = new ModelAndView("choose");
        List<MainClass> mainClass= mainClassService.getMainClass();
        modelAndView.addObject("mainClass",mainClass);
        return modelAndView;
    }


    /**
     * 用户未登录但选择了主类和副类将进入这里
     * @param choose
     * @return
     */
    @GetMapping("/push/login")
    public ModelAndView pushLogin(Choose choose){
        return toChoose(choose,"modalLogin");
    }

    /**
     * 组装用户的选择
     * @param choose
     */
    private ModelAndView toChoose(Choose choose,String toPage){
        ModelAndView modelAndView=null;
        //如果用户没有选择或条件缺失,返回选择页面
        if(choose==null||choose.getMcId()==null||choose.getScId()==null){
            modelAndView=new ModelAndView("redirect:/push/choose");
        }else{
            String mcName = mainClassService.getMcName(choose.getMcId());
            String scName = secondClassService.getScName(choose.getScId());
            choose.setMcName(mcName);
            choose.setScName(scName);
            modelAndView = new ModelAndView(toPage);
            modelAndView.addObject("choose",choose);
        }
        return modelAndView;
    }

    /**
     * 填写信息,
     * @return
     */
    @RequestMapping("/push/fill")
    public ModelAndView chooseSecondClass(Choose choose){
        ModelAndView modelAndView = toChoose(choose,"pushInfo");
        if(modelAndView.getViewName().equals("pushInfo")){
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


    /**
     * 堆填写的信息加以验证
     * @param pics
     * @param pushInfo
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/push/info",method = RequestMethod.POST)
    public ModelAndView pushInfo(@RequestParam("pic") MultipartFile pics[], @Valid @ModelAttribute("pushError") PushInfo pushInfo, BindingResult br, HttpServletRequest request)throws IOException{
        ModelAndView modelAndView = null;
        if(br.hasErrors()){
            if(pushInfo.getPiMc()==null||pushInfo.getPiSc()==null||pushInfo.getPiDistrict()==null||pushInfo.getUserId()==null){

                modelAndView = new ModelAndView("redirect:/push/choose");
            }else{
                Choose choose = new Choose();
                choose.setScId(pushInfo.getPiSc());
                choose.setMcId(pushInfo.getPiMc());
                modelAndView = chooseSecondClass(choose);
            }
        }else{
            Integer mcId = pushInfo.getPiMc();
            if(null != pics && pics.length > 0) {
                //配置获去图片存放路径        暂未规定图片大小
                String savePath = basePath.getPathValue();
                String sb = FileUtil.addPic(pics,"img/pushimg/",savePath);
                //如果上传了图片,把图片路径存入数据库
                if(!sb.isEmpty()){
                    sb=sb.substring(0,sb.length()-1);
                    pushInfo.setPiImg(sb);
                }
            }
            //设置当前时间
            Timestamp ts = new Timestamp(new Date().getTime());
            pushInfo.setPiPushDate(ts);
            //返回自增长的id
            // http://www.cnblogs.com/icerainsoft/p/3584532.html

            pushInfo.setPiIp(request.getRemoteAddr());

            Integer piId = pushInfoService.addPushInfo(pushInfo);
            //通过mcId获取搜有的tagId,并将所有的tag和他的之存储到数据库表push_info_tag中
            List<Integer> tagsId = tagService.getAllTagId(mcId);
            for(Integer tagId:tagsId){
                Integer value = Integer.valueOf(request.getParameter("tag"+tagId));
                if(value!=null){
                    pushInfoTagService.addPushInfoTag(tagId,piId,value);
                }
            }
            //获取所有的其他信息id 并将信息插入数据库
            List<Integer> picsId= pushInfoClassService.getAllPushId(mcId);
            for(Integer picId:picsId){
                String value = request.getParameter("pic"+picId);
                if(value!=null&&!value.trim().isEmpty()){
                    picContentService.addPicContent(picId,piId,value);
                }
            }
            modelAndView=new ModelAndView("redirect:/info?piId="+piId);
        }
        return modelAndView;
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
