package com.estate.business.service.pro;

import java.util.List;
import java.util.Map;

import com.estate.domain.pro.Shop;

/**
 * @Title:办公楼类service
 * @Copyright: Copyright (c) 0.1
 * @author:鲁根成
 * @version: 1.0
 * @time: 2011-5-10
 * 
 */
public interface ShopService {
	/**
	 * 根据查询条件查询写字楼信息
	 */
	public List<Shop> getList(Map<String, String> map);

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
	 * 根据Id查询 商铺信息
	 */
	public Shop getById(String id);
	
	/**
	 * 保存审核信息，若审核通过+5分
	 * 
	 * @return
	 */
	public boolean updateAuditing(Shop shop);
}
