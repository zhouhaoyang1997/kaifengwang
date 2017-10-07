package com.kf.pojo;

import java.sql.Timestamp;

/**
 * 基本信息对应数据库表push_info
 * Created by 18236 on 2017/9/26.
 */
public class BaseInfo {
    private Integer piId;
    private String piTitle;
    private String piContent;
    private Integer piMc;
    private Integer piSc;
    private String piUser;
    private String piAddress;
    private String piImg;
    private int piScan;
    private String piContactPerson;
    private String piPhone;
    private String piQq;
    private int piDistrict;
    private String piDistrictName;
    private Timestamp piPushDate;
    private double piChujia;

    public String getPiDistrictName() {
        return piDistrictName;
    }

    public void setPiDistrictName(String piDistrictName) {
        this.piDistrictName = piDistrictName;
    }

    public String getPiUser() {
        return piUser;
    }

    public void setPiUser(String piUser) {
        this.piUser = piUser;
    }

    public Integer getPiId() {
        return piId;
    }

    public void setPiId(Integer piId) {
        this.piId = piId;
    }

    public String getPiContactPerson() {
        return piContactPerson;
    }

    public void setPiContactPerson(String piContactPerson) {
        this.piContactPerson = piContactPerson;
    }

    public String getPiPhone() {
        return piPhone;
    }

    public void setPiPhone(String piPhone) {
        this.piPhone = piPhone;
    }

    public String getPiQq() {
        return piQq;
    }

    public void setPiQq(String piQq) {
        this.piQq = piQq;
    }

    public int getPiDistrict() {
        return piDistrict;
    }

    public void setPiDistrict(int piDistrict) {
        this.piDistrict = piDistrict;
    }

    public Integer getPiMc() {
        return piMc;
    }

    public void setPiMc(Integer piMc) {
        this.piMc = piMc;
    }

    public Integer getPiSc() {
        return piSc;
    }

    public void setPiSc(Integer piSc) {
        this.piSc = piSc;
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
