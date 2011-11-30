package com.estate.business.web.action.pro;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.estate.base.web.BaseAction;
import com.estate.business.service.pro.LargeProService;
import com.estate.business.service.pro.LargeProServiceImpl;
import com.estate.domain.pro.LargePro;
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
public class LargeProAction extends BaseAction {
	private LargePro largePro;
	private LargeProService service;
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

	public LargeProAction() {
		service = new LargeProServiceImpl();
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
		String page = RequestUtil.getParam(request, "page", "");
		String row = RequestUtil.getParam(request, "rows", "");

		map.put("discode", StringUtil.getShortZoneGB1(discode));
		map.put("auditingState", auditingState);
		map.put("tbtype", tbtype);
		map.put("page", page);
		map.put("row", row);

		return map;
	}

	public LargePro getLargePro() {
		return largePro;
	}

	public void setLargePro(LargePro largePro) {
		this.largePro = largePro;
	}

}
