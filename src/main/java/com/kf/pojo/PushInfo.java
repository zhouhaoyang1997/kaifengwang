package com.kf.pojo;

import com.kf.vo.TagValue;

import java.util.List;

/**
 * Created by 18236 on 2017/9/26.
 */
public class PushInfo extends BaseInfo {

    private List<OtherInfo> otherInfos;

    private List<TagValue> tagValues;

    public List<TagValue> getTagValues() {
        return tagValues;
    }

    public void setTagValues(List<TagValue> tagValues) {
        this.tagValues = tagValues;
    }

    public List<OtherInfo> getOtherInfos() {
        return otherInfos;
    }

    public void setOtherInfos(List<OtherInfo> otherInfos) {
        this.otherInfos = otherInfos;
    }

}
