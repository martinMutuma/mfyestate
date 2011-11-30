package com.estate.domain.pro;

/**
 * @Title:商铺类
 * @Copyright: Copyright (c) 0.1
 * @author: lgc
 * @version: 1.0
 * @time: 2011-5-17
 * 
 */
import java.util.Date;

import com.estate.base.annotation.Column;
import com.estate.base.annotation.Table;
import com.estate.base.entity.BaseEntity;

@Table("t_s_shops")
public class Shop extends BaseEntity {
	private String district;
	private String address;
	private String nearAddress;
	private double ugOneFloor;
	private double ugTwoFloor;
	private double firstFloor;
	private double secondFloor;
	private double thirdFloor;
	private double fourceFloor;
	private double fifthFloor;
	private double sixFloor;
	private double sevenFloor;
	private double eightFloor;
	private double ninthFloor;
	private double tenthFloor;
	private String suitIndustry;
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
	@Column(name="Flag")
	private String flag;
	@Column(name="reject")
    private  String   createTimeString;
	@Column(name="reject")
    private  String   audtingString;
	@Column(name="reject")
	private   String   flagString;
	@Column(name="reject")
	private  String  canYin;
	@Column(name="reject")
	private  String  yuLe;
	@Column(name="reject")
	private  String  xiuXian;
	@Column(name="reject")
	private  String  jiuDian;
	@Column(name="reject")
	private  String  linShou;
	@Column(name="reject")
	private  String  qiTa;
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
	public String getCreateTimeString() {
		return createTimeString;
	}
	public void setCreateTimeString(String createTimeString) {
		this.createTimeString = createTimeString;
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
	public double getUgOneFloor() {
		return ugOneFloor;
	}
	public void setUgOneFloor(double ugOneFloor) {
		this.ugOneFloor = ugOneFloor;
	}
	public double getUgTwoFloor() {
		return ugTwoFloor;
	}
	public void setUgTwoFloor(double ugTwoFloor) {
		this.ugTwoFloor = ugTwoFloor;
	}
	public double getFirstFloor() {
		return firstFloor;
	}
	public void setFirstFloor(double firstFloor) {
		this.firstFloor = firstFloor;
	}
	public double getSecondFloor() {
		return secondFloor;
	}
	public void setSecondFloor(double secondFloor) {
		this.secondFloor = secondFloor;
	}
	public double getThirdFloor() {
		return thirdFloor;
	}
	public void setThirdFloor(double thirdFloor) {
		this.thirdFloor = thirdFloor;
	}
	public double getFourceFloor() {
		return fourceFloor;
	}
	public void setFourceFloor(double fourceFloor) {
		this.fourceFloor = fourceFloor;
	}
	public double getFifthFloor() {
		return fifthFloor;
	}
	public void setFifthFloor(double fifthFloor) {
		this.fifthFloor = fifthFloor;
	}
	public double getSixFloor() {
		return sixFloor;
	}
	public void setSixFloor(double sixFloor) {
		this.sixFloor = sixFloor;
	}
	public double getSevenFloor() {
		return sevenFloor;
	}
	public void setSevenFloor(double sevenFloor) {
		this.sevenFloor = sevenFloor;
	}
	public double getEightFloor() {
		return eightFloor;
	}
	public void setEightFloor(double eightFloor) {
		this.eightFloor = eightFloor;
	}
	public double getNinthFloor() {
		return ninthFloor;
	}
	public void setNinthFloor(double ninthFloor) {
		this.ninthFloor = ninthFloor;
	}
	public double getTenthFloor() {
		return tenthFloor;
	}
	public void setTenthFloor(double tenthFloor) {
		this.tenthFloor = tenthFloor;
	}
	public String getSuitIndustry() {
		return suitIndustry;
	}
	public void setSuitIndustry(String suitIndustry) {
		this.suitIndustry = suitIndustry;
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
	public String getCanYin() {
		return canYin;
	}
	public void setCanYin(String canYin) {
		this.canYin = canYin;
	}
	public String getYuLe() {
		return yuLe;
	}
	public void setYuLe(String yuLe) {
		this.yuLe = yuLe;
	}
	public String getXiuXian() {
		return xiuXian;
	}
	public void setXiuXian(String xiuXian) {
		this.xiuXian = xiuXian;
	}
	public String getJiuDian() {
		return jiuDian;
	}
	public void setJiuDian(String jiuDian) {
		this.jiuDian = jiuDian;
	}
	public String getLinShou() {
		return linShou;
	}
	public void setLinShou(String linShou) {
		this.linShou = linShou;
	}
	public String getQiTa() {
		return qiTa;
	}
	public void setQiTa(String qiTa) {
		this.qiTa = qiTa;
	}
}
