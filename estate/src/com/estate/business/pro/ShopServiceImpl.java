package com.estate.business.pro;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.pro.Shop;
import com.estate.util.comm.DateTimeUtil;
import com.estate.util.comm.StringUtil;

public class ShopServiceImpl implements ShopService {
	private IBaseDao<Shop, Long> dao;

	public ShopServiceImpl() {
		dao = new BaseDao<Shop, Long>(Shop.class);
	}

	public boolean addShop(Shop shop) {
		try {
			dao.saveOrUpdate(shop);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public List<Shop> getList(Map<String, String> map, String start, String limt) {
		if (map == null || map.size() == 0)
			return null;
		try {
			String sql = "select * from t_s_shops  where Flag="
					+ map.get("type");
			if (!"".equals(map.get("nameparame")))
				sql += "  and  title like '" + map.get("nameparame")+"%'";
			if (!"-1".equals(map.get("autingSate")))
				sql += "  and auditingState=  " + map.get("autingSate");
			if (!"".equals(map.get("authorId")))
				sql += "  and authorId=  " + map.get("authorId");
			if (!"-1".equals(map.get("area1")))
				sql += " and areauseful between  "
						+ map.get("area1") + "  and  " + map.get("area2");
			if (!"-1".equals(map.get("price1")))
				sql += " and bursary between  "
						+ Integer.parseInt(map.get("price1")) * 12 + "  and  "
						+ Integer.parseInt(map.get("price2")) * 12;
			if (!"-1".equals(map.get("discode"))) {
				if (!"0000000000".equals(map.get("discode")))
					sql += "  and district  like '" + map.get("discode") + "%'";
			}
			if (start != null && limt != null) {
				int snum = Integer.parseInt(start) - 1;
				sql += "   limit  " + (snum * Integer.parseInt(limt)) + " ,"
						+ limt;
			}

			List<Shop> list = dao.findList(sql);

			List<Shop> newlist = null;
			if (list != null && list.size() > 0) {
				newlist = new ArrayList<Shop>();
				for (Shop shop : list) {
					shop.setCreateTimeString(DateTimeUtil.switchDateToString(
							shop.getCreateTime(), "yyyy-MM-dd"));
					String auting = shop.getAuditingState();
					if ("0".equals(auting))
						shop.setAudtingString("未审核");
					if ("1".equals(auting))
						shop.setAudtingString("已审核");
					if ("4".equals(auting))
						shop.setAudtingString("申请成交");
					if ("3".equals(auting))
						shop.setAudtingString("审核驳回");
					if ("5".equals(auting))
						shop.setAudtingString("成交通过");
					if ("7".equals(auting))
						shop.setAudtingString("成交驳回");
					newlist.add(shop);
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

			String sql = "select * from t_s_shops  where flag="
					+ map.get("type");
			if (!"".equals(map.get("nameparame")))
				sql += "  and    title like '" + map.get("nameparame")+"%'";
			if (!"-1".equals(map.get("autingSate")))
				sql += "  and auditingState=  " + map.get("autingSate");
			if (!"".equals(map.get("authorId")))
				sql += "  and authorId=  " + map.get("authorId");
			if (!"-1".equals(map.get("area1")))
				sql += " and   ugOneFloor+ugTwoFloor+firstFloor+secondFloor+thirdFloor+fourceFloor+fifthFloor+sixFloor+sevenFloor+eightFloor+ninthFloor+tenthFloor  between  "
						+ map.get("area1") + "  and  " + map.get("area2");
			if (!"-1".equals(map.get("price1")))
				sql += " and   bursary between  "
						+ Integer.parseInt(map.get("price1")) * 12 + "  and  "
						+ Integer.parseInt(map.get("price2")) * 12;
			if (!"-1".equals(map.get("discode"))) {
				if (!"0000000000".equals(map.get("discode")))
					sql += "  and district  like '" + map.get("discode") + "%'";
			}
			List<Shop> list = dao.findList(sql);
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
			String sql = "delete   from t_s_shops where  id=?  and  Flag="
					+ type;
			dao.delete(sql, new Object[] { id });
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
				sql = "delete   from  t_s_shops where  id=" + delteid[i]
						+ "  and  flag=" + type;
				dao.delete(sql);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return isFlag;
	}

	public Shop getById(String id) {
		if ("".equals(id))
			return null;
		String sql = "select * from t_s_shops where  id=?";
			List<Shop> list = dao.findList(sql, new Object[] { id });
			if (null != list && list.size() > 0) {
				Shop newShop = list.get(0);
				if (newShop != null) {
					if ("1".equals(newShop.getFlag()))
						list.get(0).setFlagString("出租");
					if ("2".equals(newShop.getFlag()))
						list.get(0).setFlagString("出售");
					}
				}
		return list.get(0);
	}

	public boolean delPic(String id, String urlname) {
		if ("".equals(id))
			return false;
		if ("".equals(urlname))
			return false;
		String lastStr = urlname.substring(urlname.length() - 1);
		String sql = "update  t_s_shops set  " + urlname + "=null ,"
				+ "imgName" + lastStr + "=null , imgType" + lastStr
				+ "=null  where  id=?";
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
			String sql = "update  t_s_shops set imgName" + j + "=?,imgType" + j
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
		Shop shop = dao.uniqueResult("select * from t_s_shops where id=?",
				new Object[] { id });
		if (shop != null) {
			switch (j) {
			case 1:
				return shop.getImgUrl1();
			case 2:
				return shop.getImgUrl2();
			case 3:
				return shop.getImgUrl3();
			case 4:
				return shop.getImgUrl4();
			case 5:
				return shop.getImgUrl5();
			default:
				break;
			}
		}
		return null;
	}

	public List<Shop> findFreshShop(String discode) {
		String sql = "select * from t_s_shops t ";
		if (null != discode && "".equals(discode))
			sql += " where auditingState='1' and district like '"
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
			String sql = "select count(id) from t_s_shops where auditingState='1' and bursary " + str;
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

	public List<Shop> findByAuthorId(String authorId) {
		String sql = "select * from t_s_shops where auditingState='1' and authorId=?";
		List<Shop> list = dao.findList(sql, new Object[] { authorId });
		return list;
	}

	public Shop read(Long id) {
		return dao.read(id);
	}
}
