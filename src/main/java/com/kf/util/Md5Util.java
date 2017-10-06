package com.kf.util;

import sun.misc.BASE64Encoder;

import java.security.MessageDigest;

/**
 * Created by 18236 on 2017/10/1.
 */
public class Md5Util {
    public static String MD5(String str) {
        try {
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            BASE64Encoder base64en = new BASE64Encoder();
            return base64en.encode(md5.digest(str.getBytes("utf-8")));

        } catch (Exception e) {
            return null;
        }
    }
}
