package com.kf.Interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by 18236 on 2017/10/2.
 */
@Component
public class RememberUserUrl implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        HttpSession session = httpServletRequest.getSession();
        String method = httpServletRequest.getMethod();

        String uri = httpServletRequest.getRequestURI();
        if(method.equals("GET")&&!uri.contains("login")&&!uri.contains("register")&&!uri.contains("timeout")&&!uri.contains("logout")&&!uri.contains("user")&&!uri.contains("error")){
            //使用session记住当前访问链接,方便用户登陆后跳转回来
            String lastedUrl =  httpServletRequest.getRequestURI();
            if(httpServletRequest.getQueryString()!=null){
                lastedUrl =lastedUrl+"?"+httpServletRequest.getQueryString();
            }
            session.setAttribute("lastedUrl",lastedUrl);
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
