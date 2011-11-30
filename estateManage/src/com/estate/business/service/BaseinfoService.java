package com.estate.business.service;

import java.util.Map;

import com.estate.domain.TmBaseinfo;


public interface BaseinfoService {

	/**
	 * 保存或修改会员信息
	 * @param tmBaseinfo
	 */
	public void saveOrUpdate(TmBaseinfo baseinfo);

	/**
	 * 根据条件查询所有会员
	 * @return  Map<String,Object>
	 */
	public  Map<String,Object> findAll(TmBaseinfo tmBaseinfo,String page,String row);

	/**
	 * 查询会员信息
	 * @param id
	 * @return TmBaseinfo
	 */
	public TmBaseinfo read(Long id);
	
	/**
	 * 批量删除会员
	 * @param idString
	 * @return
	 */
    public boolean deleteByIdString(String idString);

}
