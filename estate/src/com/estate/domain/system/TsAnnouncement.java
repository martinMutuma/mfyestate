package com.estate.domain.system;

import java.util.Date;

import com.estate.base.annotation.Table;
import com.estate.base.entity.BaseEntity;

@Table("t_s_announcement")
public class TsAnnouncement extends BaseEntity {
	private String title;
	private String content;
	private Date createTime;
	private String invalidTime;

	public String getInvalidTime() {
		return invalidTime;
	}

	public void setInvalidTime(String invalidTime) {
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

}
