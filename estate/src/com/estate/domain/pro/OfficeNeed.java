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
	private String  num;
	private String district;
	private String disname;
	private String address;
	private String nearAddress;
	private Double minArea;
	private Double maxArea;
	private Double minPrice;
	private Double maxPrice;
	private String title;
	private String rentType;
	private String userName;
	private String phone;
	private String consYearStart;
	private String consYearEnd;
	private String descr;
	private int authorId;
	private String flag;
	private String auditing;
	private Date createTime;
	private  String  category;
	private  String  needType;
	private int views;
	private int attentionNum;
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

	public Double getMinArea() {
		return minArea;
	}

	public void setMinArea(Double minArea) {
		this.minArea = minArea;
	}

	public Double getMaxArea() {
		return maxArea;
	}

	public void setMaxArea(Double maxArea) {
		this.maxArea = maxArea;
	}

	public Double getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(Double minPrice) {
		this.minPrice = minPrice;
	}

	public Double getMaxPrice() {
		return maxPrice;
	}

	public void setMaxPrice(Double maxPrice) {
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

	public String getDisname() {
		return disname;
	}

	public void setDisname(String disname) {
		this.disname = disname;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public int getAttentionNum() {
		return attentionNum;
	}

	public void setAttentionNum(int attentionNum) {
		this.attentionNum = attentionNum;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRentType() {
		return rentType;
	}

	public void setRentType(String rentType) {
		this.rentType = rentType;
	}

	public String getConsYearStart() {
		return consYearStart;
	}

	public void setConsYearStart(String consYearStart) {
		this.consYearStart = consYearStart;
	}

	public String getConsYearEnd() {
		return consYearEnd;
	}

	public void setConsYearEnd(String consYearEnd) {
		this.consYearEnd = consYearEnd;
	}

}
