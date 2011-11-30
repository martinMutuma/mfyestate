package com.estate.web.integration;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.httpclient.Cookie;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;

import com.estate.base.web.BaseAction;
import com.estate.business.pro.OfficeService;
import com.estate.business.pro.OfficeServiceImpl;
import com.estate.domain.member.TmBaseinfo;
import com.estate.util.House365Util;
import com.estate.util.comm.Contants;
import com.estate.util.comm.HttpClientUtil;
import com.estate.util.comm.RequestUtil;
import com.estate.util.file.XmlUtil;
import com.estate.util.framework.PageUtil;

/**
 * 与其他系统进行集成
 * 
 * @author F.C
 * @Time 2011/09/26 23:11
 */
public class IntegrationAction extends BaseAction {

	private static final long serialVersionUID = -7396684641779098897L;
	private static final String MAP_CLIENT = "client_";
	private static final String MAP_COOKIE = "cookie_";
	private static final String SESSION_CLIENT = "hclient-";
	private static final String SESSION_COOKIE = "siteCookie-";
	private String menuCls;

	private PageUtil pu;
	private List<Object> rows;
	private int pageNo;
	private int limit;
	private int total;

	private OfficeService officeService;

	public String getMenuCls() {
		return menuCls;
	}

	public void setMenuCls(String menuCls) {
		this.menuCls = menuCls;
	}

	public IntegrationAction() {
		officeService = new OfficeServiceImpl();
	}

	/**
	 * 模拟浏览器登陆house365
	 * 
	 * @return
	 * @throws IOException
	 */
	public String login365() throws IOException {
		String userName = RequestUtil.getParam(request, "uname", "");
		String password = RequestUtil.getParam(request, "password", "");
		String sign = "365";
		String loginUrl = XmlUtil.getValue("loginUrl-365", "integration");
		Map<String, Object> map = bulidClient(request, sign);
		HttpClient client = (HttpClient) map.get(MAP_CLIENT + sign);
		House365Util h365 = new House365Util(client);
		String cookie = (String) map.get(MAP_COOKIE + sign);
		try {
			boolean flag = h365.login(loginUrl, userName, password, cookie);
			Cookie[] cookies = client.getState().getCookies();// 取出登陆成功后，服务器返回的cookies信息，里面保存了服务器端给的“临时证”
			String tmpcookies = "";
			for (Cookie c : cookies) {
				tmpcookies = tmpcookies + c.toString() + ";";
			}
			request.getSession().setAttribute(SESSION_COOKIE + sign, client);
			if (flag)
				response.getWriter().write("1");
			else
				response.getWriter().write("2");
		} catch (HttpException e) {
			log.error("365登陆异常", e);
			response.getWriter().write("2");
		} catch (IOException e) {
			log.error("365登陆异常", e);
			response.getWriter().write("2");
		}
		return null;
	}

	/**
	 * 构建httpclient及cookie通行证
	 * 
	 * @param request
	 * @param sign
	 * @return
	 */
	private Map<String, Object> bulidClient(HttpServletRequest request,
			String sign) {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		String cookie = null == session.getAttribute(SESSION_COOKIE + sign) ? null
				: session.getAttribute(SESSION_COOKIE + sign).toString();// 通行证
		HttpClient client = (HttpClient) null == session
				.getAttribute(SESSION_CLIENT + sign) ? null
				: (HttpClient) session.getAttribute(SESSION_CLIENT + sign);
		if (null == client) {
			client = HttpClientUtil.getInstance().initCommonsHttpClient(client);
			session.setAttribute(SESSION_CLIENT + sign, client);
		}
		map.put(MAP_COOKIE + sign, cookie);
		map.put(MAP_CLIENT + sign, client);
		return map;
	}

	@SuppressWarnings("unchecked")
	public String officeManange() {
		try {
			if (pageNo <= 0)
				pageNo = 1;
			if (limit <= 0)
				limit = 20;
			String type = RequestUtil.getParam(request, "type", "1");
			Long authodId = RequestUtil.getParam(request, "authodId", 0l);
			pu = officeService.findAllOffice(type, pageNo, limit, authodId);
			List list = pu.getList();
			int count = pu.getTotalRecords();
			if (list != null && list.size() > 0) {
				total = count;
				rows = list;
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.error("写字楼管理", e);
		}
		return Contants.JSONSTRING_RESULT_NAME;
	}

	public String getUserInfo() {
		try {
			TmBaseinfo baseInfo = (TmBaseinfo) RequestUtil
					.getLoginUserFromSession(request, Contants.SESSION_USER);
			response.getWriter().print(baseInfo.getId());
		} catch (Exception e) {
			log.error("获取登陆用户错误", e);
		}
		return null;
	}
	
	public String rent365(){
		
		return "";
	}

	public PageUtil getPu() {
		return pu;
	}

	public void setPu(PageUtil pu) {
		this.pu = pu;
	}

	public List<Object> getRows() {
		return rows;
	}

	public void setRows(List<Object> rows) {
		this.rows = rows;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

}
