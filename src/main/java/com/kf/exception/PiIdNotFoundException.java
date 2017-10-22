package com.kf.exception;

/**
 * Created by 18236 on 2017/10/20.
 */
public class PiIdNotFoundException extends RuntimeException{

    private String code;
    private String msg;

    public PiIdNotFoundException(String code,String msg) {
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

    //spring对于runtime异常才会进行回滚
}
