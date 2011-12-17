package com.estate.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import com.estate.base.web.BaseAction;
import com.estate.business.service.BaseinfoService;
import com.estate.business.service.BaseinfoServiceImpl;
import com.estate.domain.TmBaseinfo;
import com.estate.util.comm.Contants;
import com.estate.util.comm.RequestUtil;

/**
 * 系统会员相关Action
 * 
 * @author SFF
 * 
 */
public class BaseinfoAction extends BaseAction {

	private static final long serialVersionUID = 688970037309060648L;

	private int total;
	private TmBaseinfo baseinfo;
	private List rows;
	private int flag;

	private BaseinfoService service;

	public BaseinfoAction() {
		service = new BaseinfoServiceImpl();
	}

	/*
	 * 转向管理页面
	 */
	public String toBaseinfoManage() {
		return "baseinfoManage";
	}
	
	/*
	 * 转向管理页面
	 */
	public String toManageRent() {
		return "manageRentPage";
	}
	public String toManageShop() {
		return "manageShopPage";
	}
	public String toManageBusiness() {
		return "manageBusiness";
	}
	public String toManageProject() {
		return "manageProjectPage";
	}
	public String toManageIndustry() {
		return "manageIndustryPage";
	}

	public String getBaseinfoManage() {
		try {
			String page = RequestUtil.getParam(request, "page", "1");
			String row = RequestUtil.getParam(request, "rows", "10");
			String mobile = RequestUtil.getParam(request, "mobile", "");
			String username = RequestUtil.getParam(request, "username", "");
			String type = RequestUtil.getParam(request, "tbtype", "");
			String discode = RequestUtil.getParam(request, "discode", "");
			String status = RequestUtil.getParam(request, "status", "");
			TmBaseinfo mbaseinfo = new TmBaseinfo();
			mbaseinfo.setMobile(mobile);
			mbaseinfo.setUsername(username);
			mbaseinfo.setType(type);
			mbaseinfo.setDiscode(discode);
			mbaseinfo.setStatus(status);
			Map<String, Object> map = service.findAll(mbaseinfo, page, row);
			rows = (List<TmBaseinfo>) map.get("list");
			total = Integer.parseInt(map.get("total").toString());
		} catch (Exception e) {
			log.error("用户管理信息出错", e);
		}
		return Contants.JSONSTRING_RESULT_NAME;
	}

	public String saveOrUpdate() {
		try {
			service.saveOrUpdate(baseinfo);
		} catch (Exception e) {
			log.error("保存或修改信息出错", e);
		}
		return "toBaseinfoManage";
	}

	public String delete() {
		String id = RequestUtil.getParam(request, "id", "");
		String idString = RequestUtil.getParam(request, "idString", "");
		boolean isFlag = false;
		if (!"".equals(id))
			isFlag = service.deleteByIdString(id);
		else
			isFlag = service.deleteByIdString(idString);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		if (isFlag)
			message = "删除成功";
		else
			message = "删除失败";
		StringBuffer sb = new StringBuffer("[");
		sb.append("{\"message\":\"" + message + "\"" + "}");
		sb.append("]");

		try {
			out = response.getWriter();
			out.println(sb.toString());
		} catch (IOException e) {
			log.error("删除信息出错", e);
		}
		return null;
	}

	/*
	 * 跳转信息页面
	 */
	public String toBaseinfoInfo() {
		try {
			long id = RequestUtil.getParam(request, "id", 0l);
			if (!"".equals(id)) {
				baseinfo = service.read(id);
			}
		} catch (Exception e) {
			log.error("查询信息出错", e);
		}
		return "toBaseinfoInfo";
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public TmBaseinfo getBaseinfo() {
		return baseinfo;
	}

	public void setBaseinfo(TmBaseinfo baseinfo) {
		this.baseinfo = baseinfo;
	}

	public BaseinfoService getService() {
		return service;
	}

	public void setService(BaseinfoService service) {
		this.service = service;
	}

	public List getRows() {
		return rows;
	}

	public void setRows(List rows) {
		this.rows = rows;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

}
