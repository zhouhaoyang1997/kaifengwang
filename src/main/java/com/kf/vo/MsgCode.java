package com.kf.vo;

import org.hibernate.validator.constraints.NotBlank;

/**
 * Created by 18236 on 2017/12/1.
 */
public class MsgCode {
    private String path;
    private String remember;
    private String phoneNum;
    private String hash;
    private String tamp;
    private String code;

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getRemember() {
        return remember;
    }

    public void setRemember(String remember) {
        this.remember = remember;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getHash() {
        return hash;
    }

    public void setHash(String hash) {
        this.hash = hash;
    }

    public String getTamp() {
        return tamp;
    }

    public void setTamp(String tamp) {
        this.tamp = tamp;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
