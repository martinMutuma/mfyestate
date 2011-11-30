package com.estate.domain.building;

import com.estate.base.annotation.Column;
import com.estate.base.annotation.Table;
import com.estate.base.entity.BaseEntity;

/**
 * TpImage entity.
 * 
 * @author MyEclipse Persistence Tools
 */
@Table("t_p_image")
public class TpImage extends BaseEntity {

	// Fields

	private Integer pid;
	@Column(name="IMG_NAME")
	private String imgName;
	@Column(name="IMG_URL")
	private String imgUrl;
	private String category;
	@Column(name="IMG_TYPE")
	private String imgType;
	private String desr;
	private String protype;

	public String getProtype() {
		return protype;
	}

	public void setProtype(String protype) {
		this.protype = protype;
	}

	public Integer getPid() {
		return this.pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getImgName() {
		return this.imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public String getImgUrl() {
		return this.imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getCategory() {
		return this.category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getImgType() {
		return this.imgType;
	}

	public void setImgType(String imgType) {
		this.imgType = imgType;
	}

	public String getDesr() {
		return this.desr;
	}

	public void setDesr(String desr) {
		this.desr = desr;
	}
	
	public String getImgRealName() {
		return null!=this.imgName?this.imgName.substring(this.imgName.indexOf("_")+1):"";
	}

}