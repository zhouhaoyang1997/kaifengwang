package com.kf.util;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * Created by 18236 on 2017/9/28.
 */

@Component
@ConfigurationProperties(prefix = "path")
public class BasePath {

    public String pathValue;

    public String getPathValue() {
        return pathValue;
    }

    public void setPathValue(String pathValue) {
        this.pathValue = pathValue;
    }
}
