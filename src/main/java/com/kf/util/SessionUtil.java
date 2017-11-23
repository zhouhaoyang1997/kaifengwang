package com.kf.util;

import com.kf.pojo.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by 18236 on 2017/10/7.
 */
public class SessionUtil {
    /**
     * 通用从session中获取id的方法
     * @param request
     * @return
     */
    public static Integer getUserId(HttpServletRequest request){
        HttpSession session = request.getSession();
        if(session.getAttribute("user")!=null){
            User user = (User)session.getAttribute("user");
            return user.getUserId();
        }
        return null;
    }

    /**
     * 获取当前用户ip登录次数
     * @param request
     * @return
     */
    public static Integer getIpCount(HttpServletRequest request){
        HttpSession session = request.getSession();
        String ip = request.getRemoteAddr();
        Object count = session.getAttribute(ip);
        if(count!=null){
            return (Integer)count;
        }
        return null;
    }
}
