package com.kf.vo;

/**
 * Created by 18236 on 2017/12/1.
 */
public class StateMsg {
    private String code;
    private String msg;

    public StateMsg(String code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public StateMsg() {
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
