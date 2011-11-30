package com.estate.domain;

import java.util.Date;

import com.estate.base.annotation.Table;
import com.estate.base.entity.BaseEntity;

@Table("T_P_SPECIALS")
public class TpSpecials extends BaseEntity {
	private String descr;
	private Date startTime;
	private Date endTime;
	private String specialsMes;
	private String line;
	private String imgOne;
	private Integer joinCount;
	private String imgTwo;
	private String imgThree;
	private String imgFour;
	private String bulidDesc;
	private Double avgPrice;
	private Double minPrice;
	private String specials;
	private String information;
	private String flag;
	private Long bulidingId;

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getSpecialsMes() {
		return specialsMes;
	}

	public void setSpecialsMes(String specialsMes) {
		this.specialsMes = specialsMes;
	}

	public String getLine() {
		return line;
	}

	public void setLine(String line) {
		this.line = line;
	}

	public String getImgOne() {
		return imgOne;
	}

	public void setImgOne(String imgOne) {
		this.imgOne = imgOne;
	}

	public String getImgTwo() {
		return imgTwo;
	}

	public void setImgTwo(String imgTwo) {
		this.imgTwo = imgTwo;
	}

	public String getImgThree() {
		return imgThree;
	}

	public void setImgThree(String imgThree) {
		this.imgThree = imgThree;
	}

	public String getImgFour() {
		return imgFour;
	}

	public void setImgFour(String imgFour) {
		this.imgFour = imgFour;
	}

	public String getBulidDesc() {
		return bulidDesc;
	}

	public void setBulidDesc(String bulidDesc) {
		this.bulidDesc = bulidDesc;
	}

	public Double getAvgPrice() {
		return avgPrice;
	}

	public void setAvgPrice(Double avgPrice) {
		this.avgPrice = avgPrice;
	}

	public Double getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(Double minPrice) {
		this.minPrice = minPrice;
	}

	public String getSpecials() {
		return specials;
	}

	public void setSpecials(String specials) {
		this.specials = specials;
	}

	public String getInformation() {
		return information;
	}

	public void setInformation(String information) {
		this.information = information;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public Long getBulidingId() {
		return bulidingId;
	}

	public void setBulidingId(Long bulidingId) {
		this.bulidingId = bulidingId;
	}

	public Integer getJoinCount() {
		return joinCount;
	}

	public void setJoinCount(Integer joinCount) {
		this.joinCount = joinCount;
	}
}
