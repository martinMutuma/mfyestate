package com.estate.base.entity;

import java.util.HashMap;
import java.util.Map;

/**
 * 系统启动后用来存储实体对象属性与DB中字段对应集合类
 * 
 * @author FC
 * 
 */
public class OrmContainer {

	private static OrmContainer instance;
	private static Map<String, OrmVo> containerMap = new HashMap<String, OrmVo>();

	private OrmContainer() {
	}

	public static OrmContainer getInstance() {
		if (null == instance)
			instance = new OrmContainer();
		return instance;
	}

	public Map<String, OrmVo> getContainerMap() {
		return containerMap;
	}

	public void setContainerMap(Map<String, OrmVo> containerMap) {
		OrmContainer.containerMap = containerMap;
	}

}
