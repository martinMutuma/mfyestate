package com.estate.domain.building;

import java.util.Date;

import com.estate.base.annotation.Column;
import com.estate.base.annotation.Table;
import com.estate.base.entity.BaseEntity;

/**
 * TpShowings entity.
 * 
 * @author MyEclipse Persistence Tools
 */
@Table("t_p_showings")
public class TpShowings extends BaseEntity {

	// Fields

	private Integer pid;
	private String pname;
	private String ptype;
	private Long participantsid;
	private String name;
	private String sex;
	private String tel;
	private String email;
	@Column(name = "in_time")
	private Date inTime;
	private String state;

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPtype() {
		return ptype;
	}

	public void setPtype(String ptype) {
		this.ptype = ptype;
	}

	public Long getParticipantsid() {
		return participantsid;
	}

	public void setParticipantsid(Long participantsid) {
		this.participantsid = participantsid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Date getInTime() {
		return inTime;
	}

	public void setInTime(Date inTime) {
		this.inTime = inTime;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

}