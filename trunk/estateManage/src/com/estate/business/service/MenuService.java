package com.estate.business.service;

import java.util.List;

import com.estate.domain.TsMenu;

public interface MenuService {
	/**
	 * 删除菜单
	 * @param id
	 */
	public void delMenu(Long id);

	/**
	 * 修改或增加菜单
	 * @param menu
	 */
	public void saveOrUpdate(TsMenu menu);

	/**
	 * 查看菜单
	 * @param id
	 * @return TsMenu
	 */
	public TsMenu read(Long id);

	/**
	 * 修改菜单
	 * @return List<TsMenu>
	 */
	public List<TsMenu> findAll();
}
