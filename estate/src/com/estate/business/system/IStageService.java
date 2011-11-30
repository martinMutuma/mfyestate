package com.estate.business.system;

import java.util.List;
import java.util.Map;

import com.estate.util.framework.PageUtil;

public interface IStageService {

	/**
	 * 根据特定条件查询相应表中的数据 map:多条件map集合 pageNo：页号 limit: 每页显示条数 discode: 地区码
	 * searchPro: 查询的项目 lpts: 楼盘中的特色楼盘 keywordValue: 关键字 selectedTab: 中介与非中介
	 * 
	 * @param map
	 * @return
	 */
	public PageUtil findByConditionMap(Map<String, Object> map, int pageNo,
			int limit, String discode, String searchPro, String lpts,
			String keywordValue, String selectedTab);

	/**
	 * 根据主键查找某个具体项目
	 * 
	 * @param pro
	 * @param id
	 * @return
	 */
	public Map<String, Object> findPro(String pro, Long id);

	/**
	 * 查找某个项目的需求列表
	 * 
	 * @return
	 */
	public List<Map<String, Object>> findNeedList(String proIndex, String mid);

	/**
	 * 根据主键查找某个具体需求信息
	 * 
	 * @param id
	 * @return
	 */
	public Map<String, Object> findNeed(String id);

	/**
	 * 根据关键字查询
	 * 
	 * @param keyword :
	 *            关键字
	 * @param proIndex :
	 *            查询的分类0:住宅 1：写字楼 2:商铺 3:经纪人
	 */
	public PageUtil findByKeyWord(String keyword, String proIndex, int pageNo,
			int limit);

	public PageUtil findByPrice(String minValue, String maxValue,
			String searchType, Integer proType, int pageNo, int limit);
}
