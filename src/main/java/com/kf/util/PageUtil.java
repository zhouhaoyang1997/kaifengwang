package com.kf.util;

public class PageUtil {


    /**
     * 总条数
     */
    private Long total;

    /**
     * 总页码
     */
    private Integer pageNums;

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }

    public Integer getPageNums() {
        return pageNums;
    }

    public void setPageNums(Integer pageNums) {
        this.pageNums = pageNums;
    }
}
