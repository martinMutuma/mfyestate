package com.estate.business.pro;

import java.util.List;
import java.util.Map;
import com.estate.domain.pro.Business;


/**
 * @Title:生意转让类��service
 * @Copyright: Copyright (c) 0.1
 * @author:lgc
 * @version: 1.0
 * @time: 2011-5-19
 * 
 */
public interface BusinessService {
     /**
      * 增加生意转让信息
      */
	  public boolean addBusiness(Business business);
		/**
		 * 查询生意转让信息
		 */  
	 public  List<Business> getByMap(Map<String,String> map,String start, String limt);
	  /**
      * 根据条件查询结果集
      */
     public   int getCount(Map<String,String> map);
	  /**
      *  根据id删除生意转让信息
      */
    public  boolean  deleteById(String id);
  
    /**
      *  删除生意转让信息
      */
    public boolean deleteByIdString(String idString);
  /**
   * 根据id查询生意转让信息
   */
   public  Business  getById(String id);
   /**
	   * 根据 id 、图片url删除图片
	   */
	  public   boolean  delPic(String id,String urlname);
	  /**
	   * 修改后新增图片
	   */
	  public   boolean   updateModPic(Map<String,String> map,int j);
	  /**
	   * 通过id查询图片名字
	   */
	  public   String    getImageName(String id,int j);
	  
	  /**
	   * 得到房源编号
	   * @param discode
	   * @param tableName
	   * @return
	   */
	  public String getNum(String discode,String proName,String tableName);
}
