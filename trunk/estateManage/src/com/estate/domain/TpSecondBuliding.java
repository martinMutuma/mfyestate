package com.estate.domain;

import java.util.Date;

import com.estate.base.annotation.Table;
import com.estate.base.entity.BaseEntity;

@Table("t_p_second_buliding")
public class TpSecondBuliding extends BaseEntity {
	private String num;
	private String district;
	private String disname;
	private String address;
	private String title;
	private String useType;
	private String tip;
	private String respDistrict;
	private String bulidNo;
	private String room;
	private Double price;
	private Double unitPrice;
	private String home;
	private String hall;
	private String bathroom;
	private Integer consArea;
	private String toward;
	private Integer floor;
	private Integer floorCount;
	private String createTime;
	private Integer age;
	private String fitCondition;
	private String furniture;
	private String introduction;
	private String phone;
	private Long authorId;
	private String flag;
	private String sourceUrl;
	private String compressUrl;
	private Integer attentionNum;
	private Integer views;
	private String addressName;
	private String positionX;
	private String positionY;
	private String auditingState;
	private String recommendedWeight;
	private Date createDate;
	private Date updateDate;
	private String slogan;

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getSlogan() {
		return slogan;
	}

	public void setSlogan(String slogan) {
		this.slogan = slogan;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTip() {
		return tip;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}

	public String getRespDistrict() {
		return respDistrict;
	}

	public void setRespDistrict(String respDistrict) {
		this.respDistrict = respDistrict;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public Integer getConsArea() {
		return consArea;
	}

	public void setConsArea(Integer consArea) {
		this.consArea = consArea;
	}

	public String getToward() {
		return toward;
	}

	public void setToward(String toward) {
		this.toward = toward;
	}

	public Integer getFloor() {
		return floor;
	}

	public void setFloor(Integer floor) {
		this.floor = floor;
	}

	public Integer getFloorCount() {
		return floorCount;
	}

	public void setFloorCount(Integer floorCount) {
		this.floorCount = floorCount;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getFitCondition() {
		return fitCondition;
	}
	
	public String getFitConditionValue(){
		if (null != fitCondition)
			switch (new Integer(home)) {
			case 0:
				return "空值";
			case 1:
				return "毛坯";
			case 2:
				return "清水";
			case 3:
				return "简装";
			case 4:
				return "中装";
			case 5:
				return "精装";
			case 6:
				return "豪装";
			default:
				return "未知";
			}
		return "空值";
	}

	public void setFitCondition(String fitCondition) {
		this.fitCondition = fitCondition;
	}

	public String getFurniture() {
		return furniture;
	}

	public void setFurniture(String furniture) {
		this.furniture = furniture;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Long getAuthorId() {
		return authorId;
	}

	public void setAuthorId(Long authorId) {
		this.authorId = authorId;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getCompressUrl() {
		return compressUrl;
	}

	public void setCompressUrl(String compressUrl) {
		this.compressUrl = compressUrl;
	}

	public Integer getAttentionNum() {
		return attentionNum;
	}

	public void setAttentionNum(Integer attentionNum) {
		this.attentionNum = attentionNum;
	}

	public Integer getViews() {
		return views;
	}

	public void setViews(Integer views) {
		this.views = views;
	}

	public String getAddressName() {
		return addressName;
	}

	public void setAddressName(String addressName) {
		this.addressName = addressName;
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

	public String getAuditingState() {
		return auditingState;
	}

	public void setAuditingState(String auditingState) {
		this.auditingState = auditingState;
	}

	public String getRecommendedWeight() {
		return recommendedWeight;
	}

	public void setRecommendedWeight(String recommendedWeight) {
		this.recommendedWeight = recommendedWeight;
	}

	public String getHome() {
		return home;
	}

	public String getHomeValue() {
		if (null != home)
			switch (new Integer(home)) {
			case 1:
				return "1室";
			case 2:
				return "2室";
			case 3:
				return "3室";
			case 4:
				return "4室";
			case 5:
				return "5室";
			case 6:
				return "5室以上";
			default:
				return "未知";
			}
		return "未知";
	}

	public void setHome(String home) {
		this.home = home;
	}

	public String getHall() {
		return hall;
	}

	public void setHall(String hall) {
		this.hall = hall;
	}

	public String getBathroom() {
		return bathroom;
	}

	public void setBathroom(String bathroom) {
		this.bathroom = bathroom;
	}

	public String getBulidNo() {
		return bulidNo;
	}

	public void setBulidNo(String bulidNo) {
		this.bulidNo = bulidNo;
	}

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

	public String getUseType() {
		return useType;
	}

	public String getUseTypeValue() {
		if (null != useType)
			switch (new Integer(useType)) {
			case 1:
				return "住宅";
			case 2:
				return "商住";
			case 3:
				return "商铺";
			case 4:
				return "别墅";
			case 5:
				return "写字楼";
			case 6:
				return "厂房";
			case 7:
				return "仓库";
			case 8:
				return "地皮";
			case 9:
				return "车位";
			case 0:
				return "其他";
			default:
				return "未知";
			}
		return "未知";
	}

	public void setUseType(String useType) {
		this.useType = useType;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getSourceUrl() {
		return sourceUrl;
	}

	public void setSourceUrl(String sourceUrl) {
		this.sourceUrl = sourceUrl;
	}
}
