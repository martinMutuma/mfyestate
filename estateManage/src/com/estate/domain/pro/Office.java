package com.estate.domain.pro;

/**
 * @Title:�写字楼类
 * @Copyright: Copyright (c) 0.1
 * @author: lgc
 * @version: 1.0
 * @time: 2011-5-10
 * 
 */
import java.util.Date;

import com.estate.base.annotation.Column;
import com.estate.base.annotation.Table;
import com.estate.base.entity.BaseEntity;

@Table("t_p_office")
public class Office extends BaseEntity {
	private String num;
	private String category;
	private String name;
	private String address;
	private double propertyManagement;
	private String floorType;
	private double price;
	private double area;
	private double successPre;
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
	private int authorId;
	private String flag;
	private Date createTime;
	private String auditingState;
	@Column(name = "reject")
	private String createTimeString;
	@Column(name = "reject")
	private String audtingString;
	@Column(name = "reject")
	private String flagString;

	private String district;
	private String disname;
	private String compressUrl;
	private String attentionNum;
	private String views;
	// 新增字段 F.C
	private String floorCategory;
	private Integer subFloor;
	private Integer floor2;
	private Integer totalFloor;
	private Double areauseful;
	private String consYear;
	private String mright;
	private String fitment;
	private String forward;
	private String cbd;
	private String rentType;
	private Date enterDate;
	private String officeCost;
	private String baseService;
	private String equipment;
	private String traffic;
	private String payInfo;

	public String getFlagString() {
		return flagString;
	}

	public void setFlagString(String flagString) {
		this.flagString = flagString;
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

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public double getPropertyManagement() {
		return propertyManagement;
	}

	public void setPropertyManagement(double propertyManagement) {
		this.propertyManagement = propertyManagement;
	}

	public String getFloorType() {
		return floorType;
	}

	public void setFloorType(String floorType) {
		this.floorType = floorType;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getArea() {
		return area;
	}

	public void setArea(double area) {
		this.area = area;
	}

	public double getSuccessPre() {
		return successPre;
	}

	public void setSuccessPre(double successPre) {
		this.successPre = successPre;
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

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
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

	public String getAttentionNum() {
		return attentionNum;
	}

	public void setAttentionNum(String attentionNum) {
		this.attentionNum = attentionNum;
	}

	public String getViews() {
		return views;
	}

	public void setViews(String views) {
		this.views = views;
	}

	public String getFloorCategory() {
		return floorCategory;
	}

	public void setFloorCategory(String floorCategory) {
		this.floorCategory = floorCategory;
	}

	public Integer getSubFloor() {
		return subFloor;
	}

	public void setSubFloor(Integer subFloor) {
		this.subFloor = subFloor;
	}

	public Integer getFloor2() {
		return floor2;
	}

	public void setFloor2(Integer floor2) {
		this.floor2 = floor2;
	}

	public Integer getTotalFloor() {
		return totalFloor;
	}

	public void setTotalFloor(Integer totalFloor) {
		this.totalFloor = totalFloor;
	}

	public Double getAreauseful() {
		return areauseful;
	}

	public void setAreauseful(Double areauseful) {
		this.areauseful = areauseful;
	}

	public String getConsYear() {
		return consYear;
	}

	public void setConsYear(String consYear) {
		this.consYear = consYear;
	}

	public String getMright() {
		return mright;
	}

	public void setMright(String mright) {
		this.mright = mright;
	}

	public String getFitment() {
		return fitment;
	}

	public void setFitment(String fitment) {
		this.fitment = fitment;
	}

	public String getForward() {
		return forward;
	}

	public void setForward(String forward) {
		this.forward = forward;
	}

	public String getCbd() {
		return cbd;
	}

	public void setCbd(String cbd) {
		this.cbd = cbd;
	}

	public String getRentType() {
		return rentType;
	}

	public void setRentType(String rentType) {
		this.rentType = rentType;
	}

	public Date getEnterDate() {
		return enterDate;
	}

	public void setEnterDate(Date enterDate) {
		this.enterDate = enterDate;
	}

	public String getOfficeCost() {
		return officeCost;
	}

	public void setOfficeCost(String officeCost) {
		this.officeCost = officeCost;
	}

	public String getBaseService() {
		return baseService;
	}

	public void setBaseService(String baseService) {
		this.baseService = baseService;
	}

	public String getEquipment() {
		return equipment;
	}

	public void setEquipment(String equipment) {
		this.equipment = equipment;
	}

	public String getTraffic() {
		return traffic;
	}

	public void setTraffic(String traffic) {
		this.traffic = traffic;
	}

	public String getPayInfo() {
		return payInfo;
	}

	public void setPayInfo(String payInfo) {
		this.payInfo = payInfo;
	}
}
