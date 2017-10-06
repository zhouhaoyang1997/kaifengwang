package com.kf.Interceptor;

import com.kf.pojo.User;
import com.kf.service.UserService;
import com.kf.util.CookieUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by 18236 on 2017/9/30.
 */
@Component
public class LoginInterceptor implements HandlerInterceptor{

    @Autowired
    private UserService userService;

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        String url = httpServletRequest.getRequestURI();
        //不对 超时 登录 进行拦截
        HttpSession session=httpServletRequest.getSession();
        if(url.contains("timeout")||url.contains("login")){
            return true;
        }

        //判断用户是否已经是登陆状态//如果用户未登录,从cookie中获取,如果cookie中不存在,则不登录
        if(session.getAttribute("user")==null){
            String userName = CookieUtil.getCookieValue(httpServletRequest,"userName");
            String userPassword = CookieUtil.getCookieValue(httpServletRequest,"userPassword");
            if(userName==null||userPassword==null){
                return true;
            }
            User user = new User();
            user.setUserPassword(userPassword);
            user.setUserName(userName);
            //从原有cookie中取出用户,进行验证如果正确放入session.
            User newUser = userService.getUser(user);
            if(newUser!=null){
                session.setAttribute("user",newUser);
            }else{
                httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+"/timeout");
                return false;
            }
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
