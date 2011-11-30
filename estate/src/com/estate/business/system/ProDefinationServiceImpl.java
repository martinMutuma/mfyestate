package com.estate.business.system;

import java.util.List;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.system.TsProDefination;

public class ProDefinationServiceImpl implements IProDefinationService {
	private IBaseDao<TsProDefination, Long> dao;

	private final static String FINDBYPROID_SQL = "select * from t_s_pro_defination where proId = ? order by orderNum ";

	public ProDefinationServiceImpl() {
		dao = new BaseDao<TsProDefination, Long>(TsProDefination.class);
	}

	public List<TsProDefination> findByProId(Long id) {
		return dao.findList(FINDBYPROID_SQL, new Object[] { id });
	}

}
