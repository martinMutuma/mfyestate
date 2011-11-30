package com.estate.domain.system;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.estate.base.annotation.Column;
import com.estate.base.annotation.Table;
import com.estate.base.entity.BaseEntity;
import com.estate.business.system.IProDefinationService;
import com.estate.business.system.ProDefinationServiceImpl;
import com.estate.util.CacheUtil;

@Table("t_s_pro")
public class TsPro extends BaseEntity {
	private String name;
	private String descr;
	private Integer orderNum;
	@Column(name = "reject")
	private List<TdDefination> searchList;

	@SuppressWarnings("unchecked")
	public List<TdDefination> getSearchList() {
		if (null == searchList) {
			searchList = new ArrayList<TdDefination>();
			Map<String, Object> map = CacheUtil.getDictionaryMap();
			List<TdDefination> proDefList = (List<TdDefination>) map.get("01");
			IProDefinationService service = new ProDefinationServiceImpl();
			List<TsProDefination> pdList = service.findByProId(getId());
			for (Iterator iterator = proDefList.iterator(); iterator.hasNext();) {
				TdDefination defination = (TdDefination) iterator.next();
				for (Iterator iterator2 = pdList.iterator(); iterator2
						.hasNext();) {
					TsProDefination pd = (TsProDefination) iterator2.next();
					if (defination.getId().equals(pd.getDefinationId())) {
						searchList.add(defination);
					}
				}
			}
		}
		return searchList;
	}

	public void setSearchList(List<TdDefination> searchList) {
		this.searchList = searchList;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public Integer getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(Integer orderNum) {
		this.orderNum = orderNum;
	}

}
