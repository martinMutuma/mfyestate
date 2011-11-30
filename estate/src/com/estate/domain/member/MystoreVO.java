package com.estate.domain.member;

public class MystoreVO {
	private String id; // 楼盘id
	private String category;// 楼盘类别
	private String compressUrl;// 图片
	private String name; // 楼盘名称
	private String disname; // 地区
	private String flag;// 出租 or 出售
	private String area;// 面积
	private String price;// 价格
	private String createTime;// 发布时间
	private String type; // 类型

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCompressUrl() {
		return compressUrl;
	}

	public void setCompressUrl(String compressUrl) {
		this.compressUrl = compressUrl;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getDisname() {
		return disname;
	}

	public void setDisname(String disname) {
		this.disname = disname;
	}
}
