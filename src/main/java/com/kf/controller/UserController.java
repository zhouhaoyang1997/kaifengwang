package com.kf.controller;

import com.kf.pojo.User;
import com.kf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by 18236 on 2017/9/24.
 */
@Controller
public class UserController {

    @Autowired
    public UserService userService;

}
