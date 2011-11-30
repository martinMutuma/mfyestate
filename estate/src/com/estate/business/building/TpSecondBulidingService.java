package com.estate.business.building;

import java.util.List;
import java.util.Map;

import com.estate.domain.building.TpSecondBuliding;
import com.estate.util.framework.PageUtil;

public interface TpSecondBulidingService {

	/**
	 * 根据主键查询二手房对象
	 * 
	 * @param id
	 * @return
	 */
	public TpSecondBuliding find(Long id);

	/**
	 * 新建二手房对象
	 * 
	 * @param tsb
	 */
	public Long save(TpSecondBuliding tsb);

	/**
	 * 修改二手房对象
	 * 
	 * @param tsb
	 */
	public void update(TpSecondBuliding tsb);

	/**
	 * 保存对象（新增或者修改）
	 * 
	 * @param tsb
	 */
	public void saveOrUpdate(TpSecondBuliding tsb);

	/**
	 * 删除二手房对象
	 * 
	 * @param tsb
	 */
	public void delete(TpSecondBuliding tsb);

	/**
	 * 根据id删除二手房
	 * @param id
	 */
	public void deleteById(Long id);

	/**
	 * 根据id批量删除二手房
	 * @param ids
	 */
	public void deleteByIds(String ids);

	/**
	 * 根据查询条件查找二手房列表信息
	 * @param paramsMap
	 * @param pageNo
	 * @param limit
	 * @return
	 */
	public PageUtil findByParams(Map<String, Object> paramsMap, int pageNo,
			int limit);
	public PageUtil searchByParams(Map<String, Object> paramsMap, int pageNo,
			int limit);
	/**
	 * 查找所有二手房
	 * @param flag
	 * @return
	 */	
	public List<TpSecondBuliding> sbList(int flag);

	/**
	 * 查找某地区下二手房列表
	 * @param pageNo
	 * @param limit
	 * @param discode
	 * @return
	 */
	public PageUtil findSecondBulidList(int pageNo, int limit, String discode);

	/**
	 * 查找权重最大的几条记录
	 * 
	 * @param top
	 * @return
	 */
	public List<TpSecondBuliding> findTopWeight(Integer top, String type);
	
	/**
	 * 查找某地区下二手房租赁列表
	 * @param pageNo
	 * @param limit
	 * @param discode
	 * @return
	 */
	public PageUtil findSecondBulidRentList(Integer integer, Integer integer2,
			String discode);

	public void updateAttentionCount(int id, int attentionNum);

}
