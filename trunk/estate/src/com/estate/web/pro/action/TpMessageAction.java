package com.estate.web.pro.action;

import java.io.IOException;
import java.util.List;

import com.estate.base.web.BaseAction;
import com.estate.business.member.BaseInfoService;
import com.estate.business.member.BaseInfoServiceImpl;
import com.estate.business.pro.TpMessageService;
import com.estate.business.pro.TpMessageServiceImpl;
import com.estate.domain.member.TmBaseinfo;
import com.estate.domain.pro.TpMessage;
import com.estate.util.MD5Encode;
import com.estate.util.comm.RequestUtil;

@SuppressWarnings("serial")
public class TpMessageAction extends BaseAction {
	private TpMessageService service;
	private BaseInfoService baseInfoservice;

	public TpMessageAction() {
		service = new TpMessageServiceImpl();
		baseInfoservice = new BaseInfoServiceImpl();
	}

	public String addMessage() {
		String content = RequestUtil.getParam(request, "content", "");
		String username = RequestUtil.getParam(request, "username", "");
		String pass = RequestUtil.getParam(request, "password", "");
		String verrand = RequestUtil.getParam(request, "rand", "");
		String checkboxNum = RequestUtil.getParam(request, "checkboxNum", "");
		int result = checkUserNameIsExistMember(username, pass, verrand);
		if (result == 0) {
			TpMessage tpMessage = new TpMessage();
			tpMessage.setLoginname(username);
			tpMessage.setLoginPass(pass);
			tpMessage.setContent(content);
			tpMessage.setCheckboxNm(checkboxNum);
			if (service.addMessage(tpMessage))
				result = 3;// 保持成功
			else
				result = 4;// 保持失败
		}
		try {
			response.getWriter().print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 检测用户名是否存在
	 * 
	 * @return
	 */
	public int checkUserNameIsExistMember(String username, String pass,
			String verrand) {
		String rand = (String) request.getSession().getAttribute("rand");
		List<TmBaseinfo> list = null;
		try {
			if (pass == null || "".equals(pass)) {
				list = baseInfoservice.menberLogin(username, pass);

			} else {
				list = baseInfoservice.menberLogin(username, MD5Encode
						.getMD5Encode(pass));
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		if (null == list || list.size() == 0) {
			return 1;// 该用户名或密码错误
		}
		if (!rand.equals(verrand)) {
			return 2;// 验证码错误
		}
		return 0;
	}

}
