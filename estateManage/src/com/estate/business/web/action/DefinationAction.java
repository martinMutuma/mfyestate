package com.estate.business.web.action;

import java.util.List;

import com.estate.base.web.BaseAction;
import com.estate.business.service.DataService;
import com.estate.business.service.DataServiceImpl;
import com.estate.business.service.DefinationService;
import com.estate.business.service.DefinationServiceImpl;
import com.estate.domain.TdData;
import com.estate.domain.TdDefination;
import com.estate.util.comm.BASE64Util;
import com.estate.util.comm.RequestUtil;

public class DefinationAction extends BaseAction {

	private static final long serialVersionUID = -6628190838690935445L;

	private TdDefination defination;
	private List<TdDefination> definationList;
	private TdData data;
	private List<TdData> dataList;
	private String defName;
	private String pid;

	private DefinationService service;
	private DataService dataService;

	public DefinationAction() {
		service = new DefinationServiceImpl();
		dataService = new DataServiceImpl();
	}

	/**
	 * 转向列表页面
	 * 
	 * @return
	 */
	public String toDefinationManage() {
		try {
			definationList = service.findAll();
		} catch (Exception e) {
			log.error("获取码表列表失败", e);
		}
		return "definationManage";
	}

	/**
	 * 转向详细信息页面
	 * 
	 * @return
	 */
	public String toDefinationInfo() {
		try {
			long id = RequestUtil.getParam(request, "id", 0l);
			if (!"".equals(id)) {
				defination = service.read(id);
			}
		} catch (Exception e) {
			log.error("查看详细信息出错", e);
		}
		return "toDefinationInfo";
	}

	/**
	 * 保存
	 * @return
	 */
	public String save() {
		try {
			if (null != defination) {
				if ("01".equals(defination.getCategory())) {
					defination.setCode(BASE64Util.getBASE64(defination
							.getCode()));
				}
				service.saveOrUpdate(defination);
			}
		} catch (Exception e) {
			log.error("码表保存失败", e);
		}
		return "toDefinationManage";
	}

	public String delete() {
		try {
			String ids = RequestUtil.getParam(request, "ids", "");
			service.delete(ids);
		} catch (Exception e) {
			log.error("删除码表失败", e);
		}
		return "toDefinationManage";
	}

	public String dataManage() {
		try {
			pid = RequestUtil.getParam(request, "pid", "");
			defName = RequestUtil.getParam(request, "defName", "");
			dataList = dataService.findAll(pid);
		} catch (Exception e) {
			log.error("码表数据加载失败", e);
		}
		return "dataManage";
	}

	public String toDataInfo() {
		try {
			long id = RequestUtil.getParam(request, "id", 0l);
			defName = RequestUtil.getParam(request, "defName", "");
			if (!"".equals(id)) {
				data = dataService.read(id);
			}
		} catch (Exception e) {
			log.error("data查看详细信息出错", e);
		}
		return "toDataInfo";
	}

	public String dataSave() {
		try {
			defName = RequestUtil.getParam(request, "defName", "");
			if (null != data) {
				dataService.saveOrUpdate(data);
			}
		} catch (Exception e) {
			log.error("tddata保存失败", e);
		}
		return "toDataManage";
	}

	public String dataDelete() {
		try {
			defName = RequestUtil.getParam(request, "defName", "");
			String ids = RequestUtil.getParam(request, "ids", "");
			dataService.delete(ids);
		} catch (Exception e) {
			log.error("删除码表失败", e);
		}
		return "toDataManage";
	}

	public TdDefination getDefination() {
		return defination;
	}

	public void setDefination(TdDefination defination) {
		this.defination = defination;
	}

	public List<TdDefination> getDefinationList() {
		return definationList;
	}

	public void setDefinationList(List<TdDefination> definationList) {
		this.definationList = definationList;
	}

	public TdData getData() {
		return data;
	}

	public void setData(TdData data) {
		this.data = data;
	}

	public List<TdData> getDataList() {
		return dataList;
	}

	public void setDataList(List<TdData> dataList) {
		this.dataList = dataList;
	}

	public String getDefName() {
		return defName;
	}

	public void setDefName(String defName) {
		this.defName = defName;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

}
