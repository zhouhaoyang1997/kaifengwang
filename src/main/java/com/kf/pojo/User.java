package com.kf.pojo;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;

import java.sql.Timestamp;

/**
 * 用户实体类
 * Created by 18236 on 2017/9/24.
 */
public class User {
    @Length(min=4,max=16,message = "用户名长度必须在4-16个字符之间!")
    private String userName;
    @Length(min=6,max=20,message = "密码长度必须在6-20个字符之间!")
    private String userPassword;
    @Length(min=11,max=11,message = "请输入正确的手机号!")
    private String userPhone;
    @Email(message = "请输入正确的邮箱!")
    private String userEmail;
    private Integer userId;
    private Timestamp createTime;
    private Timestamp lastedTime;
    private String userDescription;
    private Integer status;
    private Integer userPush;
    private Integer userCollection;
    private String userImg;
    /**
     * 公司是否认证,0未认证,1已认证
     */
    private Integer userAttc;

    public Integer getUserAttc() {
        return userAttc;
    }

    public void setUserAttc(Integer userAttc) {
        this.userAttc = userAttc;
    }

    public String getUserImg() {
        return userImg;
    }

    public void setUserImg(String userImg) {
        this.userImg = userImg;
    }

    public Integer getUserCollection() {
        return userCollection;
    }

    public void setUserCollection(Integer userCollection) {
        this.userCollection = userCollection;
    }

    public Integer getUserPush() {
        return userPush;
    }

    public void setUserPush(Integer userPush) {
        this.userPush = userPush;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public Timestamp getLastedTime() {
        return lastedTime;
    }

    public void setLastedTime(Timestamp lastedTime) {
        this.lastedTime = lastedTime;
    }

    public String getUserDescription() {
        return userDescription;
    }

    public void setUserDescription(String userDescription) {
        this.userDescription = userDescription;
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

    public void setUserId(Integer userId) {
        this.userId = userId;
    }


    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }


    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

}
