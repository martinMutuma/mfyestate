package com.estate.domain.pro;

import com.estate.base.annotation.Table;
import com.estate.base.entity.BaseEntity;
@Table("t_p_message")
public class TpMessage extends BaseEntity {
	private  String  loginname;
	private  String  loginPass;
	private String content;
	private String checkboxNm;
	public String getLoginname() {
		return loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

	public String getLoginPass() {
		return loginPass;
	}

	public void setLoginPass(String loginPass) {
		this.loginPass = loginPass;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCheckboxNm() {
		return checkboxNm;
	}

	public void setCheckboxNm(String checkboxNm) {
		this.checkboxNm = checkboxNm;
	}
}
