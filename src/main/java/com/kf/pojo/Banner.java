package com.kf.pojo;

/**
 * Created by 18236 on 2017/11/17.
 */
public class Banner extends Advert {
    private String bannerTitle;
    private String bannerContent;
    private Integer bannerId;

    public String getBannerTitle() {
        return bannerTitle;
    }

    public void setBannerTitle(String bannerTitle) {
        this.bannerTitle = bannerTitle;
    }

    public String getBannerContent() {
        return bannerContent;
    }

    public void setBannerContent(String bannerContent) {
        this.bannerContent = bannerContent;
    }

    public Integer getBannerId() {
        return bannerId;
    }

    public void setBannerId(Integer bannerId) {
        this.bannerId = bannerId;
    }
}
