package com.kf.vo;

/**
 * Created by 18236 on 2017/12/1.
 */
public class StateMsg {
    private String code;
    private MsgCode msgCode;
    private String msg;

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public StateMsg(MsgCode msgCode, String code,String msg) {
        this.msgCode = msgCode;
        this.code= code;
        this.msg=msg;
    }

    public MsgCode getMsgCode() {
        return msgCode;
    }

    public void setMsgCode(MsgCode msgCode) {
        this.msgCode = msgCode;
    }

    public StateMsg() {
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

}
