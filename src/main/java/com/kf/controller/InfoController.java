package com.kf.controller;

import com.kf.exception.PiIdNotFoundException;
import com.kf.pojo.PushInfo;
import com.kf.pojo.Tip;
import com.kf.pojo.User;
import com.kf.service.PushInfoService;
import com.kf.service.TipService;
import com.kf.service.UserService;
import com.kf.util.CommonUtil;
import com.kf.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

/**
 * Created by 18236 on 2017/10/2.
 */
@Controller
public class InfoController {

    @Autowired
    private PushInfoService pushInfoService;

    @Autowired
    private UserService userService;

    @Autowired
    private TipService tipService;

    @RequestMapping("/info")
    public ModelAndView Info(Integer piId,HttpServletRequest request)throws Exception{
        //下面这行的user是userId
        Integer user=SessionUtil.getUserId(request);
        ModelAndView modelAndView = new ModelAndView("info");
        if(piId!=null){
            PushInfo pushInfo = pushInfoService.getInfoByPiId(piId);
            Integer userId = null;
            try{
                //更新数据库
                pushInfoService.updateInfoScan(pushInfo.getPiId());
                userId = pushInfo.getUserId();
            }
            catch (Exception e){
                throw new PiIdNotFoundException("404","对不起,可能您要查看的信息已经被删除");
            }
            User infoUser = userService.getUserByUserId(userId);
            modelAndView.addObject("info",pushInfo);
            modelAndView.addObject("infoUser",infoUser);
            //用户是否收藏了该信息
            modelAndView.addObject("collected",user!=null&&pushInfoService.collectionIsExists(user,piId));
        }
        return modelAndView;
    }

    @GetMapping("/collect")
    @ResponseBody
    public String collect(Integer piId, HttpServletRequest request){
        if(piId!=null){
            Integer userId = SessionUtil.getUserId(request);
            if(userId!=null&&pushInfoService.getPushIsExists(piId)){
                //信息Id存在,且用户处于登录状态,将该条信息存入收藏表//且收藏表中不存在
                if(pushInfoService.collectionIsExists(userId,piId)){
                    return "no:该信息已经在您的收藏列表里了,请勿重复点击";
                }
                pushInfoService.addCollection(userId,piId);
                return "ok:收藏成功";
            }
        }
        return "no:错误的请求";
    }

    @PostMapping("/tipInfo")
    @ResponseBody
    public String tipInfo(Tip tip, HttpServletRequest request){
        Integer userId = SessionUtil.getUserId(request);
        if(tip!=null&&tip.getPiId()!=null&&userId!=null){
            if(tip.getTipContent()!=null&&CommonUtil.isNotNullAndNotEmpty(tip.getTipContent())){
                //存入数据库
                tip.setUserId(userId);
                tipService.addTip(tip);
                return "ok:感谢您的反馈!";
            }else{
                return "no:您还没有输入您的意见呢";
            }
        }else{
            return "no:错误的请求";
        }
    }
}
