package com.kf.pojo;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

import java.sql.Timestamp;

/**
 * 该表用于用户举报信息
 * Created by 18236 on 2017/10/14.
 */
public class Tip {
    private Integer piId;
    private Integer userId;
    private String tipContent;
    private Integer tipId;
    private Integer tipStatus;
    private Timestamp tipCreatetime;

    public Timestamp getTipCreatetime() {
        return tipCreatetime;
    }

    public void setTipCreatetime(Timestamp tipCreatetime) {
        this.tipCreatetime = tipCreatetime;
    }

    public Integer getPiId() {
        return piId;
    }

    public void setPiId(Integer piId) {
        this.piId = piId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getTipContent() {
        return tipContent;
    }

    public void setTipContent(String tipContent) {
        this.tipContent = tipContent;
    }

    public Integer getTipId() {
        return tipId;
    }

    public void setTipId(Integer tipId) {
        this.tipId = tipId;
    }

    public Integer getTipStatus() {
        return tipStatus;
    }

    public void setTipStatus(Integer tipStatus) {
        this.tipStatus = tipStatus;
    }
}
