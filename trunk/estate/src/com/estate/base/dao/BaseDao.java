package com.estate.base.dao;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.estate.base.annotation.Table;
import com.estate.base.entity.OrmContainer;
import com.estate.base.entity.OrmVo;
import com.estate.base.support.DaoSupport;
import com.estate.base.support.SqlQuery;
import com.estate.util.comm.ReflectUtils;

@SuppressWarnings("unchecked")
public class BaseDao<ENTITY, ID extends Serializable> implements
		IBaseDao<ENTITY, ID> {
	private static Logger log = Logger.getLogger(BaseDao.class);
	private Map<String, Object> fieldMap;

	private Class targetCls;
	private Class targetSupCls;
	private String tableName;
	private DaoSupport support;

	/**
	 * 默认实现该构造器
	 * 
	 * @param objClass
	 */
	public BaseDao(Class objCls) {
		try {
			// Class objCls = ReflectUtils.getSuperClassGenricType(getClass());
			String className = objCls.getName();
			OrmVo ov = OrmContainer.getInstance().getContainerMap().get(
					className);
			if (null == ov) {
				ov = new OrmVo();
				Class targetCls = objCls;
				Class targetSupCls = targetCls.getSuperclass();
				if (null == fieldMap)
					fieldMap = new HashMap<String, Object>();
				fieldMap = ReflectUtils.bulidMap(targetSupCls, fieldMap);
				fieldMap = ReflectUtils.bulidMap(targetCls, fieldMap);
				this.targetCls = targetCls;
				this.targetSupCls = targetSupCls;
				this.tableName = getTableName();
				ov.setFieldMap(fieldMap);
				ov.setTableName(this.tableName);
				ov.setTargetCls(this.targetCls);
				ov.setTargetSupCls(this.targetSupCls);
				OrmContainer.getInstance().getContainerMap().put(className, ov);
			} else {
				this.targetCls = ov.getTargetCls();
				this.targetSupCls = ov.getTargetSupCls();
				this.tableName = ov.getTableName();
				this.fieldMap = ov.getFieldMap();
			}
			support = new DaoSupport();
		} catch (Exception e) {
			log.error("反射取类属�?出错", e);
		}
	}

	// *********************insert******************
	public void insert(String sql) {
		insert(sql, null);
	}

	public void insert(String sql, Object[] obj) {
		if (null == obj)
			support.execute(sql);
		else
			support.execute(sql, obj);
	}

	public Long insertReturnId(String sql) {
		return insertReturnId(sql, null);
	}

	public Long insertReturnId(String sql, Object[] obj) {
		return support.insert(sql, obj);
	}

	public Long saveEntity(ENTITY entity) {
		Long id = 0l;
		try {
			if (null != fieldMap && fieldMap.size() > 0) {
				String insertSql = "insert into " + this.tableName;
				String columnStr = "";
				Object[] valueStr = new Object[fieldMap.size()];
				int num = 0;
				for (String key : fieldMap.keySet()) {
					if (num != 0) {
						columnStr += ",";
					}
					columnStr += key;
					valueStr[num] = ((Field) fieldMap.get(key)).get(entity);
					num++;
				}
				insertSql += "(" + columnStr + ") values (";
				for (int i = 0; i < valueStr.length; i++) {
					if (i != 0)
						insertSql += ",";
					insertSql += "?";
				}
				insertSql += ")";
				id = support.insert(insertSql, valueStr);
			}
		} catch (Exception e) {
			log.error("对象插入失败", e);
		}
		return id;
	}

	// *********************update********************
	public void update(ENTITY entity) {
		try {
			long id = 0l;
			String keyId = "id";
			if (null != fieldMap && fieldMap.size() > 0) {
				String updateSql = "update " + this.tableName + " set ";
				String columnStr = "";
				Object[] valueStr = new Object[fieldMap.size()];
				int num = 0;
				for (String key : fieldMap.keySet()) {
					Field field = (Field) fieldMap.get(key);
					Object value = field.get(entity);
					if (null != value) {
						if ("id".equals(field.getName())) {
							id = (Long) value;
							keyId = field.getName();
							continue;
						} else {
							if (num != 0) {
								columnStr += ",";
							}
							columnStr += key + " = ?";
							valueStr[num] = ((Field) fieldMap.get(key))
									.get(entity);
							num++;
						}
					}
				}
				Object[] trueValue = new Object[num];
				for (int i = 0; i < num; i++) {
					trueValue[i] = valueStr[i];
				}
				columnStr += " where " + keyId + " = " + id;
				updateSql += columnStr;
				support.execute(updateSql, trueValue);
			}
		} catch (Exception e) {
			log.error("对象更新失败", e);
		}
	}

	public void update(String sql) {
		update(sql, null);
	}

	public void update(String sql, Object[] obj) {
		if (null == obj)
			support.execute(sql);
		else
			support.execute(sql, obj);
	}

	public void saveOrUpdate(ENTITY entity) {
		try {
			Field field = (Field) fieldMap.get("id");
			Object value = field.get(entity);
			if (null == value)
				saveEntity(entity);
			else
				update(entity);
		} catch (Exception e) {
			log.error("saveOrupdate function failed", e);
		}
	}

	// ****************delete*****************
	public void deleteById(ID id) {
		String sql = "delete from " + this.tableName + " where id = " + id;
		support.execute(sql);
	}

	public void delete(ENTITY entity) {
		try {
			Field field = (Field) fieldMap.get("id");
			Object value = field.get(entity);
			String sql = "delete from " + this.tableName + " where id = "
					+ value;
			support.execute(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void delete(String sql) {
		try {
			support.execute(sql);
		} catch (Exception e) {
			log.error("", e);
		}
	}

	public void delete(String sql, Object[] objAry) {
		try {
			support.execute(sql, objAry);
		} catch (Exception e) {
			log.error("", e);
		}
	}

	// **************query****************

	public ENTITY read(ID id) {
		String sql = "select * from " + tableName + " where id = " + id;
		if ("1".equals(DaoSupport.DBType))
			sql += " limit 0,1";
		else if ("2".equals(DaoSupport.DBType))
			sql = "select top 1 * from " + tableName + " where id = " + id;
		List<ENTITY> list = findList(sql);
		if (null != list && list.size() > 0)
			return list.get(0);
		else {
			log.info("no entiy find by id '" + id + "'");
			return null;
		}
	}

	public List<ENTITY> findList(String Sql) {
		return findList(Sql, null);
	}

	public List<ENTITY> findList(String Sql, Object[] objArray) {
		Sql = Sql.trim();
		List<ENTITY> entityList = new ArrayList<ENTITY>();
		List<Map<String, Object>> list = null;
		if (null == objArray)
			list = (List<Map<String, Object>>) support.find(Sql);
		else
			list = (List<Map<String, Object>>) support.find(Sql, objArray);
		if (null != list && list.size() > 0) {
			bulidEntityCollection(list, entityList);
		}
		return entityList;
	}

	public List<Map<String, Object>> findMapList(String Sql) {
		return findMapList(Sql, null);
	}

	public List<Map<String, Object>> findMapList(String Sql, Object[] objArray) {
		Sql = Sql.trim();
		List<Map<String, Object>> list = null;
		if (null == objArray)
			list = (List<Map<String, Object>>) support.find(Sql);
		else
			list = (List<Map<String, Object>>) support.find(Sql, objArray);
		return list;
	}

	public List<Object[]> findObjectArryList(String sql) {
		return findObjectArryList(sql, null);
	}

	public List<Object[]> findObjectArryList(String sql, Object[] objArray) {
		sql = sql.trim();
		List<Object[]> list = null;
		if (null == objArray)
			list = support.findObjList(sql);
		else
			list = support.findObjList(sql, objArray);
		return list;
	}

	public List<ENTITY> findAll() {
		String sql = "select * from " + this.tableName + " order by id desc";
		return findList(sql);
	}

	public List<ENTITY> findAll(ENTITY entity) {
		// TODO:
		return null;
	}

	public ENTITY uniqueResult(String sql) {
		if ("1".equals(DaoSupport.DBType))
			sql += " limit 0,1";
		else if ("2".equals(DaoSupport.DBType))
			sql = sql.replaceFirst("select", "select top 1 ");
		List<ENTITY> list = findList(sql);
		if (null != list && list.size() > 0)
			return list.get(0);
		return null;
	}

	public ENTITY uniqueResult(String sql, Object[] objAry) {
		if ("1".equals(DaoSupport.DBType))
			sql += " limit 0,1";
		else if ("2".equals(DaoSupport.DBType))
			sql = sql.replaceFirst("select", "select top 1 ");
		List<ENTITY> list = findList(sql, objAry);
		if (null != list && list.size() > 0)
			return list.get(0);
		return null;
	}

	// ****************自由扩展（分页）****************
	/**
	 * 分页处理，暂时只实现了mysql的方�?
	 * 
	 * @param sql
	 * @return
	 */
	public SqlQuery createSqlQuery(String sql) {
		return support.createSqlQuery(sql);
	}

	public SqlQuery createBaseSqlQuery(String sql) {
		return support.createSqlQuery(sql, false);
	}

	// *********************私有方法****************

	/**
	 * 获取实体类对应DB中的表名
	 * 
	 * @return
	 */
	private String getTableName() {
		String tableName = "";
		try {
			Table table = (Table) targetCls.getAnnotation(Table.class);
			if (null != table) {
				tableName = table.value();
				if ("".equals(tableName.trim()))
					tableName = targetCls.getName();
			} else {
				tableName = targetCls.getName();
			}
		} catch (Exception e) {
			log.error("表名获取失败", e);
		}
		return tableName;
	}

	private List<ENTITY> bulidEntityCollection(List<Map<String, Object>> list,
			List<ENTITY> entityList) {
		for (Iterator iterator = list.iterator(); iterator.hasNext();) {
			Map<String, Object> map = (Map<String, Object>) iterator.next();
			Object entityObj = null;
			try {
				entityObj = targetCls.newInstance();
				for (String fieldName : map.keySet()) {
					Object value = map.get(fieldName);
					if (null == value)
						continue;
					entityObj = getEntity(fieldName, map.get(fieldName),
							entityObj);
				}
			} catch (Exception e) {
				log.error("list<map> to list<entity> error", e);
				e.printStackTrace();
			}
			entityList.add((ENTITY) entityObj);
		}
		return entityList;
	}

	private Object getEntity(String field, Object value, Object entityObj) {
		field = field.toLowerCase();
//		StringUtil.toLowerCaseInitial(field, true);
		Field fie = (Field) fieldMap.get(field);
		if (null == fie)
			throw new IllegalArgumentException("the parameter not found :"
					+ field + ";class:" + entityObj.toString());
		String fieldName = fie.getName();
		String className = fie.getType().getName().toString();
		Class[] cls = null;
		Method setterM = null;
		if ("java.lang.Integer".equals(className)) {
			cls = new Class[] { Integer.class };
			value = new Integer(value.toString());
		} else if ("int".equals(className)) {
			cls = new Class[] { int.class };
			value = new Integer(value.toString()).intValue();
		} else if ("char".equals(className)) {
			cls = new Class[] { char.class };
			value = (value.toString()).charAt(0);
		} else if ("java.lang.String".equals(className)) {
			cls = new Class[] { String.class };
			value = value.toString();
		} else if ("java.lang.Long".equals(className)) {
			cls = new Class[] { Long.class };
			value = new Long(value.toString());
		} else if ("long".equals(className)) {
			cls = new Class[] { long.class };
			value = new Long(value.toString()).longValue();
		} else if ("java.lang.Float".equals(className)) {
			cls = new Class[] { Float.class };
			value = new Float(value.toString());
		} else if ("float".equals(className)) {
			cls = new Class[] { float.class };
			value = new Float(value.toString()).floatValue();
		} else if ("java.lang.Byte".equals(className)) {
			cls = new Class[] { Byte.class };
			value = new Byte(value.toString());
		} else if ("java.lang.byte".equals(className)) {
			cls = new Class[] { byte.class };
			value = new Byte(value.toString());
		} else if ("java.lang.Double".equals(className)) {
			cls = new Class[] { Double.class };
			value = new Double(value.toString());
		} else if ("double".equals(className)) {
			cls = new Class[] { double.class };
			value = new Double(value.toString()).doubleValue();
		} else if ("java.util.Date".equals(className)) {
			cls = new Class[] { Date.class };
		} else if ("java.sql.Date".equals(className)) {
			cls = new Class[] { java.sql.Date.class };
		} else {
			return null;
		}
		try {
			setterM = targetCls.getDeclaredMethod("set"
					+ fieldName.substring(0, 1).toUpperCase()
					+ fieldName.substring(1), cls);
		} catch (Exception e) {
			try {
				setterM = targetSupCls.getDeclaredMethod("set"
						+ fieldName.substring(0, 1).toUpperCase()
						+ fieldName.substring(1), cls);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		try {
			setterM.invoke(entityObj, value);
		} catch (Exception e) {
			log.error("封装出错", e);
		}
		return entityObj;
	}

	public List<Map<String, Object>> findAllSpecial(String Sql, Object[] objAry) {
		Sql = Sql.trim();
		List<Map<String, Object>> list = null;
		if (null != objAry) {
			for (int i = 0; i < objAry.length; i++) {
				Sql = Sql.replace("{selectquery}", objAry[i].toString());
			}
		}
		list = (List<Map<String, Object>>) support.find(Sql);
		return list;
	}

	public List<Map<String, Object>> findAllSpecial(String Sql, Object[] objAry, Object[] parametersArray) {
		Sql = Sql.trim();
		List<Map<String, Object>> list = null;
		if (null != objAry) {
			for (int i = 0; i < objAry.length; i++) {
				Sql = Sql.replace("{selectquery}", objAry[i].toString());
			}
		}
		list = (List<Map<String, Object>>) support.find(Sql,parametersArray);
		return list;
	}
}
