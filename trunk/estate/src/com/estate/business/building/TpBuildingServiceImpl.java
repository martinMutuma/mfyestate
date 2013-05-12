package com.estate.business.building;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.building.TpBuilding;
import com.estate.util.comm.DateTimeUtil;
import com.estate.util.comm.StringUtil;
import com.estate.util.framework.PageUtil;

public class TpBuildingServiceImpl implements TpBuildingService {

	private IBaseDao<TpBuilding, Long> dao;
//	private final static String findBuildingInfo_SQL = "select * from t_p_building where ";

	public TpBuildingServiceImpl() {
		dao = new BaseDao<TpBuilding, Long>(TpBuilding.class);
	}

	public Long saveEntity(TpBuilding tb) {
		return dao.saveEntity(tb);
	}

	public void saveOrUpdate(TpBuilding tpBuilding) {
		dao.saveOrUpdate(tpBuilding);
	}

	public TpBuilding read(Long id) {
		return dao.read(id);
	}

	/**
	 * 我关注、浏览、备选的楼盘
	 * 
	 */
	public Map<String, Object> showProInfo(Long id, String operateType,
			int start, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		String sql = "select count(b.id) from t_p_building b , t_m_proinfo p where b.id=p.proid and p.authorId=? and p.operateType=?";
		int total = Integer.parseInt((dao.findObjectArryList(sql, new Object[] {
				id, operateType }).get(0))[0].toString());
		map.put("rowCount", total <= limit ? 1 : total / limit == total / limit
				* limit ? total / limit : (total / limit + 1));
		sql = "select b.* from t_p_building b , t_m_proinfo p where b.id=p.proid and p.authorId=? and p.operateType=?  limit "
				+ start + "," + limit;
		List<TpBuilding> list = dao.findList(sql, new Object[] { id,
				operateType });
		if (list.size() > 0)// 1 浏览 2 关注 3 收藏 4备选
			for (int i = 0; i < list.size(); i++) {
				// 是否关注
				if ("1".equals(operateType) || "4".equals(operateType)) {
					sql = "select id from t_m_proinfo where operateType=2 and proId=? and authorId=?";
					if (null != dao.findObjectArryList(sql, new Object[] {
							list.get(i).getId(), id })
							&& dao.findObjectArryList(sql,
									new Object[] { list.get(i).getId(), id })
									.size() > 0)
						list.get(i).setIsAttention("1");
					else
						list.get(i).setIsAttention("0");
				}
				// 是否备选
				if ("1".equals(operateType) || "2".equals(operateType)) {
					sql = "select id from t_m_proinfo where operateType=4 and proId=? and authorId=?";
					if (null != dao.findObjectArryList(sql, new Object[] {
							list.get(i).getId(), id })
							&& dao.findObjectArryList(sql,
									new Object[] { list.get(i).getId(), id })
									.size() > 0)
						list.get(i).setIsChoose("1");
					else
						list.get(i).setIsChoose("0");
				}
			}
		map.put("tbuildingList", list);
		return map;
	}

	/**
	 * 房友最关心的楼盘
	 * 
	 */
	public Map<String, Object> showMoreAttentionBuilding(int start, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		String sql = "select count(a.id) from (select b.id from t_p_building b , t_m_proinfo p where b.id=p.proid and p.operatetype='2' group by p.proid  order by count(proid) desc ) a";
		List<Object[]> list = dao.findObjectArryList(sql);
		map
				.put(
						"rowCount",
						Integer.parseInt(list.get(0)[0].toString()) <= limit ? 1
								: (((Integer
										.parseInt(list.get(0)[0].toString()) / limit) == (Integer
										.parseInt(list.get(0)[0].toString())
										/ limit * limit)) ? Integer
										.parseInt(list.get(0)[0].toString())
										/ limit : (Integer
										.parseInt(list.get(0)[0].toString())
										/ limit + 1)));
		sql = "select b.* from t_p_building b , t_m_proinfo p where b.id=p.proid and p.operatetype='2' group by p.proid  order by count(proid) desc limit "
				+ start + "," + limit;
		List<TpBuilding> list1 = dao.findList(sql);
		map.put("tbuildingList", list1);
		return map;
	}

	/**
	 * 
	 * 最新楼盘
	 * 
	 * @return
	 */
	public Map<String, Object> showNewBuilding(int start, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		String sql = "select count(p.id) from t_p_building p where auditingState='1' and open_date>NOW() order by open_date desc";
		int total = Integer.parseInt((dao.findObjectArryList(sql).get(0))[0]
				.toString());
		map.put("rowCount", total <= limit ? 1 : total / limit == total / limit
				* limit ? total / limit : (total / limit + 1));
		sql = "select * from t_p_building where auditingState='1' and open_date>NOW() order by open_date desc limit "
				+ start + "," + limit;
		List<TpBuilding> list1 = dao.findList(sql);
		map.put("tbuildingList", list1);
		return map;
	}

	/**
	 * 根据条件查询居住楼盘信息
	 */
	public List<TpBuilding> getList(Map<String, String> map, String start,
			String limt) {
		if (map == null || map.size() == 0)
			return null;
		try {
			String sql = "select * from t_p_building where 1=1 ";
			if (!"".equals(map.get("authorId")))
				sql += "  and authorId=  '" + map.get("authorId")+"'";
			if (!"-1".equals(map.get("discode"))) {
				if ("0000000000".equals(map.get("discode")))
					sql += " and  district like '%'";
				else
					sql += "  and district  like '" + map.get("discode") + "%'";
			}
			if (start != null && limt != null) {
				int snum = Integer.parseInt(start) - 1;
				sql += "   limit  " + (snum * Integer.parseInt(limt)) + " ,"
						+ limt + " ";
			}
			List<TpBuilding> list = dao.findList(sql);
			List<TpBuilding> newlist = null;
			if (list != null && list.size() > 0) {
				newlist = new ArrayList<TpBuilding>();
				for (TpBuilding tp : list) {

					tp.setDateString(DateTimeUtil.switchDateToString(tp
							.getOpenDate(), "yyyy-MM-dd"));

					newlist.add(tp);
				}

			}
			return newlist;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 根据条件查询结果集
	 */
	public int getCount(Map<String, String> map) {
		try {
			if (map == null || map.size() == 0)
				return 0;

			String sql = "select * from t_p_building  where 1=1 ";
			if (!"".equals(map.get("authorId")))
				sql += "  and authorId=  '" +map.get("authorId")+"'" ;
			if (!"-1".equals(map.get("discode"))) {
				if ("0000000000".equals(map.get("discode")))
					sql += " and  district like '%'";
				else
					sql += "  and district like '" + map.get("discode") + "%'";
			}
			List<TpBuilding> list = dao.findList(sql);
			if (list != null && list.size() > 0)
				return list.size();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public boolean deleteById(String id) {
		try {
			if ("".equals(id))
				return false;
			String sql = "delete from t_p_building where id=? ";
			dao.delete(sql, new Object[] { id });
			return true;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean deleteByIdString(String idString) {
		boolean isFlag = true;
		if (idString == null || "".equals(idString))
			return false;
		String sql = "";
		String[] delteid = idString.split("_");
		try {
			for (int i = 0; i < delteid.length; i++) {
				sql = "delete from t_p_building where id=" + delteid[i];
				dao.delete(sql);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return isFlag;
	}

	/**
	 * 
	 * 楼盘比较
	 */
	public List<TpBuilding> getCompareBulidings(Long id, String ids) {
		String sql = "select * from t_p_building where id in (" + ids + ")";
		List<TpBuilding> list = dao.findList(sql);
		if (list.size() > 0)// 1 浏览 2 关注 3 收藏 4备选
			for (int i = 0; i < list.size(); i++) {
				// 是否关注
				sql = "select id from t_m_proinfo where operateType=2 and proId=? and authorId=?";
				if (null != dao.findObjectArryList(sql, new Object[] {
						list.get(i).getId(), id })
						&& dao.findObjectArryList(sql,
								new Object[] { list.get(i).getId(), id })
								.size() > 0)
					list.get(i).setIsAttention("1");
				else
					list.get(i).setIsAttention("0");
				// 是否备选
				sql = "select id from t_m_proinfo where operateType=4 and proId=? and authorId=?";
				if (null != dao.findObjectArryList(sql, new Object[] {
						list.get(i).getId(), id })
						&& dao.findObjectArryList(sql,
								new Object[] { list.get(i).getId(), id })
								.size() > 0)
					list.get(i).setIsChoose("1");
				else
					list.get(i).setIsChoose("0");
			}
		return list;
	}

	public TpBuilding checkByName(String name) {
		if ("".equals(name))
			return null;
		String sql = "select * from t_p_building where auditingState = '1' and name=? ";
		try {
			List<TpBuilding> list = dao.findList(sql, new Object[] { name });
			if (null != list && list.size() > 0) {
				TpBuilding tp = list.get(0);
				return tp;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public TpBuilding findbyName(String name){
		if ("".equals(name))
			return null;
		String sql = "select * from t_p_building where   name=? ";
		try {
			List<TpBuilding> list = dao.findList(sql, new Object[] { name });
			if (null != list && list.size() > 0) {
				TpBuilding tp = list.get(0);
				return tp;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public List<TpBuilding> findTop6Bulid(String discode) {
		String sql = "select * from t_p_building where auditingState = '1' ";
		if (null != discode && !"".equals(discode))
			sql += " and district like '"
					+ StringUtil.getShortZoneGB(discode) + "%'";
		sql += " order by createTime desc";
		sql = dao.createSqlQuery(sql).setFirstResult(0).setMaxSize(6)
				.bulidSql();
		return dao.findList(sql);
	}

	@SuppressWarnings("unchecked")
	public String getNum(String discode, String proName, String tableName) {
		String sql = "select {selectquery} as num from " + tableName;
		String sqlTemp = "ifnull(max(substr(num,length(num)-4)),0)";
		List list = dao.findAllSpecial(sql, new Object[] { sqlTemp });
		Map<String, Object> obj = (Map<String, Object>) list.get(0);
		String strNum = "0000"
				+ (Integer.parseInt(obj.get("num").toString()) + 1);
		return discode + proName + strNum.substring(strNum.length() - 5);
	}

	public List<String> findByTypeAndPrice(String[] ary, String[] tipAry,
			String type, String discode) {
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < tipAry.length; i++) {
			String str = ary[i];
			String sql = "select count(id) from t_p_building where auditingState='1' and building_type = '"
					+ type + "' and average_price " + str;
			if (null != discode && !"".equals(discode)) {
				sql += " and district like '"
						+ StringUtil.getShortZoneGB(discode) + "%'";
			}
			List<Object[]> countL = dao.createSqlQuery(sql).list();
			if (null != countL && countL.size() > 0) {
				Object[] objA = countL.get(0);
				String count = objA[0].toString();
				if (!"0".equals(count))
					list.add(tipAry[i] + "(" + objA[0].toString() + ")");
			}
		}
		return list;
	}

	public List<TpBuilding> findDistrictBulid(long id,String District) {
		String sql = "select * from t_p_building where auditingState='1' and id<>"+id+" and District = '" + District
				+ "' limit 0,9";
		List<TpBuilding> list = dao.findList(sql);
		return list;
	}

	public List<TpBuilding> findAveragePriceBulid(long id,double averagePrice) {
		String sql = "select * from t_p_building where auditingState='1' and id<>"+id+" and AVERAGE_PRICE < "
				+ (averagePrice + 1000) + "  AND AVERAGE_PRICE >"
				+ (averagePrice - 1000) + " limit 0,9";
		List<TpBuilding> list = dao.findList(sql);
		return list;
	}

	public void updateAttentionCount(int id, int attentionNum) {
		String sql = "update t_p_building set attentionNum  = " + attentionNum
				+ " where id = " + id;
		dao.update(sql);
	}

	public void updateviews(long pid) {
		String sql = "update t_p_building set views=views +1  where id = "
				+ pid;
		dao.update(sql);
	}

	public void updateShowingsNum(long pid) {
		String sql = "update t_p_building set showingsnum=ifnull(showingsnum,0) +1  where id = "
				+ pid;
		dao.update(sql);
	}

	public List<TpBuilding> findFreshBulid(String discode) {
		String sql = "select id,name,attentionNum,min_Price,address,disname,compressUrl from t_p_building where auditingState='1' ";
		if (null != discode && !"".equals(discode))
			sql += " and district like '"
					+ StringUtil.getShortZoneGB(discode) + "%'";
		sql += " order by attentionNum desc";
		sql = dao.createSqlQuery(sql).setFirstResult(0).setMaxSize(10)
				.bulidSql();
		return dao.findList(sql);
	}

	public PageUtil findBulidList(int pageNo, int limit,String discode) {
		PageUtil pu = new PageUtil();
		String sql = "select * from t_p_building where auditingState='1' ";
		if (null != discode && !"".equals(discode))
			sql += " and district like '"+ StringUtil.getShortZoneGB(discode) + "%'";
			sql +=" order by createTime desc";
		sql = dao.createSqlQuery(sql).setFirstResult((pageNo - 1) * limit)
				.setMaxSize(limit).bulidSql();
		String countSql = "select count(*) from t_p_building where auditingState='1'";
		if (null != discode && !"".equals(discode))
			countSql += " and district like '"+ StringUtil.getShortZoneGB(discode) + "%'";
		List<Object[]> countList = dao
				.findObjectArryList(countSql);
		if (null != countList && countList.size() > 0) {
			Object[] obj = countList.get(0);
			pu.setTotalRecords(new Integer(null == obj[0] ? "0" : obj[0]
					.toString()));
		}
		pu.setList(dao.findList(sql));
		pu.setPageNo(pageNo);
		pu.setPageSize(limit);
		return pu;
	}

	public TpBuilding getById(String id) {
		if ("".equals(id))
			return null;
		String sql = "select * from t_p_building where  id=? ";
		try {
			List<TpBuilding> list = dao.findList(sql, new Object[] { id });
			if (null != list && list.size() > 0) {

				TpBuilding tp = list.get(0);
				tp.setDateString(DateTimeUtil.switchDateToString(tp
						.getOpenDate(), "yyyy-MM-dd"));
				if (null != tp.getCheckDate())
					tp.setCheckdataString(DateTimeUtil.switchDateToString(tp
							.getCheckDate(), "yyyy-MM-dd"));
				return tp;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<TpBuilding> findByAuthorId(String authorId) {
		String sql = "select * from t_p_building where  auditingState='1' and authorId=?";
		List<TpBuilding> list = dao.findList(sql, new Object[] { authorId });
		return list;
	}

}
