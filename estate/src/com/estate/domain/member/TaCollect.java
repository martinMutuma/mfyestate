package com.estate.domain.member;

import java.util.Date;

import com.estate.base.annotation.Table;
import com.estate.base.entity.BaseEntity;

/**
 * TaCollect entity.
 * 
 * @author MyEclipse Persistence Tools
 */
@Table("t_a_collect")
public class TaCollect extends BaseEntity {

	private String title;
	private String targetTitle;
	private String targetType;
	private String rentOrsale;
	private double price;
	private String publish;
	private String status;
	private Date publishTime;
	private Date createTime;

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTargetTitle() {
		return this.targetTitle;
	}

	public void setTargetTitle(String targetTitle) {
		this.targetTitle = targetTitle;
	}

	public String getTargetType() {
		return this.targetType;
	}

	public void setTargetType(String targetType) {
		this.targetType = targetType;
	}

	public String getRentOrsale() {
		return this.rentOrsale;
	}

	public void setRentOrsale(String rentOrsale) {
		this.rentOrsale = rentOrsale;
	}

	public double getPrice() {
		return this.price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getPublish() {
		return this.publish;
	}

	public void setPublish(String publish) {
		this.publish = publish;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getPublishTime() {
		return this.publishTime;
	}

	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

}