package com.hd.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.validation.constraints.Min;

/**
 * @Description:
 * @author: zhouhuijie
 * @CreateDate: 2018/3/13 11:59
 */
public class BasePage {

    /**
     * 最大每页数量为1000
     */
    @JsonIgnore
    private final Integer MAX_PAGE_SIZE = 1000;

    /**
     * 默认每页数量为10
     */
    @JsonIgnore
    private final Integer DEFAULT_PAGE_SIZE = 15;


    /**
     * 页码
     */
    @Min(0)
    private Integer page;

    /**
     * 每页数量
     */
    @Min(0)
    private Integer limit;

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = (page-1)*limit;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }
}
