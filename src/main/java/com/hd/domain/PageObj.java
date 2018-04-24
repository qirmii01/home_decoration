package com.hd.domain;
/**
 * 分页对象
 */
public class PageObj {
	/**
	 * 数据总数
	 */
	private int dataCount;
	/**
	 * 当前页码
	 */
	private int currentPage = 0;
	/**
	 * 每页数据量
	 */
	private int pageSize;
	
	public int getDataCount() {
		return dataCount;
	}
	public void setDataCount(int dataCount) {
		this.dataCount = dataCount;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
}
