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
		// 获取request string的字符串数组

		if (toType == Date.class) {
			if (null == value) {
				return null;
			}
			String[] params = (String[]) value;
			if (params.length == 0) {
				return null;
			}
			String param = (String) params[0];
			Date date = DateTimeUtil.switchStringToDate1(param);
			return null == date ? DateTimeUtil.switchStringToDate3(param)
					: date;

		} else if (toType == Double.class) {
			if (null == value) {
				return null;
			}
			String[] params = (String[]) value;
			if (params.length == 0) {
				return null;
			}
			String param = (String) params[0];
			if ("0.0".equals(param)) {
				return null;
			}
			return Double.parseDouble(param);
		} else if (toType == double.class) {
			if (null == value) {
				return null;
			}
			String[] params = (String[]) value;
			if (params.length == 0) {
				return null;
			}
			String param = (String) params[0];
			if ("0.0".equals(param)) {
				return null;
			}
			return Double.parseDouble(param);
		} else if (toType == String.class) {
			if(null == value)
				return null;
			return value.toString();
		} else {
			return value;
		}
	}

}
