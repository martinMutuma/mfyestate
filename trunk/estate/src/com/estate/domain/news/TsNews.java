package com.estate.domain.news;

import java.util.Date;

import com.estate.base.annotation.Table;
import com.estate.base.entity.BaseEntity;

@Table("t_s_news")
public class TsNews extends BaseEntity {
	private String title;

	private Date createTime;

	private String source;

	private String summary;

	private String content;

	private Byte columnType;

	private Byte imgFlag;

	private String imgUrl;

	private Byte stressFlag;

	private Byte recommendFlag;

	private int clickNum;

	private String creator;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Byte getColumnType() {
		return columnType;
	}

	public void setColumnType(Byte columnType) {
		this.columnType = columnType;
	}

	public Byte getImgFlag() {
		return imgFlag;
	}

	public void setImgFlag(Byte imgFlag) {
		this.imgFlag = imgFlag;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public Byte getStressFlag() {
		return stressFlag;
	}

	public void setStressFlag(Byte stressFlag) {
		this.stressFlag = stressFlag;
	}

	public Byte getRecommendFlag() {
		return recommendFlag;
	}

	public void setRecommendFlag(Byte recommendFlag) {
		this.recommendFlag = recommendFlag;
	}

	public int getClickNum() {
		return clickNum;
	}

	public void setClickNum(int clickNum) {
		this.clickNum = clickNum;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

}
