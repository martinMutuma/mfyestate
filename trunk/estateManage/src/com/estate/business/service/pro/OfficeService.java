package com.estate.business.service.pro;

import java.util.List;
import java.util.Map;

import com.estate.domain.pro.Office;

/**
 * @Title:办公楼类service
 * @Copyright: Copyright (c) 0.1
 * @author:鲁根成
 * @version: 1.0
 * @time: 2011-5-10
 * 
 */
public interface OfficeService {
	/**
	 * 根据查询条件查询写字楼信息
	 */
	public List<Office> getList(Map<String, String> map);

	/**
	 * 
	 * 根据条件查询符合条件的结果集
	 */
	public int getCount(Map<String, String> map);

	/**
	 * 删除写字楼信息
	 */
	public boolean deleteByIdString(String idString);
	/**
	 * 核实写字楼信息
	 */
	public boolean auditByIdString(String idString);

		/**
	 * 根据 id，type（出租/出售）查询 写字楼信息
	 */
	public Office getOfficeById(String id, String type);
	/**
	 * 保存楼盘审核信息
	 * 
	 * @return
	 */
		public boolean updateAuditing(Office obj);
}
