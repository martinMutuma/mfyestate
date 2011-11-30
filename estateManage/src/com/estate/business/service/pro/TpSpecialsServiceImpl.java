package com.estate.business.service.pro;

import java.util.List;
import java.util.Map;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.TpImage;
import com.estate.domain.TpSecondBuliding;
import com.estate.domain.TpSpecials;
import com.estate.domain.pro.TpBuilding;
import com.estate.util.framework.PageUtil;

public class TpSpecialsServiceImpl implements TpSpecialsService {
	private IBaseDao<TpSpecials, Long> dao;
	private IBaseDao<TpSecondBuliding, Long> secondBulidDao;
	private IBaseDao<TpImage, Long> imageDao;
	private IBaseDao<TpBuilding, Long> bulidDao;

	public TpSpecialsServiceImpl() {
		bulidDao = new BaseDao<TpBuilding, Long>(TpBuilding.class);
		dao = new BaseDao<TpSpecials, Long>(TpSpecials.class);
		secondBulidDao = new BaseDao<TpSecondBuliding, Long>(
				TpSecondBuliding.class);
		imageDao = new BaseDao<TpImage, Long>(TpImage.class);
	}

	public PageUtil findByParams(Map<String, Object> paramsMap, int pageNo,
			int limit) {
		PageUtil pu = new PageUtil();
		String sql = "select id,title,respDistrict,consArea,price,age,fitCondition from t_p_second_buliding where 1=1 ";
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
		List<Object[]> countList = secondBulidDao.findObjectArryList(countSql);
		List<Map<String, Object>> list = null;
		list = secondBulidDao.createSqlQuery(sql).setFirstResult(
				(pageNo - 1) * limit).setMaxSize(limit).mapList();
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
	
	public PageUtil findBulidingByParams(Map<String, Object> paramsMap, int pageNo,
			int limit) {
		PageUtil pu = new PageUtil();
		String sql = "select id,name,building_type as buildingtype,features,disname,address,open_date as opendate,min_price as minprice from t_p_building where 1=1 ";
		String countSql = "select count(id) from t_p_building where 1=1 ";
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
		sql += " order by createTime desc";
		List<Object[]> countList = bulidDao.findObjectArryList(countSql);
		List<Map<String, Object>> list = null;
		list = bulidDao.createSqlQuery(sql).setFirstResult(
				(pageNo - 1) * limit).setMaxSize(limit).mapList();
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

	public TpSecondBuliding readSecondBuliding(Long id) {
		return secondBulidDao.read(id);
	}

	public void saveSpecial(TpSpecials special) {
		dao.saveEntity(special);
	}

	public PageUtil findSpecialsByParams(Map<String, Object> paramsMap,
			int pageNo, int limit, String type) {
		PageUtil pu = new PageUtil();
		String sql = "select id,descr,startTime,endTime,specialsMes,line,bulidDesc,avgPrice,minPrice,specials,information,flag from T_P_SPECIALS where flag = '"+type+"' ";
		String countSql = "select count(*) from T_P_SPECIALS where 1=1 ";
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
		sql += " order by endTime desc";
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

	public TpSpecials findById(long id) {
		return dao.read(id);
	}

	public List<TpImage> findBySecondBulidId(Long id) {
		String sql = "select * from t_p_image where PROTYPE = 2 and PID = "
				+ id;
		return imageDao.findList(sql);
	}

	public void deleteById(Long id) {
		dao.deleteById(id);
	}

	public TpBuilding findBulidingById(Long id) {
		return bulidDao.read(id);
	}

	public void modifySpecials(TpSpecials specials) {
		dao.update(specials);
	}

	public List<TpImage> findByProId(Long id) {
		String sql = "select * from t_p_image where PROTYPE=1 and PID = "+id;
		return imageDao.findList(sql);
	}
}
