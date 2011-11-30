package com.estate.business.pro;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.pro.LargePro;
import com.estate.util.comm.DateTimeUtil;

/**
 * @Title:大型项目service
 * @Copyright: Copyright (c) 0.1
 * @author:鲁根成
 * @version: 1.0
 * @time: 2011-5-20
 * 
 */
public class LargeProServiceImpl implements LargeProService {
	private IBaseDao<LargePro, Long> dao;

	public LargeProServiceImpl() {
		dao = new BaseDao<LargePro, Long>(LargePro.class);
	}

	public boolean addPro(LargePro pro) {
		try {
			dao.saveOrUpdate(pro);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public List<LargePro> getList(Map<String, String> map, String start,
			String limt) {
		if (map == null || map.size() == 0)
			return null;
		try {
			String sql = "select * from t_p_largepro where 1=1 ";

			if (!"".equals(map.get("nameparame")))
				sql += "  and  title like " + map.get("nameparame");
			if (!"-1".equals(map.get("autingSate")))
				sql += "  and auditingState=  " + map.get("autingSate");
			 if(!"-1".equals(map.get("discode"))) {
				 if("0000000000".equals(map.get("discode"))) sql+=" and  district like '%'";
				 else  sql+="  and district  like '"+map.get("discode") +"%'";
			 }
			if (start != null && limt != null) {
				int snum = Integer.parseInt(start) - 1;
				sql += "   limit  " + (snum * Integer.parseInt(limt)) + " ,"
						+ limt + " ";
			}
			List<LargePro> list = dao.findList(sql);
			List<LargePro> newlist = null;
			if (list != null && list.size() > 0) {
				newlist = new ArrayList<LargePro>();
				for (LargePro largePro : list) {

					largePro.setCreateTimeString(DateTimeUtil
							.switchDateToString(largePro.getCreateTime(),
									"yyyy-MM-dd"));
					String auting = largePro.getAuditingState();
					if ("0".equals(auting))
						largePro.setAudtingString("未审核");
					if ("1".equals(auting))
						largePro.setAudtingString("已审核");
					if ("4".equals(auting))
						largePro.setAudtingString("申请成交");
					if ("3".equals(auting))
						largePro.setAudtingString("审核驳回");
					if ("5".equals(auting))
						largePro.setAudtingString("成交通过");
					if ("7".equals(auting))
						largePro.setAudtingString("成交驳回");
					if ("1".equals(largePro.getFlag()))
						largePro.setPaywayString("出租");
					if ("2".equals(largePro.getFlag()))
						largePro.setPaywayString("出售");
					if ("3".equals(largePro.getFlag()))
						largePro.setPaywayString("合作");
					newlist.add(largePro);
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

			String sql = "select * from t_p_largepro where 1=1";
			if (!"".equals(map.get("nameparame")))
				sql += "  and    title like " + map.get("nameparame");
			if (!"-1".equals(map.get("autingSate")))
				sql += "  and auditingState=  " + map.get("autingSate");
			 if(!"-1".equals(map.get("discode"))) {
				 if("0000000000".equals(map.get("discode"))) sql+=" and  district like '%'";
				 else  sql+="  and district  like '"+map.get("discode") +"%'";
			 }
			List<LargePro> list = dao.findList(sql);
			if (list != null && list.size() > 0)
				return list.size();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	/**
	 * 根据id删除大型项目信息
	 */
	public boolean deleteById(String id) {
		try {
			if ("".equals(id))
				return false;
			String sql = "delete from t_p_largepro where  id=?  ";

			dao.delete(sql, new Object[] { id });
			return true;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 删除大型项目信息
	 */
	public boolean deleteByIdString(String idString) {
		boolean isFlag = true;
		if (idString == null || "".equals(idString))
			return false;
		String sql = "";
		String[] delteid = idString.split("_");
		try {
			for (int i = 0; i < delteid.length; i++) {
				sql = "delete from  t_p_largepro where id=" + delteid[i];

				dao.delete(sql);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return isFlag;
	}

	/**
	 * 根据id查询大型项目信息
	 */
	public LargePro getById(String id) {
		if ("".equals(id))
			return null;
		String sql = "select * from t_p_largepro where id=? ";
		try {
			List<LargePro> list = dao.findList(sql, new Object[] { id });
			if (null != list && list.size() > 0)
				return list.get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	  public   boolean  delPic(String id,String urlname){
	    	if("".equals(id))return false;
	    	if("".equals(urlname))return  false;
	      	String  lastStr=urlname.substring(urlname.length()-1);
	    	String  sql="update t_p_largepro  set  "+urlname+"=null ,"+"imgName"+lastStr+"=null , imgType"+lastStr +"=null  where  id=?";
	    	
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
				String sql="update t_p_largepro set imgName"+j+"=?,imgType"+j+"=?,imgUrl"+j+"=? where id=? ";
				dao.update(sql, new Object[]{map.get("name"),map.get("type"),map.get("url"),map.get("id")});
				return true;
			} catch (Exception e) {
				 e.printStackTrace();
				 return  false;
			}
	    	
	    } 
	    public   String    getImageName(String id,int j){
	         if("".equals(id))return null;
	         LargePro pro=dao.uniqueResult("select * from  t_p_largepro where id=?", new Object[]{id});
	    	 if(pro!=null){
	    		 switch (j) {
				case 1:
					return pro.getImgUrl1();
				case 2:
					return  pro.getImgUrl2();	
				case 3:
					return  pro.getImgUrl3();
				case 4:
					return  pro.getImgUrl4();
				case 5:
					return  pro.getImgUrl5();	
				default:
					break;
				}
	    	 }
	    	return null;
	    }
}
