package com.estate.web.action.pro;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.estate.base.web.BaseAction;
import com.estate.business.service.pro.ShopService;
import com.estate.business.service.pro.ShopServiceImpl;
import com.estate.domain.TsUser;
import com.estate.domain.pro.Shop;
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
public class ShopAction extends BaseAction {
	private Shop shop;
	private ShopService service;
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

	public ShopAction() {
		service = new ShopServiceImpl();
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
	 * 根据Id查询 商铺信息
	 */
	public String searchById() {
		String id = RequestUtil.getParam(request, "id", "");
		try {
			Shop shop = service.getById(id);
			request.setAttribute("shop", shop);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "modifyrent";
	}
	
	/**
	 * 保存楼盘审核信息，若审核通过+5分
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
			shop.setAuditingUser(Integer.valueOf(user.getId().toString()));
			boolean saveFlag = service.updateAuditing(shop);
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
		String page = RequestUtil.getParam(request, "page", "");
		String row = RequestUtil.getParam(request, "rows", "");

		map.put("discode", StringUtil.getShortZoneGB1(discode));
		map.put("auditingState", auditingState);
		map.put("tbtype", tbtype);
		map.put("page", page);
		map.put("row", row);

		return map;
	}

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

}
