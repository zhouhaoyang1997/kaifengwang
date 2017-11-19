package com.kf.controller;

import com.kf.pojo.*;
import com.kf.service.*;
import com.kf.util.BasePath;
import com.kf.util.FileUtil;
import com.kf.util.SessionUtil;
import com.kf.vo.Flag;
import com.kf.vo.OtherInfo;
import com.kf.vo.TagValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.IOException;
import java.security.PublicKey;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 18236 on 2017/10/7.
 */
@Controller
public class PersonalController {

    @Autowired
    private PushInfoService pushInfoService;

    @Autowired
    private PushInfoClassService pushInfoClassService;

    @Autowired
    private DistrictService districtService;

    @Autowired
    private PushInfoTagService pushInfoTagService;

    @Autowired
    private PicContentService picContentService;

    @Autowired
    private TagService tagService;

    @Autowired
    private BasePath basePath;

    @GetMapping("/user/personal")
    public ModelAndView personal(){

        //查询所有的信息

        ModelAndView modelAndView = new ModelAndView("personal");
        return modelAndView;
    }

    @GetMapping("/user/allPush")
    @ResponseBody
    public List<BaseInfo> allPush(Integer limit,Integer offset,HttpServletRequest request){
        Integer userId = SessionUtil.getUserId(request);
        //查询出除去删除的信息
        return pushInfoService.getBaseInfoByUserIdAndOpStatus(userId,null);
    }


    @GetMapping("/user/collectionPush")
    @ResponseBody
    public List<BaseInfo> collectionPush(Integer limit,Integer offset,HttpServletRequest request){
        Integer userId = SessionUtil.getUserId(request);
        return pushInfoService.getCollectionByUserId(userId);
    }

    @GetMapping("/user/deleteInfo")
    @ResponseBody
    public String deleteInfo(Integer piId,HttpServletRequest request){
        Integer userId = SessionUtil.getUserId(request);
        if(userId!=null&&piId!=null){
            //确保该信息是该用户发的
            pushInfoService.deletePushInfo(piId,userId);
            return "ok:删除成功";
        }else{
            return "no:不合法的请求";
        }
    }


    @GetMapping("/user/alterInfo")
    public ModelAndView alterInfo(Integer piId,HttpServletRequest request){
        Integer userId = SessionUtil.getUserId(request);
        ModelAndView modelAndView = null;
        if(userId!=null&&piId!=null){
            //使用userID和piId查询信息
            PushInfo pushInfo = pushInfoService.getInfoByPiIdAndUserId(userId,piId);
            Map<String,String> tagMap = new HashMap<String,String>();
            for(TagValue tagValue:pushInfo.getTagValues()){
                tagMap.put(tagValue.getTagName(),tagValue.getTcName());
            }
            List<District> district = districtService.getAllDistrict();
            List<Tag> tags = tagService.getAllTag(pushInfo.getPiMc());
            List<PushInfoClass> pushInfoClasses = pushInfoClassService.getAllPush(pushInfo.getPiMc());
            modelAndView = new ModelAndView("alterInfo");
            modelAndView.addObject("districts",district);
            modelAndView.addObject("pushInfo",pushInfo);
            modelAndView.addObject("tags",tags);
            modelAndView.addObject("pushInfoClasses",pushInfoClasses);
            modelAndView.addObject("tagMap",tagMap);
            return modelAndView;
        }else{
            //出错,跳转首页
            modelAndView = new ModelAndView("redirect:/index");
            return modelAndView;
        }
    }

    @PostMapping("/user/alterBaseInfo")
    public ModelAndView alterInfo(@Valid @ModelAttribute("pushError") BaseInfo baseInfo, BindingResult br, HttpServletRequest request){
        if(br.hasErrors()){
            return alterInfo(baseInfo.getPiId(),request);
        }else{
            //如果信息没错,更新信息;
            Integer userId=SessionUtil.getUserId(request);
            if(userId!=null){
                baseInfo.setUserId(userId);
                pushInfoService.updatePushInfo(baseInfo);
                //通过mcId获取搜有的tagId,并将所有的tag和他的之存储到数据库表push_info_tag中
                List<Integer> tagsId = tagService.getAllTagId(baseInfo.getPiMc());
                for(Integer tagId:tagsId){
                    Integer value = Integer.valueOf(request.getParameter("tag"+tagId));
                    if(value!=null){
                        pushInfoTagService.updateInfoTag(tagId,baseInfo.getPiId(),value);
                    }
                }
                //获取所有的其他信息id 并将信息插入数据库
                List<Integer> picsId= pushInfoClassService.getAllPushId(baseInfo.getPiMc());
                for(Integer picId:picsId){
                    String value = request.getParameter("pic"+picId);
                    if(value!=null&&!value.trim().isEmpty()){
                        picContentService.updatePicContent(picId,baseInfo.getPiId(),value);
                    }
                }

                return new ModelAndView("redirect:/info?piId="+baseInfo.getPiId());
            }else{
                return new ModelAndView("redirect:/index");
            }
        }
    }

    @PostMapping("/user/uploadPic")
    @ResponseBody
    public Flag alterPicInfo(@RequestParam("pic")MultipartFile[] pic,Integer piId, Integer mcId,HttpServletRequest request)throws IOException{
        Integer userId=SessionUtil.getUserId(request);
        String baseImgStr = pushInfoService.getImgUrl(piId,userId);
        String savePath = basePath.getPathValue();
        String otherImgUrl = FileUtil.addPic(pic,"img/pushimg/",savePath);
        if(baseImgStr!=null){
            otherImgUrl=baseImgStr+"#"+otherImgUrl;
        }
        if(!otherImgUrl.isEmpty()){
            pushInfoService.updatePicUrl(otherImgUrl.substring(0,otherImgUrl.length()-1),piId,userId);
        }
        Flag flag = new Flag();
        flag.setFlag("true");
        return flag;
    }

    /**
     * 初始话图片
     * @param piId
     * @param request
     * @return
     */
    @GetMapping("/user/initPic")
    @ResponseBody
    public String getPicInfo(Integer piId,HttpServletRequest request){
        Integer userId=SessionUtil.getUserId(request);
        String imgStr = pushInfoService.getImgUrl(piId,userId);
        return imgStr==null?"":imgStr;
    }

    @PostMapping("/user/picDelete")
    @ResponseBody
    public Flag deletePic(Integer key,Integer urlId,HttpServletRequest request){
        Integer userId=SessionUtil.getUserId(request);
        String imgStr = pushInfoService.getImgUrl(key,userId);
        String imgUrl = FileUtil.getDeleteImg(imgStr,urlId,basePath);
        pushInfoService.updatePicUrl(imgUrl,key,userId);
        return new Flag("true");
    }


    @GetMapping("/user/deleteCollect")
    @ResponseBody
    public boolean deleteCollection(Integer piId,HttpServletRequest request){
        Integer userId = SessionUtil.getUserId(request);
        if(piId!=null){
            pushInfoService.deleteCollection(userId,piId);
            return true;
        }else{
            return false;
        }
    }

}
