package com.estate.util.framework;

import java.util.Date;
import java.util.Map;

import ognl.DefaultTypeConverter;

import com.estate.util.comm.DateTimeUtil;

/**
 * 处理页面和action之间的日期转换器
 * 
 * @author fc
 * 
 */
public class DateConverter extends DefaultTypeConverter {

	@SuppressWarnings("unchecked")
	@Override
	public Object convertValue(Map context, Object value, Class toType) {
		// String to Date
		if (toType == Date.class) {
			// 获取request string的字符串数组
			if (null == value) {
				return null;
			}
			String[] params = (String[]) value;
			if (params.length == 0) {
				return null;
			}
			String param = (String) params[0];
			return null==DateTimeUtil.switchStringToDate1(param)?DateTimeUtil.switchStringToDate3(param):DateTimeUtil.switchStringToDate1(param);

		} else {

		}
		return null;
	}

}
