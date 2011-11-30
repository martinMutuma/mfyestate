package com.estate.business.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.pro.TpSuggestion;
import com.estate.domain.pro.TpSuggestionFormBean;

public class SuggestionServiceImpl implements SuggestionService {

	private IBaseDao<TpSuggestion, Long> dao;

	public SuggestionServiceImpl() {
		dao = new BaseDao<TpSuggestion, Long>(TpSuggestion.class);
	}

	public TpSuggestion read(Long id) {
		return dao.read(id);
	}

	public void saveOrUpdate(TpSuggestion tpSuggestion) {
		dao.saveOrUpdate(tpSuggestion);

	}

	public boolean deleteByIdString(String idString) {
		boolean isFlag = true;
		if (idString == null || "".equals(idString))
			return false;
		String sql = "delete from t_p_suggestion where id in (" + idString + ")";
		try {
			dao.delete(sql);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return isFlag;
	}

	public Map<String, Object> findAll(TpSuggestionFormBean bean, String page, String row) {
		String sql = "select * from t_p_suggestion s where 1=1 ";
		String countSql = "select count(id) from t_p_suggestion s where 1=1 ";
		if (bean != null) {
			if (bean.getState() != null && !"".equals(bean.getState())) {
				sql += " and s.state =" + bean.getState();
				countSql += " and s.state =" + bean.getState();
			}
			if (bean.getStartTime() != null && !"".equals(bean.getStartTime())) {
				sql += " and s.CreateTime >= '" + bean.getStartTime() + " 00:00:00'";
				countSql += " and s.CreateTime >= '" + bean.getStartTime() + " 00:00:00'";
			}
			if (bean.getEndTime() != null && !"".equals(bean.getEndTime())) {
				sql += " and s.CreateTime <= '" + bean.getEndTime() + " 23:59:59'";
				countSql += " and s.CreateTime <= '" + bean.getEndTime() + " 23:59:59'";
			}

		}
		if (page != null && row != null) {
			int snum = Integer.parseInt(page) - 1;
			sql += " order by id desc   limit  " + (snum * Integer.parseInt(row)) + "," + row + " ";
		}
		List<TpSuggestion> list = dao.findList(sql);
		int total = 0;
		if (list.size() != 0) {
			total = Integer.parseInt((dao.findObjectArryList(countSql).get(0))[0] + "");
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("total", total);
		return map;
	}

}
