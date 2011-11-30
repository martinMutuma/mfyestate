package com.estate.business.service;

import java.util.Map;

import com.estate.domain.pro.TpSuggestion;
import com.estate.domain.pro.TpSuggestionFormBean;

public interface SuggestionService {

	/**
	 * 处理投诉和建议
	 * @param TpSuggestion
	 */
	public void saveOrUpdate(TpSuggestion tpSuggestion);

	/**
	 * 删除
	 * @param id
	 */

	public boolean deleteByIdString(String idString);

	/**
	 * 查询所有投诉与建议
	 * @return  Map<String,Object>
	 */
	public Map<String, Object> findAll(TpSuggestionFormBean bean, String page, String row);

	/**
	 * 查询投诉信息
	 * @param id
	 * @return TpSuggestion
	 */
	public TpSuggestion read(Long id);
}
