package com.kf.Interceptor;

import com.kf.pojo.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by 18236 on 2017/10/4.
 */
public class UserInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        String url = httpServletRequest.getRequestURI();
        HttpSession session = httpServletRequest.getSession();
        //如果用户未登录,跳转到选择登陆界面,并附带上用户的选择信息,从request中转发到login控制器去
        if(session.getAttribute("user")==null){
            if(url.contains("/m/user")){
                httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+"/m/login");
            }else{
                httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+"/login");
            }

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
