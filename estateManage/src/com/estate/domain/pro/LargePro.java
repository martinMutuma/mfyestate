package com.estate.domain.pro;

/**
 * @Title:大型项目类
 * @Copyright: Copyright (c) 0.1
 * @author:lgc
 * @version: 1.0
 * @time: 2011-5-20
 * 
 */
import java.util.Date;

import com.estate.base.annotation.Column;
import com.estate.base.annotation.Table;
import com.estate.base.entity.BaseEntity;

@Table("t_p_largepro")
public class LargePro extends BaseEntity {
	private  String  num;
	private String district;
	private  String  disname;
	private String address;
	private double price;
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
	@Column(name="reject")
    private  String   createTimeString;
	@Column(name="reject")
    private  String   audtingString;
	@Column(name="reject")
	private  String  paywayString;

	private String nearAddress;
	private String flag;
	private Double area;
	private Double areauseful;
	private int views;
	private int attentionnum;
	private String compressUrl;
	
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

	public String getPaywayString() {
		return paywayString;
	}

	public void setPaywayString(String paywayString) {
		this.paywayString = paywayString;
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

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
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

	public String getNearAddress() {
		return nearAddress;
	}

	public void setNearAddress(String nearAddress) {
		this.nearAddress = nearAddress;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public Double getArea() {
		return area;
	}

	public void setArea(Double area) {
		this.area = area;
	}

	public Double getAreauseful() {
		return areauseful;
	}

	public void setAreauseful(Double areauseful) {
		this.areauseful = areauseful;
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

	public String getCompressUrl() {
		return compressUrl;
	}

	public void setCompressUrl(String compressUrl) {
		this.compressUrl = compressUrl;
	}
}
