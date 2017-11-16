package com.kf.pojo;

import org.hibernate.validator.constraints.NotBlank;

public class Company {

    private Integer companyId;
    private Integer cpUser;

    private Integer cpSc;
    @NotBlank(message = "企业名称不可为空!")
    private String cpName;
    @NotBlank(message = "企业联系人不可为空!")
    private String cpContactPerson;
    private String cpAddress;
    private String cpNet;

    @NotBlank
    private String cpContact;

    private String cpDescription;
    /**
     * 公司介绍图片
     */
    private String cpImg;
    /**
     * 公司注册号
     */
    @NotBlank(message = "企业注册号不可为空")
    private String cpNum;
    /**
     * 公司营业执照图片
     */
    private String cpPzImg;

    public String getCpContact() {
        return cpContact;
    }

    public void setCpContact(String cpContact) {
        this.cpContact = cpContact;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    public Integer getCpUser() {
        return cpUser;
    }

    public void setCpUser(Integer cpUser) {
        this.cpUser = cpUser;
    }

    public Integer getCpSc() {
        return cpSc;
    }

    public void setCpSc(Integer cpSc) {
        this.cpSc = cpSc;
    }

    public String getCpName() {
        return cpName;
    }

    public void setCpName(String cpName) {
        this.cpName = cpName;
    }

    public String getCpContactPerson() {
        return cpContactPerson;
    }

    public void setCpContactPerson(String cpContactPerson) {
        this.cpContactPerson = cpContactPerson;
    }

    public String getCpAddress() {
        return cpAddress;
    }

    public void setCpAddress(String cpAddress) {
        this.cpAddress = cpAddress;
    }

    public String getCpNet() {
        return cpNet;
    }

    public void setCpNet(String cpNet) {
        this.cpNet = cpNet;
    }

    public String getCpDescription() {
        return cpDescription;
    }

    public void setCpDescription(String cpDescription) {
        this.cpDescription = cpDescription;
    }

    public String getCpImg() {
        return cpImg;
    }

    public void setCpImg(String cpImg) {
        this.cpImg = cpImg;
    }

    public String getCpNum() {
        return cpNum;
    }

    public void setCpNum(String cpNum) {
        this.cpNum = cpNum;
    }

    public String getCpPzImg() {
        return cpPzImg;
    }

    public void setCpPzImg(String cpPzImg) {
        this.cpPzImg = cpPzImg;
    }
}
