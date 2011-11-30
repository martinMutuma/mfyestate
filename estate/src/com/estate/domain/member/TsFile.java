package com.estate.domain.member;

import java.util.Date;

import com.estate.base.annotation.Table;
import com.estate.base.entity.BaseEntity;

@Table("t_s_file")
public class TsFile extends BaseEntity {

	private String category;
	private String fileName;
	private String filePath;
	private String fileType;
	private Long integral;
	private Long vipIntegral;
	private Date upLoadTime;

	public Long getIntegral() {
		return integral;
	}

	public void setIntegral(Long integral) {
		this.integral = integral;
	}

	public Long getVipIntegral() {
		return vipIntegral;
	}

	public void setVipIntegral(Long vipIntegral) {
		this.vipIntegral = vipIntegral;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUpLoadTime() {
		return upLoadTime;
	}

	public void setUpLoadTime(Date upLoadTime) {
		this.upLoadTime = upLoadTime;
	}

}
