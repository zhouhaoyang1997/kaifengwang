package com.kf.exception;

/**
 * Created by 18236 on 2017/11/30.
 */

public class PhoneErrorException extends Exception {
    private String code;
    private String msg;

    public PhoneErrorException(String code,String msg) {
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
