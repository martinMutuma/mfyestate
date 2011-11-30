package com.estate.business.system;

import java.util.List;

import com.estate.domain.system.TsProDefination;

/**
 * 
 * @author FC
 * 
 */
public interface IProDefinationService {

	/**
	 * 根据项目主键查找相应字典集合
	 * 
	 * @param id
	 * @return
	 */
	public List<TsProDefination> findByProId(Long id);
}
