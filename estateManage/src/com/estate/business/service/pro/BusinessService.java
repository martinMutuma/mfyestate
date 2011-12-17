package com.estate.business.service.pro;

import java.util.List;
import java.util.Map;

import com.estate.domain.pro.Business;

/**
 * @Title:办公楼类service
 * @Copyright: Copyright (c) 0.1
 * @author:鲁根成
 * @version: 1.0
 * @time: 2011-5-10
 * 
 */
public interface BusinessService {
	/**
	 * 根据查询条件查询写字楼信息
	 */
	public List<Business> getList(Map<String, String> map);

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

	public Business getById(String id);

	public boolean updateAuditing(Business business);
}
