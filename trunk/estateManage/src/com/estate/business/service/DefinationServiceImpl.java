package com.estate.business.service;

import java.util.List;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.TdDefination;

public class DefinationServiceImpl implements DefinationService {
	private IBaseDao<TdDefination, Long> dao;

	public DefinationServiceImpl() {
		dao = new BaseDao<TdDefination, Long>(TdDefination.class);
	}

	public void saveOrUpdate(TdDefination defination) {
		dao.saveOrUpdate(defination);
	}

	public TdDefination read(Long id) {
		return dao.read(id);
	}

	public List<TdDefination> findAll() {
		return dao.findAll();
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
