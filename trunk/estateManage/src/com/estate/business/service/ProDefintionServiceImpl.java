package com.estate.business.service;

import java.util.List;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.TsProDefination;

public class ProDefintionServiceImpl implements ProDefintionService {
	private IBaseDao<TsProDefination, Long> dao;
	
	public ProDefintionServiceImpl() {
		dao = new BaseDao<TsProDefination, Long>(TsProDefination.class);
	}

	private final static String FIND_ALL_BY_PROID ="SELECT PD.ID,PD.DEFINATIONID,PD.ORDERNUM FROM T_S_PRO_DEFINATION PD  where PD.PROID = ? ORDER BY PD.ORDERNUM ASC"; 
	
	private final static String DEL_BY_PROID = "DELETE FROM T_S_PRO_DEFINATION WHERE PROID = ?"; 
	
	public void del(Long proId) {
		dao.delete(DEL_BY_PROID, new Object[] {proId});
	}

	public List<TsProDefination> findAll(Long proId) {
		return dao.findList(FIND_ALL_BY_PROID, new Object[] {proId});
	}

	public void save(TsProDefination tsProDefination) {
		dao.saveEntity(tsProDefination);
		
	}



}
