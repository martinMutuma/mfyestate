package com.estate.business.service.pro;

import java.util.List;
import java.util.Map;

import com.estate.domain.TpImage;
import com.estate.domain.TpSecondBuliding;
import com.estate.domain.TpSpecials;
import com.estate.domain.pro.TpBuilding;
import com.estate.util.framework.PageUtil;

public interface TpSpecialsService {

	/**
	 * 根据查询条件查找团购/特价列表信息
	 * 
	 * @param paramsMap
	 * @param pageNo
	 * @param limit
	 * @return
	 */
	public PageUtil findSpecialsByParams(Map<String, Object> paramsMap,
			int pageNo, int limit, String type);

	/**
	 * 根据主键查找团购/特价信息
	 * 
	 * @param id
	 * @return
	 */
	public TpSpecials findById(long id);

	/**
	 * 根据查询条件查找二手房列表信息
	 * 
	 * @param paramsMap
	 * @param pageNo
	 * @param limit
	 * @return
	 */
	public PageUtil findByParams(Map<String, Object> paramsMap, int pageNo,
			int limit);

	/**
	 * 根据查询条件查找楼盘列表信息
	 * 
	 * @param paramsMap
	 * @param pageNo
	 * @param limit
	 * @return
	 */
	public PageUtil findBulidingByParams(Map<String, Object> paramsMap,
			int pageNo, int limit);

	/**
	 * 查找楼盘详细信息
	 * 
	 * @param id
	 * @return
	 */
	public TpSecondBuliding readSecondBuliding(Long id);

	/**
	 * 保存特价房/团购
	 * 
	 * @param special
	 */
	public void saveSpecial(TpSpecials special);

	/**
	 * 查找图片
	 * 
	 * @param id
	 * @return
	 */
	public List<TpImage> findBySecondBulidId(Long id);

	/**
	 * 删除团购/特价信息
	 * 
	 * @param id
	 */
	public void deleteById(Long id);

	/**
	 * 根据主键查找楼盘
	 * 
	 * @param id
	 * @return
	 */
	public TpBuilding findBulidingById(Long id);

	/**
	 * 修改团购/特价信息
	 * 
	 * @param specials
	 */
	public void modifySpecials(TpSpecials specials);

	/**
	 * 根据楼盘id查找图片
	 * 
	 * @param id
	 * @return
	 */
	public List<TpImage> findByProId(Long id);
}
