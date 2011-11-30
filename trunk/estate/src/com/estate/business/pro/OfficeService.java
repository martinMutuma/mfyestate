package com.estate.business.pro;

import java.util.List;
import java.util.Map;

import com.estate.domain.pro.Office;
import com.estate.util.framework.PageUtil;

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
	 * 发布写字楼出租或出售信息
	 * 
	 * @param office
	 * @return
	 */
	public boolean addOfficeRent(Office office);

	/**
	 * 根据查询条件查询写字楼信息
	 */
	public List<Office> getList(Map<String, String> map, String start,
			String limt);

	/**
	 * 
	 * 根据条件查询符合条件的结果集
	 */
	public int getCount(Map<String, String> map);

	/**
	 * 根据id删除写字楼信息
	 */
	public boolean deleteById(String id, String type);

	/**
	 * 删除写字楼信息
	 */
	public boolean deleteByIdString(String idString, String type);

	/**
	 * 根据 id，type（出租/出售）查询 写字楼信息
	 */
	public Office getOfficeById(String id, String type);
	
	/**
	 * 根据 id查询 写字楼信息
	 */
	public Office read(Long id);

	/**
	 * 根据 id 、图片url删除图片
	 */
	public boolean delPic(String id, String urlname);

	/**
	 * 修改后新增图片
	 */
	public boolean updateModPic(Map<String, String> map, int j);

	/**
	 * 通过id查询图片名字
	 */
	public String getImageName(String id, int j);

	/**
	 * 首页最新写字楼信息
	 * 
	 * @return
	 */
	public List<Office> findFreshOffice(String discode);

	/**
	 * 查找某价格之内的写字楼信息
	 * 
	 * @param ary
	 * @param tipAry
	 * @param type
	 * @return
	 */
	public List<String> findByTypeAndPrice(String[] ary, String[] tipAry,
			String discode);

	public PageUtil findOfficeList(Map<String, String> map, String start,
			String limit);

	public List<Office> findFreshBulid();

	/**
	 * 查找所有写字楼信息，按照时间排序（倒序）
	 */
	public PageUtil findAllOffice(String type, int pageNo, int limit,
			Long authorId);
}
