package com.estate.domain.pro;

import java.util.Date;

import com.estate.base.annotation.Column;
import com.estate.base.annotation.Table;
import com.estate.base.entity.BaseEntity;

/**
 * @Title:楼盘类
 * @Copyright: Copyright (c) 0.1
 * @author:鲁根成
 * @version: 1.0
 * @time: 2011-5-11
 * 
 */
@Table("t_p_estate")
public class Floor extends BaseEntity {
	private String name;
	private String pinyin;
	private String address;
	private String district;
	private String disname;
	private String propertyCompany;
	private String propertyDevelopers;
	private double packingRent;
	private int packingCount;
	private double propertyFees;
	private String propertyLevel;
	private int customElevator;
	private int fireElevator;
	private double totalArea;
	private double standardArea;
	private int floorCount;
	private int groundFloor;
	private int undergroundFloor;
	private String traffic;
	private String propertyDesc;
	private String imgName1;
	private String imgType1;
	private String imgUrl1;
	private String imgName2;
	private String imgType2;
	private String imgUrl2;
	private String imgName3;
	private String imgType3;
	private String imgUrl3;
	private String imgName4;
	private String imgType4;
	private String imgUrl4;
	private String imgName5;
	private String imgType5;
	private String imgUrl5;
	private String positionX;
	private String positionY;
	private int authorId;
	private Date  createTime;
	private String auditingState;
	@Column(name = "Flag")
	private  String  flag;
	private int attentionNum;
	private int  views;

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getAuditingState() {
		return auditingState;
	}

	public void setAuditingState(String auditingState) {
		this.auditingState = auditingState;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public int getAttentionNum() {
		return attentionNum;
	}

	public void setAttentionNum(int attentionNum) {
		this.attentionNum = attentionNum;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPinyin() {
		return pinyin;
	}

	public void setPinyin(String pinyin) {
		this.pinyin = pinyin;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getPropertyCompany() {
		return propertyCompany;
	}

	public void setPropertyCompany(String propertyCompany) {
		this.propertyCompany = propertyCompany;
	}

	public String getPropertyDevelopers() {
		return propertyDevelopers;
	}

	public void setPropertyDevelopers(String propertyDevelopers) {
		this.propertyDevelopers = propertyDevelopers;
	}

	public double getPackingRent() {
		return packingRent;
	}

	public void setPackingRent(double packingRent) {
		this.packingRent = packingRent;
	}

	public int getPackingCount() {
		return packingCount;
	}

	public void setPackingCount(int packingCount) {
		this.packingCount = packingCount;
	}

	public double getPropertyFees() {
		return propertyFees;
	}

	public void setPropertyFees(double propertyFees) {
		this.propertyFees = propertyFees;
	}

	public String getPropertyLevel() {
		return propertyLevel;
	}

	public void setPropertyLevel(String propertyLevel) {
		this.propertyLevel = propertyLevel;
	}

	public int getCustomElevator() {
		return customElevator;
	}

	public void setCustomElevator(int customElevator) {
		this.customElevator = customElevator;
	}

	public int getFireElevator() {
		return fireElevator;
	}

	public void setFireElevator(int fireElevator) {
		this.fireElevator = fireElevator;
	}

	public double getTotalArea() {
		return totalArea;
	}

	public void setTotalArea(double totalArea) {
		this.totalArea = totalArea;
	}

	public double getStandardArea() {
		return standardArea;
	}

	public void setStandardArea(double standardArea) {
		this.standardArea = standardArea;
	}

	public int getFloorCount() {
		return floorCount;
	}

	public void setFloorCount(int floorCount) {
		this.floorCount = floorCount;
	}

	public int getGroundFloor() {
		return groundFloor;
	}

	public void setGroundFloor(int groundFloor) {
		this.groundFloor = groundFloor;
	}

	public int getUndergroundFloor() {
		return undergroundFloor;
	}

	public void setUndergroundFloor(int undergroundFloor) {
		this.undergroundFloor = undergroundFloor;
	}

	public String getTraffic() {
		return traffic;
	}

	public void setTraffic(String traffic) {
		this.traffic = traffic;
	}

	public String getPropertyDesc() {
		return propertyDesc;
	}

	public void setPropertyDesc(String propertyDesc) {
		this.propertyDesc = propertyDesc;
	}

	public String getImgName1() {
		return imgName1;
	}

	public void setImgName1(String imgName1) {
		this.imgName1 = imgName1;
	}

	public String getImgType1() {
		return imgType1;
	}

	public void setImgType1(String imgType1) {
		this.imgType1 = imgType1;
	}

	public String getImgUrl1() {
		return imgUrl1;
	}

	public void setImgUrl1(String imgUrl1) {
		this.imgUrl1 = imgUrl1;
	}

	public String getImgName2() {
		return imgName2;
	}

	public void setImgName2(String imgName2) {
		this.imgName2 = imgName2;
	}

	public String getImgType2() {
		return imgType2;
	}

	public void setImgType2(String imgType2) {
		this.imgType2 = imgType2;
	}

	public String getImgUrl2() {
		return imgUrl2;
	}

	public void setImgUrl2(String imgUrl2) {
		this.imgUrl2 = imgUrl2;
	}

	public String getImgName3() {
		return imgName3;
	}

	public void setImgName3(String imgName3) {
		this.imgName3 = imgName3;
	}

	public String getImgType3() {
		return imgType3;
	}

	public void setImgType3(String imgType3) {
		this.imgType3 = imgType3;
	}

	public String getImgUrl3() {
		return imgUrl3;
	}

	public void setImgUrl3(String imgUrl3) {
		this.imgUrl3 = imgUrl3;
	}

	public String getImgName4() {
		return imgName4;
	}

	public void setImgName4(String imgName4) {
		this.imgName4 = imgName4;
	}

	public String getImgType4() {
		return imgType4;
	}

	public void setImgType4(String imgType4) {
		this.imgType4 = imgType4;
	}

	public String getImgUrl4() {
		return imgUrl4;
	}

	public void setImgUrl4(String imgUrl4) {
		this.imgUrl4 = imgUrl4;
	}

	public String getImgName5() {
		return imgName5;
	}

	public void setImgName5(String imgName5) {
		this.imgName5 = imgName5;
	}

	public String getImgType5() {
		return imgType5;
	}

	public void setImgType5(String imgType5) {
		this.imgType5 = imgType5;
	}

	public String getImgUrl5() {
		return imgUrl5;
	}

	public void setImgUrl5(String imgUrl5) {
		this.imgUrl5 = imgUrl5;
	}

	public String getPositionX() {
		return positionX;
	}

	public void setPositionX(String positionX) {
		this.positionX = positionX;
	}

	public String getPositionY() {
		return positionY;
	}

	public void setPositionY(String positionY) {
		this.positionY = positionY;
	}

	public int getAuthorId() {
		return authorId;
	}

	public void setAuthorId(int authorId) {
		this.authorId = authorId;
	}

	public String getDisname() {
		return disname;
	}

	public void setDisname(String disname) {
		this.disname = disname;
	}
}
