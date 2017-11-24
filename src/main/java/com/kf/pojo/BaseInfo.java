package com.kf.pojo;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.NotNull;
import java.sql.Timestamp;

/**
 * 基本信息对应数据库表push_info
 * Created by 18236 on 2017/9/26.
 */
public class BaseInfo {
    private Integer piId;
    @Length(min = 4,max = 100,message = "标题长度应在在4-100之间")
    private String piTitle;
    @Length(min=10,max = 2500,message = "内容应在10-2500之间")
    private String piContent;
    private Integer piMc;
    private String mcName;
    private String scName;

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

    private Integer piSc;
    private String piUser;
    @NotNull(message = "错误的提交")
    private Integer userId;
    @Length(min = 2,max=150,message = "请输入2-150个字符之间的文字")
    private String piAddress;
    private String piImg;
    private int piScan;
    @Length(min=2,max=8,message = "请输入正确的联系人姓名,2-8个字符,例如'王女士'")
    private String piContactPerson;
    @Length(min=11,max = 11,message = "请输入正确的手机号")
    private String piPhone;
    private String piQq;
    @NotNull(message = "错误的提交")
    private Integer piDistrict;
    private String piDistrictName;
    private Timestamp piPushDate;
    private double piChujia;
    private String piScName;
    private String piIp;

    private Integer piZhiding;
    //当前信息状态,0正常,1被删除,2正在审核,
    private Integer status;

    public String getPiIp() {
        return piIp;
    }

    public void setPiIp(String piIp) {
        this.piIp = piIp;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getUserId() {
        return userId;
    }

    public Integer getPiDistrict() {
        return piDistrict;
    }

    public void setPiDistrict(Integer piDistrict) {
        this.piDistrict = piDistrict;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getPiScName() {
        return piScName;
    }

    public void setPiScName(String piScName) {
        this.piScName = piScName;
    }


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

    public Integer getPiZhiding() {
        return piZhiding;
    }

    public void setPiZhiding(Integer piZhiding) {
        this.piZhiding = piZhiding;
    }
}
