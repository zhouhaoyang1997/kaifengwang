package com.kf.util;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * Created by 18236 on 2017/9/28.
 */

@Component
@ConfigurationProperties(prefix = "path")
public class BasePath {

    private String pathValue;

    private String headImgPath;

    private String companyImgPath;

    public String getCompanyImgPath() {
        return companyImgPath;
    }

    public void setCompanyImgPath(String companyImgPath) {
        this.companyImgPath = companyImgPath;
    }

    public String getHeadImgPath() {
        return headImgPath;
    }

    public void setHeadImgPath(String headImgPath) {
        this.headImgPath = headImgPath;
    }

    public String getPathValue() {
        return pathValue;
    }

    public void setPathValue(String pathValue) {
        this.pathValue = pathValue;
    }
}
