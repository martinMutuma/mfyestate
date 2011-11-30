package com.estate.business.system;

import java.util.List;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.system.TsAnnouncement;

public class TsAnnouncementServiceImpl implements ITsAnnouncementService {
	private IBaseDao<TsAnnouncement, Long> dao;

	public TsAnnouncementServiceImpl() {
		dao = new BaseDao<TsAnnouncement, Long>(TsAnnouncement.class);
	}

	public List<TsAnnouncement> findAnnouncement() {
		String sql = "select * from t_s_announcement t where invalidTime >= now()";
		return dao.findList(sql);
	}
	
	public TsAnnouncement findById(Long id){
		return dao.read(id);
	}

}
