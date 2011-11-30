package com.estate.domain.pro;

import com.estate.base.entity.BaseEntity;

public class TpSuggestionFormBean extends BaseEntity {
	private String startTime;

	private String endTime;
	
	private String state;

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

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}


}
