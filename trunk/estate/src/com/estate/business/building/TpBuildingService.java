package com.estate.business.building;

import java.util.List;
import java.util.Map;

import com.estate.domain.building.TpBuilding;
import com.estate.util.framework.PageUtil;

public interface TpBuildingService {

	public Long saveEntity(TpBuilding tb);

	public void saveOrUpdate(TpBuilding tmBaseinfo);

	public TpBuilding read(Long id);

	/**展示关注、收藏、浏览的楼盘*/
	public Map<String, Object> showProInfo(Long id, String operateType,
			int start, int limit);

	/**房友最关注的楼盘*/
	public Map<String, Object> showMoreAttentionBuilding(int start, int limit);

	/**最新开盘*/
	public Map<String, Object> showNewBuilding(int start, int limit);

	public List<TpBuilding> getList(Map<String, String> map, String start,
			String limt);

	public int getCount(Map<String, String> map);

	public TpBuilding checkByName(String name);
	public TpBuilding findbyName(String name);

	public boolean deleteById(String id);

	public TpBuilding getById(String id);

	public boolean deleteByIdString(String idString);

	/**楼盘比较*/
	public List<TpBuilding> getCompareBulidings(Long id, String ids);

	/**
	 * 查找最新的6个楼盘
	 * 
	 * @param discode:地区编码
	 * @return
	 */
	public List<TpBuilding> findTop6Bulid(String discode);

	/**
	 * 查找某价格之内的住宅楼盘信息
	 * 
	 * @param ary
	 * @param tipAry
	 * @param type
	 * @return
	 */

	public List<String> findByTypeAndPrice(String[] ary, String[] tipAry,
			String type, String discode);

	/**
	 * 得到房源编号
	 * 
	 * @param discode
	 * @param tableName
	 * @return
	 */
	public String getNum(String discode, String proName, String tableName);

	/**
	 * 查找最新最受关注楼盘列表
	 * @param discode
	 * @return
	 */
	public List<TpBuilding> findFreshBulid(String discode);

	public PageUtil findBulidList(int start, int limit,String discode);

	public List<TpBuilding> findDistrictBulid(long id,String District);

	public List<TpBuilding> findAveragePriceBulid(long id,double averagePrice);

	public void updateAttentionCount(int id, int attentionNum);

	public void updateviews(long pid);

	public void updateShowingsNum(long id);


}