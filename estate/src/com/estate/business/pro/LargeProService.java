package com.estate.business.pro;
import java.util.List;
import java.util.Map;
import com.estate.domain.pro.LargePro;


/**
 * @Title:大型项目service
 * @Copyright: Copyright (c) 0.1
 * @author:鲁根成
 * @version: 1.0
 * @time: 2011-5-20
 * 
 */
public interface LargeProService {
	/**
	 * 
	 * 发布项目
	 */
	public boolean addPro(LargePro pro);

	/**
	 * 根据查询条件查询大型项目信息
	 */
	public List<LargePro> getList(Map<String, String> map, String start,
			String limt);

	 /**
	 * 根据条件查询结果集
	 */
	 public int getCount(Map<String, String> map);
	 /**
     *  根据id删除大型项目信息
     */
     public  boolean  deleteById(String id);
 
     /**
     *  删除大型项目信息
     */
    public boolean deleteByIdString(String idString);
    /**
	 * 根据id查询大型项目信息
	 */
	public LargePro getById(String id);
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
