package com.estate.business.pro;

import java.util.List;

import com.estate.domain.pro.Floor;

/**
 * @Title:楼盘service
 * @Copyright: Copyright (c) 0.1
 * @author:鲁根成
 * @version: 1.0
 * @time: 2011-5-11
 * 
 */
public interface FloorService {
   /**
    * 增加楼盘
    */
	public  boolean  addFloor(Floor  floor);
	/**
	 * 查询楼盘
	 */
	public  List<Floor>  searchFloor(String pingyin);
}
