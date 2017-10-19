package com.kf.controller;

import com.kf.pojo.*;
import com.kf.service.*;
import com.kf.util.SessionUtil;
import com.kf.vo.Flag;
import com.kf.vo.OtherInfo;
import com.kf.vo.TagValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
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
        return pushInfoService.getBaseInfoByUserIdAndOpStatus(userId,1);
    }

    @GetMapping("/user/deletePush")
    @ResponseBody
    public List<BaseInfo> deletePush(Integer limit,Integer offset,HttpServletRequest request){
        Integer userId = SessionUtil.getUserId(request);
        return pushInfoService.getBaseInfoByUserIdAndStatus(userId,1);
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
            pushInfoService.updatePushInfoStatus(piId,userId,1);
            return "ok:删除成功";
        }else{
            return "no:不合法的请求";
        }
    }

    @GetMapping("/user/recoverInfo")
    @ResponseBody
    public String recoverInfo(Integer piId,HttpServletRequest request){
        Integer userId = SessionUtil.getUserId(request);
        if(userId!=null&&piId!=null){
            //确保该信息是该用户发的
            pushInfoService.updatePushInfoStatus(piId,userId,0);
            return "ok:已恢复";
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
            Map<String,String> tagMap = new HashMap<>();
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
    public String alterPicInfo(HttpServletRequest request){
        return "ok";
    };

    @GetMapping("/user/initPic")
    @ResponseBody
    public String getPicInfo(Integer piId,HttpServletRequest request){
        Integer userId=SessionUtil.getUserId(request);
        String imgStr = pushInfoService.getImgUrl(piId,userId);
        if(imgStr!=null){
            return pushInfoService.getImgUrl(piId,userId);
        }
        return "";
    }

    @PostMapping("/user/picDelete")
    @ResponseBody
    public Flag deletePic(Integer key,Integer urlId,HttpServletRequest request){
        Integer userId=SessionUtil.getUserId(request);
        System.out.print(urlId);
        String imgStr = pushInfoService.getImgUrl(key,userId);

        StringBuffer stringBuffer = new StringBuffer();
        if(imgStr!=null){
            String[] imgUrl = imgStr.split("#");
            for(int i=0;i<imgUrl.length;i++){
                if(i!=urlId){
                    stringBuffer.append(imgUrl[i]);
                    stringBuffer.append("#");
                }
            }
            //更改图片url

            pushInfoService.updatePicUrl(getUrl(stringBuffer),key,userId);
        }
        Flag flag = new Flag();
        flag.setFlag("true");
        return flag;
    }

    private String getUrl(StringBuffer stringBuffer){
        if(stringBuffer.length()>0){
            String sb = stringBuffer.toString();
            return sb.substring(0,sb.length()-1);
        }else{
            return null;
        }
    }
}
