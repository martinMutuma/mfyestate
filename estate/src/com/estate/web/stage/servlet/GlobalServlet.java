package com.estate.web.stage.servlet;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.estate.util.comm.Contants;
import com.estate.util.comm.CookiesUtil;

public class GlobalServlet implements Filter {

	public static Logger log = Logger.getLogger(GlobalServlet.class);

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
//		System.out.println(httpRequest.getRequestURI());
		HttpSession session = httpRequest.getSession();
		try {
			// 登陆信息cookie
			if (null != session.getAttribute(Contants.SESSION_USER)) {
				// 已登录
			} else {
				// 未登陆,则获取cookie中的值
				String cookieStr = CookiesUtil.getCookieValue(
						Contants.COOKIE_USER_INFO, httpRequest);
				// 对其中的数据进行处理
				if (null != cookieStr && !"".equals(cookieStr)) {

				}
			}
			// 地区初始化
			if (null != session.getAttribute(Contants.SESSION_DISTRICT)) {
//				System.out.println("session"+session.getAttribute(Contants.SESSION_DISTRICT));
			} else {
				String cookieStr = CookiesUtil.getCookieValue(
						Contants.COOKIE_DISTRICT_INFO, httpRequest);
//				System.out.println("cookie"+cookieStr);
				if (null != cookieStr && !"".equals(cookieStr)) {
					String[] cookieAry = cookieStr.split(",");
					if(cookieAry.length == 2)
						session.setAttribute(Contants.SESSION_DISTRICT, cookieAry[1]);
				}
			}
		} catch (Exception e) {
			log.error("全局过滤器运行异常", e);
		}
		chain.doFilter(request, response);
	}
/*
	private String getIp(HttpServletRequest request) {
		String ipAddress = null;
		// ipAddress = this.getRequest().getRemoteAddr();
		ipAddress = request.getHeader("x-forwarded-for");
		if (ipAddress == null || ipAddress.length() == 0
				|| "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getHeader("Proxy-Client-IP");
		}
		if (ipAddress == null || ipAddress.length() == 0
				|| "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ipAddress == null || ipAddress.length() == 0
				|| "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getRemoteAddr();
			if (ipAddress.equals("127.0.0.1")) {
				// 根据网卡取本机配置的IP
				InetAddress inet = null;
				try {
					inet = InetAddress.getLocalHost();
				} catch (UnknownHostException e) {
					e.printStackTrace();
				}
				ipAddress = inet.getHostAddress();
			}

		}

		// 对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割
		if (ipAddress != null && ipAddress.length() > 15) { // "***.***.***.***".length()
			// = 15
			if (ipAddress.indexOf(",") > 0) {
				ipAddress = ipAddress.substring(0, ipAddress.indexOf(","));
			}
		}
		return ipAddress;
	}
*/
	public void init(FilterConfig filterConfig) throws ServletException {

	}

}
