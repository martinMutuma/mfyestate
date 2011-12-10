package com.estate.business.service.pro;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.pro.Office;
import com.estate.util.comm.DateTimeUtil;
import com.estate.util.comm.StringUtil;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class OfficeServiceImpl implements  OfficeService{
     private IBaseDao<Office, Long> dao;
     public  OfficeServiceImpl(){
    	 dao=new BaseDao<Office, Long>(Office.class);
     }
     /**
      * 根据条件查询写字楼出租或出售信息
      */
     public   List<Office>  getList(Map<String,String> map){
    	 String start = map.get("page"); 
    	 String limt = map.get("row");
    	   if(map==null || map.size()==0)return null;
    	   try {
    		   String sql="select p.* from t_p_office p , t_m_baseinfo m where p.authorId = m.id and p.district like '"+map.get("discode")+"%'";
    			 if(!"".equals(map.get("auditingState"))) 
    				 sql+=" and p.auditingState = '"+map.get("auditingState")+ "'";
    			 if(!"".equals(map.get("tbtype"))) 
    				 sql+=" and m.type=  '"+map.get("tbtype")+ "'";
    			 if(!"".equals(map.get("tflag")))
    				 sql+=" and m.flag=  '"+map.get("tflag")+ "'";
    			 sql+=" order by createTime desc";
			 if(start!=null && limt!=null) {
	    	    	 int snum=Integer.parseInt(start)-1;
	    	    	 sql+="   limit  "+(snum*Integer.parseInt(limt))+ " ,"+ limt+" ";}
			 List<Office>  list=dao.findList(sql);
			 List<Office> newlist = null;
			 if (list != null && list.size() > 0) {
					newlist = new ArrayList<Office>();
					for (Office office : list) {
						office.setCreateTimeString(DateTimeUtil.switchDateToString(
								office.getCreateTime(), "yyyy-MM-dd"));
							office.setAudtingString(StringUtil.formatAuditingState(office.getAuditingState()));
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
     public int getCount(Map<String,String> map){
    	 try {
    		 if(map==null || map.size()==0)return 0;
  			 String sql="select count(p.id) as num from t_p_office p , t_m_baseinfo m where p.authorId = m.id " +
  			 		"and p.district like '"+map.get("discode")+"%'";
  			 if(!"".equals(map.get("auditingState"))) sql+=" and p.auditingState = '"+map.get("auditingState")+ "'";
  			 if(!"".equals(map.get("tbtype"))) sql+=" and m.type=  '"+map.get("tbtype")+ "'";
  			 List list=dao.findObjectArryList(sql);
  			 Object[] obj = (Object[])list.get(0);
  			 return Integer.valueOf(obj[0].toString());
		} catch (Exception e) {
			 e.printStackTrace();
		}
		 return 0;
     }
     /**
      *  删除写字楼出租或出售信息
      */
   public boolean deleteByIdString(String idString){
   		boolean isFlag = true;
   		if (idString == null || "".equals(idString))
   			return false;
   		String sql = "";
   		String[] delteid = idString.split("_");
   		try {
   			for (int i = 0; i < delteid.length; i++) {
   				sql = "delete from t_p_office where id=" + delteid[i];
   				dao.delete(sql);
   			}
   		} catch (Exception e) {
   			e.printStackTrace();
   			return false;
   		}
   		return isFlag;
   	}
   
   /**
    * 核实
    */
	public boolean auditByIdString(String idString) {
   		boolean isFlag = true;
   		if (idString == null || "".equals(idString))
   			return false;
   		String sql = "";
   		String[] delteid = idString.split("_");
   		try {
   			for (int i = 0; i < delteid.length; i++) {
   				sql="update t_p_office set auditingState = '1' where id=?";
				dao.update(sql, new Object[]{idString});
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
	
	public boolean updateAuditing(Office obj) {
		String sql = "";
		try {
			if("1".equals(obj.getAuditingState())){
				sql="update t_m_baseinfo set integral = integral+5,totalIntegral = totalIntegral+5 where id=?";
				dao.update(sql, new Object[]{obj.getAuthorId()});
			}
			sql="update t_p_office set auditingState = ?,auditingRemark = ?,auditingUser = ?,auditingTime = now() where id=?";
			dao.update(sql, new Object[]{obj.getAuditingState(),obj.getAuditingRemark(),obj.getAuditingUser(),obj.getId()});
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
