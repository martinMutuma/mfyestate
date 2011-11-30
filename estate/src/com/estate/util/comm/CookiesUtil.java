package com.estate.util.comm;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookiesUtil {
	/**
	 * 获取cookie
	 * 
	 * @param cookieName
	 * @param request
	 * @return cookie
	 */
	public static Cookie getCookie(String cookieName, HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals(cookieName)) {
					return cookie;
				}
			}
		}
		return null;
	}

	/**
	 * 获取cookieValue
	 * 
	 * @param cookieName
	 * @param request
	 * @return cookieValue
	 */
	public static String getCookieValue(String cookieName, HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals(cookieName)) {
					return cookie.getValue();
				}
			}
		}
		return null;
	}

	
	/**
	 * 删除cookie
	 * 
	 * @param cookieName
	 * @param request
	 * @param response
	 * @return true发现并删除cookie false未发现cookie
	 */
	public static boolean removeCookie(String cookieName, HttpServletRequest request, HttpServletResponse response) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals(cookieName)) {
					// 设置路径
					cookie.setPath("/");
					// 设置空值
					cookie.setValue(null);
					// 立即失效
					cookie.setMaxAge(0);
					response.addCookie(cookie);
					return true;
				}
			}
		}
		return false;
	}

	/**
	 * 添加cookie
	 * 
	 * @param cookieName key
	 * @param cookieValue value
	 * @param time_second 时效 秒
	 * @param request
	 */
	public static boolean addCookie(String cookieName, String cookieValue, int time_second, HttpServletResponse response, HttpServletRequest request) {
		try {
			// (key,value)
			Cookie cookie = new Cookie(cookieName, cookieValue);
			// 设置路径
			cookie.setPath("/");
			// 时效，秒为单位
			cookie.setMaxAge(time_second);
			// 添加第一个Cookie
			response.addCookie(cookie);
			// cookie再每次更改后的response才会更新，刚更改过的cookie字符串，暂时存在request中
			request.setAttribute(cookieName + "Temp", cookieValue);
			return true;
		} catch (RuntimeException e) {
			e.printStackTrace();
			return false;
		}
	}
}
