package com.estate.business.system;

import java.util.List;

import com.estate.domain.system.TsPro;

public interface ISearchService {
	
	/**
	 * 查找所有项目
	 * 
	 * @return
	 */
	public List<TsPro> findAllPro();
}
