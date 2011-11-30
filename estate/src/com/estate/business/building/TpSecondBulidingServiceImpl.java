package com.estate.business.building;

import java.util.List;
import java.util.Map;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.building.TpSecondBuliding;
import com.estate.util.comm.StringUtil;
import com.estate.util.framework.PageUtil;

public class TpSecondBulidingServiceImpl implements TpSecondBulidingService {
	private IBaseDao<TpSecondBuliding, Long> dao;

	// private final static String findBuildingInfo_SQL = "select * from
	// t_p_building where ";

	/**
	 * 默认构造器中实例化dao
	 * 
	 */
	public TpSecondBulidingServiceImpl() {
		dao = new BaseDao<TpSecondBuliding, Long>(TpSecondBuliding.class);
	}

	public Long save(TpSecondBuliding tsb) {
		return dao.saveEntity(tsb);
	}

	public void saveOrUpdate(TpSecondBuliding tsb) {
		dao.saveOrUpdate(tsb);
	}

	public void update(TpSecondBuliding tsb) {
		dao.update(tsb);
	}

	public TpSecondBuliding findById(Long id) {
		return dao.read(id);
	}

	public void delete(TpSecondBuliding tsb) {
		dao.delete(tsb);
	}

	public TpSecondBuliding find(Long id) {
		return dao.read(id);
	}

	public PageUtil findByParams(Map<String, Object> paramsMap, int pageNo,
			int limit) {
		PageUtil pu = new PageUtil();
		String sql = "select id,title,respDistrict,consArea,price,age,fitCondition,auditingState from t_p_second_buliding where 1=1 ";
		String countSql = "select count(id) from t_p_second_buliding where 1=1 ";
		if (null != paramsMap)
			for (String key : paramsMap.keySet()) {
				String conditionSql = "";
				String[] keyAry = key.split("@");
				if (keyAry.length == 1)
					conditionSql = keyAry[0] + " = " + paramsMap.get(key);
				if (keyAry.length > 1) {
					if ("1".equals(keyAry[1]))
						conditionSql = keyAry[0] + " = " + paramsMap.get(key);
					else if (keyAry.length == 2)
						conditionSql = keyAry[0] + " = '" + paramsMap.get(key)
								+ "' ";
					else if (keyAry.length > 2 && "2".equals(keyAry[2]))
						conditionSql = keyAry[0] + " like '"
								+ paramsMap.get(key) + "' ";
				}
				sql += " and " + conditionSql;
				countSql += " and " + conditionSql;
			}
		sql += " order by createDate desc";
		List<Object[]> countList = dao.findObjectArryList(countSql);
		List<Map<String, Object>> list = null;
		list = dao.createSqlQuery(sql).setFirstResult((pageNo - 1) * limit)
				.setMaxSize(limit).mapList();
		if (null != countList && countList.size() > 0) {
			Object[] obj = countList.get(0);
			pu.setTotalRecords(new Integer(null == obj[0] ? "0" : obj[0]
					.toString()));
		}
		pu.setList(list);
		pu.setPageNo(pageNo);
		pu.setPageSize(limit);
		return pu;
	}

	public PageUtil searchByParams(Map<String, Object> paramsMap, int pageNo,
			int limit) {
		PageUtil pu = new PageUtil();
		String sql = "select * from t_p_second_buliding where 1=1 ";
		String countSql = "select count(id) from t_p_second_buliding where 1=1 ";
		if (null != paramsMap)
			for (String key : paramsMap.keySet()) {
				String conditionSql = "";
				String[] keyAry = key.split("@");
				if (keyAry.length == 1)
					conditionSql = keyAry[0] + " = " + paramsMap.get(key);
				if (keyAry.length > 1) {
					if ("1".equals(keyAry[1]))
						conditionSql = keyAry[0] + " = " + paramsMap.get(key);
					else if (keyAry.length == 2)
						conditionSql = keyAry[0] + " = '" + paramsMap.get(key)
								+ "' ";
					else if (keyAry.length > 2 && "2".equals(keyAry[2]))
						conditionSql = keyAry[0] + " like '"
								+ paramsMap.get(key) + "' ";
				}
				sql += " and " + conditionSql;
				countSql += " and " + conditionSql;
			}
		sql += " order by createDate desc";
		List<Object[]> countList = dao.findObjectArryList(countSql);
		List<Map<String, Object>> list = null;
		list = dao.createSqlQuery(sql).setFirstResult((pageNo - 1) * limit)
				.setMaxSize(limit).mapList();
		if (null != countList && countList.size() > 0) {
			Object[] obj = countList.get(0);
			pu.setTotalRecords(new Integer(null == obj[0] ? "0" : obj[0]
					.toString()));
		}
		pu.setList(list);
		pu.setPageNo(pageNo);
		pu.setPageSize(limit);
		return pu;
	}
	public void deleteById(Long id) {
		dao.deleteById(id);
	}

	public void deleteByIds(String ids) {
		String[] idAry = ids.split(",");
		for (int i = 0; i < idAry.length; i++) {
			Long id = new Long(idAry[i]);
			deleteById(id);
		}
	}


	public List<TpSecondBuliding> sbList(int flag) {
		String sql = "select * from t_p_second_buliding where auditingState = '1' and flag = "+flag+" order by createTime desc limit 0,6";
	    return dao.findList(sql);
	}

	public PageUtil findSecondBulidList(int pageNo, int limit, String discode) {
		PageUtil pu = new PageUtil();
		String sql = "select * from t_p_second_buliding where auditingState = '1' and flag = 2 ";
		String countSql = "select count(id) from t_p_second_buliding where auditingState = '1' and flag = 2 ";
		if(null!=discode&&!"".equals(discode)){
			sql += " and district like '"+StringUtil.getShortZoneGB(discode)+"%'";
			countSql += " and district like '"+StringUtil.getShortZoneGB(discode)+"%'";
		}
		sql += " order by createDate";
		sql = dao.createSqlQuery(sql).setFirstResult((pageNo - 1) * limit)
				.setMaxSize(limit).bulidSql();
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

	public List<TpSecondBuliding> findTopWeight(Integer top,String type) {
		String sql = "select * from t_p_second_buliding where auditingState = '1' and flag = '"+type+"' order by recommendedWeight desc";
		sql = dao.createSqlQuery(sql).setFirstResult(top).bulidSql();
		return dao.findList(sql);
	}

	public PageUtil findSecondBulidRentList(Integer pageNo, Integer limit,
			String discode) {
		PageUtil pu = new PageUtil();
		String sql = "select * from t_p_second_buliding where auditingState = '1' and flag=1 ";
		String countSql = "select count(id) from t_p_second_buliding where auditingState = '1' and flag=1 ";
		if(null!=discode&&!"".equals(discode)){
			sql += " and district like '"+StringUtil.getShortZoneGB(discode)+"%'";
			countSql += " and district like '"+StringUtil.getShortZoneGB(discode)+"%'";
		}
		
		sql += " order by createDate";
		sql = dao.createSqlQuery(sql).setFirstResult((pageNo - 1) * limit)
				.setMaxSize(limit).bulidSql();
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

	public void updateAttentionCount(int id, int attentionNum) {
		String sql = "update t_p_second_buliding set attentionNum  = " + attentionNum
					+ " where id = " + id;
			dao.update(sql);
	}
}
