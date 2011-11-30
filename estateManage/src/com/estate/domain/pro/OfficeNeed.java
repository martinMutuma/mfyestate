package com.estate.domain.pro;

import java.util.Date;

import com.estate.base.annotation.Column;
import com.estate.base.annotation.Table;
import com.estate.base.entity.BaseEntity;

/**
 * @Title:需求类
 * @Copyright: Copyright (c) 0.1
 * @author: lgc
 * @version: 1.0
 * @time: 2011-5-12
 * 
 */
@Table("t_p_officeneed")
public class OfficeNeed extends BaseEntity {
	private String district;
	private String address;
	private String nearAddress;
	private double minArea;
	private double maxArea;
	private double minPrice;
	private double maxPrice;
	private String title;
	private String descr;
	private int authorId;
	private String flag;
	private String auditing;
	private Date createTime;
	private  String  category;
	private  String  needType;
	@Column(name="reject")
    private  String   createTimeString;
	@Column(name="reject")
    private  String   priceString;
	@Column(name="reject")
    private  String   flagString;
	@Column(name="reject")
    private  String   audtingString;
	public String getFlagString() {
		return flagString;
	}

	public void setFlagString(String flagString) {
		this.flagString = flagString;
	}

	public String getPriceString() {
		return priceString;
	}

	public void setPriceString(String priceString) {
		this.priceString = priceString;
	}

	public String getCreateTimeString() {
		return createTimeString;
	}

	public void setCreateTimeString(String createTimeString) {
		this.createTimeString = createTimeString;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getNeedType() {
		return needType;
	}

	public void setNeedType(String needType) {
		this.needType = needType;
	}

	public String getAuditing() {
		return auditing;
	}

	public void setAuditing(String auditing) {
		this.auditing = auditing;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getNearAddress() {
		return nearAddress;
	}

	public void setNearAddress(String nearAddress) {
		this.nearAddress = nearAddress;
	}

	public double getMinArea() {
		return minArea;
	}

	public void setMinArea(double minArea) {
		this.minArea = minArea;
	}

	public double getMaxArea() {
		return maxArea;
	}

	public void setMaxArea(double maxArea) {
		this.maxArea = maxArea;
	}

	public double getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(double minPrice) {
		this.minPrice = minPrice;
	}

	public double getMaxPrice() {
		return maxPrice;
	}

	public void setMaxPrice(double maxPrice) {
		this.maxPrice = maxPrice;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public int getAuthorId() {
		return authorId;
	}

	public void setAuthorId(int authorId) {
		this.authorId = authorId;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getAudtingString() {
		return audtingString;
	}

	public void setAudtingString(String audtingString) {
		this.audtingString = audtingString;
	}
}
