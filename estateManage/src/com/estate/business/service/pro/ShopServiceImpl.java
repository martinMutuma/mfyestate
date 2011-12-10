package com.estate.business.service.pro;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.pro.Office;
import com.estate.domain.pro.Shop;
import com.estate.util.comm.DateTimeUtil;
import com.estate.util.comm.StringUtil;

public class ShopServiceImpl implements  ShopService{
     private IBaseDao<Shop, Long> dao;
     public  ShopServiceImpl(){
    	 dao=new BaseDao<Shop, Long>(Shop.class);
     }
     /**
      * 根据条件查询写字楼出租或出售信息
      */
     public   List<Shop>  getList(Map<String,String> map){
    	 String start = map.get("page"); 
    	 String limt = map.get("row");
    	   if(map==null || map.size()==0)return null;
    	   try {
    		   String sql="select p.* from t_s_shops p , t_m_baseinfo m where p.authorId = m.id and p.district like '"+map.get("discode")+"%'";
    			 if(!"".equals(map.get("auditingState"))) 
    				 sql+=" and p.auditingState = '"+map.get("auditingState")+ "'";
    			 if(!"".equals(map.get("tbtype"))) 
    				 sql+=" and m.type=  '"+map.get("tbtype")+ "'";
    			 sql+=" order by createTime desc";
			 if(start!=null && limt!=null) {
	    	    	 int snum=Integer.parseInt(start)-1;
	    	    	 sql+="   limit  "+(snum*Integer.parseInt(limt))+ " ,"+ limt+" ";}
			 List<Shop>  list=dao.findList(sql);
			 List<Shop> newlist = null;
			 if (list != null && list.size() > 0) {
					newlist = new ArrayList<Shop>();
					for (Shop shop : list) {
						shop.setCreateTimeString(DateTimeUtil.switchDateToString(
								shop.getCreateTime(), "yyyy-MM-dd"));
						shop.setAudtingString(StringUtil.formatAuditingState(shop.getAuditingState()));
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
     public int getCount(Map<String,String> map){
    	 try {
    		 if(map==null || map.size()==0)return 0;
  			 String sql="select count(p.id) as num from t_s_shops p , t_m_baseinfo m where p.authorId = m.id " +
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
   				sql = "delete from t_s_shops where id=" + delteid[i];
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
   				sql="update t_s_shops set auditingState = '1' where id=?";
				dao.update(sql, new Object[]{idString});
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
}
