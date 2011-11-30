package com.estate.util.comm;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by IntelliJ IDEA. User: 石铁军 Date: 2008-4-6 Time: 20:07:36 To change
 * this template use File | Settings | File Templates.
 */

public class RequestUtil {
	/**
	 * 获取request中变量值
	 * 
	 * @param request
	 * @param name
	 * @param defval
	 *            默认值
	 * @return String
	 */
	public static final String getParam(HttpServletRequest request,
			String name, String defval) {
		String param = request.getParameter(name);
		return (param != null ? param : defval);
	}

	/**
	 * 获取request中变量值
	 * 
	 * @param request
	 * @param name
	 * @return long
	 */
	public static final long getParam(HttpServletRequest request, String name,
			long defval) {
		String param = request.getParameter(name);
		long value = defval;
		if (param != null) {
			try {
				value = Long.parseLong(param);
			} catch (NumberFormatException ignore) {
			}
		}
		return value;
	}

	/**
	 * @param request
	 * @param name
	 * @param defval
	 *            默认值
	 * @return Integer
	 */
	public static final Integer getParam(HttpServletRequest request,
			String name, Integer defval) {
		String param = request.getParameter(name);
		Integer value = defval;
		if (param != null) {
			try {
				value = Integer.valueOf(param);
			} catch (NumberFormatException ignore) {
			}
		}
		return value;
	}

	/**
	 * @param request
	 * @param name
	 * @param defval
	 *            默认值
	 * @return Integer
	 */
	public static final int getParam(HttpServletRequest request,
			String name, int defval) {
		String param = request.getParameter(name);
		int value = defval;
		if (param != null) {
			try {
				value = Integer.parseInt(param);
			} catch (NumberFormatException ignore) {
			}
		}
		return value;
	}
	
	public static String changeEncoding(String input, String sourceEncoding,
			String targetEncoding) {
		if (input == null || input.equals("")) {
			return input;
		}

		try {
			byte[] bytes = input.getBytes(sourceEncoding);
			return new String(bytes, targetEncoding);
		} catch (Exception ex) {
		}
		return input;
	}

	/**
	 * 从session中取出登录用户对象
	 * 
	 * @param request
	 * @param session_user_name
	 *            缺省情况默认为contants下SESSION_USER属性值
	 * @return
	 */
	public static Object getLoginUserFromSession(HttpServletRequest request,
			String session_user_name) {
		return request
				.getSession()
				.getAttribute(
						(null == session_user_name || ""
								.equals(session_user_name)) ? Contants.SESSION_USER
								: session_user_name);
	}

	/**
	 * 将登录用户对象存入session
	 * 
	 * @param request
	 * @param session_user_name
	 *            缺省情况默认为contants下SESSION_USER属性值
	 * @param userObject
	 */
	public static void setLoginUser2Session(HttpServletRequest request,
			String session_user_name, Object userObject) {
		request
				.getSession()
				.setAttribute(
						(null == session_user_name || ""
								.equals(session_user_name)) ? Contants.SESSION_USER
								: session_user_name, userObject);
	}

	/**
	 * 修改当前session中的用户对象
	 * 
	 * @param request
	 * @param session_user_name
	 *            缺省情况默认为contants下SESSION_USER属性值
	 * @param userObject
	 */
	public static void reSetLoginUser2Session(HttpServletRequest request,
			String session_user_name, Object userObject) {
		request
				.getSession()
				.removeAttribute(
						(null == session_user_name || ""
								.equals(session_user_name)) ? Contants.SESSION_USER
								: session_user_name);
		request
				.getSession()
				.setAttribute(
						(null == session_user_name || ""
								.equals(session_user_name)) ? Contants.SESSION_USER
								: session_user_name, userObject);
	}
}
