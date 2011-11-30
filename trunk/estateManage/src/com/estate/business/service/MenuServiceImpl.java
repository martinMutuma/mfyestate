package com.estate.business.service;

import java.util.List;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.TsMenu;

public class MenuServiceImpl implements MenuService {

	private IBaseDao<TsMenu, Long> dao;

	private final static String FIND_ALL_BY_PROID ="SELECT * FROM T_S_MENU ORDER BY ORDERNUM ASC";
	
	public MenuServiceImpl() {
		dao = new BaseDao<TsMenu, Long>(TsMenu.class);
	}

	public void delMenu(Long id) {
		dao.deleteById(id);
	}

	public TsMenu read(Long id) {
		return dao.read(id);
	}

	public void saveOrUpdate(TsMenu menu) {
		dao.saveOrUpdate(menu);
	}

	public List<TsMenu> findAll() {
		return dao.findList(FIND_ALL_BY_PROID);
	}

}
