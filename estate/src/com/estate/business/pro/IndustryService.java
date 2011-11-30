package com.estate.business.pro;

import java.util.List;
import java.util.Map;
import com.estate.domain.pro.Industry;


/**
 * @Title:工业地产service
 * @Copyright: Copyright (c) 0.1
 * @author:鲁根成
 * @version: 1.0
 * @time: 2011-5-20
 * 
 */
public interface IndustryService {
    /**
    * 增加工业地产信息
    */
	 public   boolean  addIndustry(Industry industry);
    /**
	   * 根据查询条件查询工业地产信息
	   */
	  public   List<Industry>  getList(Map<String,String> map,String start,String limt);
	  /**
     * 根据条件查询结果集
     */
    public   int getCount(Map<String,String> map);
    /**
     *  根据id删除工业地产信息
     */
   public  boolean  deleteById(String id,String type);
 
   /**
     *  删除工业地产信息
     */
   public boolean deleteByIdString(String idString, String type);
   /**
    *  根据id 查询工业地产信息
    */
    public Industry getById(String id, String type);
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
  }
