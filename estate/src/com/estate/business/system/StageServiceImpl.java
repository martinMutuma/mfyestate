package com.estate.business.system;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.pro.OfficeNeed;
import com.estate.util.comm.StringUtil;
import com.estate.util.file.SeniorSearchUtil;
import com.estate.util.framework.PageUtil;

public class StageServiceImpl implements IStageService {

	private IBaseDao<OfficeNeed, Integer> dao;

	public StageServiceImpl() {
		dao = new BaseDao<OfficeNeed, Integer>(OfficeNeed.class);
	}

	public PageUtil findByConditionMap(Map<String, Object> map, int pageNo,
			int limit, String discode, String searchP, String lpts,
			String keywordValue, String selectedTab) {
		PageUtil pu = new PageUtil();
		List<Map<String, Object>> list = null;
		if (null != map) {
			// 项目编号
			String pro = (null == searchP || "".equals(searchP)) ? "0"
					: searchP;
			// 获取语句的搜索属性部分
			String selectSqlHeader = SeniorSearchUtil.bulidProInfo(searchP, 6);
			// 获取表名
			String tableName = SeniorSearchUtil.bulidProInfo(pro, 1);
			String countSql = "select count(*) from " + tableName
					+ " t,t_m_baseinfo m where m.id = t.authorId ";
			StringBuffer sql = new StringBuffer();
			sql.append(selectSqlHeader);
			List<Object> conditionList = new ArrayList<Object>();
			StringBuffer conditionSql = new StringBuffer();
			for (String key : map.keySet()) {
				String[] keyAry = key.split("@");
				String columnName = keyAry[0];
				String type = "0";
				if (keyAry.length > 1)
					type = keyAry[1];
				conditionSql.append(bulidSql(type, columnName, map.get(key)
						.toString(), conditionList));
			}
			// 中介
			if ("1".equals(selectedTab)) {
				conditionSql.append(" and m.type = ? ");
				conditionList.add("7");
			} else if ("2".equals(selectedTab)) {
				conditionSql.append(" and m.type = ? ");
				conditionList.add("7");
			}
			// 特色楼盘
			if (null != lpts && !"".equals(lpts)) {
				conditionSql.append(" and t.features like ? ");
				conditionList.add("%" + lpts.toString() + "%");
			}
			// 关键字查询
			if (null != keywordValue && !"".equals(keywordValue)) {
				// 获取关键字对应的字段
				String title = SeniorSearchUtil.bulidProInfo(pro, 2);
				conditionSql.append(" and t." + title + " like ? ");
				conditionList.add("%" + keywordValue.toString() + "%");
			}
			// 地区
			if (null != discode && !"".equals(discode)) {
				conditionSql.append(" and t.district like ? ");
				conditionList.add("%" + StringUtil.getShortZoneGB(discode)
						+ "%");
			}
			conditionSql.append(" and auditingState = '1' ");
			countSql += conditionSql;
			sql.append(conditionSql).append(" order by createTime desc");
			Object[] conditionObj = convertListToObjectArray(conditionList);
			List<Object[]> countList = dao.findObjectArryList(countSql,
					conditionObj);
			list = dao.createBaseSqlQuery(sql.toString()).setFirstResult(
					(pageNo - 1) * limit).setMaxSize(limit).mapList(
					conditionObj);
			if (null != countList && countList.size() > 0) {
				Object[] obj = countList.get(0);
				pu.setTotalRecords(new Integer(null == obj[0] ? "0" : obj[0]
						.toString()));
			}
		}
		pu.setList(list);
		pu.setPageNo(pageNo);
		pu.setPageSize(limit);
		return pu;
	}

	public PageUtil findByConditionMulMap(Map<String, Object> map, int pageNo,
			int limit, String discode, String searchP, String lpts,
			String keywordValue, String selectedTab) {
		PageUtil pu = new PageUtil();
		List<Map<String, Object>> list = null;
		if (null != map) {
			// 项目编号
			String pro = (null == searchP || "".equals(searchP)) ? "0"
					: searchP;
			// 获取语句的搜索属性部分
			String selectSqlHeader = SeniorSearchUtil.bulidProInfo(searchP, 6);
			// 获取表名
			String tableName = SeniorSearchUtil.bulidProInfo(pro, 1);
			String countSql = "select count(*) from " + tableName
					+ " t,t_m_baseinfo m where m.id = t.authorId ";
			StringBuffer sql = new StringBuffer();
			sql.append(selectSqlHeader);
			List<Object> conditionList = new ArrayList<Object>();
			StringBuffer conditionSql = new StringBuffer();
			for (String key : map.keySet()) {
				String[] keyAry = key.split("@");
				String columnName = keyAry[0];
				String type = "0";
				if (keyAry.length > 1)
					type = keyAry[1];
				conditionSql.append(bulidSql(type, columnName, map.get(key)
						.toString(), conditionList));
			}
			// 中介
			if ("1".equals(selectedTab)) {
				conditionSql.append(" and m.type = ? ");
				conditionList.add("7");
			} else if ("2".equals(selectedTab)) {
				conditionSql.append(" and m.type = ? ");
				conditionList.add("7");
			}
			// 特色楼盘
			if (null != lpts && !"".equals(lpts)) {
				conditionSql.append(" and t.features like ? ");
				conditionList.add("%" + lpts.toString() + "%");
			}
			// 关键字查询
			if (null != keywordValue && !"".equals(keywordValue)) {
				// 获取关键字对应的字段
				String title = SeniorSearchUtil.bulidProInfo(pro, 2);
				conditionSql.append(" and t." + title + " like ? ");
				conditionList.add("%" + keywordValue.toString() + "%");
			}
			// 地区
			if (null != discode && !"".equals(discode)) {
				conditionSql.append(" and t.district like ? ");
				conditionList.add("%" + StringUtil.getShortZoneGB(discode)
						+ "%");
			}
			conditionSql.append(" and auditingState = '1' ");
			countSql += conditionSql;
			sql.append(conditionSql).append(" order by createTime desc");
			Object[] conditionObj = convertListToObjectArray(conditionList);
			List<Object[]> countList = dao.findObjectArryList(countSql,
					conditionObj);
			list = dao.createBaseSqlQuery(sql.toString()).setFirstResult(
					(pageNo - 1) * limit).setMaxSize(limit).mapList(
					conditionObj);
			if (null != countList && countList.size() > 0) {
				Object[] obj = countList.get(0);
				pu.setTotalRecords(new Integer(null == obj[0] ? "0" : obj[0]
						.toString()));
			}
		}
		pu.setList(list);
		pu.setPageNo(pageNo);
		pu.setPageSize(limit);
		return pu;
	}

	private Object[] convertListToObjectArray(List<Object> list) {
		Object[] objAry = new Object[list.size()];
		for (int i = 0; i < list.size(); i++) {
			objAry[i] = list.get(i);
		}
		return objAry;
	}

	// 处理查询条件
	private String bulidSql(String searchType, String columnName, String value,
			List<Object> conditionList) {
		String sql = " and ";
		String[] valAry = value.split("@");
		String[] columnNameAry = columnName.split("#");
		columnName = columnNameAry[0];
		// String columnType = "0";
		// if (columnNameAry.length > 1) {
		// columnType = columnNameAry[1];
		// }
		String parmValue = valAry[0];
		String parmValue1 = "";
		if (valAry.length > 1)
			parmValue1 = valAry[1];
		// if ("1".equals(columnType)) {
		// parmValue = "'" + parmValue + "'";
		// if (!"".equals(parmValue1))
		// parmValue1 = "'" + parmValue1 + "'";
		// }
		sql += "t." + columnName;
		switch (new Integer(searchType)) {
		case 1:
			sql += " < ? ";
			conditionList.add(parmValue);
			break;
		case 2:
			sql += " > ? ";
			conditionList.add(parmValue);
			break;
		case 3:
			sql += " <= ? ";
			conditionList.add(parmValue);
			break;
		case 4:
			sql += " >= ?";
			conditionList.add(parmValue);
			break;
		case 5:
			sql += " = ? ";
			conditionList.add(parmValue);
			break;
		case 6:
			sql += " <> ? ";
			conditionList.add(parmValue);
			break;
		case 7:
			if (valAry.length > 1) {
				if (!"".equals(valAry[0])) {
					sql += " between ? and ? ";
					conditionList.add(parmValue);
					conditionList.add(parmValue1);
				} else {
					sql += " < " + parmValue;
					conditionList.add(parmValue);
				}
			} else {
				sql += " > ? ";
				conditionList.add(parmValue1);
			}
			break;
		case 8:
			sql += " like ? ";
			conditionList.add(parmValue);
			break;
		default:
			sql += " = ? ";
			break;
		}
		return sql;
	}

	public Map<String, Object> findPro(String pro, Long id) {
		Map<String, Object> map = null;
		String sql = SeniorSearchUtil.bulidProInfo(pro, 3);
		String sqlTemp = "case d.LEVEL when '1' then d.NAME else "
				+ "case d.LEVEL when '2' then concat((select dd.NAME from t_s_district dd where dd.CODE = concat(SUBSTRING(d.code,1,2),'00000000')),d.NAME) "
				+ "else case d.LEVEL when '3' then concat(concat("
				+ "(select name from t_s_district pd where pd.CODE = concat(SUBSTRING(d.code,1,2),'00000000')),"
				+ "(select name from t_s_district cd where cd.CODE = concat(SUBSTRING(d.code,1,4),'000000'))),d.NAME)"
				+ "else ''" + " end end end ";
		List<Map<String, Object>> mapList = dao.findAllSpecial(sql,
				new Object[] { sqlTemp }, new Object[] { id });
		if (null != mapList && mapList.size() > 0)
			map = mapList.get(0);
		return map;
	}

	public Map<String, Object> findNeed(String id) {
		Map<String, Object> map = null;
		String sql = "select m.id,m.realname,m.type,m.disname as mdisname,m.company,m.headurl,m.id as mid,m.mobile as tel,"
				+ "p.title,p.descr as content,p.category,p.minprice,p.maxprice,p.minarea,p.maxArea,"
				+ "p.address,p.flag,p.createtime,ifnull(p.num,'') as num,"
				+ " {selectquery} as disname"
				+ " from t_p_officeneed p,t_m_baseinfo m,t_s_district d where d.code = p.district and p.authorid = m.id and p.id = "
				+ id;
		String sqlTemp = "case d.LEVEL when '1' then d.NAME else "
				+ "case d.LEVEL when '2' then concat((select dd.NAME from t_s_district dd where dd.CODE = concat(SUBSTRING(d.code,1,2),'00000000')),d.NAME) "
				+ "else case d.LEVEL when '3' then concat(concat("
				+ "(select name from t_s_district pd where pd.CODE = concat(SUBSTRING(d.code,1,2),'00000000')),"
				+ "(select name from t_s_district cd where cd.CODE = concat(SUBSTRING(d.code,1,4),'000000'))),d.NAME)"
				+ "else ''" + " end end end ";
		List<Map<String, Object>> mapList = dao.findAllSpecial(sql,
				new Object[] { sqlTemp });
		if (null != mapList && mapList.size() > 0)
			map = mapList.get(0);
		return map;
	}

	public List<Map<String, Object>> findNeedList(String proIndex, String mid) {
		String sql = "select p.title as title,p.id as id from t_p_officeneed "
				+ " p where p.needType = " + (new Integer(proIndex) + 1);
		if (null != mid && !"".equals(mid))
			sql += " and p.authorid = " + mid;
		sql += " order by p.createTime desc limit 0,10";
		return dao.findAllSpecial(sql, null);
	}

	public PageUtil findByKeyWord(String keyword, String proIndex, int pageNo,
			int limit) {
		PageUtil pu = new PageUtil();
		String sql = "";
		String countSql = "";
		Object[] paramObj = new Object[] { "%" + keyword + "%" };
		// 新房
		if ("0".equals(proIndex)) {
			sql = SeniorSearchUtil.bulidProInfo("9", 4);
			countSql = SeniorSearchUtil.bulidProInfo("9", 5);
		} else if ("1".equals(proIndex)) {
			sql = SeniorSearchUtil.bulidProInfo("0", 4);
			countSql = SeniorSearchUtil.bulidProInfo("0", 5);
		} else if ("2".equals(proIndex)) {
			sql = SeniorSearchUtil.bulidProInfo("1", 4);
			countSql = SeniorSearchUtil.bulidProInfo("1", 5);
		}
		List<Object[]> countList = dao.findObjectArryList(countSql, paramObj);
		List<Map<String, Object>> list = null;
		list = dao.findMapList(dao.createSqlQuery(sql).setFirstResult(
				(pageNo - 1) * limit).setMaxSize(limit).bulidSql(), paramObj);
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

	public PageUtil findByPrice(String minValue, String maxValue,
			String searchType, Integer proType, int pageNo, int limit) {
		PageUtil pu = new PageUtil();
		String sql = bulidSelectQuery(minValue, maxValue, searchType, proType);
		String countSql = bulidCountQuery(minValue, maxValue, searchType,
				proType);
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

	private String bulidSelectQuery(String minValue, String maxValue,
			String searchType, Integer type) {
		String sql = "select id,compressUrl,name,disname,fit_Condition as fitCondition,address,features,open_Date as openDate,check_Date as checkDate,min_Price as minPrice,building_Type as buildingType from t_p_building where building_type =";
		switch (type) {
		case 1:
			sql += " '0' "
					+ bulidWhereCluse("average_price", minValue, maxValue,
							searchType);
			break;
		case 2:
			sql += " '1' "
					+ bulidWhereCluse("average_price", minValue, maxValue,
							searchType);
			break;
		case 3:
			sql += " '2' "
					+ bulidWhereCluse("average_price", minValue, maxValue,
							searchType);
			break;
		case 4:
			sql += " '3' "
					+ bulidWhereCluse("average_price", minValue, maxValue,
							searchType);
			break;
		case 5:
			sql += " '4' "
					+ bulidWhereCluse("average_price", minValue, maxValue,
							searchType);
			break;
		case 6:
			sql += " '5' "
					+ bulidWhereCluse("average_price", minValue, maxValue,
							searchType);
			break;
		case 7:
			sql = "select t.id,t.title,t.address,t.area,t.propertyManagement as pm,t.price,t.authorId,t.createtime,t.flag,t.compressUrl from t_p_office t where 1=1 "
					+ bulidWhereCluse("t.price", minValue, maxValue, searchType);
			break;
		case 8:
			sql = "select t.id,t.title,t.address,t.propertyManagement as pm,t.bursary as price,t.authorId,t.createtime,t.flag,t.compressUrl "
					+ ",(t.ugOneFloor+t.ugTwoFloor+t.firstFloor+t.secondFloor+t.thirdFloor+t.fourceFloor+t.fifthFloor+t.sixFloor "
					+ "+t.sevenFloor+t.eightFloor) as area  from t_s_shops t where 1=1 "
					+ bulidWhereCluse("t.bursary", minValue, maxValue,
							searchType);
			break;
		default:
			sql = "select t.id,t.title,t.address,t.propertyManagement as pm,t.bursary as price,t.authorId,t.createtime,t.flag,t.compressUrl "
					+ ",(t.ugOneFloor+t.ugTwoFloor+t.firstFloor+t.secondFloor+t.thirdFloor+t.fourceFloor+t.fifthFloor+t.sixFloor "
					+ "+t.sevenFloor+t.eightFloor) as area  from t_s_shops t where 1=1 "
					+ bulidWhereCluse("t.bursary", minValue, maxValue,
							searchType);
			break;
		}
		return sql;
	}

	private String bulidCountQuery(String minValue, String maxValue,
			String searchType, Integer type) {
		StringBuffer sql = new StringBuffer();
		sql.append("select count(*) ");
		switch (type) {
		case 1:
			sql.append(" from t_p_building where building_type = '0' ");
			sql.append(bulidWhereCluse("average_price", minValue, maxValue,
					searchType));
			break;
		case 2:
			sql.append(" from t_p_building where building_type = '1' ");
			sql.append(bulidWhereCluse("average_price", minValue, maxValue,
					searchType));
			break;
		case 3:
			sql.append(" from t_p_building where building_type = '2' ").append(
					bulidWhereCluse("average_price", minValue, maxValue,
							searchType));
			break;
		case 4:
			sql.append(" from t_p_building where building_type = '3' ").append(
					bulidWhereCluse("average_price", minValue, maxValue,
							searchType));
			break;
		case 5:
			sql.append(" from t_p_building where building_type = '4' ").append(
					bulidWhereCluse("average_price", minValue, maxValue,
							searchType));
			break;
		case 6:
			sql.append(" from t_p_building where building_type = '5' ").append(
					bulidWhereCluse("average_price", minValue, maxValue,
							searchType));
			break;
		case 7:
			sql.append(" from t_p_office t where 1=1 ").append(
					bulidWhereCluse("t.price", minValue, maxValue, searchType));
			break;
		case 8:
			sql.append(" from t_s_shops t where 1=1 ")
					.append(
							bulidWhereCluse("t.bursary", minValue, maxValue,
									searchType));
			break;
		default:
			sql.append(" from t_s_shops t where 1=1 ")
					.append(
							bulidWhereCluse("t.bursary", minValue, maxValue,
									searchType));
			break;
		}
		return sql.toString();
	}

	private String bulidWhereCluse(String priceColumn, String minValue,
			String maxValue, String searchType) {
		StringBuffer sql = new StringBuffer();
		sql.append(" and ");
		if ("1".equals(searchType))
			sql.append(priceColumn).append(" <= ").append(minValue);
		else if ("2".equals(searchType))
			sql.append(priceColumn).append(" >= ").append(minValue);
		else if ("3".equals(searchType))
			sql.append(priceColumn).append(" between ").append(minValue)
					.append(" and ").append(maxValue);
		return sql.toString();
	}

}
