package com.kf.controller;

import com.kf.pojo.BaseInfo;
import com.kf.pojo.PushInfo;
import com.kf.service.DistrictService;
import com.kf.service.PushInfoService;
import com.kf.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.security.PublicKey;
import java.util.List;
/**
 * Created by 18236 on 2017/10/7.
 */
@Controller
public class PersonalController {

    @Autowired
    private PushInfoService pushInfoService;

    @Autowired
    private DistrictService districtService;

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

            modelAndView = new ModelAndView("alterInfo");
            modelAndView.addObject("pushInfo",pushInfo);
            return modelAndView;
        }else{
            //出错,跳转首页
            modelAndView = new ModelAndView("redirect:/index");
            return modelAndView;
        }
    }
}
