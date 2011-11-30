package com.estate.base.support;


import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.estate.util.file.XmlUtil;

/**
 * 封装sql工具类
 * 
 * @author FC
 * 
 */
public class SqlQuery {
	Logger log = Logger.getLogger(SqlQuery.class);
	private final static String DBType = XmlUtil.getValue("dataBaseType",
			"sysConfig");
	private String sql;
	private DaoSupport support;
	private Integer start;
	private String tempSql;
	private String tableSql;
	private int num = 1;

	@SuppressWarnings("unused")
	private SqlQuery() {

	}

	public SqlQuery(String sql, DaoSupport support) {
		if (sql.indexOf("?") != -1) {
			sql = replace(sql);
		}
		this.sql = sql;
		this.support = support;
	}

	public SqlQuery(String sql) {
		if (sql.indexOf("?") != -1) {
			sql = replace(sql);
		}
		this.sql = sql;
	}

	private String replace(String sql) {
		sql = sql.replaceFirst("\\?", "\\$" + num + "\\$");
		num++;
		if (sql.indexOf("?") != -1)
			return replace(sql);
		else
			return sql;
	}

	public SqlQuery limitSql(Integer start, Integer limit) {
		tableSql = this.sql;
		this.sql = "select top " + limit + " * from (" + tableSql + ")";
		if (start > 0) {
			this.sql += " where id not in (select top " + start + " id from "
					+ tableSql + " order by id) order by id";
		}
		return this;
	}

	public SqlQuery setFirstResult(Integer start) {
		if ("1".equals(DBType))
			this.sql += " limit " + start;
		else if ("2".equals(DBType)) {
			tableSql = this.sql;
			if (start > 0)
				tempSql = " where id not in (select top " + start + " id from "
						+ tableSql + " order by id) order by id";
		}
		this.start = start;
		return this;
	}

	public SqlQuery setMaxSize(Integer limit) {
		if ("1".equals(DBType)) {
			if (this.sql.indexOf("limit") == -1)
				this.sql += " limit " + limit;
			else
				this.sql += ", " + (this.start + limit);
		}else if("2".equals(DBType)){
			this.sql = "select top " + limit + " * from (" + tableSql + ")";
			if(this.start>0)
				this.sql += tempSql;
		}
		return this;
	}

	public SqlQuery setParameters(Integer index, Object value) {
		this.sql = this.sql.replace("$" + index + "$", value.toString());
		return this;
	}

	public List<Object[]> list() {
		String sqlTmp = sql.substring(6, sql.indexOf("from"));
		String[] sqlArray = sqlTmp.split(",");
		int length = sqlArray.length;
		return support.findObjList(this.sql, length);
	}

	public List<Map<String, Object>> mapList() {
		String sqlTmp = sql.substring(6, sql.indexOf("from"));
		String[] sqlArray = sqlTmp.split(",");
		sqlArray = bulidMap(sqlArray);
		return support.find(sql, sqlArray);
	}

	public Object uniqueResult() {
		List<Object[]> list = list();
		if (null != list && list.size() > 0)
			return list.get(0);
		return null;
	}

	public String bulidSql() {
		return this.sql;
	}

	private String[] bulidMap(String[] conditionArray) {
		int length = conditionArray.length;
		String[] buf = new String[length];
		for (int j = 0; j < conditionArray.length; j++) {
			String coditionName = conditionArray[j].toLowerCase();
			int index1 = coditionName.indexOf(".");
			if (index1 >= 0) {
				coditionName = coditionName.substring(index1 + 1);
			}
			int index2 = coditionName.indexOf("as");
			if (index2 >= 0) {
				coditionName = coditionName.substring(index2 + 2).trim();
			}
			buf[j] = coditionName.trim();
		}
		return buf;
	}

	public static void main(String[] args) {
		System.out.println(new SqlQuery("select id,name from t_test ?").setFirstResult(0).setMaxSize(10).setParameters(1, "'1'").sql);
	}

}
