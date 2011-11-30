package com.estate.base.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.estate.base.support.SqlQuery;

public interface IBaseDao<ENTITY, ID extends Serializable> {

	// *****************insert/save****************
	/**
	 * 根据sql语句插入数据到DB
	 */
	public void insert(String sql);

	/**
	 * 根据sql语句插入到DB 防止注入
	 */
	public void insert(String sql, Object[] obj);

	/**
	 * 根据sql插入数据，并返回该条数据的id
	 */
	public Long insertReturnId(String sql);

	/**
	 * 根据sql插入数据，并返回该条数据的id,防止注入形式
	 */
	public Long insertReturnId(String sql, Object[] obj);

	/**
	 * 保存实体对象
	 */
	public Long saveEntity(ENTITY entity);

	// ******************update******************
	/**
	 * 根据sql更新db中数�?
	 */
	public void update(String sql);

	/**
	 * 根据sql更新db中数�?防止注入
	 */
	public void update(String sql, Object[] obj);

	/**
	 * 更新实体对象
	 */
	public void update(ENTITY entity);

	public void saveOrUpdate(ENTITY entity);

	// ****************delete*****************
	/**
	 * 根据主键删除
	 */
	public void deleteById(ID id);

	/**
	 * 删除该实体对�?
	 * 
	 * @param entity
	 */
	public void delete(ENTITY entity);

	public void delete(String sql);
	
	public void delete(String sql,Object[] objAry);

	// ***************query******************
	/**
	 * 查询实体对象列表
	 * 
	 * @param Sql
	 * @return
	 */
	public List<ENTITY> findList(String Sql);

	/**
	 * 防止注入法查询实体对象列�?
	 * 
	 * @param Sql
	 * @param objArray
	 * @return
	 */
	public List<ENTITY> findList(String Sql, Object[] objArray);

	/**
	 * 查询列表--普�? 列表以map形式返回,key = 列名 value=�?
	 * 
	 * @param Sql
	 * @param objArray
	 * @return
	 */
	public List<Map<String, Object>> findMapList(String Sql);

	/**
	 * 查询列表--防止注入形式 列表以map形式返回,key = 列名 value=�?
	 * 
	 * @param Sql
	 * @param objArray
	 * @return
	 */
	public List<Map<String, Object>> findMapList(String Sql, Object[] objArray);

	/**
	 * 查询列表-- 列表以Object[]形式返回
	 * 
	 * @param Sql
	 * @param objArray
	 * @return
	 */
	public List<Object[]> findObjectArryList(String sql);

	/**
	 * 查询列表-- 列表以Object[]形式返回--防止注入
	 * 
	 * @param Sql
	 * @param objArray
	 * @return
	 */
	public List<Object[]> findObjectArryList(String sql, Object[] objArray);

	/**
	 * 查询�?��对象
	 * 
	 * @return
	 */
	public List<ENTITY> findAll();

	/**
	 * 查询�?��对象
	 * 
	 * @param entity
	 * @return
	 */
	public List<ENTITY> findAll(ENTITY entity);
	
	public List<Map<String, Object>> findAll(String sql,Object[] objAry);

	public ENTITY read(ID id);

	public ENTITY uniqueResult(String sql);

	public ENTITY uniqueResult(String sql, Object[] objAry);

	// ****************自由扩展（分页）****************
	/**
	 * 扩展形式的查询，目前已实现分页扩�?setFirstMarch(Integer start)设置查询�?��条数
	 * setMaxMarch(Integer limit)设置每页显示条数 setParameters(Integer index, Object
	 * value)替代sql中的�?表示用value替代第index个？index�?�?��计数
	 */
	public SqlQuery createSqlQuery(String sql);
}
