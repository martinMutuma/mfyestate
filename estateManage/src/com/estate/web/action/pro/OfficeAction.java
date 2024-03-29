package com.estate.web.action.pro;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.estate.base.web.BaseAction;
import com.estate.business.service.pro.OfficeService;
import com.estate.business.service.pro.OfficeServiceImpl;
import com.estate.domain.TsUser;
import com.estate.domain.pro.Office;
import com.estate.util.comm.Contants;
import com.estate.util.comm.RequestUtil;
import com.estate.util.comm.StringUtil;

/**
 * 修改意见： 1.与Null做比较时，请将null放在前面
 * 
 * @author FC
 * 
 */

@SuppressWarnings("serial")
public class OfficeAction extends BaseAction {
	private Office office;
	private OfficeService service;
	private int total;
	@SuppressWarnings("unchecked")
	private List rows;

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	@SuppressWarnings("unchecked")
	public List getRows() {
		return rows;
	}

	@SuppressWarnings("unchecked")
	public void setRows(List rows) {
		this.rows = rows;
	}

	public OfficeAction() {
		service = new OfficeServiceImpl();
	}

	/**
	 * 写字楼出租或出售查询
	 * 
	 */
	@SuppressWarnings("unchecked")
	public String search() {
		Map map = getParam();
		int count = service.getCount(map);
		List list = service.getList(map);
		if (list != null && list.size() > 0) {
			total = count;
			rows = list;
		}
		return Contants.JSONSTRING_RESULT_NAME;
	}

	/**
	 * 
	 * 删除写字楼出租信息
	 */
	public String delete() {
		String idString = RequestUtil.getParam(request, "idString", "");
		boolean isFlag = false;
		isFlag = service.deleteByIdString(idString);
//		response.setContentType("text/html;charset=utf-8");
//		PrintWriter out = null;
//		if (isFlag)
//			message = "删除成功";
//		else
//			message = "删除失败";
//		StringBuffer sb = new StringBuffer("[");
//		sb.append("{\"message\":\"" + message + "\"" + "}");
//		sb.append("]");

//		try {
//			out = response.getWriter();
//			out.println(sb.toString());
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		return null;
	}

	/**
	 * 
	 * 核实写字楼出租信息
	 */
	public String auditPro() {
		String idString = RequestUtil.getParam(request, "idString", "");
		boolean isFlag = false;
		isFlag = service.auditByIdString(idString);
//		response.setContentType("text/html;charset=utf-8");
//		PrintWriter out = null;
//		if (isFlag)
//			message = "核实成功";
//		else
//			message = "删除失败";
//		StringBuffer sb = new StringBuffer("[");
//		sb.append("{\"message\":\"" + message + "\"" + "}");
//		sb.append("]");
//
//		try {
//			out = response.getWriter();
//			out.println(sb.toString());
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		return null;
	}
	/**
	 * 通过id查询写字楼信息
	 * 
	 * @return
	 */
	public String searchById() {
		String id = RequestUtil.getParam(request, "id", "");
		String flag = RequestUtil.getParam(request, "flag", "");// 查看 or 修改
		String type = RequestUtil.getParam(request, "type", "");
		Office office = service.getOfficeById(id, type);
		if ("1".equals(office.getFlag()))
			office.setFlagString("出租");
		if ("2".equals(office.getFlag()))
			office.setFlagString("出售");
		request.setAttribute("office", office);
		if ("see".equals(flag))
			return "see";
		return "modify";
	}
	
	/**
	 * 保存审核信息，若审核通过+5分
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String addSend() {
		String str = "";
		TsUser user = (TsUser) RequestUtil.getLoginUserFromSession(request, "");
		if(null == user || null == user.getId() || "".equals(user.getId())){
			str = "<script>parent.notLogged();</script>";
		}else{
			office.setAuditingUser(Integer.valueOf(user.getId().toString()));
			boolean saveFlag = service.updateAuditing(office);
			if(!saveFlag)
				str = "<script>parent.auditingFailed();</script>";
			str = "<script>parent.auditingSuccess();</script>";
		}
		try {
			response.getWriter().print(str);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 得到参数值
	 * 
	 * @return
	 */
	public Map<String, String> getParam() {
		Map<String, String> map = new HashMap<String, String>();

		String discode = RequestUtil.getParam(request, "discode", "");
		String auditingState = RequestUtil.getParam(request, "auditingState",
				"");
		String tbtype = RequestUtil.getParam(request, "tbtype", "");
		String tflag = RequestUtil.getParam(request, "tflag", "");
		String page = RequestUtil.getParam(request, "page", "");
		String row = RequestUtil.getParam(request, "rows", "");

		map.put("discode", StringUtil.getShortZoneGB1(discode));
		map.put("auditingState", auditingState);
		map.put("tbtype", tbtype);
		map.put("tflag", tflag);
		map.put("page", page);
		map.put("row", row);
		return map;
	}

	public Office getOffice() {
		return office;
	}

	public void setOffice(Office office) {
		this.office = office;
	}

}
