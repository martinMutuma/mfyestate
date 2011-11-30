package com.estate.business.pro;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.pro.Business;
import com.estate.util.comm.DateTimeUtil;


public class BusinessServiceImpl implements BusinessService {
    private  IBaseDao<Business, Long> dao;
    public   BusinessServiceImpl(){
    	dao=new BaseDao<Business, Long>(Business.class);
    }
    public boolean addBusiness(Business business){
    	 try {
			dao.saveOrUpdate(business);
			return  true;
		} catch (Exception e) {
			  e.printStackTrace();
			  return false;
		}
    }
    public  List<Business> getByMap(Map<String,String> map,String start, String limt){
    	if (map == null || map.size() == 0)
			return null;
		try {
			String sql = "select * from t_p_business  where 1=1 " ;
			if (!"".equals(map.get("nameparame")))
				sql += "  and  title like '" + map.get("nameparame")+"%'";
			if (!"-1".equals(map.get("autingSate")))
				sql += "  and auditingState=  " + map.get("autingSate");
			if (!"".equals(map.get("authorId")))
				sql += "  and authorId=  " + map.get("authorId");
			 if(!"-1".equals(map.get("catogry"))) sql+=" and   category  =  "+map.get("catogry") ;
			 if(!"-1".equals(map.get("price1"))) sql+=" and   propertyRent between  "+Integer.parseInt(map.get("price1"))*30 +"  and  "+Integer.parseInt(map.get("price2"))*30;
			 if(!"-1".equals(map.get("discode"))) {
				 if(!"0000000000".equals(map.get("discode")))
					 sql+="  and district  like '"+map.get("discode") +"%'";
			 }
			if (start != null && limt != null) {
				int snum = Integer.parseInt(start) - 1;
				sql += "   limit  " + (snum * Integer.parseInt(limt)) + " ,"
						+ limt + " ";
			}
			List<Business> list = dao.findList(sql);
			
			List<Business> newlist = null;
			if (list != null && list.size() > 0) {
				newlist = new ArrayList<Business>();
				for (Business bussiness : list) {
					bussiness.setCreateTimeString(DateTimeUtil.switchDateToString(
							bussiness.getCreateTime(), "yyyy-MM-dd"));
					String auting = bussiness.getAuditingState();
					if ("0".equals(auting))
						bussiness.setAudtingString("未审核");
					if ("1".equals(auting))
						bussiness.setAudtingString("已审核");
					if ("4".equals(auting))
						bussiness.setAudtingString("申请成交");
					if ("3".equals(auting))
						bussiness.setAudtingString("审核驳回");
					if ("5".equals(auting))
						bussiness.setAudtingString("成交通过");
					if ("7".equals(auting))
						bussiness.setAudtingString("成交驳回");
					newlist.add(bussiness);
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

			String sql = "select * from t_p_business  where 1=1 ";
			if (!"".equals(map.get("nameparame")))
				sql += "  and title like '" + map.get("nameparame")+"%'";
			if (!"-1".equals(map.get("autingSate")))
				sql += "  and auditingState=  " + map.get("autingSate");
			if (!"".equals(map.get("authorId")))
				sql += "  and authorId=  " + map.get("authorId");
			 if(!"-1".equals(map.get("catogry"))) sql+=" and   category  =  "+map.get("catogry") ;
			 if(!"-1".equals(map.get("price1"))) sql+=" and   propertyRent between  "+Integer.parseInt(map.get("price1"))*30 +"  and  "+Integer.parseInt(map.get("price2"))*30;
			 if(!"-1".equals(map.get("discode"))) {
				 if(!"0000000000".equals(map.get("discode"))) 
					 sql+="  and district  like '"+map.get("discode") +"%'";
			 }
			List<Business> list = dao.findList(sql);
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
			String sql = "delete   from t_p_business where  id=? ";
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
				sql = "delete   from t_p_business where  id=" + delteid[i] ;
				dao.delete(sql);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return isFlag;
	}
	public Business getById(String id) {
		 if("".equals(id))return null;
 	   String  sql="select * from t_p_business where  id=? ";
 	   try {
 		   List<Business>   list=  dao.findList(sql, new Object[]{id});   
 		   if(null!=list && list.size()>0){
 			  Business business= list.get(0);
 				business.setCreateTimeString(DateTimeUtil.switchDateToString(
						business.getCreateTime(), "yyyy-MM-dd"));
 			   return  business;
 		   }
		} catch (Exception e) {
			 e.printStackTrace();
		}
		return null;
    }
	  public   boolean  delPic(String id,String urlname){
	    	if("".equals(id))return false;
	    	if("".equals(urlname))return  false;
	    	String  lastStr=urlname.substring(urlname.length()-1);
	    	String  sql="update t_p_business set  "+urlname+"=null ,"+"imgName"+lastStr+"=null , imgType"+lastStr +"=null  where  id=?";
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
				String sql="update t_p_business set imgName"+j+"=?,imgType"+j+"=?,imgUrl"+j+"=? where id=? ";
				dao.update(sql, new Object[]{map.get("name"),map.get("type"),map.get("url"),map.get("id")});
				return true;
			} catch (Exception e) {
				 e.printStackTrace();
				 return  false;
			}
	    }
	  
	    public   String    getImageName(String id,int j){
	         if("".equals(id))return null;
	         Business business=dao.uniqueResult("select * from t_p_business where id=?", new Object[]{id});
	    	 if(business!=null){
	    		 switch (j) {
				case 1:
					return  business.getImgUrl1();
				case 2:
					return  business.getImgUrl2();	
				case 3:
					return  business.getImgUrl3();
				case 4:
					return  business.getImgUrl4();
				case 5:
					return  business.getImgUrl5();	
				default:
					break;
				}
	    	 }
	    	return null;
	    }
	   
		@SuppressWarnings("unchecked")
		public String getNum(String discode,String proName,String tableName){
	    	String sql="select {selectquery} as num from "+tableName;
	    	String sqlTemp = "ifnull(max(substr(num,length(num)-4)),0)";
	    	List list = dao.findAllSpecial(sql,new Object[]{sqlTemp});
	    	Map<String,Object> obj = (Map<String,Object>) list.get(0);
	    	String strNum = "0000"+(Integer.parseInt(obj.get("num").toString())+1);
	    	return discode+proName+strNum.substring(strNum.length()-5);
	    }
	    

}
