package com.estate.web.member.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import com.estate.base.web.BaseAction;
import com.estate.business.member.BaseInfoService;
import com.estate.business.member.BaseInfoServiceImpl;
import com.estate.business.member.MessageService;
import com.estate.business.member.MessageServiceImpl;
import com.estate.domain.member.MystoreVO;
import com.estate.domain.member.StatisticsVO;
import com.estate.domain.member.TmBaseinfo;
import com.estate.domain.member.TsMessage;
import com.estate.util.Base64;
import com.estate.util.MD5Encode;
import com.estate.util.comm.Contants;
import com.estate.util.comm.DateTimeUtil;
import com.estate.util.comm.RequestUtil;
import com.estate.util.file.FileUtil;
import com.estate.util.file.XmlUtil;
import com.estate.util.framework.PageUtil;
import com.estate.util.mail.MailInfo;
import com.estate.util.mail.MailUtil;
import com.opensymphony.xwork2.ActionContext;

public class BaseInfoAction extends BaseAction {

	private static final long serialVersionUID = 7730284833959800414L;
	private BaseInfoService service;
	private int reLogin;
	private TmBaseinfo tb;
	private String imgchk;
	private String userPwd;
	private File imageFile;
	private String imageFileFileName;
	private StatisticsVO svo;
	private List<TsMessage> messList;
	private MessageService mseeageService;
	private TsMessage ts;
	private int pageSize = 10; // 一页显示的记录数
	private PageUtil pu;// 分页工具类
	private String pageNo;
	private String limit;
	private int rowCount; // 记录总数
	private int pageCount; // 总页数
	private int currentPage; // 当前页码
	private String menuIndex;
	private List<MystoreVO> myStorePageList = new ArrayList<MystoreVO>();// 我的店铺每页list

	public BaseInfoAction() {
		service = new BaseInfoServiceImpl();
		mseeageService = new MessageServiceImpl();
	}

	/**
	 * 登陆
	 * 
	 * @return
	 * @throws IOException
	 */
	public String loginMember() throws IOException {
		try {
			Map<String, Object> map = ActionContext.getContext().getSession();
			String code = (String) map.get("rand");
			String ifClient = RequestUtil.getParam(request, "clientLogin",
					"false");
			if (!"true".equals(ifClient))
				if (null != imgchk && !imgchk.equals(code)) {
					reLogin = 2;// 验证码错误
					try {
						response.getWriter().print(reLogin);
					} catch (IOException e) {
						e.printStackTrace();
					}
					return null;
				}
			reLogin = 0;
			String username = RequestUtil.getParam(request, "username", "");
			String password = RequestUtil.getParam(request, "password", "");
			if (null == tb) {
				tb = new TmBaseinfo();
				tb.setUsername(username);
				tb.setPassword(password);
			}
			List<TmBaseinfo> list = service.menberLogin(tb.getUsername(),
					MD5Encode.getMD5Encode(tb.getPassword()));
			if (list.size() == 0) {
				reLogin = 0;// 登陆失败
			} else {
				tb = list.get(0);
				if (!DateTimeUtil.getDateToString(tb.getLastLoginTime(),
						"yyyy-MM-dd").equals(
						DateTimeUtil.getDateToString(new Date(), "yyyy-MM-dd"))) {
					tb.setIntegral((null == tb.getIntegral() ? 0 : tb
							.getIntegral()) + 5);// 登陆积分加5
					tb.setTotalIntegral((null == tb.getTotalIntegral() ? 0 : tb
							.getTotalIntegral()) + 5);
					tb.setLevel(service.getMemberLevel(tb));
					Object firstLogin = request.getSession().getAttribute(
							"firstLogin");
					if (null == firstLogin) {
						request.getSession()
								.setAttribute("firstLogin", "first");
					} else {
						request.getSession().removeAttribute("firstLogin");
						request.getSession()
								.setAttribute("firstLogin", "first");
					}
				}
				tb.setHonorHeadUrl(service.getHonorHeadUrl(tb));
				tb.setLastLoginTime(new Date());// 记录最后一次登陆时间
				tb.setHonorTypeString(service.getHononrType(tb));
				RequestUtil.setLoginUser2Session(request, "", tb);
				try {
					service.saveOrUpdate(tb);
				} catch (Exception e) {
					e.printStackTrace();
				}
				reLogin = 1;
			}
		} catch (Exception e) {
			reLogin = 0;
			log.error("会员登陆错误", e);
		}
		try {
			response.getWriter().print(reLogin);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 注册
	 * 
	 * @return
	 * @throws IOException
	 */
	public String registerMember() throws IOException {
		Map<String, Object> map = ActionContext.getContext().getSession();
		String code = (String) map.get("rand");
		if (null != imgchk && !imgchk.equals(code)) {
			response.getWriter().print("<script>parent.fail();</script>");
			return null;// "registerPage";
		} else {
			if (null != tb.getId()) {
				try {
					TmBaseinfo tbDB = (TmBaseinfo) RequestUtil
							.getLoginUserFromSession(request,
									Contants.SESSION_USER);
					if (null != tbDB && tbDB.getId().equals(tb.getId())) {
						tb.setPassword(tbDB.getPassword());
						// 保存头像图片
						if (imageFile != null) {
							String basePath = request.getSession()
									.getServletContext().getRealPath("/");
							String imagePatn = XmlUtil.getValue("imgPath",
									"sysConfig")
									+ "/";
							String message = this.checkImage(imageFile);
							if (message.length() > 1) {
								response
										.setContentType("text/html;charset=utf-8");
								PrintWriter out = null;
								try {
									out = response.getWriter();
									out
											.println("<script>alert('"
													+ message
													+ "');window.history.back(-1);</script>");
								} catch (IOException e) {
									e.printStackTrace();
								}
								return null;
							}
							String fileName = tb.getUsername()
									+ imageFileFileName
											.substring(imageFileFileName
													.lastIndexOf("."));
							if (FileUtil.doUpFile(basePath + imagePatn
									+ fileName, imageFile))
								tb.setHeadUrl(fileName);
						} else {
							tb.setHeadUrl(tbDB.getHeadUrl());
						}
					}
					service.saveOrUpdate(tb);
				} catch (Exception e) {
					e.printStackTrace();
				}
				// response.getWriter().print(
				// "<script>parent.window.location.href='" + bath
				// + "/mem/baseinfo_mainPage.shtml?id="
				// + tb.getId() + "';</script>");
				tb.setHonorTypeString(service.getHononrType(tb));
				RequestUtil.reSetLoginUser2Session(request, "", tb);
				return "mainPage";// 转向个人主页
			} else {
				Long bid = null;
				tb.setPassword(MD5Encode.getMD5Encode(tb.getPassword()));
				tb.setCreateTime(new Date());
				try {
					bid = service.saveEntity(tb);
					tb.setId(bid);
				} catch (Exception e) {
					e.printStackTrace();
				}
				// response.getWriter().print(
				// "<script>parent.window.location.href='" + bath
				// + "/mem/baseinfo_regisertSuccess.shtml?id="
				// + bid + "';</script>");
				tb.setHonorTypeString(service.getHononrType(tb));
				RequestUtil.setLoginUser2Session(request, "", tb);
				return "skipPage";
			}
		}
	}

	/**
	 * 页面跳转
	 * 
	 * @return
	 */
	public String mainPage() {
		menuIndex = "0";
		menuCls = String.valueOf(31);
		tb = (TmBaseinfo) RequestUtil.getLoginUserFromSession(request,
				Contants.SESSION_USER);
		if (tb == null)
			return "loginPage";
		try {
			if (null == pageNo || "".equals(pageNo))
				pageNo = "1";
			if (null == limit || "".equals(limit))
				limit = "10";
			try {
				pu = mseeageService.getMessageByLoginId(tb.getId().toString(),"1", new Integer(pageNo),
						new Integer(limit));
			} catch (Exception e) {
				e.printStackTrace();
			}
			tb.setHonorTypeString(service.getHononrType(tb));
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (null == messList || messList.size() == 0)
			messList = new ArrayList<TsMessage>();
		HttpSession session = request.getSession();
		String type = RequestUtil.getParam(request, "type", "");
		Object firstLogin = session.getAttribute("firstLogin");
		svo = service.getStatisticsInfoByLoginId(tb.getId());
		if ("first".equals(firstLogin)) {
			reLogin = 9;// 首次登陆
			session.setAttribute("firstLogin", "true");
		}
		if ("fullInfo".equals(type))
			return "fixInfoPage";// 完善个人信息页面
		return "mainPage";// 转向个人主页
	}

	/**
	 * 修改密码
	 * 
	 * @return
	 */
	public String changePassMember() {
		tb = (TmBaseinfo) RequestUtil.getLoginUserFromSession(request,
				Contants.SESSION_USER);
		request.removeAttribute("modPassSuccess");
		reLogin = 1;
		return "modPassPage";
	}

	/**
	 * 保存新密码
	 * 
	 * @return
	 */
	public String saveNewPassMember() {
		HttpSession session = request.getSession();
		List<TmBaseinfo> list = service.menberLogin(tb.getUsername(), MD5Encode
				.getMD5Encode(tb.getPassword()));
		if (list.size() == 0) {
			reLogin = 0;// 密码修改失败
			return "modPassPage";
		} else {
			tb = list.get(0);
			tb.setPassword(MD5Encode.getMD5Encode(userPwd));
			service.saveOrUpdate(tb);
			Object firstLogin = session.getAttribute("modPassSuccess");
			if (null == firstLogin) {
				reLogin = 8;// 密码修改成功
				session.setAttribute("modPassSuccess", "true");
			}
			return "mainPage";
		}
	}

	/**
	 * 跳转资料修改页面
	 * 
	 * @return
	 */
	public String modUserInfoPage() {
		tb = (TmBaseinfo) RequestUtil.getLoginUserFromSession(request,
				Contants.SESSION_USER);
		if (null == tb)
			return "loginPage";
		List<TmBaseinfo> list = service.menberLogin(tb.getUsername(), tb
				.getPassword());
		tb = list.get(0);
		RequestUtil.reSetLoginUser2Session(request, "", tb);
		return "modUserInfoPage";
	}

	/**
	 * 检测用户名是否存在
	 * 
	 * @return
	 */
	public String checkUserNameIsExistMember() {
		String username = RequestUtil.getParam(request, "username", "");
		List<TmBaseinfo> list = null;
		try {
			list = service.checkUserNameIsExistMember(username);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		if (null == list || list.size() == 0) {
			reLogin = 1;// 该用户名不存在
		} else {
			reLogin = 0;// 该用户名存在
		}
		try {
			response.getWriter().print(reLogin);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 检测邮箱是否存在
	 * 
	 * @return
	 */
	public String checkEmailIsExistMember() {
		String email = RequestUtil.getParam(request, "email", "");
		List<TmBaseinfo> list = null;
		try {
			list = service.checkEmailIsExistMember(email);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		if (null == list || list.size() == 0) {
			reLogin = 1;// 该用户名不存在
		} else {
			reLogin = 0;// 该用户名存在
		}
		try {
			response.getWriter().print(reLogin);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 检测手机号是否存在
	 * 
	 * @return
	 */
	public String checkMobileIsExistMember() {
		String mobile = RequestUtil.getParam(request, "mobile", "");
		List<TmBaseinfo> list = null;
		try {
			list = service.checkMobileIsExistMember(mobile);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		if (null == list || list.size() == 0) {
			reLogin = 1;// 该用户名不存在
		} else {
			reLogin = 0;// 该用户名存在
		}
		try {
			response.getWriter().print(reLogin);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 验证图片大小
	 * 
	 * @return
	 */
	public String checkImage(File file) {
		if (file != null) {
			if (file.length() > 102400)
				return new StringBuffer("图片超过100k，请修改图片大小").toString();
		}
		return "1";
	}

	/**
	 * 根据用户名检测邮箱是否存在
	 * 
	 * @return
	 */
	public String checkEmailIsExistMemberAndUseName() {
		String email = RequestUtil.getParam(request, "email", "");
		String username = RequestUtil.getParam(request, "username", "");
		List<TmBaseinfo> list = null;
		try {
			list = service.checkEmailIsExistMemberAndUseName(email, username);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		if (null == list || list.size() == 0) {
			reLogin = 1;// 该用户名不存在
		} else {
			reLogin = 0;// 该用户名存在
		}
		try {
			response.getWriter().print(reLogin);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 我的店铺
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String toMyStore() {
		String authorId = RequestUtil.getParam(request, "authorId", "");
		String type = RequestUtil.getParam(request, "type", "");
		tb = service.read(Long.parseLong(authorId));
		currentPage = RequestUtil.getParam(request, "page", 1);
		List<MystoreVO> myStoreAllList = new ArrayList<MystoreVO>();
		myStoreAllList = service.getMyStoreByAuthorId(authorId, type);
		int start = (currentPage - 1) * pageSize;
		int limit1 = pageSize;
		rowCount = myStoreAllList.size();
		pageCount = getPageCount(rowCount, limit1);
		if (myStoreAllList.size() > 0)
			myStorePageList = myStoreAllList
					.subList(
							(start > 0 ? start : 0),
							(myStoreAllList.size() < ((start > 0 ? start : 0) + limit1) ? myStoreAllList
									.size()
									: ((start > 0 ? start : 0) + limit1)));
		request.getSession().setAttribute("type", type);
		// 公告
		String flag = RequestUtil.getParam(request, "flag", "3");
		List<TsMessage> list = null;
		
		if (null == pageNo || "".equals(pageNo))
			pageNo = "1";
		if (null == limit || "".equals(limit))
			limit = "10";
		try {
			pu = mseeageService.getMessageByLoginId(tb.getId().toString(),flag, new Integer(pageNo),
					new Integer(limit));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (null == list || list.size() == 0)
			ts = new TsMessage();
		else
			ts = list.get(0);
		return "mystore";
	}

	/**
	 * 修改个人头衔
	 * 
	 * @return
	 */
	public String updateHonorType() {
		tb = (TmBaseinfo) RequestUtil.getLoginUserFromSession(request,
				Contants.SESSION_USER);
		String role = RequestUtil.getParam(request, "role", tb.getHonorType());
		if (null == tb) {
			reLogin = 0;
			return "loginPage";
		} else {
			tb.setHonorType(role);
			service.saveOrUpdate(tb);
			reLogin = 1;
		}
		try {
			response.getWriter().print(reLogin);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 发送邮件找回密码
	 * 
	 * @return
	 */
	public String findPass() {

		return null;
	}

	/**
	 * 得到总页数
	 * 
	 * @param rowCount
	 * @param limit
	 * @return
	 */
	public int getPageCount(int rowCount, int limit) {
		return rowCount <= limit ? 1 : (((rowCount / limit) == (rowCount
				/ limit * limit)) ? rowCount / limit : (rowCount / limit + 1));
	}

	/**
	 * 读取找回密码文件
	 */
	public String getPass() {
		String username = RequestUtil.getParam(request, "username", "");
		String email = RequestUtil.getParam(request, "email", "");
		List<TmBaseinfo> list = null;
		try {
			list = service.checkEmailIsExistMemberAndUseName(email, username);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		TmBaseinfo obj = null;
		if (null == list || list.size() == 0) {
			reLogin = 2;// 该用户名不存在
			try {
				response.getWriter().print(reLogin);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		} else {
			obj = list.get(0);
		}

		try {
			String passwordFilePath = XmlUtil.getValue("findPasswordFilePath",
					"sysConfig")
					+ "/";
			String basePath = request.getSession().getServletContext()
					.getRealPath("/");
			FileUtil.logFile(basePath + passwordFilePath + "/pass.txt",
					username
							+ "#_#"
							+ Base64.encodeString(username + ","
									+ new Date().getTime()));
			String pass = getRandomNum();
			obj.setPassword(pass);
			if (sendmail(obj)) {
				obj.setPassword(MD5Encode.getMD5Encode(pass));
				service.saveOrUpdate(obj);
				reLogin = 1; // 成功
			}
		} catch (Exception e) {
			e.printStackTrace();
			reLogin = 2; // 失败
		}
		try {
			response.getWriter().print(reLogin);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean sendmail(TmBaseinfo tmBaseinfo) {
		MailInfo obj = new MailInfo();
		obj.setSmtpServer("smtp.126.com");
		obj.setMailFrom("rosham@126.com");
		obj.setMailTo(tmBaseinfo.getEmail());
		obj.setUserName("rosham");
		obj.setPassword("zhenghao1011");
		obj.setTitle("亲爱的 "+tmBaseinfo.getRealName()+"，请重新设置你的【梦房园】帐户密码！");
		obj
				.setText("             亲爱的梦房园用户，您好！感谢您一直以来对[梦房园]的支持。\r\n \r\n");
		obj.setText(obj.getText() + "                        您的用户名是："
				+ tmBaseinfo.getUsername() + "  \r\n \r\n");
		obj.setText(obj.getText() + "                        当前的密码是："
				+ tmBaseinfo.getPassword() + "\r\n \r\n\r\n");
		obj.setText(obj.getText()
				+ "                        为了您个人资料的安全，请您尽快登陆登录梦房园：http://www.mymfy.com进入个人中心修改当前密码。谢谢！\r\n");
		obj
				.setText(obj.getText()
						+ "                                                (如果不能点击该链接地址，请复制并粘贴到浏览器的地址输入框)\r\n\r\n");
		obj.setText(obj.getText()
				+ "                                         感谢您使用梦房园\r\n");
		obj
				.setText(obj.getText()
						+ "                        --------------------------------------------------------------------------------------------------\r\n\r\n");
		obj.setText(obj.getText()
				+ "                        此信由梦房园系统发出，不接收回信，请勿直接回复。\r\n\r\n");
		obj
				.setText(obj.getText()
						+ "                        如有任何疑问，请与客服人员联系或者访问梦房园http://www.mymfy.com与我们取得联系。\r\n\r\n");
		obj.setText(obj.getText()
				+ "                                                                梦房园版权所有");
		return MailUtil.sendMail(obj);
	}

	private static String getRandomNum() {
		Random r = new Random();
		return String.valueOf(r.nextInt(900000) + 100000);
	}

	public String getImgchk() {
		return imgchk;
	}

	public void setImgchk(String imgchk) {
		this.imgchk = imgchk;
	}

	public TmBaseinfo getTb() {
		return tb;
	}

	public void setTb(TmBaseinfo tb) {
		this.tb = tb;
	}

	public int getReLogin() {
		return reLogin;
	}

	public void setReLogin(int reLogin) {
		this.reLogin = reLogin;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getRowCount() {
		return rowCount;
	}

	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public StatisticsVO getSvo() {
		return svo;
	}

	public void setSvo(StatisticsVO svo) {
		this.svo = svo;
	}

	public File getImageFile() {
		return imageFile;
	}

	public void setImageFile(File imageFile) {
		this.imageFile = imageFile;
	}

	public String getImageFileFileName() {
		return imageFileFileName;
	}

	public void setImageFileFileName(String imageFileFileName) {
		this.imageFileFileName = imageFileFileName;
	}

	public List<TsMessage> getMessList() {
		return messList;
	}

	public void setMessList(List<TsMessage> messList) {
		this.messList = messList;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public List<MystoreVO> getMyStorePageList() {
		return myStorePageList;
	}

	public void setMyStorePageList(List<MystoreVO> myStorePageList) {
		this.myStorePageList = myStorePageList;
	}

	public TsMessage getTs() {
		return ts;
	}

	public void setTs(TsMessage ts) {
		this.ts = ts;
	}

	public String getMenuIndex() {
		return menuIndex;
	}

	public void setMenuIndex(String menuIndex) {
		this.menuIndex = menuIndex;
	}
	public static void main(String[] args) {
		System.out.println(9*16+9);
		System.out.println(11*16+11);
		System.out.println(14*16+8);
	}

	public PageUtil getPu() {
		return pu;
	}

	public void setPu(PageUtil pu) {
		this.pu = pu;
	}

	public String getPageNo() {
		return pageNo;
	}

	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}

	public String getLimit() {
		return limit;
	}

	public void setLimit(String limit) {
		this.limit = limit;
	}
}
