package com.estate.business.service;

import java.util.List;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.TsPro;

public class ProServiceImpl implements ProService {
	private IBaseDao<TsPro, Long> dao;

	private final static String FIND_ALL_BY_PROID ="SELECT * FROM T_S_PRO ORDER BY ORDERNUM ASC"; 
	
	public ProServiceImpl() {
		dao = new BaseDao<TsPro, Long>(TsPro.class);
	}

	public void saveOrUpdatePro(TsPro tsPro) {
		dao.saveOrUpdate(tsPro);
	}

	public void delPro(Long id) {
		dao.deleteById(id);
	}

	public TsPro read(Long id) {
		return dao.read(id);
	}

	public List<TsPro> findAll() {
		return dao.findList(FIND_ALL_BY_PROID);
	}

}
