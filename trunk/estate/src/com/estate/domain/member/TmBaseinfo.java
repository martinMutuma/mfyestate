package com.estate.domain.member;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.estate.base.annotation.Column;
import com.estate.base.annotation.Table;
import com.estate.base.entity.BaseEntity;

@Table("t_m_baseinfo")
public class TmBaseinfo extends BaseEntity {

	private String username;
	private String password;
	private String type;
	private String discode;
	private String disname;
	private String email;
	private String realName;
	private String stores;
	private String company;
	private String mobile;
	private String tel;
	private String status;
	private String certification;
	private double money;
	private Long integral;
	private Long totalIntegral;
	private Long mouseWord;
	private Long level;
	private double virtualCurrency;
	private String introduction;
	private Date lastLoginTime;
	private String headUrl;
	private Date createTime;
	private String sex;
	private String honorType;
	@Column(name = "reject")
	private String honorTypeString;
	@Column(name = "reject")
	private String honorHeadUrl;

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getHeadUrl() {
		return headUrl;
	}

	public void setHeadUrl(String headUrl) {
		this.headUrl = headUrl;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDiscode() {
		return discode;
	}

	public void setDiscode(String discode) {
		this.discode = discode;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getStores() {
		return stores;
	}

	public void setStores(String stores) {
		this.stores = stores;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCertification() {
		return certification;
	}

	public void setCertification(String certification) {
		this.certification = certification;
	}

	public Long getIntegral() {
		return integral;
	}

	public void setIntegral(Long integral) {
		this.integral = integral;
	}

	public Long getMouseWord() {
		return mouseWord;
	}

	public void setMouseWord(Long mouseWord) {
		this.mouseWord = mouseWord;
	}

	public Long getLevel() {
		return level;
	}

	public void setLevel(Long level) {
		this.level = level;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public Date getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public String getDisname() {
		return disname;
	}

	public void setDisname(String disname) {
		this.disname = disname;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getCreateTimeString() {
		return null == createTime ? "" : new SimpleDateFormat("yyyy-MM-dd")
				.format(createTime);
	}

	public String getLastLoginTimeString() {
		return null == lastLoginTime ? "" : new SimpleDateFormat("yyyy-MM-dd")
				.format(lastLoginTime);
	}

	public Long getTotalIntegral() {
		return totalIntegral;
	}

	public void setTotalIntegral(Long totalIntegral) {
		this.totalIntegral = totalIntegral;
	}

	public String getHonorType() {
		return honorType;
	}

	public void setHonorType(String honorType) {
		this.honorType = honorType;
	}

	public String getHonorTypeString() {
		return honorTypeString;
	}

	public void setHonorTypeString(String honorTypeString) {
		this.honorTypeString = honorTypeString;
	}

	public String getHonorHeadUrl() {
		return honorHeadUrl;
	}

	public void setHonorHeadUrl(String honorHeadUrl) {
		this.honorHeadUrl = honorHeadUrl;
	}

	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public double getVirtualCurrency() {
		return virtualCurrency;
	}

	public void setVirtualCurrency(double virtualCurrency) {
		this.virtualCurrency = virtualCurrency;
	}

}
