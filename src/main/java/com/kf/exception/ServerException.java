package com.kf.exception;

/**
 * Created by 18236 on 2017/11/6.
 */
public class ServerException extends RuntimeException {
    private String code;
    private String exceptionStr;
    private String msg;

    public ServerException(String code,String msg,String exceptionStr) {
        this.code=code;
        this.msg=msg;
        this.exceptionStr=exceptionStr;
    }

    public String getExceptionStr() {
        return exceptionStr;
    }

    public void setExceptionStr(String exceptionStr) {
        this.exceptionStr = exceptionStr;
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
