package com.estate.domain.pro;

import java.util.Date;

import com.estate.base.annotation.Table;
import com.estate.base.entity.BaseEntity;

@Table("t_p_need")
public class TpNeed extends BaseEntity {
	private String city;
	private String preference;
	private String purpose;
	private String needRoom;
	private String area;
	private String totalPrice;
	private String name;
	private String phone;
	private String sex;
	private String otherDemand;
	private Date createtime;
//	private String needFrom;
	private String state;
	private Date completionTime;
	private String handler;
	private String results;
	
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPreference() {
		return preference;
	}

	public void setPreference(String preference) {
		this.preference = preference;
	}

	public String getPurpose() {
		return purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public String getNeedRoom() {
		return needRoom;
	}

	public void setNeedRoom(String needRoom) {
		this.needRoom = needRoom;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getOtherDemand() {
		return otherDemand;
	}

	public void setOtherDemand(String otherDemand) {
		this.otherDemand = otherDemand;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Date getCompletionTime() {
		return completionTime;
	}

	public void setCompletionTime(Date completionTime) {
		this.completionTime = completionTime;
	}

	public String getHandler() {
		return handler;
	}

	public void setHandler(String handler) {
		this.handler = handler;
	}

	public String getResults() {
		return results;
	}

	public void setResults(String results) {
		this.results = results;
	}

}
