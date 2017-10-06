package com.kf.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;

/**
 * Created by 18236 on 2017/10/4.
 */
public class CommonUtil {
    public static boolean isNotNullAndNotEmpty(String value){
        return value!=null&&!value.trim().isEmpty();
    }

    /**
     * 字符串是否含有空格非法字符,
     * @param value
     * @return
     */
    public static boolean isNotstrContainsBackspace(String value){
        return value!=null&&!value.contains(" ");
    }

    public static boolean isPhoneNum(String str) throws PatternSyntaxException {
        if(str==null){
            return false;
        }
        String regExp = "^((13[0-9])|(15[^4])|(18[0,2,3,5-9])|(17[0-8])|(147))\\d{8}$";
        Pattern p = Pattern.compile(regExp);
        Matcher m = p.matcher(str);
        return m.matches();
    }

}
