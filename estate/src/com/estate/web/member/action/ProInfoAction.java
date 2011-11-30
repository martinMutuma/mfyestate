package com.estate.web.member.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.estate.base.web.BaseAction;
import com.estate.business.building.TpBuildingService;
import com.estate.business.building.TpBuildingServiceImpl;
import com.estate.business.member.ProInfoService;
import com.estate.business.member.ProInfoServiceImpl;
import com.estate.domain.building.TpBuilding;
import com.estate.domain.member.TmBaseinfo;
import com.estate.domain.member.TmProInfo;
import com.estate.util.comm.Contants;
import com.estate.util.comm.RequestUtil;

public class ProInfoAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7730284833959800414L;
	private int reLogin;
	private TmBaseinfo tb;
	private TpBuilding tbuilding;
	private TmProInfo tp;
	private List<TmProInfo> proInfoList;
	private List<TpBuilding> tbuildingList;
	private ProInfoService proInfoService;
	private TpBuildingService tbuildingSer;
	private int pageSize = 4; //一页显示的记录数 
	private int rowCount; //记录总数 
	private int pageCount; //总页数 
	private int currentPage; //当前页码 

	public List<TmProInfo> getProInfoList() {
		return proInfoList;
	}

	public void setProInfoList(List<TmProInfo> proInfoList) {
		this.proInfoList = proInfoList;
	}

	public ProInfoAction() {
		proInfoService = new ProInfoServiceImpl();
		tbuildingSer = new TpBuildingServiceImpl();
	}

	/**
	 * 保存关注、浏览、(收藏)
	 * 
	 * @return
	 */
	public String saveProInfo() {
		tb = (TmBaseinfo) RequestUtil.getLoginUserFromSession(request,Contants.SESSION_USER);
		tp = new TmProInfo();
		String proType = RequestUtil.getParam(request, "proType", "");//项目类型
		String operateType = RequestUtil.getParam(request, "operateType", "");//操作类型
		Integer proId = RequestUtil.getParam(request, "proId", Integer.valueOf(0));//项目id
		Long id = RequestUtil.getParam(request, "id", Long.valueOf(0));  //主键
		tp.setId(id);
		tp.setProId(proId);
		tp.setAuthorId(Integer.valueOf(tb.getId().toString()));
		tp.setProType(proType);
		tp.setOperateType(operateType);
		tp.setCreateTime(new Date());
		proInfoService.saveOrUpdate(tp);
		return null;
	}

	/**
	 * 
	 * 展示关注、收藏、浏览的楼盘
	 * @return
	 */
	public String showProInfo() {
		currentPage = RequestUtil.getParam(request, "page", 1);
		tb = (TmBaseinfo) RequestUtil.getLoginUserFromSession(request,Contants.SESSION_USER);
		String operateType = RequestUtil.getParam(request, "operateType", "1");//1 浏览  2 关注  3 收藏  4备选
		Map<String,Object> tbuildingMap  = tbuildingSer.showProInfo(tb.getId(),operateType,(currentPage-1)*pageSize,pageSize);
		rowCount = Integer.parseInt(tbuildingMap.get("rowCount").toString());
		tbuildingList = (List<TpBuilding>) tbuildingMap.get("tbuildingList");
		return "operateType"+operateType;
	}

	/**
	 * 
	 * 保存备选、关注、收藏的楼盘
	 * @return
	 */
	public String createproInfo(){
		tb = (TmBaseinfo) RequestUtil.getLoginUserFromSession(request,Contants.SESSION_USER);
		Long proId = RequestUtil.getParam(request, "proId", Long.valueOf(0));
		String operateType = RequestUtil.getParam(request, "operateType", "1");//1 浏览  2 关注  3 收藏  4备选
		String operateToType = RequestUtil.getParam(request, "operateToType", "0");//1 浏览  2 关注  3 收藏  4备选
		String proType = RequestUtil.getParam(request, "proType", "0");//1 浏览  2 关注  3 收藏  4备选
		TmProInfo obj = proInfoService.getProInfo(tb.getId(),proId,operateToType,proType);
		if(null==obj){
			tp = proInfoService.getProInfo(tb.getId(),proId,operateType,proType);
			if(tp==null){
				tp = new TmProInfo();
				tp.setProId(Integer.valueOf(proId.toString()));
				tp.setAuthorId(Integer.valueOf(tb.getId().toString()));
			}	
			tp.setId(null);
			tp.setProType("6");
			tp.setOperateType(operateToType);
			tp.setCreateTime(new Date());
			proInfoService.save(tp);
		}
		currentPage = RequestUtil.getParam(request, "page", 1);
		tb = (TmBaseinfo) RequestUtil.getLoginUserFromSession(request,Contants.SESSION_USER);
		Map<String,Object> tbuildingMap  = tbuildingSer.showProInfo(tb.getId(),operateType,(currentPage-1)*pageSize,pageSize);
		rowCount = Integer.parseInt(tbuildingMap.get("rowCount").toString());
		tbuildingList = (List<TpBuilding>) tbuildingMap.get("tbuildingList");
		return null;
	}
	
	/**
	 *删除所有浏览、关注、收藏、备选楼盘
	 * 
	 * @return
	 */
	public String deleteAllproInfo(){
		tb = (TmBaseinfo) RequestUtil.getLoginUserFromSession(request,Contants.SESSION_USER);
		String operateType = RequestUtil.getParam(request, "operateType", "0");//1 浏览  2 关注  3 收藏  4备选
		String proType = RequestUtil.getParam(request, "proType", "6"); //6 楼盘
		proInfoService.deleteAllproInfo(tb.getId(),operateType,proType);
		tbuildingList = new ArrayList<TpBuilding>();
		return "operateType"+operateType;
	}
	
	/**
	 * 
	 * 删除一条
	 * @return
	 */
	public String deleteproInfo(){
		tb = (TmBaseinfo) RequestUtil.getLoginUserFromSession(request,Contants.SESSION_USER);
		Long proId = RequestUtil.getParam(request, "proId", Long.valueOf(0));
		String operateType = RequestUtil.getParam(request, "operateType", "0");//1 浏览  2 关注  3 收藏  4备选
		String proType = RequestUtil.getParam(request, "proType", "6"); //6 楼盘
		proInfoService.deleteproInfo(tb.getId(),proId,operateType,proType);
		tbuildingList = new ArrayList<TpBuilding>();
		return "operateType"+operateType;
	}
	
	/**
	 * 
	 * 房友最关注楼盘
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String showMoreAttentionBuilding(){
		currentPage = RequestUtil.getParam(request, "page", 1);
		Map<String,Object> tbuildingMap = tbuildingSer.showMoreAttentionBuilding((currentPage-1)*pageSize,pageSize);
		rowCount = Integer.parseInt(tbuildingMap.get("rowCount").toString());
		tbuildingList = (List<TpBuilding>) tbuildingMap.get("tbuildingList");
		return "showMoreAttentionPage";
	}
	
	/**
	 * 
	 * 最新开盘
	 * @return
	 */
	public String showNewBuilding(){
		currentPage = RequestUtil.getParam(request, "page", 1);
		Map<String,Object> tbuildingMap = tbuildingSer.showNewBuilding((currentPage-1)*pageSize,pageSize);
		rowCount = Integer.parseInt(tbuildingMap.get("rowCount").toString());
		tbuildingList = (List<TpBuilding>) tbuildingMap.get("tbuildingList");
		return "showNewBuildingPage";
	}
	
	/**
	 * 
	 * 楼盘比较
	 * @return
	 */
	public String compareBuildings(){
		tb = (TmBaseinfo) RequestUtil.getLoginUserFromSession(request,Contants.SESSION_USER);
		String ids = RequestUtil.getParam(request, "ids", "0");
		tbuildingList = tbuildingSer.getCompareBulidings(tb.getId(),ids);
//		for (int i = 0; i < tbuildingList.size(); i++) {
//			request.getSession().setAttribute("tbuilding"+i, tbuildingList.get(i));
//		}
		return "compareBuildingPage";
	}
	
	public TmBaseinfo getTb() {
		return tb;
	}

	public void setTb(TmBaseinfo tb) {
		this.tb = tb;
	}

	public int getReLogin() {
		return reLogin;
	}

	public void setReLogin(int reLogin) {
		this.reLogin = reLogin;
	}

	public TmProInfo getTp() {
		return tp;
	}

	public void setTp(TmProInfo tp) {
		this.tp = tp;
	}

	public TpBuilding getTbuilding() {
		return tbuilding;
	}

	public void setTbuilding(TpBuilding tbuilding) {
		this.tbuilding = tbuilding;
	}

	public List<TpBuilding> getTbuildingList() {
		return tbuildingList;
	}

	public void setTbuildingList(List<TpBuilding> tbuildingList) {
		this.tbuildingList = tbuildingList;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getRowCount() {
		return rowCount;
	}

	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

}
