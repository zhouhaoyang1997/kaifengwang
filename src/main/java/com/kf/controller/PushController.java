package com.kf.controller;

import com.kf.pojo.*;
import com.kf.service.*;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import com.kf.util.BasePath;
import com.kf.util.FileUtil;
import com.kf.vo.Choose;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
    public MainClassService mainClassService;


    @Autowired
    private PushInfoClassService pushInfoClassService;

    @Autowired
    private DistrictService districtService;

    @Autowired
    private UserService userService;

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

    protected Logger logger = LoggerFactory.getLogger(PushController.class);
    /**
     * 选择主类及副类
     * @return
     */
    @GetMapping("/push/choose")
    public String chooseMainClass(ModelMap modelMap){
        List<MainClass> mainClass= mainClassService.getMainClass();
        modelMap.addAttribute("mainClass",mainClass);
        return "choose";
    }


    /**
     * 用户未登录但选择了主类和副类将进入这里
     * @param choose
     * @return
     */
    @GetMapping("/push/login")
    public String pushLogin(Choose choose,ModelMap modelMap){
        choose = toChoose(choose);
        if(choose!=null){
            modelMap.addAttribute("choose",choose);
        }else{
            return "redirect:/push/choose";
        }
        return "modalLogin";
    }




    private Choose toChoose(Choose choose){
        if(choose!=null){
            String mcName = mainClassService.getMcName(choose.getMcId());
            String scName = secondClassService.getScName(choose.getScId());
            if(mcName!=null&&scName!=null){
                choose.setMcName(mcName);
                choose.setScName(scName);
                return choose;
            }
        }
        return null;
    }



    /**
     * 填写信息,
     * @return
     */
    @GetMapping("/push/fill")
    public String chooseSecondClass(Choose choose,ModelMap modelMap){
        logger.debug(choose.getMcId()+":::"+choose.getScId());
        choose = toChoose(choose);
        if(choose!=null){
            assembly(modelMap,choose);
            return "pushInfo";
        }else{
            return "redirect:/push/choose";
        }

    }

    private void assembly(ModelMap modelMap,Choose choose){
        choose = toChoose(choose);
        List<District> districts = districtService.getAllDistrict();
        List<Tag> tags = tagService.getAllTag(choose.getMcId());
        List<PushInfoClass> pushInfoClasses = pushInfoClassService.getAllPush(choose.getMcId());
        modelMap.addAttribute("choose",choose);
        modelMap.addAttribute("districts",districts);
        modelMap.addAttribute("tags",tags);
        modelMap.addAttribute("pushInfoClasses",pushInfoClasses);
    }



    /**
     * 堆填写的信息加以验证
     * @param pics
     * @param pushInfo
     * @param request
     * @return
     * @throws IOException
     */
    @PostMapping(value = "/push/info")
    public String pushInfo(@RequestParam("pic") MultipartFile pics[], @Valid @ModelAttribute("pushError") PushInfo pushInfo,
                                 BindingResult br, @RequestParam(value = "method",defaultValue = "pc") String method,ModelMap modelMap,
                           HttpServletRequest request)throws IOException{
        boolean access = FileUtil.picIsError(pics);
        if(br.hasErrors()||!access){
            if(pushInfo.getPiMc()==null||pushInfo.getPiSc()==null||pushInfo.getPiDistrict()==null||pushInfo.getUserId()==null){
               return "redirect:/push/choose";
            }else{
                Choose choose = new Choose();
                choose.setScId(pushInfo.getPiSc());
                choose.setMcId(pushInfo.getPiMc());
                assembly(modelMap,choose);
                if(!access){
                    modelMap.addAttribute("picError","对不起,您上传的图片有的大小超过了1M,请检查后重试!");
                }
                if(method.equals("mobile")){
                    return "phone/pushInfo";
                }else{
                    return "pushInfo";
                }

            }
        }else{

            Integer mcId = pushInfo.getPiMc();

            //配置获去图片存放路径
            String savePath = basePath.getPathValue();
            String sb = FileUtil.addPic(pics,"img/pushimg/",savePath);
            //如果上传了图片,把图片路径存入数据库
            if(!sb.isEmpty()){
                sb=sb.substring(0,sb.length()-1);
                pushInfo.setPiImg(sb);
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
            return "redirect:/info?piId="+piId;


        }
    }

}
