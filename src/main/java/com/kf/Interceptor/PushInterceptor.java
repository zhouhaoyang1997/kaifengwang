package com.kf.Interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by 18236 on 2017/10/1.
 */

/**
 * 该拦截器用于判断用户是否已经登陆,是否能够发布信息或者进入信息填写链接
 */
@Component
public class PushInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        String url = httpServletRequest.getRequestURI();
        //不对选择主类和副类 登陆页 进行拦截
        if(url.contains("choose")||url.contains("login")){
            return true;
        }
        HttpSession session = httpServletRequest.getSession();
        //如果用户未登录,跳转到选择登陆界面,并附带上用户的选择信息,从request中转发到login控制器去
        if(session.getAttribute("user")==null){
            httpServletRequest.getRequestDispatcher("/push/login").forward(httpServletRequest,httpServletResponse);
            return false;
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
