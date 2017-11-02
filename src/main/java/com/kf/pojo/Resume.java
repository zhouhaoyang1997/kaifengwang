package com.kf.pojo;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.NotNull;
import java.sql.Timestamp;

/**
 * 个人简历实体,对应数据库cv
 * Created by 18236 on 2017/11/2.
 */
public class Resume {

    @NotNull(message = "错误的请求")
    private Integer userId;
    private Integer cvId;
    @NotBlank(message = "毕业院校不能为空")
    private String graColl;
    @NotEmpty(message = "毕业时间不能为空")
    private Timestamp bornYear;
    @NotNull(message = "错误的请求")
    private Integer dreamWork;

    private String gender;
    private Integer dreamDistrict;
    @NotBlank(message = "籍贯不能为空")
    private String jiguan;
    @NotBlank(message = "民族不能为空")
    private String minzu;
    private Integer tall;
    @NotNull(message = "错误的请求")
    private Integer maritalStatus;
    @NotNull(message = "错误的请求")
    private String maxEdu;
    @NotEmpty(message = "毕业时间不能为空")
    private Timestamp graDate;

    private String stuPro;
    private String english;
    private String computer;
    @NotBlank(message = "错误的请求")
    private String jobYear;
    private String jobDetail;
    private String income;
    private String jineng;
    private String zitui;
    @NotBlank(message = "联系手机不可为空")
    private String phone;
    private String email;
    private String qq;
    private String realName;
    private Integer weight;
    private Integer health;
    private String cvImg;
    private String otherStu;
    private String workTime;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getCvId() {
        return cvId;
    }

    public void setCvId(Integer cvId) {
        this.cvId = cvId;
    }

    public String getGraColl() {
        return graColl;
    }

    public void setGraColl(String graColl) {
        this.graColl = graColl;
    }

    public Timestamp getBornYear() {
        return bornYear;
    }

    public void setBornYear(Timestamp bornYear) {
        this.bornYear = bornYear;
    }

    public Integer getDreamWork() {
        return dreamWork;
    }

    public void setDreamWork(Integer dreamWork) {
        this.dreamWork = dreamWork;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Integer getDreamDistrict() {
        return dreamDistrict;
    }

    public void setDreamDistrict(Integer dreamDistrict) {
        this.dreamDistrict = dreamDistrict;
    }

    public String getJiguan() {
        return jiguan;
    }

    public void setJiguan(String jiguan) {
        this.jiguan = jiguan;
    }

    public String getMinzu() {
        return minzu;
    }

    public void setMinzu(String minzu) {
        this.minzu = minzu;
    }

    public Integer getTall() {
        return tall;
    }

    public void setTall(Integer tall) {
        this.tall = tall;
    }

    public Integer getMaritalStatus() {
        return maritalStatus;
    }

    public void setMaritalStatus(Integer maritalStatus) {
        this.maritalStatus = maritalStatus;
    }

    public String getMaxEdu() {
        return maxEdu;
    }

    public void setMaxEdu(String maxEdu) {
        this.maxEdu = maxEdu;
    }

    public Timestamp getGraDate() {
        return graDate;
    }

    public void setGraDate(Timestamp graDate) {
        this.graDate = graDate;
    }

    public String getStuPro() {
        return stuPro;
    }

    public void setStuPro(String stuPro) {
        this.stuPro = stuPro;
    }

    public String getEnglish() {
        return english;
    }

    public void setEnglish(String english) {
        this.english = english;
    }

    public String getComputer() {
        return computer;
    }

    public void setComputer(String computer) {
        this.computer = computer;
    }

    public String getJobYear() {
        return jobYear;
    }

    public void setJobYear(String jobYear) {
        this.jobYear = jobYear;
    }

    public String getJobDetail() {
        return jobDetail;
    }

    public void setJobDetail(String jobDetail) {
        this.jobDetail = jobDetail;
    }

    public String getIncome() {
        return income;
    }

    public void setIncome(String income) {
        this.income = income;
    }

    public String getJineng() {
        return jineng;
    }

    public void setJineng(String jineng) {
        this.jineng = jineng;
    }

    public String getZitui() {
        return zitui;
    }

    public void setZitui(String zitui) {
        this.zitui = zitui;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public Integer getWeight() {
        return weight;
    }

    public void setWeight(Integer weight) {
        this.weight = weight;
    }

    public Integer getHealth() {
        return health;
    }

    public void setHealth(Integer health) {
        this.health = health;
    }

    public String getCvImg() {
        return cvImg;
    }

    public void setCvImg(String cvImg) {
        this.cvImg = cvImg;
    }

    public String getOtherStu() {
        return otherStu;
    }

    public void setOtherStu(String otherStu) {
        this.otherStu = otherStu;
    }

    public String getWorkTime() {
        return workTime;
    }

    public void setWorkTime(String workTime) {
        this.workTime = workTime;
    }
}
