package com.estate.business.pro;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.base.support.SqlQuery;
import com.estate.domain.pro.Office;
import com.estate.util.comm.DateTimeUtil;
import com.estate.util.comm.StringUtil;
import com.estate.util.framework.PageUtil;

public class OfficeServiceImpl implements OfficeService {
	private IBaseDao<Office, Long> dao;

	public OfficeServiceImpl() {
		dao = new BaseDao<Office, Long>(Office.class);
	}

	/**
	 * 
	 * 发布写字楼出租
	 */
	public boolean addOfficeRent(Office office) {
		try {
			dao.saveOrUpdate(office);
			return true;
		} catch (Exception e) {
			return false;
		}

	}

	/**
	 * 根据条件查询写字楼出租或出售信息
	 */
	public List<Office> getList(Map<String, String> map, String start,
			String limt) {
		if (map == null || map.size() == 0)
			return null;
		try {
			String sql = "select * from t_p_office where flag="
					+ map.get("type");
			if (!"".equals(map.get("nameparame")))
				sql += "  and  name like '%" + map.get("nameparame")
						+ "%'  or  title like  '%" + map.get("nameparame")+"%'";
			if (!"-1".equals(map.get("autingSate")))
				sql += "  and auditingState=  " + map.get("autingSate");
			if (!"".equals(map.get("authorId")))
				sql += "  and authorId=  " + map.get("authorId");
			if (!"-1".equals(map.get("area1")))
				sql += " and   area between  " + map.get("area1") + "  and  "
						+ map.get("area2");
			if (!"-1".equals(map.get("price1")))
				sql += " and   price between  " + map.get("price1") + "  and  "
						+ map.get("price2");
			if (!"-1".equals(map.get("discode"))) {
				if ("00".equals(map.get("discode")))
					sql += " and  district like '%'";
				else
					sql += "  and district  like '" + map.get("discode") + "%'";
			}
			sql += " order by createTime desc";
			if (start != null && limt != null) {
				int snum = Integer.parseInt(start) - 1;
				sql += "   limit  " + (snum * Integer.parseInt(limt)) + " ,"
						+ limt + " ";
			}
			List<Office> list = dao.findList(sql);

			List<Office> newlist = null;
			if (list != null && list.size() > 0) {
				newlist = new ArrayList<Office>();
				for (Office office : list) {

					office.setCreateTimeString(DateTimeUtil.switchDateToString(
							office.getCreateTime(), "yyyy-MM-dd"));
					String auting = office.getAuditingState();
					if ("0".equals(auting))
						office.setAudtingString("未审核");
					if ("1".equals(auting))
						office.setAudtingString("已审核");
					if ("4".equals(auting))
						office.setAudtingString("申请成交");
					if ("3".equals(auting))
						office.setAudtingString("审核驳回");
					if ("5".equals(auting))
						office.setAudtingString("成交通过");
					if ("7".equals(auting))
						office.setAudtingString("成交驳回");
					newlist.add(office);
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

			String sql = "select * from t_p_office  where  flag="
					+ map.get("type");
			if (!"".equals(map.get("nameparame")))
				sql += "  and  name like '%" + map.get("nameparame")
						+ "%'  or  title like '%" + map.get("nameparame")+"%'";
			if (!"-1".equals(map.get("autingSate")))
				sql += "  and auditingState=  " + map.get("autingSate");
			if (!"".equals(map.get("authorId")))
				sql += "  and authorId=  " + map.get("authorId");
			if (!"-1".equals(map.get("area1")))
				sql += " and   area  between  " + map.get("area1") + "  and  "
						+ map.get("area2");
			if (!"-1".equals(map.get("price1")))
				sql += " and   price between  " + map.get("price1") + "  and  "
						+ map.get("price2");
			if (!"-1".equals(map.get("discode"))) {
				if ("00".equals(map.get("discode")))
					sql += " and  district like '%'";
				else
					sql += "  and district like '" + map.get("discode") + "%'";
			}
			List<Office> list = dao.findList(sql);
			if (list != null && list.size() > 0)
				return list.size();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	/**
	 * 根据id删除写字楼出租或出售信息
	 */
	public boolean deleteById(String id, String type) {
		try {
			if ("".equals(id))
				return false;
			String sql = "delete from t_p_office where id=? and flag=" + type;
			dao.delete(sql, new Object[] { id });
			return true;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 删除写字楼出租或出售信息
	 */
	public boolean deleteByIdString(String idString, String type) {
		boolean isFlag = true;
		if (idString == null || "".equals(idString))
			return false;
		String sql = "";
		String[] delteid = idString.split("_");
		try {
			for (int i = 0; i < delteid.length; i++) {
				sql = "delete from t_p_office where id=" + delteid[i]
						+ " and flag=" + type;
				dao.delete(sql);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return isFlag;
	}

	public Office getOfficeById(String id, String type) {
		if ("".equals(id))
			return null;
		String sql = "select * from t_p_office where id=? and  flag=? ";
		try {
			List<Office> list = dao.findList(sql, new Object[] { id, type });
			if (null != list && list.size() > 0) {
				return list.get(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean delPic(String id, String urlname) {
		if ("".equals(id))
			return false;
		if ("".equals(urlname))
			return false;
		String lastStr = urlname.substring(urlname.length() - 1);
		String sql = "update t_p_office set " + urlname + "= null ,"
				+ "imgName" + lastStr + "= null , imgType" + lastStr
				+ "= null  where  id=?";
		try {
			dao.update(sql, new Object[] { id });
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	public boolean updateModPic(Map<String, String> map, int j) {
		try {
			String sql = "update t_p_office set imgName" + j + "=?,imgType" + j
					+ "=?,imgUrl" + j + "=? where id=? ";
			dao.update(sql, new Object[] { map.get("name"), map.get("type"),
					map.get("url"), map.get("id") });
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	public String getImageName(String id, int j) {
		if ("".equals(id))
			return null;
		Office office = dao.uniqueResult("select * from t_p_office where id=?",
				new Object[] { id });
		if (office != null) {
			switch (j) {
			case 1:
				return office.getImgUrl1();
			case 2:
				return office.getImgUrl2();
			case 3:
				return office.getImgUrl3();
			case 4:
				return office.getImgUrl4();
			case 5:
				return office.getImgUrl5();
			default:
				break;
			}
		}
		return null;
	}

	public List<Office> findFreshOffice(String discode) {
		String sql = "select * from t_p_office t ";
		if (null != discode)
			sql += " where auditingState='1' and t.district like '"
					+ StringUtil.getShortZoneGB(discode) + "%'";
		sql += " order by t.createtime desc";
		sql = dao.createSqlQuery(sql).setFirstResult(0).setMaxSize(10)
				.bulidSql();
		return dao.findList(sql);
	}

	public List<String> findByTypeAndPrice(String[] ary, String[] tipAry,
			String discode) {
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < tipAry.length; i++) {
			String str = ary[i];
			String sql = "select count(id) from t_p_office where auditingState='1' and price "
					+ str;
			if (null != discode && !"".equals(discode))
				sql += " and district like '"
						+ StringUtil.getShortZoneGB(discode) + "%'";
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

	public PageUtil findOfficeList(Map<String, String> map, String start,
			String limit) {
		PageUtil pu = new PageUtil();
		if (map == null || map.size() == 0)
			return null;
		try {
			String sql = "select * from t_p_office where auditingState='1' ";
			if (!"".equals(map.get("type")))
				sql += " and flag=" + map.get("type");
			if (!"".equals(map.get("nameparame")))
				sql += " and name like " + map.get("nameparame")
						+ "  or  title like " + map.get("nameparame");
			if (!"-1".equals(map.get("autingSate")))
				sql += " and auditingState=  " + map.get("autingSate");
			if (!"-1".equals(map.get("area1")))
				sql += " and area between  " + map.get("area1") + "  and  "
						+ map.get("area2");
			if (!"-1".equals(map.get("price1")))
				sql += " and price between  " + map.get("price1") + "  and  "
						+ map.get("price2");
			if (!"-1".equals(map.get("discode"))) {
				if ("0000000000".equals(map.get("discode")))
					sql += " and district like '%'";
				else
					sql += " and district like '" + map.get("discode") + "%'";
			}
			List<Object[]> countList = dao.findObjectArryList(sql.replace("*",
					"count(*"));
			if (null != countList && countList.size() > 0) {
				Object[] obj = countList.get(0);
				pu.setTotalRecords(new Integer(null == obj[0] ? "0" : obj[0]
						.toString()));
			}
			if (start != null && limit != null) {
				int snum = Integer.parseInt(start) - 1;
				sql += " limit " + (snum * Integer.parseInt(limit)) + " ,"
						+ limit + " ";
			}
			List<Office> list = dao.findList(sql);
			List<Office> newlist = null;
			if (list != null && list.size() > 0) {
				newlist = new ArrayList<Office>();
				for (Office office : list) {
					office.setCreateTimeString(DateTimeUtil.switchDateToString(
							office.getCreateTime(), "yyyy-MM-dd"));
					String auting = office.getAuditingState();
					if ("0".equals(auting))
						office.setAudtingString("未审核");
					if ("1".equals(auting))
						office.setAudtingString("已审核");
					if ("4".equals(auting))
						office.setAudtingString("申请成交");
					if ("3".equals(auting))
						office.setAudtingString("审核驳回");
					if ("5".equals(auting))
						office.setAudtingString("成交通过");
					if ("7".equals(auting))
						office.setAudtingString("成交驳回");
					newlist.add(office);
				}
			}
			pu.setList(newlist);
			pu.setPageNo(Integer.parseInt(start));
			pu.setPageSize(Integer.parseInt(limit));
			return pu;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<Office> findFreshBulid() {
		String sql = "select id,name,attentionnum,price,address,compressurl from t_p_office where auditingState='1' order by attentionnum desc";
		sql = dao.createSqlQuery(sql).setFirstResult(0).setMaxSize(10)
				.bulidSql();
		return dao.findList(sql);
	}

	@SuppressWarnings("unchecked")
	public List findByAuthorId(String authorId) {
		String sql = "select * from t_p_office where auditingState='1' and authorId=?";
		List<Office> list = dao.findList(sql, new Object[] { authorId });
		return list;
	}

	public PageUtil findAllOffice(String type, int pageNo, int limit,
			Long authorId) {
		PageUtil pu = new PageUtil();
		try {
			String sql = "select * from t_p_office where authorId= ? and flag = ? order by createTime desc";
			SqlQuery query = new SqlQuery(sql, false);
			query.bulidPageUtil(new Object[] { authorId, type }, (pageNo - 1)
					* limit, limit);
			String countSql = "select count(*) from t_p_office where authorId= ? and flag = ?";
			List<Object[]> countList = dao.findObjectArryList(countSql,
					new Object[] { authorId, type });
			if (null != countList && countList.size() > 0) {
				Object[] obj = countList.get(0);
				pu.setTotalRecords(new Integer(null == obj[0] ? "0" : obj[0]
						.toString()));
			}
			/**pu
					.setList(dao.findList(query.bulidSql(), query
							.getObjectAry()));**/
			pu.setPageNo(pageNo);
			pu.setPageSize(limit);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pu;
	}

	public Office read(Long id) {
		return dao.read(id);
	}
}
