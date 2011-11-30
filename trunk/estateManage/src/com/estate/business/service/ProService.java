package com.estate.business.service;

import java.util.List;

import com.estate.domain.TsPro;

/*
 * creator sff
 */
public interface ProService {

	/*
	 *保存和修改项目名
	 */
	public void saveOrUpdatePro(TsPro tsPro);

	/*
	 * 根据id删除项目
	 */
	public void delPro(Long id); 
    
	/*
	 *根据id查询项目
	 */
	public TsPro read(Long id);
	
	/*
	 * 查询所有项目
	 */
	public List<TsPro> findAll();
	
}
