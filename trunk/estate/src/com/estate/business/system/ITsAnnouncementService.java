package com.estate.business.system;

import java.util.List;

import com.estate.domain.system.TsAnnouncement;

public interface ITsAnnouncementService {
	/**
	 * 获取有效的公告列表
	 * @return
	 */
	public List<TsAnnouncement> findAnnouncement();
	
	/**
	 * 根据主键获取公告内容
	 * @param id
	 * @return
	 */
	public TsAnnouncement findById(Long id);
}
