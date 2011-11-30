package com.estate.base.support;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.estate.util.file.XmlUtil;

/**
 * 封装sql工具类 2011-11-11 第一次优化修订
 * 
 * @author FC
 * 
 */
public class SqlQuery {
	Logger log = Logger.getLogger(SqlQuery.class);
	private final static String DBType = XmlUtil.getValue("dataBaseType",
			"sysConfig");
	private String sql;// 需执行的sql
	private DaoSupport support;// 与db进行交互的基础支撑
	private Integer start = -1;// 开始位置
	private ParameterMetadata pm;

	@SuppressWarnings("unused")
	private SqlQuery() {

	}

	// constrocters

	public SqlQuery(String sql, DaoSupport support) {
		this.sql = sql;
		this.support = support;
		pm = new ParameterMetadata(sql);
	}

	public SqlQuery(String sql) {
		this.sql = sql;
		pm = new ParameterMetadata(sql);
	}

	public SqlQuery(String sql, Object[] conditionAry) {
		this.sql = sql;
		pm = new ParameterMetadata(sql);
		if (pm.getOrdinalParameterCount() < 0) {
			throw new IllegalAccessError(
					"No positional parameters in query, please change Constructor");
		} else {
			for (int i = 0; i < conditionAry.length; i++) {
				pm.getNamedDescriptorMap().put(i + 1, conditionAry[i]);
			}
		}
	}

	public SqlQuery(String sql, Object[] conditionAry, DaoSupport support) {
		this.sql = sql;
		this.support = support;
		pm = new ParameterMetadata(sql);
		if (pm.getOrdinalParameterCount() < 0) {
			throw new IllegalAccessError(
					"No positional parameters in query, please change Constructor");
		} else {
			for (int i = 0; i < conditionAry.length; i++) {
				pm.getNamedDescriptorMap().put(i + 1, conditionAry[i]);
			}
		}
	}

	public SqlQuery(String sql, Boolean flag) {
		this.sql = sql;
	}

	public SqlQuery(String sql, DaoSupport support, Boolean flag) {
		this.sql = sql;
		this.support = support;
	}

	public SqlQuery setFirstResult(Integer start) {
		if ("1".equals(DBType))
			this.sql += " limit " + start;
		else if ("2".equals(DBType)) {
			if (start > 0)
				sql += " where id not in (select top " + start + " id from "
						+ sql + " order by id) order by id";
		}
		this.start = start;
		return this;
	}

	public SqlQuery setMaxSize(Integer limit) {
		if ("1".equals(DBType)) {
			if (this.sql.indexOf("limit") == -1)
				this.sql += " limit " + limit;
			else
				this.sql += ", " + (limit);
		} else if ("2".equals(DBType)) {
			this.sql = "select top " + limit + " * from (" + this.sql + ")";
		}
		return this;
	}

	public SqlQuery limitSql(Integer start, Integer limit) {
		if ("1".equals(DBType)) {
			this.sql += " limit " + start + ", " + limit;
		} else if ("2".equals(DBType)) {
			String tableSql = this.sql;
			this.sql = "select top " + limit + " * from (" + tableSql + ")";
			if (start > 0) {
				this.sql += " where id not in (select top " + start
						+ " id from " + tableSql + " order by id) order by id";
			}
		}
		return this;
	}

	public SqlQuery bulidPageUtil(Object[] objAry, int start, int limit) {
		Object[] obj = null;
		if ("1".equals(DBType)) {
			this.sql += " limit ?, ? ";
			obj = new Object[objAry.length + 2];
			cloneObjArray(obj, objAry, 0);
			obj[objAry.length] = Integer.valueOf(start);
			obj[objAry.length + 1] = Integer.valueOf(limit);
		} else if ("2".equals(DBType)) {
			if (this.start > 0) {
				this.sql += " where id not in (select top " + start
						+ " id from " + this.sql + " order by id) order by id";
				this.sql = "select top " + limit + " * from (" + this.sql + ")";
				obj = new Object[objAry.length + 2];
				obj[0] = Integer.valueOf(limit);
				cloneObjArray(obj, objAry, 1);
				obj[objAry.length + 1] = Integer.valueOf(start);
			} else {
				this.sql = "select top ? * from (" + this.sql + ")";
				obj = new Object[objAry.length + 1];
				obj[0] = Integer.valueOf(limit);
				cloneObjArray(obj, objAry, 1);
			}
		}
		for (int i = 0; i < obj.length; i++) {
			pm.getNamedDescriptorMap().put(i + 1, obj[i]);
		}
		return this;
	}

	public SqlQuery setParameters(Integer position, Object value) {
		if (pm.getOrdinalParameterCount() == -1)
			throw new IllegalArgumentException(
					"No positional parameters in query:" + bulidSql());
		if (position <= 0 || position > pm.getOrdinalParameterCount())
			throw new IllegalArgumentException(
					"Positional parameter does not exist: " + position
							+ " in query: " + bulidSql());
		pm.getNamedDescriptorMap().put(position, value);
		return this;
	}

	public List<Object[]> list() {
		if (null == support) {
			throw new IllegalAccessError("no support found");
		}
		return support.findObjList(this.sql);
	}

	public List<Map<String, Object>> mapList() {
		if (null == support) {
			throw new IllegalAccessError("no support found");
		}
		if(this.pm.getOrdinalParameterCount()>=0)
			return support.find(sql,getObjectAry());
		else
			return support.find(sql);
	}

	public List<Map<String, Object>> mapList(Object[] obj) {
		if (null == support) {
			throw new IllegalAccessError("no support found");
		}
		return support.find(sql, obj);
	}

	public Object uniqueResult() {
		List<Object[]> list = list();
		if (null != list && list.size() > 0)
			return list.get(0);
		return null;
	}

	public String bulidSql() {
		String sql = this.sql;
		if (this.pm.getOrdinalParameterCount() != -1) {
			for (int i = 0; i < pm.getNamedDescriptorMap().size(); i++) {
				sql = sql.replaceFirst("\\?", this.pm.getNamedDescriptorMap()
						.get(i + 1).toString());
			}
		}
		return sql;
	}

	public Object[] getObjectAry() {
		Object[] objectAry = new Object[this.pm.getNamedDescriptorMap().size()];
		for (int i = 0; i < objectAry.length; i++) {
			objectAry[i] = this.pm.getNamedDescriptorMap().get(i + 1);
		}
		return objectAry;
	}


	private Object[] cloneObjArray(Object[] targetArray, Object[] sourceArray,
			int start) {
		for (int i = 0; i < sourceArray.length; i++) {
			targetArray[start + i] = sourceArray[i];
		}
		return targetArray;
	}

	public static void main(String[] args) {
		System.out.println(new SqlQuery("select id,name from t_test ?")
				.setFirstResult(2).setMaxSize(10).setParameters(1, "1")
				.bulidSql());
	}

}
