package com.estate.business.web.action;

import java.util.List;

import com.estate.base.web.BaseAction;
import com.estate.business.service.UserService;
import com.estate.business.service.UserServiceImpl;
import com.estate.domain.TsUser;
import com.estate.util.comm.Contants;
import com.estate.util.comm.RequestUtil;

/**
 * 系统用户相关Action
 * @author FC
 *
 */
public class UserAction extends BaseAction {

	private static final long serialVersionUID = 688970037309060648L;

	private TsUser user;
	private String errorMessage;
	private String newPassword;
	private List<TsUser> tsUserList;

	private UserService service;

	public UserAction() {
		service = new UserServiceImpl();
	}

	/**
	 * 处理用户登录请求
	 * @return
	 */
	public String login() {
		response.setCharacterEncoding("utf-8");
		try {
			if (null != user)
				user = service.checkLogin(user.getUsername(), user.getPassword());
			if (null == user) {
				errorMessage = "用户名或密码错误，请重试!";
				return "login_error";
			}
			request.getSession().setAttribute(Contants.SESSION_USER, user);
		} catch (Exception e) {
			errorMessage = "用户名或密码错误，请重试!";
			log.error("执行用户登录出错", e);
			return "login_error";
		}
		return "login_success";
	}

	public String leftPage(){
		return "leftPage";
	}
	
	public String getSessionUserInfo() {
		response.reset();
		response.setCharacterEncoding("utf-8");
		try {
			user = (TsUser) RequestUtil.getLoginUserFromSession(request, "");
			String resultStr = "";
			if (null != user)
				resultStr = "{\"name\":\"" + user.getUsername() + "\"}";
			response.getWriter().print(resultStr);
		} catch (Exception e) {
			log.error("获取登陆用户信息", e);
		}
		return null;
	}

	public String adminOut() {
		request.getSession().removeAttribute(Contants.SESSION_USER);
		return "adminOut";
	}
	
	
	public String toUpdatePassword() {
		long id = RequestUtil.getParam(request, "id", 0l);
		user = service.read(id);
		return "updatePasswordPage";
	}

	public String updatePassword() {
		long id = ((TsUser) RequestUtil.getLoginUserFromSession(request, "")).getId();
		service.updatePassword(id, newPassword);
		((TsUser) RequestUtil.getLoginUserFromSession(request, "")).setPassword(newPassword);
		return "updatePasswordSuccess";

	}

	/*
	 * 转向管理页面
	 */
	public String toUserManage() {
		try {
			tsUserList = service.findAll();
		} catch (Exception e) {
			log.error("用户管理信息出错", e);
		}
		return "tsUserManage";
	}

	public String saveOrUpdate() {
		try {
			if (user.getId() == null) {
				user.setPassword("123123");
			}
			service.saveOrUpdateUser(user);
		} catch (Exception e) {
			log.error("保存或修改信息出错", e);
		}
		return "totsUserManage";
	}

	public String delTsUser() {
		try {
			long id = RequestUtil.getParam(request, "id", 0l);
			service.delUser(id);
		} catch (Exception e) {
			log.error("删除出错", e);
		}
		return "totsUserManage";
	}

	/*
	 * 跳转信息页面
	 */
	public String toUserInfo() {
		try {
			long id = RequestUtil.getParam(request, "id", 0l);
			if (!"".equals(id)) {
				user = service.read(id);
			}
		} catch (Exception e) {
			log.error("查询信息出错", e);
		}
		return "toUserInfo";
	}

	public TsUser getUser() {
		return user;
	}

	public void setUser(TsUser user) {
		this.user = user;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public List<TsUser> getTsUserList() {
		return tsUserList;
	}

	public void setTsUserList(List<TsUser> tsUserList) {
		this.tsUserList = tsUserList;
	}

}
