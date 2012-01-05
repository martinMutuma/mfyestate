package com.estate.domain.pro;

/**
 * @Title:工业地产类
 * @Copyright: Copyright (c) 0.1
 * @author:鲁根成
 * @version: 1.0
 * @time: 2011-5-20
 * 
 */
import java.util.Date;

import com.estate.base.annotation.Column;
import com.estate.base.annotation.Table;
import com.estate.base.entity.BaseEntity;

@Table("t_p_industry")
public class Industry extends BaseEntity {
	private String district;
	private String address;
	private double constructionArea;
	private double area;
	private double spaceArea;
	private double far;
	private double greenRate;
	private String industry;
	private String category;
	private String type;
	private String floorHeight;
	private String car;
	private String structure;
	private String bear;
	private double power;
	private double water;
	private String communicate;
	private String isSingle;
	private String facilities;
	private double propertyManagement;
	private double bursary;
	private String title;
	private String content;
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
	private String addressName;
	private int authorId;
	private Date createTime;
	private String auditingState;
	@Column(name = "Flag")
	private String flag;
	@Column(name = "reject")
	private String createTimeString;
	@Column(name = "reject")
	private String audtingString;
	@Column(name = "reject")
	private String flagString;
	
	private String  num;
	private String  disname;
	private String compressUrl;
    private int  views;
    private  int attentionnum;

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

	public double getConstructionArea() {
		return constructionArea;
	}

	public void setConstructionArea(double constructionArea) {
		this.constructionArea = constructionArea;
	}

	public double getArea() {
		return area;
	}

	public void setArea(double area) {
		this.area = area;
	}

	public double getSpaceArea() {
		return spaceArea;
	}

	public void setSpaceArea(double spaceArea) {
		this.spaceArea = spaceArea;
	}

	public double getFar() {
		return far;
	}

	public void setFar(double far) {
		this.far = far;
	}

	public double getGreenRate() {
		return greenRate;
	}

	public void setGreenRate(double greenRate) {
		this.greenRate = greenRate;
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getFloorHeight() {
		return floorHeight;
	}

	public void setFloorHeight(String floorHeight) {
		this.floorHeight = floorHeight;
	}

	public String getCar() {
		return car;
	}

	public void setCar(String car) {
		this.car = car;
	}

	public String getStructure() {
		return structure;
	}

	public void setStructure(String structure) {
		this.structure = structure;
	}

	public String getBear() {
		return bear;
	}

	public void setBear(String bear) {
		this.bear = bear;
	}

	public double getPower() {
		return power;
	}

	public void setPower(double power) {
		this.power = power;
	}

	public double getWater() {
		return water;
	}

	public void setWater(double water) {
		this.water = water;
	}

	public String getCommunicate() {
		return communicate;
	}

	public void setCommunicate(String communicate) {
		this.communicate = communicate;
	}

	public String getIsSingle() {
		return isSingle;
	}

	public void setIsSingle(String isSingle) {
		this.isSingle = isSingle;
	}

	public String getFacilities() {
		return facilities;
	}

	public void setFacilities(String facilities) {
		this.facilities = facilities;
	}

	public double getPropertyManagement() {
		return propertyManagement;
	}

	public void setPropertyManagement(double propertyManagement) {
		this.propertyManagement = propertyManagement;
	}

	public double getBursary() {
		return bursary;
	}

	public void setBursary(double bursary) {
		this.bursary = bursary;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public String getAddressName() {
		return addressName;
	}

	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}

	public int getAuthorId() {
		return authorId;
	}

	public void setAuthorId(int authorId) {
		this.authorId = authorId;
	}

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

	public String getCreateTimeString() {
		return createTimeString;
	}

	public void setCreateTimeString(String createTimeString) {
		this.createTimeString = createTimeString;
	}

	public String getAudtingString() {
		return audtingString;
	}

	public void setAudtingString(String audtingString) {
		this.audtingString = audtingString;
	}

	public String getFlagString() {
		return flagString;
	}

	public void setFlagString(String flagString) {
		this.flagString = flagString;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getDisname() {
		return disname;
	}

	public void setDisname(String disname) {
		this.disname = disname;
	}

	public String getCompressUrl() {
		return compressUrl;
	}

	public void setCompressUrl(String compressUrl) {
		this.compressUrl = compressUrl;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public int getAttentionnum() {
		return attentionnum;
	}

	public void setAttentionnum(int attentionnum) {
		this.attentionnum = attentionnum;
	}

}
