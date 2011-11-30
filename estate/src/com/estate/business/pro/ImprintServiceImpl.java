package com.estate.business.pro;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.pro.TpSuggestion;

public class ImprintServiceImpl implements ImprintService {

	private IBaseDao<TpSuggestion, Long> dao;

	public ImprintServiceImpl() {
		dao = new BaseDao<TpSuggestion, Long>(TpSuggestion.class);
	}

	public void saveOrUpdateSuggestion(TpSuggestion tpSuggestion) {
		dao.saveOrUpdate(tpSuggestion);

	}

}
