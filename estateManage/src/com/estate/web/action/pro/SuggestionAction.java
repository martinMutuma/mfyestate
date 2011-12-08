package com.estate.web.action.pro;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.estate.base.web.BaseAction;
import com.estate.business.service.SuggestionService;
import com.estate.business.service.SuggestionServiceImpl;
import com.estate.domain.TsUser;
import com.estate.domain.pro.TpSuggestion;
import com.estate.domain.pro.TpSuggestionFormBean;
import com.estate.util.comm.Contants;
import com.estate.util.comm.RequestUtil;

/**
 *投诉与意见相关Action
 * 
 * @author SFF
 * 
 */
public class SuggestionAction extends BaseAction {

	private static final long serialVersionUID = 688970037309060648L;

	private int total;
	private TpSuggestion tpSuggestion;
	private List rows;
	private int flag;

	private SuggestionService service;

	public SuggestionAction() {
		service = new SuggestionServiceImpl();
	}

	/*
	 * 转向管理页面
	 */
	@SuppressWarnings("unchecked")
	public String toSuggestionManage() {
		return "suggestionManage";
	}

	public String getSuggestionManage() {
		try {
			String page = RequestUtil.getParam(request, "page", "1");
			String row = RequestUtil.getParam(request, "rows", "10");
			String startTime = RequestUtil.getParam(request, "startTime", "");
			String endTime = RequestUtil.getParam(request, "endTime", "");
			String state = RequestUtil.getParam(request, "state", "");
			TpSuggestionFormBean formBean = new TpSuggestionFormBean();
			formBean.setState(state);
			formBean.setEndTime(endTime);
			formBean.setStartTime(startTime);
			Map<String, Object> map = service.findAll(formBean, page, row);
			rows = (List<TpSuggestion>) map.get("list");
			total = Integer.parseInt(map.get("total").toString());
		} catch (Exception e) {
			log.error("投诉与意见管理信息出错", e);
		}
		return Contants.JSONSTRING_RESULT_NAME;
	}

	public String saveOrUpdate() {
		try {
			TpSuggestion suggestion = new TpSuggestion();
			suggestion = service.read(tpSuggestion.getId());
			TsUser user = (TsUser) RequestUtil.getLoginUserFromSession(request, "");
			
			tpSuggestion.setHandler(user.getUsername());
			tpSuggestion.setCompletionTime(new Date());
			service.saveOrUpdate(tpSuggestion);
		} catch (Exception e) {
			log.error("保存或修改信息出错", e);
		}
		return "toSuggestionManage";
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
	public String toTpSuggestionInfo() {
		try {
			long id = RequestUtil.getParam(request, "id", 0l);
			if (!"".equals(id)) {
				tpSuggestion = service.read(id);
			}
		} catch (Exception e) {
			log.error("查询信息出错", e);
		}
		return "toTpSuggestionInfo";
	}

	/**
	 * 获取系统路径
	 * 
	 * @return
	 */
	private String getBasePath() {
		return request.getSession().getServletContext().getRealPath("");
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
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

	public TpSuggestion getTpSuggestion() {
		return tpSuggestion;
	}

	public void setTpSuggestion(TpSuggestion tpSuggestion) {
		this.tpSuggestion = tpSuggestion;
	}

}
