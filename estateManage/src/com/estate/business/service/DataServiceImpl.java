package com.estate.business.service;

import java.util.List;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.TdData;

public class DataServiceImpl implements DataService {

	private IBaseDao<TdData, Long> dao;

	private final static String findAll_SQL = "select * from t_d_data where pid = ?";

	public DataServiceImpl() {
		dao = new BaseDao<TdData, Long>(TdData.class);
	}

	public List<TdData> findAll(String pid) {
		return dao.findList(findAll_SQL, new Object[] { pid });
	}

	public TdData read(long id) {
		return dao.read(id);
	}

	public void saveOrUpdate(TdData data) {
		dao.saveOrUpdate(data);
	}

	public void delete(String ids) {
		if (null != ids && !"".equals(ids)) {
			String[] idAry = ids.split(",");
			for (int i = 0; i < idAry.length; i++) {
				dao.deleteById(new Long(idAry[i]));
			}
		}
	}
}
