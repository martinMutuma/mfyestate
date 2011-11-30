package com.estate.business.system;

import java.util.List;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.system.TsPro;

public class SearchServiceImpl implements ISearchService {
	private IBaseDao<TsPro, Long> tsproDao;

	public SearchServiceImpl() {
		tsproDao = new BaseDao<TsPro, Long>(TsPro.class);
	}

	public List<TsPro> findAllPro() {
		return tsproDao.findList("select * from t_s_pro order by orderNum");
	}
}
