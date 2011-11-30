package com.estate.util.framework;

import java.util.List;

/**
 * 
 * @author fc
 * 
 */
public class PageUtil {

	//总数
	private int totalRecords;

	//对象列表
	private List<?> list;

	//页码
	private int pageNo;

	//每页显示数目
	private int pageSize;

	public int getTotalRecords() {
		return totalRecords;
	}

	/**
	 * 计算出总页数
	 * 
	 * @return
	 */
	public int getTotalPages() {
		return (totalRecords + pageSize - 1) / pageSize;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public List<?> getList() {
		return list;
	}

	public void setList(List<?> list) {
		this.list = list;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	/**
	 * 首页
	 * 
	 * @return
	 */
	public int getTopPageNo() {
		return 1;
	}

	/**
	 * 上一页
	 * 
	 * @return
	 */
	public int getPreviousPageNo() {
		if (pageNo <= 1) {
			return 1;
		}
		return pageNo - 1;
	}

	/**
	 * 下一页
	 * 
	 * @return
	 */
	public int getNextPageNo() {
		if (pageNo >= getTotalPages()) {
			return getTotalPages() == 0 ? 1 : getTotalPages();
		}
		return pageNo + 1;
	}

	/**
	 * 最后页
	 * 
	 * @return
	 */
	public int getBottomPageNo() {
		return getTotalPages() == 0 ? 1 : getTotalPages();
	}
}
