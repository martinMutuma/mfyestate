package com.estate.business.pro;

import com.estate.domain.pro.TpSuggestion;

public interface ImprintService {
	
	/**
	 * 用户发表投诉或建议
	 * 
	 */
	public void saveOrUpdateSuggestion(TpSuggestion tpSuggestion);
}
