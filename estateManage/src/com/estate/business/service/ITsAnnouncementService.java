package com.estate.business.service;

import java.util.List;

import com.estate.domain.TsAnnouncement;
import com.estate.util.framework.PageUtil;

public interface ITsAnnouncementService {

	/**
	 * 查找所有有效的公告信息列表
	 * 
	 * @return
	 */
	public List<TsAnnouncement> findAnnouncement();

	/**
	 * 查找所有公告信息分页
	 * 
	 * @return
	 */
	public PageUtil findAllAnnouncement(int pageno,int limit);
	
	/**
	 * 根据Id查找具体公告内容
	 * @param id
	 * @return
	 */
	public TsAnnouncement findById(Long id);
	
	/**
	 * 保存公告对象
	 * @param announcement
	 */
	public void save(TsAnnouncement announcement);
	
	/**
	 * 通过主键删除对象
	 * @param id
	 */
	public void deleteById(Long id);
}
