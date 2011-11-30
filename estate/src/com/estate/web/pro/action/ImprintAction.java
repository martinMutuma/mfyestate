package com.estate.web.pro.action;

import java.util.Date;
import java.util.Map;

import com.estate.base.web.BaseAction;
import com.estate.business.pro.ImprintService;
import com.estate.business.pro.ImprintServiceImpl;
import com.estate.domain.pro.TpSuggestion;
import com.opensymphony.xwork2.ActionContext;

/**
 * 用户投诉与建议
 * 
 * @author sff
 * 
 */

@SuppressWarnings("serial")
public class ImprintAction extends BaseAction {
	private ImprintService service;
	private TpSuggestion tpSuggestion;
	private String imgchk;
	private int imprintFlag;
	private String menuIndex;
	private int codeFlag;

	public ImprintAction() {
		service = new ImprintServiceImpl();
	}

	public String addSuggestion() {
		menuIndex = "0";
		imprintFlag = 12;
		Map<String, Object> map = ActionContext.getContext().getSession();
		String code = (String) map.get("rand");
		if (null != imgchk && !imgchk.equals(code)) {
			codeFlag = 1;
		} else {
			tpSuggestion.setCreatetime(new Date());
			tpSuggestion.setState(new Byte("0"));
			service.saveOrUpdateSuggestion(tpSuggestion);
			tpSuggestion = null;
			codeFlag = 2;
		}
		return "imprint";
	}

	public String to() {
		menuIndex = "0";
		
		return "imprint";
	}

	public TpSuggestion getTpSuggestion() {
		return tpSuggestion;
	}

	public void setTpSuggestion(TpSuggestion tpSuggestion) {
		this.tpSuggestion = tpSuggestion;
	}

	public String getImgchk() {
		return imgchk;
	}

	public void setImgchk(String imgchk) {
		this.imgchk = imgchk;
	}

	public int getImprintFlag() {
		return imprintFlag;
	}

	public void setImprintFlag(int imprintFlag) {
		this.imprintFlag = imprintFlag;
	}

	public String getMenuIndex() {
		return menuIndex;
	}

	public void setMenuIndex(String menuIndex) {
		this.menuIndex = menuIndex;
	}

	public int getCodeFlag() {
		return codeFlag;
	}

	public void setCodeFlag(int codeFlag) {
		this.codeFlag = codeFlag;
	}

	
	
}
