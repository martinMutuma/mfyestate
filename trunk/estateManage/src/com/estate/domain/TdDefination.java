package com.estate.domain;

import com.estate.base.annotation.Table;
import com.estate.base.entity.BaseEntity;

@Table("t_d_defination")
public class TdDefination extends BaseEntity {
	private String name;
	private String code;
	private String searchType;
	private String descr;
	private String category;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
}
