package com.kf.pojo;

/**
 * 该实体作用是热词搜索
 * Created by 18236 on 2017/10/26.
 */
public class HotSearch {
    private Integer hotSearchId;
    private Integer hotSearchBz;
    private String hotSearchCt;

    public Integer getHotSearchId() {
        return hotSearchId;
    }

    public void setHotSearchId(Integer hotSearchId) {
        this.hotSearchId = hotSearchId;
    }

    public Integer getHotSearchBz() {
        return hotSearchBz;
    }

    public void setHotSearchBz(Integer hotSearchBz) {
        this.hotSearchBz = hotSearchBz;
    }

    public String getHotSearchCt() {
        return hotSearchCt;
    }

    public void setHotSearchCt(String hotSearchCt) {
        this.hotSearchCt = hotSearchCt;
    }
}
