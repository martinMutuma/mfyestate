package com.estate.business.web.action.pro;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.estate.base.web.BaseAction;
import com.estate.business.service.pro.OfficeNeedService;
import com.estate.business.service.pro.OfficeNeedServiceImpl;
import com.estate.domain.TmBaseinfo;
import com.estate.domain.pro.OfficeNeed;
import com.estate.util.comm.Contants;
import com.estate.util.comm.RequestUtil;

/**
 * @Title:需求Action
 * @Copyright: Copyright (c) 0.1
 * @author:鲁根成
 * @version: 1.0
 * @time: 2011-5-12
 * 
 */
@SuppressWarnings("serial")
public class OfficeNeedAction extends BaseAction {
	private OfficeNeedService service;
	private OfficeNeed need;
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

	public OfficeNeedAction() {
		service = new OfficeNeedServiceImpl();
	}

	/**
	 * 
	 * 增加需求
	 */
	public String addNeed() {
		String id = RequestUtil.getParam(request, "id", "");
		TmBaseinfo td=(TmBaseinfo)RequestUtil.getLoginUserFromSession(request,"");
		need.setAuthorId(td.getId().intValue());
		if ("".equals(id))
			need.setCreateTime(new Date());
		else {
			OfficeNeed newNeed = service.getOfficeNeedById(id, need
					.getNeedType());
			String auting = newNeed.getAuditing();
			if (!"0".equals(newNeed))
				need.setAuditing(auting);
			need.setCreateTime(newNeed.getCreateTime());
			need.setId(newNeed.getId());

		}
		if (service.addNeed(need))
			return "success";
		else
			return "error";
	}

	/**
	 * 
	 * 查询需求
	 */
	@SuppressWarnings("unchecked")
	public String search() {

		String page = RequestUtil.getParam(request, "page", "");
		String row = RequestUtil.getParam(request, "rows", "");
		String flag = RequestUtil.getParam(request, "flag", "");
		String auting = RequestUtil.getParam(request, "auting", "");
		String type = RequestUtil.getParam(request, "type", "");
		Map map = new HashMap<String, String>();
		map.put("flag", flag);
		map.put("auting", auting);
		map.put("type", type);
		List list = service.getAllList(map, page, row);
		int count = service.getcount(map);
		if (list != null && list.size() > 0) {
			total = count;
			rows = list;
		}
		return Contants.JSONSTRING_RESULT_NAME;
	}

	/**
	 * 删除需求
	 * 
	 * @return
	 */
	public String delete() {
		String id = RequestUtil.getParam(request, "id", "");
		String idString = RequestUtil.getParam(request, "idString", "");
		String type = RequestUtil.getParam(request, "type", "");
		boolean isFlag = false;
		if (!"".equals(id))
			isFlag = service.deleteById(id, type);
		else
			isFlag = service.deleteByIdString(idString, type);
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 通过id查询需求信息
	 * 
	 * @return
	 */
	public String searchById() {
		String id = RequestUtil.getParam(request, "id", "");
		String type = RequestUtil.getParam(request, "type", "");
		OfficeNeed need = service.getOfficeNeedById(id, type);
		request.setAttribute("need", need);
		if ("1".equals(type))
			return "modify";
		if ("2".equals(type))
			return "modifyshopneed";
		if ("4".equals(type))
			return "modifyproneed";
		if ("3".equals(type))
			return "modifyindustryneed";
		return null;

	}

	public OfficeNeed getNeed() {
		return need;
	}

	public void setNeed(OfficeNeed need) {
		this.need = need;
	}
}
