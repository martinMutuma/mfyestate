package com.estate.business.pro;

import java.util.List;

import com.estate.domain.pro.SpecialsBean;
import com.estate.domain.pro.TpSpecials;

public interface SpecialsService {
	
	/**
	 * 查找团购/特价
	 * @param count
	 * @return
	 */
	public List<TpSpecials> findActiveSpecials(int count,String type);
	/**
	 * 根据id查询团购信息/特价信息
	 */
	public List<TpSpecials> findbyId(String id);
	/**
	 * 按createtime排序查询前六个用于首页
	 * @param district
	 * @return
	 */
	public List<SpecialsBean> findTop6Specials(String district);
}
