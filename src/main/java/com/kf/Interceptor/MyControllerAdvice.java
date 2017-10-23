package com.kf.Interceptor;

import com.kf.exception.PiIdNotFoundException;
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
        ModelAndView modelAndView = new ModelAndView("piIdNotFound");
        modelAndView.addObject("ex",ex);
        return modelAndView;
    }
}
