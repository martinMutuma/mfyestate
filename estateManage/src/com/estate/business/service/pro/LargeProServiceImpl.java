package com.estate.business.service.pro;

import java.util.List;
import java.util.Map;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.pro.LargePro;

public class LargeProServiceImpl implements  LargeProService{
     private IBaseDao<LargePro, Long> dao;
     public  LargeProServiceImpl(){
    	 dao=new BaseDao<LargePro, Long>(LargePro.class);
     }
     /**
      * 根据条件查询写字楼出租或出售信息
      */
     public   List<LargePro>  getList(Map<String,String> map){
    	 String start = map.get("page"); 
    	 String limt = map.get("row");
    	   if(map==null || map.size()==0)return null;
    	   try {
    		   String sql="select p.* from t_p_largepro p , t_m_baseinfo m where p.authorId = m.id and p.district like '"+map.get("discode")+"%'";
    			 if(!"".equals(map.get("auditingState"))) 
    				 sql+=" and p.auditingState = '"+map.get("auditingState")+ "'";
    			 if(!"".equals(map.get("tbtype"))) 
    				 sql+=" and m.type=  '"+map.get("tbtype")+ "'";
    			 sql+=" order by createTime desc";
			 if(start!=null && limt!=null) {
	    	    	 int snum=Integer.parseInt(start)-1;
	    	    	 sql+="   limit  "+(snum*Integer.parseInt(limt))+ " ,"+ limt+" ";}
			 List<LargePro>  list=dao.findList(sql);
			 return list;
			
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
  			 String sql="select count(p.id) as num from t_p_largepro p , t_m_baseinfo m where p.authorId = m.id " +
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
   				sql = "delete from t_p_largepro where id=" + delteid[i];
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
   				sql="update t_p_largepro set auditingState = '1' where id=?";
				dao.update(sql, new Object[]{idString});
   			}
   		} catch (Exception e) {
   			e.printStackTrace();
   			return false;
   		}
   		return isFlag;
   	}
}
