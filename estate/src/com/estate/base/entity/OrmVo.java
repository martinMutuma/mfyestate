package com.estate.base.entity;

import java.util.Map;

@SuppressWarnings("unchecked")
public class OrmVo {
	private String tableName;
	private Class targetCls;
	private Class targetSupCls;
	private Map<String, Object> fieldMap;

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public Class getTargetCls() {
		return targetCls;
	}

	public void setTargetCls(Class targetCls) {
		this.targetCls = targetCls;
	}

	public Class getTargetSupCls() {
		return targetSupCls;
	}

	public void setTargetSupCls(Class targetSupCls) {
		this.targetSupCls = targetSupCls;
	}

	public Map<String, Object> getFieldMap() {
		return fieldMap;
	}

	public void setFieldMap(Map<String, Object> fieldMap) {
		this.fieldMap = fieldMap;
	}
}
