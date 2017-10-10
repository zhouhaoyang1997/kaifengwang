package com.kf.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by 18236 on 2017/9/30.
 */
public class CookieUtil {
    /**
     * 获取cookie值
     * @param request
     * @param name
     * @return
     */
    public static String getCookieValue(HttpServletRequest request,String name){
        Cookie[] cookies = request.getCookies();
        if(cookies!=null){
            for(Cookie cookie:cookies){
                if(cookie.getName().equals(name)){
                    return cookie.getValue();
                }
            }
        }
        return null;
    }

    public static void addCookie(HttpServletResponse response,String name,String value){
        if(name!=null&&value!=null){
            Cookie cookie = new Cookie(name,value);
            //cookie有效期为七天
            cookie.setMaxAge(60*60*12*7);
            response.addCookie(cookie);
        }
    }

    //移除cookie
    public static void removeCookie(HttpServletResponse response,HttpServletRequest request,String name){
        if(CookieUtil.getCookieValue(request,name)!=null){
            Cookie cookie = new Cookie(name,"1");
            cookie.setPath("/");
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }
    }
}
