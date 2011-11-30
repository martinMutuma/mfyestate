package com.estate.business.service.pro;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.pro.Industry;
import com.estate.util.comm.DateTimeUtil;

/**
 * @Title:工业地产service
 * @Copyright: Copyright (c) 0.1
 * @author:鲁根成
 * @version: 1.0
 * @time: 2011-5-20
 * 
 */
public class IndustryServiceImpl implements IndustryService {
	private IBaseDao<Industry, Long> dao;

	public IndustryServiceImpl() {
		dao = new BaseDao<Industry, Long>(Industry.class);
	}

	public boolean addIndustry(Industry industry) {
		try {
			dao.saveOrUpdate(industry);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * 根据查询条件查询工业地产信息
	 */
	public List<Industry> getList(Map<String, String> map, String start,
			String limt) {
		if (map == null || map.size() == 0)
			return null;
		try {
			String sql = "select * from t_p_industry  where 1=1 and  Flag="
					+ map.get("type");
			if (!"".equals(map.get("nameparame")))
				sql += "  and  title like " + map.get("nameparame");
			if (!"-1".equals(map.get("autingSate")))
				sql += "  and auditingState=  " + map.get("autingSate");
			if (start != null && limt != null) {
				int snum = Integer.parseInt(start) - 1;
				sql += "   limit  " + (snum * Integer.parseInt(limt)) + " ,"
						+ limt + " ";
			}
			List<Industry> list = dao.findList(sql);

			List<Industry> newlist = null;
			if (list != null && list.size() > 0) {
				newlist = new ArrayList<Industry>();
				for (Industry industry : list) {

					industry.setCreateTimeString(DateTimeUtil
							.switchDateToString(industry.getCreateTime(),
									"yyyy-MM-dd hh:mm:ss"));
					String auting = industry.getAuditingState();
					if ("0".equals(auting))
						industry.setAudtingString("未审核");
					if ("1".equals(auting))
						industry.setAudtingString("已审核");
					if ("4".equals(auting))
						industry.setAudtingString("申请成交");
					if ("3".equals(auting))
						industry.setAudtingString("审核驳回");
					if ("5".equals(auting))
						industry.setAudtingString("成交通过");
					if ("7".equals(auting))
						industry.setAudtingString("成交驳回");
					newlist.add(industry);
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

			String sql = "select * from t_p_industry  where 1=1  and flag="
					+ map.get("type");
			if (!"".equals(map.get("nameparame")))
				sql += "  and    title like " + map.get("nameparame");
			if (!"-1".equals(map.get("autingSate")))
				sql += "  and auditingState=  " + map.get("autingSate");
			List<Industry> list = dao.findList(sql);
			if (list != null && list.size() > 0)
				return list.size();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	/**
	 * 根据id删除工业地产信息
	 */
	public boolean deleteById(String id, String type) {
		try {
			if ("".equals(id))
				return false;
			String sql = "delete   from t_p_industry where  id=?  and  Flag="
					+ type;
			dao.delete(sql, new Object[] { id });
			return true;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 删除工业地产信息
	 */
	public boolean deleteByIdString(String idString, String type) {
		boolean isFlag = true;
		if (idString == null || "".equals(idString))
			return false;
		String sql = "";
		String[] delteid = idString.split("_");
		try {
			for (int i = 0; i < delteid.length; i++) {
				sql = "delete   from  t_p_industry where  id=" + delteid[i]
						+ "  and  flag=" + type;
				dao.delete(sql);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return isFlag;
	}

	/**
	 * 根据id获得工业地产信息
	 */
	public Industry getById(String id, String type) {
		if ("".equals(id))
			return null;
		String sql = "select * from    t_p_industry where  id=?  and   flag=?";
		try {
			List<Industry> list = dao.findList(sql, new Object[] { id, type });
			if (list != null && list.size() > 0)
				return list.get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	 public   boolean  delPic(String id,String urlname){
	    	if("".equals(id))return false;
	    	if("".equals(urlname))return  false;
	    	String  sql="update  t_p_industry set  "+urlname+"=null   where  id=?";
	    	try {
				   dao.update(sql, new Object[]{id});
				   return true;
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
			
	    }
	  public   boolean   updateModPic(Map<String,String> map,int j){
	    	try {
				String sql="update  t_p_industry set imgName"+j+"=?,imgType"+j+"=?,imgUrl"+j+"=? where id=? ";
				dao.update(sql, new Object[]{map.get("name"),map.get("type"),map.get("url"),map.get("id")});
				return true;
			} catch (Exception e) {
				 e.printStackTrace();
				 return  false;
			}
	    	
	    } 
	    public   String    getImageName(String id,int j){
	         if("".equals(id))return null;
	         Industry indutry=dao.uniqueResult("select * from t_p_industry where id=?", new Object[]{id});
	    	 if(indutry!=null){
	    		 switch (j) {
				case 1:
					return indutry.getImgUrl1();
				case 2:
					return indutry.getImgUrl2();	
				case 3:
					return  indutry.getImgUrl3();
				case 4:
					return  indutry.getImgUrl4();
				case 5:
					return  indutry.getImgUrl5();	
				default:
					break;
				}
	    	 }
	    	return null;
	    }
}
