package com.estate.business.pro;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.pro.TpNeed;

public class TpNeedServiceImpl implements TpNeedService {
	private IBaseDao<TpNeed, Long> dao;

	public TpNeedServiceImpl() {
		dao = new BaseDao<TpNeed, Long>(TpNeed.class);
	}

	public TpNeed read(Long id) {
		return dao.read(id);
	}

	public Long save(TpNeed tp) {
		return dao.saveEntity(tp);
	}

	public void saveOrUpdate(TpNeed tp) {
		if (tp.getId() == 0)
			dao.saveEntity(tp);
		dao.saveOrUpdate(tp);
	}

}
