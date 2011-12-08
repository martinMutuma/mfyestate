package com.estate.web.action;

import java.util.List;

import com.estate.base.web.BaseAction;
import com.estate.business.service.MenuService;
import com.estate.business.service.MenuServiceImpl;
import com.estate.domain.TsMenu;
import com.estate.util.comm.RequestUtil;

public class MenuAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	private TsMenu menu;

	private List<TsMenu> menuList;

	private int flag;

	private MenuService service;

	public MenuAction() {
		service = new MenuServiceImpl();
	}

	/*
	 * 转向管理页面
	 */
	public String toMenuManage() {
		try {
			menuList = service.findAll();
		} catch (Exception e) {
			log.error("查询所有信息出错", e);
		}
		return "menuManage";
	}

	/*
	 * 跳转信息页面
	 */
	public String toMenuInfo() {
		try {
			long id = RequestUtil.getParam(request, "id", 0l);
			if (!"".equals(id)) {
				menu = service.read(id);
			}
		} catch (Exception e) {
			log.error("查询单个信息出错", e);
		}
		return "toMenuInfo";
	}

	public String saveOrUpdate() {
		try {
			service.saveOrUpdate(menu);
		} catch (Exception e) {
			log.error("保存或修改信息出错", e);
		}
		return "toMenuManage";
	}

	public String delMenu() {
		try {
			long id = RequestUtil.getParam(request, "id", 0l);
			service.delMenu(id);
		} catch (Exception e) {
			log.error("删除项目出错", e);
		}
		return "toMenuManage";
	}

	public TsMenu getMenu() {
		return menu;
	}

	public void setMenu(TsMenu menu) {
		this.menu = menu;
	}

	public List<TsMenu> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<TsMenu> menuList) {
		this.menuList = menuList;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

}
