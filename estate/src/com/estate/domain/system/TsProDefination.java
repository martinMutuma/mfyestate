package com.estate.domain.system;

import com.estate.base.annotation.Table;
import com.estate.base.entity.BaseEntity;

@Table("t_s_pro_defination")
public class TsProDefination extends BaseEntity {
	private Long proId;
	private Long definationId;
	private Integer orderNum;

	public Long getProId() {
		return proId;
	}

	public void setProId(Long proId) {
		this.proId = proId;
	}

	public Long getDefinationId() {
		return definationId;
	}

	public void setDefinationId(Long definationId) {
		this.definationId = definationId;
	}

	public Integer getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(Integer orderNum) {
		this.orderNum = orderNum;
	}

}
