package com.estate.business.system;

import java.util.List;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.system.TdData;
import com.estate.domain.system.TdDefination;

public class DictionaryServiceImpl implements IDictionaryService {

	private IBaseDao<TdDefination, Long> dao;
	private IBaseDao<TdData, Long> dataDao;

	private final static String FINDALLDEFBYCODE_SQL = "select * from t_d_defination where category = ? ";
	private final static String FINDALLDATABYPID_SQL = "select * from t_d_data where pid = ? ";

	public DictionaryServiceImpl() {
		dao = new BaseDao<TdDefination, Long>(TdDefination.class);
		dataDao = new BaseDao<TdData, Long>(TdData.class);
	}

	public List<TdDefination> findAllDefByCode(String code) {
		return dao.findList(FINDALLDEFBYCODE_SQL, new Object[] { code });
	}

	public List<TdData> findAllDataByPid(Long pid) {
		return dataDao.findList(FINDALLDATABYPID_SQL, new Object[] { pid });
	}

}
