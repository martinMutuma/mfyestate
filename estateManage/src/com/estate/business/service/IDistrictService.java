package com.estate.business.service;

import java.util.List;

import com.estate.business.web.action.DTO.TreeData;
import com.estate.domain.TsDistrict;

public interface IDistrictService {

	/**
	 * 根据地区码查找地区列表
	 * 
	 * @param discode
	 * @return
	 */
	public List<TsDistrict> findByDisCode(String discode);

	/**
	 * 根据地区等级查找地区列表
	 * 
	 * @param level
	 * @return
	 */
	public List<TsDistrict> findByLevel(String level);

	/**
	 * 根据地区码及地区等级查找地区列表
	 * 
	 * @param discode
	 * @param level
	 * @return
	 */
	public List<TreeData> findByDisCodeAndLevel(String discode, int level);

	/**
	 * 查找介于自定义等级范围内的地区列表
	 * 
	 * @param startLevel
	 * @param endLevel
	 * @return
	 */
	public List<TsDistrict> findByLevel(String startLevel, String endLevel);

	/**
	 * 查找介于自定义等级范围的某辖区内的地区列表
	 * 
	 * @param discode
	 * @param level
	 * @return
	 */
	public List<TsDistrict> findByDisCodeAndLevel(String discode,
			String startLevel, String endLevel);
}
