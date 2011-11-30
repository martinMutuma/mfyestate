package com.estate.business.service;

import java.util.List;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.TsAnnouncement;
import com.estate.util.framework.PageUtil;

public class TsAnnouncementServiceImpl implements ITsAnnouncementService {
	private IBaseDao<TsAnnouncement, Long> dao;

	public TsAnnouncementServiceImpl() {
		dao = new BaseDao<TsAnnouncement, Long>(TsAnnouncement.class);
	}

	public List<TsAnnouncement> findAnnouncement() {
		String sql = "select * from t_s_announcement t where t.invalidTime >= now()";
		return dao.findList(sql);
	}

	public TsAnnouncement findById(Long id) {
		return dao.read(id);
	}

	public PageUtil findAllAnnouncement(int pageno, int limit) {
		PageUtil pu = new PageUtil();
		String sql = "select * from t_s_announcement t where t.invalidTime >= now()";
		sql = dao.createSqlQuery(sql).setFirstResult((pageno - 1) * limit)
				.setMaxSize(limit).bulidSql();
		String countSql = "select count(*) from t_s_announcement t where t.invalidTime >= now()";
		List<Object[]> countList = dao.findObjectArryList(countSql);
		if (null != countList && countList.size() > 0) {
			Object[] obj = countList.get(0);
			pu.setTotalRecords(new Integer(null == obj[0] ? "0" : obj[0]
					.toString()));
		}
		List<TsAnnouncement> list = dao.findList(sql);
		pu.setList(list);
		pu.setPageNo(pageno);
		pu.setPageSize(limit);
		return pu;
	}

	public void save(TsAnnouncement announcement) {
		if (null != announcement.getId())
			dao.update(announcement);
		else
			dao.saveEntity(announcement);
	}

	public void deleteById(Long id) {
		dao.deleteById(id);
	}

}
