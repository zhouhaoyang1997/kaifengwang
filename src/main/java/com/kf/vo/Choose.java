package com.kf.vo;

/**
 * Created by 18236 on 2017/10/1.
 */

/**
 * 已经选择的主类Id 主类名称, 副类id 副类名称
 */
public class Choose {
    private Integer mcId;
    private Integer scId;
    private String mcName;
    private String scName;

    public Integer getMcId() {
        return mcId;
    }

    public void setMcId(Integer mcId) {
        this.mcId = mcId;
    }

    public Integer getScId() {
        return scId;
    }

    public void setScId(Integer scId) {
        this.scId = scId;
    }

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
}
