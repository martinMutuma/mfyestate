package com.estate.web.stage.servlet;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.estate.util.comm.RequestUtil;

public class SessionFilter implements Filter {

	public void destroy() {

	}

	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		String requestUrl = request.getServletPath();
//		System.out.println(requestUrl);
		if (!requestUrl.startsWith("/home.shtml")
				&& !requestUrl.startsWith("/index.jsp")
				&& !requestUrl.startsWith("/search.shtml")
				&& !requestUrl.startsWith("/member/login.jsp")
				&& !requestUrl.startsWith("/member/register.jsp")
				&& !requestUrl.startsWith("/member/yanzhengma.jsp")
				&& !requestUrl.startsWith("/mem/baseinfo_checkUserNameIsExistMember.shtml")
				&& !requestUrl.startsWith("/mem/baseinfo_checkEmailIsExistMember.shtml")
				&& !requestUrl.startsWith("/mem/baseinfo_registerMember.shtml")
				&& !requestUrl.startsWith("/mem/baseinfo_loginMember.shtml")
				&& !requestUrl.startsWith("/mem/baseinfo_regisertSuccess.shtml")
				&& !requestUrl.startsWith("/district/bulidDistrictTree.shtml")
				&& !requestUrl.startsWith("/proShow.shtml")
				&& !requestUrl.startsWith("/needShow.shtml")
				&& !requestUrl.startsWith("/getMemNeedList.shtml")
				&& !requestUrl.startsWith("/news/")
				&& !requestUrl.startsWith("/news_")
				&& !requestUrl.startsWith("/news/news_")) {
			Object sessionUser = RequestUtil.getLoginUserFromSession(request,
					"");
			if (null == sessionUser) {
				RequestDispatcher requestDispatcher = request
						.getRequestDispatcher("/member/login.jsp");
				requestDispatcher.forward(request, response);
				return;
			}
		}
		chain.doFilter(req, resp);
	}

	public void init(FilterConfig arg0) throws ServletException {

	}

}
