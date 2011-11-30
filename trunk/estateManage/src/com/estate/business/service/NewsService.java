package com.estate.business.service;

import java.util.Map;

import com.estate.domain.TsNews;
import com.estate.domain.TsNewsFormBean;


public interface NewsService {

	/**
	 * 保存或修改新闻
	 * @param news
	 */
	public void saveOrUpdate(TsNews news);

	/**
	 * 根据条件查询新闻
	 * @return  Map<String,Object>
	 */
	public  Map<String,Object> findAll(TsNewsFormBean news,String page,String row);

	/**
	 * 查询新闻
	 * @param id
	 * @return TmBaseinfo
	 */
	public TsNews read(Long id);
	
	/**
	 * 批量删除新闻
	 * @param idString
	 * @return
	 */
    public boolean deleteByIdString(String idString);

}
