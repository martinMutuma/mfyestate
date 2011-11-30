package com.estate.base.web;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import com.estate.util.comm.CharacterUtil;

public class SetCharacterEncodingFilter implements Filter {
	protected String encoding = null;// 编码格式
	protected FilterConfig filterConfig = null;// 配置

	public void destroy() {
		// 释放资源
		this.encoding = null;
		this.filterConfig = null;
	}

	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		if (request.getMethod().equalsIgnoreCase("post")) {
			// 如果是通过post方法提交的数据
			request.setCharacterEncoding(encoding);
		} else {
			// 如果get方式方式提交，则调用重写的方法
			request = new Request(request);
		}

		// 设置
		resp.setCharacterEncoding(encoding);

		chain.doFilter(request, resp);
	}

	public void init(FilterConfig cfg) throws ServletException {
		// 从web.xml中读取initParam的参数encoding值
		this.filterConfig = cfg;
		this.encoding = cfg.getInitParameter("encoding");

	}

	// 继承HttpServletRequest的默认实现类HttpServletRequestWrapper
	// 重写其中的getParameter和getParameterValues方法
	class Request extends HttpServletRequestWrapper {

		public Request(HttpServletRequest request) {
			super(request);
		}

		// 从父类中获取已经传入的request对象
		private HttpServletRequest getHttpServletRequest() {
			return (HttpServletRequest) super.getRequest();
		}

		@Override
		public String getParameter(String name) {
			String str = this.getHttpServletRequest().getParameter(name);
			if (str != null) {
				str = this.setCharset(str);
			}

			return str;
		}

		@Override
		public String[] getParameterValues(String name) {
			String values[] = getHttpServletRequest().getParameterValues(name);
			if (values != null) {
				for (int i = 0; i < values.length; i++) {
					values[i] = setCharset(values[i]);
				}
			}
			return values;
		}

		// 转换编码
		public String setCharset(String input) {
			try {
				return CharacterUtil.encode(input);
			} catch (Exception e) {
				e.printStackTrace();
			}

			return null;
		}

	}

}
