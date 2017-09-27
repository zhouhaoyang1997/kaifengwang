package com.kf.pojo;

import java.util.List;
/**
 * Created by 18236 on 2017/9/26.
 */
public class Tag {
    private List<TagContent> tagContents;

    private String tagName;
    private int tagId;
    public String getTagName() {
        return tagName;
    }

    public void setTagName(String tagName) {
        this.tagName = tagName;
    }


    public List<TagContent> getTagContents() {
        return tagContents;
    }

    public void setTagContents(List<TagContent> tagContents) {
        this.tagContents = tagContents;
    }

    public int getTagId() {
        return tagId;
    }

    public void setTagId(int tagId) {
        this.tagId = tagId;
    }
}
