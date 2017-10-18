package com.kf.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

public class ErrorController {
    @Controller
    public class MainsiteErrorController  {

        private static final String ERROR_PATH = "/error";

        @RequestMapping(value=ERROR_PATH)
        public String handleError(){
            return "404";
        }

        public String getErrorPath() {
            // TODO Auto-generated method stub
            return ERROR_PATH;
        }

    }
}
