package com.kf.pojo;

import com.kf.vo.TagValue;

/**
 * Created by 18236 on 2017/9/26.
 */
public class JobInfo extends BaseInfo {
    private String pijName;
    private String pijGender;
    private double pijSalary;
    private TagValue tagValue;

    public TagValue getTagValue() {
        return tagValue;
    }

    public void setTagValue(TagValue tagValue) {
        this.tagValue = tagValue;
    }

    public String getPijName() {
        return pijName;
    }

    public void setPijName(String pijName) {
        this.pijName = pijName;
    }

    public String getPijGender() {
        return pijGender;
    }

    public void setPijGender(String pijGender) {
        this.pijGender = pijGender;
    }

    public double getPijSalary() {
        return pijSalary;
    }

    public void setPijSalary(double pijSalary) {
        this.pijSalary = pijSalary;
    }
}
