package com.estate.util.tag;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.estate.domain.member.TmBaseinfo;
import com.estate.domain.system.TsMenu;
import com.estate.util.comm.Contants;
import com.estate.util.file.MenuUtil;

public class MenuTag extends TagSupport {

	private static final long serialVersionUID = 1L;
	String basePath;

	@SuppressWarnings("unchecked")
	public int doEndTag() throws JspException {
		try {
			HttpSession session = pageContext.getSession();
			JspWriter out = pageContext.getOut();
			TmBaseinfo baseInfo = (TmBaseinfo) session
					.getAttribute(Contants.SESSION_USER);
			HttpServletRequest request = (HttpServletRequest) pageContext
					.getRequest();
			String path = request.getContextPath();
			basePath = request.getScheme() + "://" + request.getServerName()
					+ ":" + request.getServerPort() + path + "/";
			if (null == baseInfo) {
				out.print("<script>window.location.href='" + basePath
						+ "member/login.jsp'</script>");
				return TagSupport.SKIP_PAGE;
			}
			String level = null == baseInfo.getLevel() ? "0" : baseInfo
					.getLevel().toString();
			List<TsMenu> menuList = MenuUtil.getMenuList();
			StringBuffer strBuffer = new StringBuffer();
			strBuffer.append("<link rel='stylesheet' href='" + basePath
					+ "resource/css/menu.css' type='text/css'></link>");
			// strBuffer.append("<script type='text/javascript'
			// src='"+basePath+"resource/js/menu/prototype.lite.js'
			// charset='utf-8'></script>");
			// strBuffer.append("<script type='text/javascript'
			// src='"+basePath+"resource/js/menu/moo.fx.js'
			// charset='utf-8'></script>");
			// strBuffer.append("<script type='text/javascript'
			// src='"+basePath+"resource/js/menu/moo.fx.pack.js'
			// charset='utf-8'></script>");
			strBuffer
					.append("<script type='text/javascript' src='"
							+ basePath
							+ "resource/js/menu/menuJquery.js' charset='utf-8'></script>");
			strBuffer
					.append("<table width='100%' height='280' border='0' cellpadding='0' cellspacing='0'>");
			strBuffer.append("<tr><td width='182' valign='top'>");
			strBuffer.append("<div id='container'>");
			for (Iterator iterator = menuList.iterator(); iterator.hasNext();) {
				TsMenu menu = (TsMenu) iterator.next();
				menu.bulidMenuByUserLevel(level);
				String tilteId = menu.getDescr();
				if ((null != menu.getChildren() && menu.getChildren().size() > 0)
						|| ("anyone".equals(menu.getAllowGroups()))) {
					strBuffer.append("<h1 cls='' id='" + tilteId
							+ "' class='type'><a href='javascript:void(0)'>"
							+ menu.getName() + "</a></h1>");
					bulidMenu(menu.getChildren(), strBuffer, level, tilteId);
				}
			}
			strBuffer.append("</div></td></tr></table>");
			out.print(strBuffer);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return EVAL_PAGE;
	}

	@SuppressWarnings("unchecked")
	private StringBuffer bulidMenu(List<TsMenu> menuList,
			StringBuffer strBuffer, String level, String tilteId) {
		strBuffer.append("<div pcls='' id='p"+tilteId+"' class='content'>");
		strBuffer
				.append("<table width='100%' border='0' cellspacing='0' cellpadding='0'><tr><td>");
		strBuffer
				.append("<img src='"
						+ basePath
						+ "resource/images/menu/menu_topline.gif' width='182' height='5' /></td></tr></table><ul class='MM'>");
		for (Iterator iterator = menuList.iterator(); iterator.hasNext();) {
			TsMenu menu = (TsMenu) iterator.next();
			strBuffer.append("<li>");
			String url = "hasChildren".equals(menu.getUrl()) ? "javascript:void(0)"
					: basePath + bulidUrl(menu.getUrl(), menu.getDescr());
			strBuffer.append("<a sign='" + menu.getDescr() + "' href='" + url
					+ "'>" + menu.getName() + "</a>");
			if (null != menu.getCategoryMap()) {
				strBuffer.append("<div>");
				Map<String, String> map = menu.getCategoryMap();
				for (String key : map.keySet()) {
					strBuffer.append("<span onclick='go(\"" + basePath
							+ bulidUrl(map.get(key), menu.getDescr())
							+ "\")'>&gt;&nbsp;" + key + "</span>");
				}
				strBuffer.append("</div>");
			}
			// menu.bulidMenuByUserLevel(level);
			// if (null != menu.getChildren())
			// strBuffer.append(bulidMenu(menu.getChildren(), strBuffer,level));
			strBuffer.append("</li>");
		}
		strBuffer.append("</ul></div>");
		return strBuffer;
	}

	private String bulidUrl(String url, String cls) {
		if (!"hasChildren".equals(url))
			if (url.indexOf("?") == -1)
				url += "?menuCls=" + cls;
			else
				url += "&menuCls=" + cls;
		return url;
	}
}
