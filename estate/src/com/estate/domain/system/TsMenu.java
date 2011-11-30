package com.estate.domain.system;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.estate.base.annotation.Table;
import com.estate.base.entity.BaseEntity;

@Table("t_s_menu")
public class TsMenu extends BaseEntity {

	private String name;

	private String url;

	private String tip;

	private String descr;

	private String orderNum;

	private String allowGroups;

	private List<TsMenu> children;

	private Map<String, String> categoryMap;

	public Map<String, String> getCategoryMap() {
		return categoryMap;
	}

	public void setCategoryMap(Map<String, String> categoryMap) {
		this.categoryMap = categoryMap;
	}

	public List<TsMenu> getChildren() {
		return children;
	}

	public void setChildren(List<TsMenu> children) {
		this.children = children;
	}

	public String getAllowGroups() {
		return allowGroups;
	}

	public void setAllowGroups(String allowGroups) {
		this.allowGroups = allowGroups;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getTip() {
		return tip;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public String getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}

	public List<TsMenu> bulidMenuByUserLevel(String level) {
		return bulidChildrenMenu(getChildren(), level);
	}

	@SuppressWarnings("unchecked")
	private List<TsMenu> bulidChildrenMenu(List<TsMenu> menuList, String level) {
		if (null != menuList) {
			for (Iterator iterator = menuList.iterator(); iterator.hasNext();) {
				TsMenu menu = (TsMenu) iterator.next();
				if (null != menu.getAllowGroups()
						&& !"".equals(menu.getAllowGroups())) {
					if (menu.getAllowGroups().indexOf(level) == -1
							&& !"all".equals(menu.getAllowGroups())
							&& !"anyone".equals(menu.getAllowGroups())) {
						iterator.remove();
						menuList.remove(menu);
					}
				}
				menu.setChildren(bulidChildrenMenu(menu.getChildren(), level));
			}
		}
		return menuList;
	}

}
