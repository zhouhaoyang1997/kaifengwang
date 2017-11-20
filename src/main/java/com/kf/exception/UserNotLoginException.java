package com.kf.exception;

/**
 * Created by 18236 on 2017/11/4.
 */
public class UserNotLoginException extends RuntimeException{
    private String code;
    private String msg;

    public UserNotLoginException(String code,String msg) {
        this.code=code;
        this.msg=msg;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
