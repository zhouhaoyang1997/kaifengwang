package com.kf.config;

import com.kf.Interceptor.LoginInterceptor;
import com.kf.Interceptor.PushInterceptor;
import com.kf.Interceptor.RememberUserUrl;
import com.kf.Interceptor.UserInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * Created by 18236 on 2017/9/30.
 */
@Configuration
public class LoginConfig extends WebMvcConfigurerAdapter {

    /**
     * 该login拦截器,用于将存于cookie中的用户取出,并登陆
     * @return
     */
    @Bean
    public HandlerInterceptor getLoginInterceptor(){
        return new LoginInterceptor();
    }

    @Bean
    public HandlerInterceptor getPushInterceptor(){
        return new PushInterceptor();
    }


//    @Bean
//    public HandlerInterceptor getRememberUserUrl(){
//        return new RememberUserUrl();
//    }

    @Bean
    public HandlerInterceptor getUserInterceptor(){
        return new UserInterceptor();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(getLoginInterceptor()).addPathPatterns("/**");
        //registry.addInterceptor(getRememberUserUrl()).addPathPatterns("/**");
        registry.addInterceptor(getPushInterceptor()).addPathPatterns("/m/push/**").addPathPatterns("/push/**");
        registry.addInterceptor(getUserInterceptor()).addPathPatterns("/m/user/**").addPathPatterns("/user/**");
        super.addInterceptors(registry);
    }
}
