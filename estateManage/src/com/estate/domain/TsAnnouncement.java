package com.estate.domain;

import java.util.Date;

import com.estate.base.annotation.Table;
import com.estate.base.entity.BaseEntity;

@Table("t_s_announcement")
public class TsAnnouncement extends BaseEntity {
	private String title;
	private String content;
	private Date createTime;
	private Date invalidTime;

	public Date getInvalidTime() {
		return invalidTime;
	}

	public void setInvalidTime(Date invalidTime) {
		this.invalidTime = invalidTime;
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

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public boolean getInvailid(){
		if(null!=invalidTime){
			if(invalidTime.getTime()>new Date().getTime())
				return false;
			else
				return true;
		}
		return false;
	}
}
