package com.estate.util.comm;

import java.lang.reflect.Field;
import java.lang.reflect.Method;


/**
 * 对象操作类
 * 
 * @author lgc
 * 
 */
public class PojoPropertiesUtil {
	private static PojoPropertiesUtil instance;

	private PojoPropertiesUtil() {

	}

	public static PojoPropertiesUtil getInstance() {
		if (null == instance)
			instance = new PojoPropertiesUtil();
		return instance;
	}

	/**
	 * 将源对象中的值存入目标对象
	 * 
	 * @param targetObj
	 *            目标对象
	 * @param sourceObj
	 *            源对象
	 * @return targetObj
	 */
	@SuppressWarnings("unchecked")
	public Object copyProperties(Object targetObj, Object sourceObj) {
		try {
			Class targetClass = targetObj.getClass();
			Class sourceClass = sourceObj.getClass();
			Field[] sourceFields;
			sourceFields = sourceClass.getDeclaredFields();
			for (int i = 0; i < sourceFields.length; i++) {
				Field field = sourceFields[i];
				field.setAccessible(true);
				if (null == field.get(sourceObj))
					continue;
				String fieldName = field.getName();
				if ("serialVersionUID".equals(fieldName.trim()))
					continue;
				Object value = field.get(sourceObj);
				Method getMethod = targetClass.getMethod("get"
						+ fieldName.substring(0, 1).toUpperCase()
						+ fieldName.substring(1));
				Method setMethod = null;
				Class paramType = getMethod.getReturnType();
				String pT = paramType.getName();
				Class[] obj = null;
				if ("java.lang.Integer".equals(pT)) {
					obj = new Class[] { Integer.class };
				} else if (("java.lang.String").equals(pT)) {
					obj = new Class[] { String.class };
				} else if (("java.lang.Float").equals(pT)) {
					obj = new Class[] { Float.class };
				} else if (("java.lang.Double").equals(pT)) {
					obj = new Class[] { Double.class };
				} else if ("java.util.Date".equals(pT)) {
					obj = new Class[] { java.util.Date.class };
				} else if ("java.lang.Short".equals(pT)) {
					obj = new Class[] { Short.class };
				} else if ("java.sql.Date".equals(pT)) {
					obj = new Class[] { java.sql.Date.class };
				} else {
					continue;
				}
				setMethod = targetClass.getMethod("set"
						+ fieldName.substring(0, 1).toUpperCase()
						+ fieldName.substring(1), obj);
				setMethod.invoke(targetObj, value);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return targetObj;
	}

	public Object copy(Object object) {
		Class<?> typeObject = object.getClass();
		System.out.println(typeObject.getName());
		try {
			Object targetObj = typeObject.getConstructor(new Class[] {})
					.newInstance(new Object[] {});
			Field[] fields = typeObject.getDeclaredFields();
			for (int i = 0; i < fields.length; i++) {
				Field field = fields[i];
				String fieldName = field.getName();
				String setName = "set"
						+ fieldName.substring(0, 1).toUpperCase()
						+ fieldName.substring(1);
				String getName = "get"
						+ fieldName.substring(0, 1).toUpperCase()
						+ fieldName.substring(1);
				Method setMethod = typeObject.getMethod(setName,
						new Class[] { field.getType() });
				Method getMethod = typeObject
						.getMethod(getName, new Class[] {});
				Object value = getMethod.invoke(object, new Object[] {});
				setMethod.invoke(targetObj, new Object[] { value });
			}
			return targetObj;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
