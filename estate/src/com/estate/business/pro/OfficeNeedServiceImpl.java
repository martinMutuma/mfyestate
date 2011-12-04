package com.estate.business.pro;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.pro.OfficeNeed;
import com.estate.util.comm.DateTimeUtil;
import com.estate.util.comm.StringUtil;

/**
 * @Title:写字楼需求service
 * @Copyright: Copyright (c) 0.1
 * @author:鲁根成
 * @version: 1.0
 * @time: 2011-5-12
 * 
 */
public class OfficeNeedServiceImpl implements OfficeNeedService {
	private IBaseDao<OfficeNeed, Long> dao;

	public OfficeNeedServiceImpl() {
		dao = new BaseDao<OfficeNeed, Long>(OfficeNeed.class);
	}

	public boolean addNeed(OfficeNeed need) {
		try {
			dao.saveOrUpdate(need);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public List<OfficeNeed> getAllList(Map<String, String> map, String start,
			String limt) {
		String flag = map.get("flag");
		String auting = map.get("auting");
		String sql = "select *  from  t_p_officeneed where needType="
				+ map.get("type");
		if (!"-1".equals(map.get("discode"))) {
			if ("0000000000".equals(map.get("discode")))
				sql += " and  district like '%'";
			else
				sql += "  and district  like '" + map.get("discode") + "%'";
		}
		if (null != flag && (!"".equals(flag)) && !("0").equals(flag))
			sql += " and  flag= " + flag;
		if (!"".equals(map.get("authorId")))
			sql += "  and authorId=  " + map.get("authorId");
		if (null != auting && (!"-1".equals(auting)))
			sql += " and  auditing=" + auting;
		if (start != null && limt != null) {
			int snum = Integer.parseInt(start) - 1;
			sql += "   limit  " + (snum * Integer.parseInt(limt)) + " ," + limt
					+ " ";
		}
		try {
			List<OfficeNeed> list = dao.findList(sql);
			List<OfficeNeed> newList = null;
			if (list != null && list.size() > 0) {
				newList = new ArrayList<OfficeNeed>();
				for (OfficeNeed need : list) {
					if (need.getMaxPrice() != 0.0) {
						need.setPriceString(need.getMinPrice() + "-"
								+ need.getMaxPrice());
					} else
						need.setPriceString(need.getMinPrice() + "");
					need.setCreateTimeString(DateTimeUtil.switchDateToString(
							need.getCreateTime(), "yyyy-MM-dd"));
					if ("1".equals(need.getFlag()))
						need.setFlagString("求租");
					if ("2".equals(need.getFlag()))
						need.setFlagString("求购");
					if ("0".equals(need.getAuditing()))
						need.setAudtingString("未审核");
					if ("1".equals(need.getAuditing()))
						need.setAudtingString("已审核");
					if ("5".equals(need.getAuditing()))
						need.setAudtingString("审核驳回");
					newList.add(need);
				}
			}
			return newList;
		} catch (Exception e) {
			e.printStackTrace();

		}
		return null;

	}

	public int getcount(Map<String, String> map) {
		String type = map.get("type");
		String flag = map.get("flag");
		String auting = map.get("auting");
		String sql = "select * from  t_p_officeneed where  needType="
				+ type;
		if (!"-1".equals(map.get("discode"))) {
			if ("0000000000".equals(map.get("discode")))
				sql += " and  district like '%'";
			else
				sql += "  and district  like '" + map.get("discode") + "%'";
		}
		if (null != flag && (!"".equals(flag)) && !("0").equals(flag))
			sql += " and  flag= " + flag;
		if (!"".equals(map.get("authorId")))
			sql += "  and authorId=  " + map.get("authorId");
		if (null != auting && (!"-1".equals(auting)))
			sql += " and  auditing=" + auting;
		try {
			List<OfficeNeed> list = dao.findList(sql);

			if (list != null && list.size() > 0)
				return list.size();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public boolean deleteById(String id, String type) {
		try {
			if ("".equals(id))
				return false;
			String sql = "delete from t_p_officeneed where  id=? and  needType=? ";
			dao.delete(sql, new Object[] { id, type });
			return true;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean deleteByIdString(String idString, String type) {
		boolean isFlag = true;
		if (idString == null || "".equals(idString))
			return false;
		String sql = "";
		String[] delteid = idString.split("_");
		try {
			for (int i = 0; i < delteid.length; i++) {
				sql = "delete from t_p_officeneed where  id=" + delteid[i]
						+ "   and  needType= " + type;
				dao.delete(sql);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return isFlag;
	}

	public OfficeNeed getOfficeNeedById(String id, String type) {
		if ("".equals(id))
			return null;
		String sql = "select * from  t_p_officeneed where  id=?  and   needType=?";
		try {
			List<OfficeNeed> list = dao
					.findList(sql, new Object[] { id, type });
			if (null != list && list.size() > 0) {
				return list.get(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<OfficeNeed> findFreshNeed(String type, String discode) {
		String sql = "select * from  t_p_officeneed where auditing = '1' and needType=? ";
		if (null != discode && !"".equals(discode)) {
			sql += " and district like '" + StringUtil.getShortZoneGB(discode)
					+ "%'";
		}
		sql += " order by createtime desc";
		sql = dao.createSqlQuery(sql).setFirstResult(0).setMaxSize(9)
				.setParameters(1, type).bulidSql();
		return dao.findList(sql);
	}
}
