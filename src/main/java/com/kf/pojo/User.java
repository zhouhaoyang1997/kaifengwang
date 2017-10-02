package com.kf.pojo;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;

/**
 * 用户实体类
 * Created by 18236 on 2017/9/24.
 */
public class User {
    @Length(min=3,max=10,message = "用户名长度必须在3-10个字符之间!")
    private String userName;
    @Length(min=6,max=20,message = "密码长度必须在6-20个字符之间!")
    private String userPassword;
    private String userAvator;
    @Length(min=11,max=11,message = "请输入正确的手机号!")
    private String userPhone;
    @Email(message = "请输入正确的邮箱!")
    private String userEmail;
    private Integer userId;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserAvator() {
        return userAvator;
    }

    public void setUserAvator(String userAvator) {
        this.userAvator = userAvator;
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
