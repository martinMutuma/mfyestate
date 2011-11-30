package com.estate.domain.system;

import java.util.List;

import com.estate.base.annotation.Column;
import com.estate.base.annotation.Table;
import com.estate.base.entity.BaseEntity;
import com.estate.business.system.DictionaryServiceImpl;
import com.estate.business.system.IDictionaryService;

@Table("t_d_defination")
public class TdDefination extends BaseEntity {
	private String name;
	private String code;
	private String searchType;
	private String descr;
	private String category;

	@Column(name = "reject")
	private List<TdData> dataList;

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

	public List<TdData> getDataList() {
		if (null == dataList) {
			IDictionaryService service = new DictionaryServiceImpl();
			List<TdData> list = service.findAllDataByPid(getId());
			return list;
		}
		return dataList;
	}

	public void setDataList(List<TdData> dataList) {
		this.dataList = dataList;
	}
}
