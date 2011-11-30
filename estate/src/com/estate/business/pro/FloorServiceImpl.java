package com.estate.business.pro;

import java.util.List;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.pro.Floor;

/**
 * 修改说明
 * 类请格式化 
 * 其他类似  FC
 */
public class FloorServiceImpl implements  FloorService {
       private  IBaseDao<Floor, Long> dao;
       public   FloorServiceImpl(){
    	   dao=new BaseDao<Floor, Long>(Floor.class);
       }
   	public  boolean  addFloor(Floor  floor){
   		try {
			dao.saveEntity(floor);
			return  true;
		} catch (Exception e) {
			  e.printStackTrace();
			  return false;

		}
		

   	}
   	public  List<Floor>   searchFloor(String pingyin){
   		
   		try {
   			String sql="select * from t_p_estate where pinyin like ?" ;
 		   return dao.findList(sql, new Object[]{"%"+pingyin+"%"});
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}			
			
		
   
 
}
