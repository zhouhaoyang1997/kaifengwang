package com.kf.Interceptor;

import com.kf.exception.PiIdNotFoundException;
import com.kf.exception.UserNotLoginException;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by 18236 on 2017/10/20.
 */
@ControllerAdvice
public class MyControllerAdvice {


    /**
     * 拦截捕捉自定义异常 MyException.class
     * @param ex
     * @return
     */
    @ExceptionHandler(value = PiIdNotFoundException.class)
    public ModelAndView myErrorHandler(PiIdNotFoundException ex) {
        ModelAndView modelAndView = new ModelAndView("exception/piIdNotFound");
        modelAndView.addObject("ex",ex);
        return modelAndView;
    }

    @ExceptionHandler(value = UserNotLoginException.class)
    public ModelAndView userNotLoginHandler(UserNotLoginException ex) {
        ModelAndView modelAndView = new ModelAndView("exception/userNotLogin");
        modelAndView.addObject("ex",ex);
        return modelAndView;
    }

}
