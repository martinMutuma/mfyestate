package com.estate.domain;

import com.estate.base.annotation.Table;
import com.estate.base.entity.BaseEntity;

@Table("t_s_menu")
public class TsMenu extends BaseEntity {

	private String name;

	private String url;

	private String tip;

	private String descr;

	private String orderNum;

	private Byte mainMenu;

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

	public Byte getMainMenu() {
		return mainMenu;
	}

	public void setMainMenu(Byte mainMenu) {
		this.mainMenu = mainMenu;
	}

}
