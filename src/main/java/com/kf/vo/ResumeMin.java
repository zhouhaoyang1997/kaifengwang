package com.kf.vo;

/**
 * 简化版的resume,用于搜索
 * Created by 18236 on 2017/11/5.
 */
public class ResumeMin {
    private Integer cvId;
    private Integer dreamWork;
    private String dreamWorkStr;
    private Integer districtId;
    private String districtName;
    private Integer openFlag;

    public Integer getOpenFlag() {
        return openFlag;
    }

    public void setOpenFlag(Integer openFlag) {
        this.openFlag = openFlag;
    }


    public Integer getCvId() {
        return cvId;
    }

    public void setCvId(Integer cvId) {
        this.cvId = cvId;
    }

    public Integer getDreamWork() {
        return dreamWork;
    }

    public void setDreamWork(Integer dreamWork) {
        this.dreamWork = dreamWork;
    }


    public String getDreamWorkStr() {
        return dreamWorkStr;
    }

    public void setDreamWorkStr(String dreamWorkStr) {
        this.dreamWorkStr = dreamWorkStr;
    }

    public Integer getDistrictId() {
        return districtId;
    }

    public void setDistrictId(Integer districtId) {
        this.districtId = districtId;
    }

    public String getDistrictName() {
        return districtName;
    }

    public void setDistrictName(String districtName) {
        this.districtName = districtName;
    }
}
