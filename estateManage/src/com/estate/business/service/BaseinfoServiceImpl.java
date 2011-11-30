package com.estate.business.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.TmBaseinfo;

public class BaseinfoServiceImpl implements BaseinfoService {

	private IBaseDao<TmBaseinfo, Long> dao;

	public BaseinfoServiceImpl() {
		dao = new BaseDao<TmBaseinfo, Long>(TmBaseinfo.class);
	}

    public boolean deleteByIdString(String idString) {
   		boolean isFlag = true;
   		if (idString == null || "".equals(idString))
   			return false;
   		String sql = "delete from t_m_baseinfo where id in ("+idString+")";
   		try {
   			dao.delete(sql);
   		} catch (Exception e) {
   			e.printStackTrace();
   			return false;
   		}
   		return isFlag;
   	}

	public TmBaseinfo read(Long id) {
		return dao.read(id);
	}

	public Map<String, Object> findAll(TmBaseinfo tmBaseinfo, String page, String row) {
		String sql = "select * from t_m_baseinfo m where 1=1 ";
		String countSql = "select count(id) from t_m_baseinfo m where 1=1 ";
		if(tmBaseinfo!=null){
		if (tmBaseinfo.getUsername() != null && !"".equals(tmBaseinfo.getUsername())) {
			sql += " and m.username like '%" + tmBaseinfo.getUsername() + "%' ";
			countSql += " and m.username like '%" + tmBaseinfo.getUsername() + "%' ";
		}if (tmBaseinfo.getType() != null && !"".equals(tmBaseinfo.getType())) {
			sql += " and m.type = '" + tmBaseinfo.getType() + "' ";
			countSql += " and m.type = '" + tmBaseinfo.getType() + "' ";
		}if (tmBaseinfo.getDiscode() != null && !"".equals(tmBaseinfo.getDiscode())) {
			sql += " and m.discode = '" + tmBaseinfo.getDiscode() + "' ";
			countSql += " and m.discode = '" + tmBaseinfo.getDiscode()+ "' ";
		}if (tmBaseinfo.getStatus() != null && !"".equals(tmBaseinfo.getStatus())) {
			sql += " and m.status = '" + tmBaseinfo.getStatus()+ "' ";
			countSql += " and m.status = '" + tmBaseinfo.getStatus()+ "' ";
		}
		if (tmBaseinfo.getMobile() != null && !"".equals(tmBaseinfo.getMobile())) {
			sql += "and m.mobile like '%" + tmBaseinfo.getMobile() + "%' ";
			countSql += "and m.mobile like '%" + tmBaseinfo.getMobile() + "%' ";
		}
		}
		if (page != null && row != null) {
			int snum = Integer.parseInt(page) - 1;
			sql += "   limit  " + (snum * Integer.parseInt(row)) + "," + row + " ";
		}
		List<TmBaseinfo> list = dao.findList(sql);
		int total = 0;
		if (list.size() != 0) {
			total = Integer.parseInt((dao.findObjectArryList(countSql).get(0))[0] + "");
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("total", total);
		return map;
	}

	public void saveOrUpdate(TmBaseinfo baseinfo) {
		dao.saveOrUpdate(baseinfo);
	}

	
	
}
