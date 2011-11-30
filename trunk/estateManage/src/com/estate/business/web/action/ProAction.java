package com.estate.business.web.action;

import java.util.List;

import com.estate.base.web.BaseAction;
import com.estate.business.service.DefinationService;
import com.estate.business.service.DefinationServiceImpl;
import com.estate.business.service.ProDefintionService;
import com.estate.business.service.ProDefintionServiceImpl;
import com.estate.business.service.ProService;
import com.estate.business.service.ProServiceImpl;
import com.estate.domain.TdDefination;
import com.estate.domain.TsPro;
import com.estate.domain.TsProDefination;
import com.estate.util.comm.RequestUtil;

public class ProAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	private TsPro tsPro;

	private List<TsPro> proList;

	private List<TdDefination> definationList;

	private List<TsProDefination> tsProDefinationList;

	private int flag;

	private String proIds;

	private String orderNs;

	private ProService service;

	private DefinationService definationService;

	private ProDefintionService proDefintionService;

	public ProAction() {
		service = new ProServiceImpl();
		definationService = new DefinationServiceImpl();
		proDefintionService = new ProDefintionServiceImpl();
	}

	/*
	 * 转向管理页面
	 */
	public String toProManage() {
		try {
			proList = service.findAll();
		} catch (Exception e) {
			log.error("项目操作信息出错", e);
		}
		return "proManage";
	}

	/*
	 * 跳转信息页面
	 */
	public String toProInfo() {
		try {
			long id = RequestUtil.getParam(request, "id", 0l);
			if (!"".equals(id)) {
				tsPro = service.read(id);
				proDefintionService.findAll(id);
			}
		} catch (Exception e) {
			log.error("查询项目信息出错", e);
		}
		return "toProInfo";
	}

	public String saveOrUpdate() {
		try {
			service.saveOrUpdatePro(tsPro);
		} catch (Exception e) {
			log.error("保存或修改项目信息出错", e);
		}
		return "toProManage";
	}

	public String delPro() {
		try {
			long id = RequestUtil.getParam(request, "id", 0l);
			service.delPro(id);
			proDefintionService.del(id);
		} catch (Exception e) {
			log.error("删除项目出错", e);
		}
		return "toProManage";
	}

	/*
	 * 维护项目与码表的关系
	 */
	public String toMaintainPage() {
		long proId = RequestUtil.getParam(request, "id", 0l);
		tsPro = service.read(proId);
		definationList = definationService.findAll();
		tsProDefinationList = proDefintionService.findAll(proId);
		if (!tsProDefinationList.isEmpty()) {
			for (int i = 0; i < tsProDefinationList.size(); i++) {
				if (i == 0) {
					proIds = tsProDefinationList.get(i).getDefinationId().toString();
					orderNs = tsProDefinationList.get(i).getOrderNum().toString();
				} else {
					proIds += "," + tsProDefinationList.get(i).getDefinationId().toString();
					orderNs += "," + tsProDefinationList.get(i).getOrderNum().toString();
				}

			}
		}
		return "toMaintainPage";
	}

	/*
	 * 保存维护关系
	 */
	public String maintain() {
		try {
			long proId = RequestUtil.getParam(request, "proId", 0l);
			String ids = RequestUtil.getParam(request, "ids", "");
			String orderNums = RequestUtil.getParam(request, "orderNums", "");
			String[] idss = ids.split(",");
			String[] orderNumss = orderNums.split(",");
			proDefintionService.del(proId);
			for (int i = 1; i < idss.length; i++) {
				TsProDefination tsProDefination = new TsProDefination();
				tsProDefination.setProId(proId);
				tsProDefination.setDefinationId(new Long(idss[i]));
				tsProDefination.setOrderNum(new Integer(orderNumss[i]));
				proDefintionService.save(tsProDefination);
			}
		} catch (Exception e) {
			log.error("保存维护关系出错", e);
		}
		return "toProManage";
	}

	public TsPro getTsPro() {
		return tsPro;
	}

	public void setTsPro(TsPro tsPro) {
		this.tsPro = tsPro;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public List<TsPro> getProList() {
		return proList;
	}

	public void setProList(List<TsPro> proList) {
		this.proList = proList;
	}

	public List<TdDefination> getDefinationList() {
		return definationList;
	}

	public void setDefinationList(List<TdDefination> definationList) {
		this.definationList = definationList;
	}

	public List<TsProDefination> getTsProDefinationList() {
		return tsProDefinationList;
	}

	public void setTsProDefinationList(List<TsProDefination> tsProDefinationList) {
		this.tsProDefinationList = tsProDefinationList;
	}

	public String getProIds() {
		return proIds;
	}

	public void setProIds(String proIds) {
		this.proIds = proIds;
	}

	public String getOrderNs() {
		return orderNs;
	}

	public void setOrderNs(String orderNs) {
		this.orderNs = orderNs;
	}

}
