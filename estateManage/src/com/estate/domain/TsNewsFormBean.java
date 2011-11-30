package com.estate.domain;

import com.estate.base.entity.BaseEntity;

public class TsNewsFormBean extends BaseEntity {
	private String title;

	private String startTime;

	private String endTime;

	private String columnType;

	private String recommendFlag;

	private String stressFlag;
	
	private String imgFlag;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getColumnType() {
		return columnType;
	}

	public void setColumnType(String columnType) {
		this.columnType = columnType;
	}

	public String getRecommendFlag() {
		return recommendFlag;
	}

	public void setRecommendFlag(String recommendFlag) {
		this.recommendFlag = recommendFlag;
	}

	public String getStressFlag() {
		return stressFlag;
	}

	public void setStressFlag(String stressFlag) {
		this.stressFlag = stressFlag;
	}

	public String getImgFlag() {
		return imgFlag;
	}

	public void setImgFlag(String imgFlag) {
		this.imgFlag = imgFlag;
	}

	
}
