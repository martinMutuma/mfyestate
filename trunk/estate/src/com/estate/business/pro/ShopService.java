package com.estate.business.pro;

import java.util.List;
import java.util.Map;
import com.estate.domain.pro.Shop;

/**
 * @Title:商铺service
 * @Copyright: Copyright (c) 0.1
 * @author:鲁根成
 * @version: 1.0
 * @time: 2011-5-17
 * 
 */
public interface ShopService {
	/**
	 * 增加商铺
	 * 
	 */
	public boolean addShop(Shop shop);

	/**
	 * 根据查询条件查询商铺信息
	 */
	public List<Shop> getList(Map<String, String> map, String start, String limt);

	/**
	 * 根据条件查询结果集
	 */
	public int getCount(Map<String, String> map);

	/**
	 * 根据id删除商铺信息
	 */
	public boolean deleteById(String id, String type);

	/**
	 * 删除商铺信息
	 */
	public boolean deleteByIdString(String idString, String type);

	/**
	 * 根据id查询商铺信息
	 */
	public Shop getById(String id);

	/**
	 * 根据 id 、图片url删除图片
	 */
	public boolean delPic(String id, String urlname);

	/**
	 * 修改后新增图片
	 */
	public boolean updateModPic(Map<String, String> map, int j);

	/**
	 * 通过id查询图片名字
	 */
	public String getImageName(String id, int j);

	/**
	 * 查找最新商铺列表
	 * 
	 * @return
	 */
	public List<Shop> findFreshShop(String discode);

	/**
	 * 查找某价格之内的写字楼信息
	 * 
	 * @param ary
	 * @param tipAry
	 * @param type
	 * @return
	 */
	public List<String> findByTypeAndPrice(String[] ary, String[] tipAry,
			String district);
	
	/**
	 * 根据id获取Shop对象
	 * @param id
	 * @return
	 */
	public Shop read(Long id);

}
