package com.estate.domain.member;

import java.util.Date;

import com.estate.base.annotation.Table;
import com.estate.base.entity.BaseEntity;

/**
 * TmProInfo entity.
 * 
 * @author MyEclipse Persistence Tools
 */
@Table("t_m_proinfo")
public class TmProInfo extends BaseEntity{

	// Fields

	private Integer authorId;
	private Integer proId;
	private String proType;
	private String operateType;
	private String remark;
	private Date createTime;


	public Integer getAuthorId() {
		return this.authorId;
	}

	public void setAuthorId(Integer authorId) {
		this.authorId = authorId;
	}

	public Integer getProId() {
		return this.proId;
	}

	public void setProId(Integer proId) {
		this.proId = proId;
	}

	public String getProType() {
		return this.proType;
	}

	public void setProType(String proType) {
		this.proType = proType;
	}

	public String getOperateType() {
		return this.operateType;
	}

	public void setOperateType(String operateType) {
		this.operateType = operateType;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

}