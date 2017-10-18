package com.kf.advice;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@ControllerAdvice
public class ErrorControllerAdvice {
    public static final String DEFAULT_ERROR_VIEW = "error";

    @ExceptionHandler(value = NumberFormatException.class)
    public ModelAndView defaultErrorHandler(HttpServletRequest req, Exception e) throws Exception {
        ModelAndView mav = new ModelAndView();
        mav.addObject("exception", e);
        mav.addObject("url", req.getRequestURL());
        mav.setViewName("phone/505");
        return mav;

    }
}
