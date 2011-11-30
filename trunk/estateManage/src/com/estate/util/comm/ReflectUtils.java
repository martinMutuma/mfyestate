package com.estate.util.comm;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;

import com.estate.base.annotation.Column;

/**
 * 反射工具类
 * 
 * @author FC
 * @Date 2011-03-10
 * @修订版本日志：
 * 
 * 
 */
public class ReflectUtils {
	private static Logger logger = Logger.getLogger(ReflectUtils.class);

	/**
	 * 获取实体类中属性所对应DB中的列名与该属性反射Filed的键值对
	 * 
	 * @param cls
	 *            实体类
	 * @param map
	 *            存放键值对的集合
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static Map<String, Object> bulidMap(Class cls,
			Map<String, Object> map) {
		if (null == map)
			map = new HashMap<String, Object>();
		if (null != cls) {
			Field[] fields;
			fields = cls.getDeclaredFields();
			for (int i = 0; i < fields.length; i++) {
				Field field = fields[i];
				field.setAccessible(true);
				Column ano = field.getAnnotation(Column.class);
				String fieldName = field.getName();
				String anoName = "";
				if (null != ano) {
					anoName = ano.name().toLowerCase();
					if ("reject".equals(anoName))
						continue;
					else if (!"_self".equals(anoName))
						fieldName = anoName;
				}
				map.put(fieldName, field);
			}
		}
		return map;
	}

	/**
	 * 通过反射,获得定义Class时声明的父类的范型参数的类型. 如public UserDao extends HibernateDao<User>
	 * 
	 * @param clazz
	 *            The class to introspect
	 * @return the first generic declaration, or Object.class if cannot be
	 *         determined
	 */
	@SuppressWarnings("unchecked")
	public static Class getSuperClassGenricType(Class clazz) {
		return getSuperClassGenricType(clazz, 0);
	}

	/**
	 * 通过反射,获得定义Class时声明的父类的范型参数的类型. 如public UserDao extends HibernateDao<User,Long>
	 * 
	 * @param clazz
	 *            clazz The class to introspect
	 * @param index
	 *            the Index of the generic ddeclaration,start from 0.
	 * @return the index generic declaration, or Object.class if cannot be
	 *         determined
	 */

	@SuppressWarnings("unchecked")
	public static Class getSuperClassGenricType(Class clazz, int index) {

		Type genType = clazz.getGenericSuperclass();

		if (clazz.getSimpleName().indexOf("$$EnhancerByCGLIB$$") > 0) {
			return Object.class;// 如果是代理对象就不用找了
		}

		if (!(genType instanceof ParameterizedType)) {
			logger.warn(clazz.getSimpleName()
					+ "'s superclass not ParameterizedType");
			return Object.class;
		}

		Type[] params = ((ParameterizedType) genType).getActualTypeArguments();

		if (index >= params.length || index < 0) {
			logger.warn("Index: " + index + ", Size of "
					+ clazz.getSimpleName() + "'s Parameterized Type: "
					+ params.length);
			return Object.class;
		}
		if (!(params[index] instanceof Class)) {
			logger
					.warn(clazz.getSimpleName()
							+ " not set the actual class on superclass generic parameter");
			return Object.class;
		}
		return (Class) params[index];
	}
}
