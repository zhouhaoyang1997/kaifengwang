package com.kf.xss;

import org.springframework.web.util.HtmlUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

/**
 * Created by 18236 on 2017/10/28.
 */
public class XssHttpServletRequestWrapper extends HttpServletRequestWrapper{


    public XssHttpServletRequestWrapper(HttpServletRequest request) {
        super(request);
    }

    @Override
    public String getHeader(String name) {
        String value = super.getHeader(name);
        //使用htmlUtils.htmlEscape可以将html字符串转义，可参见 http://www.xuebuyuan.com/2100005.html
        return HtmlUtils.htmlEscape(value);
    }

    @Override
    public String getParameter(String name) {
        String value = super.getParameter(name);

        return HtmlUtils.htmlEscape(value);
    }

    @Override
    public String[] getParameterValues(String name) {

        String[] values = super.getParameterValues(name);
        if(name.equals("path")){
            return values;
        }
        if(values!=null){
            int length = values.length;
            String[] escapeValues = new String[length];
            for(int i=0;i<length;i++){
                //将所有的请求参数去空格化
                escapeValues[i] = HtmlUtils.htmlEscape(values[i]).trim();
            }
            return escapeValues;
        }

        return super.getParameterValues(name);
    }
}
