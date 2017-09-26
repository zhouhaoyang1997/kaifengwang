package com.kf.pojo;

/**
 * Created by 18236 on 2017/9/25.
 */
public class SecondClass {
    private int scId;
    private String scName;
    private String mcName;
    private int scMcId;

    public int getScId() {
        return scId;
    }

    public void setScId(int scId) {
        this.scId = scId;
    }

    public String getScName() {
        return scName;
    }

    public void setScName(String scName) {
        this.scName = scName;
    }

    public String getMcName() {
        return mcName;
    }

    public void setMcName(String mcName) {
        this.mcName = mcName;
    }

    public int getScMcId() {
        return scMcId;
    }

    public void setScMcId(int scMcId) {
        this.scMcId = scMcId;
    }

    public int getScClickNums() {
        return scClickNums;
    }

    public void setScClickNums(int scClickNums) {
        this.scClickNums = scClickNums;
    }

    private int scClickNums;
}
