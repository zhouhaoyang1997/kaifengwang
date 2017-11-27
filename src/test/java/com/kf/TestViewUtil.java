package com.kf;

import com.kf.util.ViewUtil;
import org.junit.jupiter.api.Test;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author zhy
 * @create 2017-11-27 19:23
 **/
public class TestViewUtil {
    @Test
    void test(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("redirect:/login");
        ViewUtil.toMobileView(modelAndView);
    }
}
