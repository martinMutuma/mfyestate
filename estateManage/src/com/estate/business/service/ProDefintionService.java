package com.estate.business.service;

import java.util.List;

import com.estate.domain.TsProDefination;

/*
 * creator sff
 */
public interface ProDefintionService {

	/*
	 *保存关系
	 */
	public void save(TsProDefination tsProDefination);

	/*
	 * 根据proId删除项目
	 */
	public void del(Long proId);

	/*
	 * 根据proId查询绑定
	 */
	public List<TsProDefination> findAll(Long proId);

}
