package com.kf.pojo;

import java.sql.Timestamp;

/**
 * 基本信息对应数据库表push_info
 * Created by 18236 on 2017/9/26.
 */
public class BaseInfo {
    private int piId;
    private String piTitle;
    private String piContent;
    private String mcName;
    private String scName;
    private String userName;
    private String piAddress;
    private String piImg;
    private int piScan;
    private Timestamp piPushDate;
    private double piChujia;

    public int getPiId() {
        return piId;
    }

    public void setPiId(int piId) {
        this.piId = piId;
    }

    public String getPiTitle() {
        return piTitle;
    }

    public void setPiTitle(String piTitle) {
        this.piTitle = piTitle;
    }

    public String getPiContent() {
        return piContent;
    }

    public void setPiContent(String piContent) {
        this.piContent = piContent;
    }

    public String getMcName() {
        return mcName;
    }

    public void setMcName(String mcName) {
        this.mcName = mcName;
    }

    public String getScName() {
        return scName;
    }

    public void setScName(String scName) {
        this.scName = scName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPiAddress() {
        return piAddress;
    }

    public void setPiAddress(String piAddress) {
        this.piAddress = piAddress;
    }

    public String getPiImg() {
        return piImg;
    }

    public void setPiImg(String piImg) {
        this.piImg = piImg;
    }

    public int getPiScan() {
        return piScan;
    }

    public void setPiScan(int piScan) {
        this.piScan = piScan;
    }

    public Timestamp getPiPushDate() {
        return piPushDate;
    }

    public void setPiPushDate(Timestamp piPushDate) {
        this.piPushDate = piPushDate;
    }

    public double getPiChujia() {
        return piChujia;
    }

    public void setPiChujia(double piChujia) {
        this.piChujia = piChujia;
    }

    public String getPiZhiding() {
        return piZhiding;
    }

    public void setPiZhiding(String piZhiding) {
        this.piZhiding = piZhiding;
    }

    private String piZhiding;
}
