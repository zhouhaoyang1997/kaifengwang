package com.kf.pojo;

import java.sql.Timestamp;

public class Advert {
    private Integer advertId;
    private String advertPosition;
    private String advertUrl;
    private Integer width;
    private Integer height;
    //广告显示效果图片url
    private String demoUrl;
    //过期时间
    private Timestamp expireTime;

    //广告页面
    private String advertPage;

    public String getAdvertPage() {
        return advertPage;
    }

    public void setAdvertPage(String advertPage) {
        this.advertPage = advertPage;
    }

    public Integer getAdvertId() {
        return advertId;
    }

    public void setAdvertId(Integer advertId) {
        this.advertId = advertId;
    }

    public String getAdvertPosition() {
        return advertPosition;
    }

    public void setAdvertPosition(String advertPosition) {
        this.advertPosition = advertPosition;
    }

    public String getAdvertUrl() {
        return advertUrl;
    }

    public void setAdvertUrl(String advertUrl) {
        this.advertUrl = advertUrl;
    }

    public Integer getWidth() {
        return width;
    }

    public void setWidth(Integer width) {
        this.width = width;
    }

    public Integer getHeight() {
        return height;
    }

    public void setHeight(Integer height) {
        this.height = height;
    }

    public String getDemoUrl() {
        return demoUrl;
    }

    public void setDemoUrl(String demoUrl) {
        this.demoUrl = demoUrl;
    }

    public Timestamp getExpireTime() {
        return expireTime;
    }

    public void setExpireTime(Timestamp expireTime) {
        this.expireTime = expireTime;
    }
}
