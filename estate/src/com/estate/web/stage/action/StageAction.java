package com.estate.web.stage.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;

import com.estate.base.web.BaseAction;
import com.estate.business.building.TpBuildingService;
import com.estate.business.building.TpBuildingServiceImpl;
import com.estate.business.building.TpSecondBulidingService;
import com.estate.business.building.TpSecondBulidingServiceImpl;
import com.estate.business.member.BaseInfoService;
import com.estate.business.member.BaseInfoServiceImpl;
import com.estate.business.news.NewsService;
import com.estate.business.news.NewsServiceImpl;
import com.estate.business.pro.OfficeNeedService;
import com.estate.business.pro.OfficeNeedServiceImpl;
import com.estate.business.pro.OfficeService;
import com.estate.business.pro.OfficeServiceImpl;
import com.estate.business.pro.ShopService;
import com.estate.business.pro.ShopServiceImpl;
import com.estate.business.pro.SpecialsService;
import com.estate.business.pro.SpecialsServiceImpl;
import com.estate.business.system.IStageService;
import com.estate.business.system.ITsAnnouncementService;
import com.estate.business.system.StageServiceImpl;
import com.estate.business.system.TsAnnouncementServiceImpl;
import com.estate.domain.building.TpBuilding;
import com.estate.domain.building.TpImage;
import com.estate.domain.building.TpSecondBuliding;
import com.estate.domain.member.TmBaseinfo;
import com.estate.domain.pro.Office;
import com.estate.domain.pro.OfficeNeed;
import com.estate.domain.pro.Shop;
import com.estate.domain.pro.TpSpecials;
import com.estate.domain.system.HomeData;
import com.estate.domain.system.TsAnnouncement;
import com.estate.util.CacheUtil;
import com.estate.util.House365Util;
import com.estate.util.WebSiteUtil;
import com.estate.util.comm.BASE64Util;
import com.estate.util.comm.Contants;
import com.estate.util.comm.CookiesUtil;
import com.estate.util.comm.HttpClientUtil;
import com.estate.util.comm.RequestUtil;
import com.estate.util.file.XmlUtil;
import com.estate.util.framework.PageUtil;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

public class StageAction extends BaseAction {
	private static final long serialVersionUID = 2912409727851124389L;
	private String jsonString;
	private int total;
	private String searchQuery;// 搜索条件
	private String searchStatus;// 条件选中状态
	private String searchPro;// 搜索项目
	private String keywordValue;// 关键字
	private String lptsValue;// 新房-网上售楼处-楼盘特色
	private TmBaseinfo baseinfo;// 会员基本信息
	private List<Object> rows;
	private String pageNo;
	private String limit;
	private PageUtil pu;// 分页工具类
	private List<Map<String, Object>> dataList;
	private List<Office> officeList;
	private List<Shop> shopList;
	private List<TmBaseinfo> baseInfoList;
	private List<OfficeNeed> officeNeedList;
	private List<OfficeNeed> shopNeedList;
	private Map<String, Object> dataMap;
	private String selectedTab;
	private String menuIndex;
	private TpSpecials special;
	private Office office;
	private String proShowPage;

	private IStageService service;
	private OfficeService officeSerive;
	private ShopService shopService;
	private BaseInfoService baseInfoService;
	private OfficeNeedService needService;
	private List<OfficeNeed> needList;
	private TpBuildingService tbsService;
	private NewsService newsService;
	private TpSecondBulidingService secondService;
	private SpecialsService specialService;
	private ITsAnnouncementService annouService;
	private List<TpImage> imgList;

	public StageAction() {
		service = new StageServiceImpl();
		officeSerive = new OfficeServiceImpl();
		shopService = new ShopServiceImpl();
		baseInfoService = new BaseInfoServiceImpl();
		needService = new OfficeNeedServiceImpl();
		tbsService = new TpBuildingServiceImpl();
		newsService = new NewsServiceImpl();
		secondService = new TpSecondBulidingServiceImpl();
		specialService = new SpecialsServiceImpl();
		annouService = new TsAnnouncementServiceImpl();
	}

	/**
	 * 测试
	 * 
	 * @return
	 */
	public String test() {
		this.jsonString = "[{code:'3200000000',name:'江苏'}";
		for (int i = 0; i < 500; i++) {
			jsonString += ",{code:'3201000000',name:'南京'},{code:'3202000000',name:'无锡'}";
		}
		jsonString += "]";
		return Contants.JSONSTRING_RESULT_NAME;
	}

	/**
	 * 测试
	 * 
	 * @return
	 */
	public String testGrid() {
		System.out.println(RequestUtil.getParam(request, "page", ""));
		System.out.println(RequestUtil.getParam(request, "rows", ""));
		System.out.println(RequestUtil.getParam(request, "callback", ""));
		this.total = 100;
		rows = new ArrayList<Object>();
		for (int i = 0; i < 10; i++) {
			baseinfo = new TmBaseinfo();
			baseinfo.setRealName(i + "姓名");
			baseinfo.setCompany(i + "公司");
			rows.add(baseinfo);
		}
		return Contants.JSONSTRING_RESULT_NAME;
	}

	/**
	 * 主页
	 * 
	 * @return
	 */
	public String home() {
		menuIndex = "0";
		ActionContext.getContext().put("proList", CacheUtil.getProAllList());
		ActionContext.getContext().put("homeFlag", true);
		HomeData hd = null;
		HttpSession session = this.request.getSession();
		Object disCodeObj = session.getAttribute(Contants.SESSION_DISTRICT);
		if (null != disCodeObj) {
			String discode = disCodeObj.toString();
			hd = CacheUtil.bulidHomeData(officeSerive, shopService,
					baseInfoService, needService, tbsService, newsService,
					secondService, specialService, discode);
		} else
			hd = CacheUtil.getHome();
		ActionContext.getContext().put("data", hd);
		return Action.SUCCESS;
	}

	/**
	 * 高级搜索
	 * 
	 * @return
	 */
	public String seniorSearch() {
		ActionContext.getContext().put("proList", CacheUtil.getProAllList());
		return "seniorSearch";
	}
	
	/**
	 * 高级搜索-复选
	 * 
	 * @return
	 */
	public String seniorSearchMul() {
		ActionContext.getContext().put("proList", CacheUtil.getProAllList());
		return "seniorSearchMul";
	}

	/**
	 * 多条件搜索，所有模块公用，修改请写修改日志
	 * 
	 * @author F.C create update F.C 2011-12-07 对搜索条件中的字段名进行base64解密
	 * @return
	 */
	public String search() {
		String discode = "";
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			if (null == pageNo || "".equals(pageNo))
				pageNo = "1";
			if (null == limit || "".equals(limit))
				limit = "20";
			if (null == searchPro || "".equals(searchPro)) {
				// throw new Exception("ff chrome");
			}
			if (null == selectedTab || "".equals(selectedTab))
				selectedTab = "0";
			// map.put("searchPro", searchPro);
			// map.put("selectedTab", selectedTab);
			// if (null != lpts && !"".equals(lpts))
			// map.put("lpts", lpts);
			// if (null != keywordValue && !"".equals(keywordValue))
			// map.put("keywordValue", keywordValue);
			// searchStatus = RequestUtil.getParam(request, "searchStatus",
			// "");//条件状�1�7�，页面根据此项设置相应选项是否为�1�7�中状�1�7�1�7
			// searchQuery = RequestUtil.getParam(request, "searchQuery",
			// "");//搜索条件
			// searchPro = RequestUtil.getParam(request, "searchPro", "");//搜索项目
			// 处理查询条件
			if (null != searchQuery) {
				String[] queryAry = searchQuery.split("@");
				for (int i = 0; i < queryAry.length; i++) {
					try {
						String queryString = queryAry[i];
						String[] conditionAry = queryString.split("~");
						String columnName = BASE64Util
								.getFromBASE64(conditionAry[0]);
						String searchType = conditionAry[1];
						String minValue = conditionAry[2];
						String maxValue = "";
						if (conditionAry.length > 3)
							maxValue = conditionAry[3];
						String value = minValue + "@" + maxValue;
						map.put(columnName + "@" + searchType, value);
					} catch (Exception e) {
						continue;
					}
				}
			}
			HttpSession session = this.request.getSession();
			Object disCodeObj = session.getAttribute(Contants.SESSION_DISTRICT);
			if (null != disCodeObj)
				discode = disCodeObj.toString();
			pu = service.findByConditionMap(map, new Integer(pageNo),
					new Integer(limit), discode, searchPro, lptsValue, keywordValue,
					selectedTab);
		} catch (Exception e) {
			log.error("查询项目出错", e);
		}
		if ("9".equals(searchPro)) {
			menuIndex = "1";
			ActionContext.getContext().put("attentionBulidList",
			    CacheUtil.getHome().getAttentionBulidList());
			return "bulidSearch";
		} else if ("10".equals(searchPro)) {
			menuIndex = "3";
			return "secondBulid";
		} else {
			menuIndex = "2";
			needList = needService.findFreshNeed((new Integer(searchPro) + 1)
					+ "", discode);
			ActionContext.getContext()
					.put("proList", CacheUtil.getProAllList());
			ActionContext.getContext().put("keywordFlag", false);
			return "bus";
		}
	}

	/**
	 * 显示项目
	 * 
	 * @return
	 */
	public String proShow() {
		menuIndex = "2";
		try {
			Long id = RequestUtil.getParam(request, "id", 0l);
			if (null == searchPro || "".equals(searchPro))
				searchPro = "0";
			dataMap = service.findPro(searchPro, id);
		} catch (Exception e) {
			log.error("霄1�7求项目详细错评1�7", e);
		}
		switch (new Integer(searchPro)) {
		case 0:
			proShowPage = "/proshow_office.jsp";
			break;
		case 1:
			proShowPage = "/proshow_shop.jsp";
			break;
		case 2:
			proShowPage = "/proshow_business.jsp";
			break;
		case 3:
			proShowPage = "/proshow_industry.jsp";
			break;
		case 4:
			proShowPage = "/proshow_largepro.jsp";
			break;
		}
		return "proShow";
	}

	/**
	 * 查找需求信息
	 * 
	 * @return
	 */
	public String needShow() {
		try {
			String id = RequestUtil.getParam(request, "id", "");
			if (null == searchPro || "".equals(searchPro))
				searchPro = "0";
			dataMap = service.findNeed(id);
		} catch (Exception e) {
			log.error("霄1�7求查看错评1�7", e);
		}
		return "needShow";
	}

	/**
	 * 查找某人需求信息
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getMemNeedList() {
		try {
			if (null == searchPro || "".equals(searchPro))
				searchPro = "0";
			String mid = RequestUtil.getParam(request, "mid", "");
			List<Map<String, Object>> mapList = service.findNeedList(searchPro,
					mid);
			if (null != mapList)
				jsonString = JSONArray.fromObject(mapList).toString();
		} catch (Exception e) {
			log.error("查询具体人员相应霄1�7求列表信息出锄1�7", e);
			jsonString = "[]";
		}
		return Contants.JSONSTRING_RESULT_NAME;
	}

	/**
	 * 转向网上售楼处
	 * 
	 * @return
	 */
	public String bulid() {
		String discode = "";
		try {
			menuIndex = "1";
			if (null == pageNo || "".equals(pageNo))
				pageNo = "1";
			if (null == limit || "".equals(limit))
				limit = "20";
			HttpSession session = this.request.getSession();
			Object disCodeObj = session.getAttribute(Contants.SESSION_DISTRICT);
			if (null != disCodeObj)
				discode = disCodeObj.toString();
			pu = tbsService.findBulidList(new Integer(pageNo), new Integer(
					limit), discode);
			ActionContext.getContext().put("attentionBulidList",
			    CacheUtil.getHome().getAttentionBulidList());
		} catch (Exception e) {
			log.error("住宅", e);
		}
		return "bulid";
	}

	/**
	 * 转向地产行天下
	 * 
	 * @return
	 */
	public String bus() {
		try {
			// menuIndex = "1";
			if (null == pageNo || "".equals(pageNo))
				pageNo = "1";
			if (null == limit || "".equals(limit))
				limit = "20";
			// Map<String, String> paramMap = new HashMap<String, String>();
			// paramMap.put("nameparame", "");
			// paramMap.put("autingSate", "-1");
			// paramMap.put("area1", "-1");
			// paramMap.put("price1", "-1");
			// paramMap.put("discode", "-1");
			// 地产行天下主页
			ActionContext.getContext().put("homeFlag", true);
			ActionContext.getContext()
					.put("proList", CacheUtil.getProAllList());
			HomeData hd = CacheUtil.getHome();
			ActionContext.getContext().put("data", hd);
			menuIndex = "2";
		} catch (Exception e) {
			log.error("商业地产", e);
		}
		return "bus";
	}

	/**
	 * 关键字查询
	 * 
	 * @return
	 */
	public String keyWordSearch() {
		String proIndex = RequestUtil.getParam(request, "proIndex", "");
		String keyword = RequestUtil.getParam(request, "keyword", "");
		try {
			if (null == pageNo || "".equals(pageNo))
				pageNo = "1";
			if (null == limit || "".equals(limit))
				limit = "20";
			pu = service.findByKeyWord(keyword, proIndex, new Integer(pageNo),
					new Integer(limit));
			ActionContext.getContext().put("keyword", keyword);
			ActionContext.getContext().put("proIndex", proIndex);
			ActionContext.getContext().put("attentionBulidList",
                CacheUtil.getHome().getAttentionBulidList());
		} catch (Exception e) {
			log.error("", e);
		}
		if ("0".equals(proIndex)) {
			menuIndex = "1";
			return "bulidKeyWord";
		} else {
			menuIndex = "2";
			ActionContext.getContext()
					.put("proList", CacheUtil.getProAllList());
			ActionContext.getContext().put("keywordFlag", true);
			selectedTab = "0";
			if ("1".equals(proIndex)) {
				searchPro = "0";
			} else if ("2".equals(proIndex)) {
				searchPro = "1";
			}
			return "bus";
		}
	}

	/**
	 * 根据价格查询
	 * 
	 * @return
	 */
	public String searchByPrice() {
		String minValue = RequestUtil.getParam(request, "minValue", "");
		String maxValue = RequestUtil.getParam(request, "maxValue", "");
		String searchType = RequestUtil.getParam(request, "type", "");
		Integer proType = RequestUtil.getParam(request, "proType", 0);
		try {
			if (null == pageNo || "".equals(pageNo))
				pageNo = "1";
			if (null == limit || "".equals(limit))
				limit = "20";
			pu = service.findByPrice(minValue, maxValue, searchType, proType,
					new Integer(pageNo), new Integer(limit));
			ActionContext.getContext().put("minValue", minValue);
			ActionContext.getContext().put("maxValue", maxValue);
			ActionContext.getContext().put("searchType", searchType);
			ActionContext.getContext().put("proType", proType);
		} catch (Exception e) {
		}
		if (proType > 6) {
			menuIndex = "2";
			ActionContext.getContext()
					.put("proList", CacheUtil.getProAllList());
			if (proType == 7) {
				searchPro = "0";
				// needList = needService
				// .findFreshNeed((new Integer(searchPro) + 1) + "");
			} else if (proType == 8) {
				searchPro = "1";
				// needList = needService
				// .findFreshNeed((new Integer(searchPro) + 1) + "");
			}
			// 根据价格查询
			ActionContext.getContext().put("priceSearchFlag", true);
			return "bus";
		} else {
			menuIndex = "1";
			// ActionContext.getContext().put("attentionBulidList",
			// tbsService.findFreshBulid());
			return "bulidPrice";
		}
	}

	/**
	 * 退出
	 * 
	 * @return
	 */
	public String exit() {
		request.getSession().invalidate();
		return "home";
	}

	/**
	 * 切换地区，须更新session中地区信息，同时在cookie中记录 注：地产行天下板块不变(旅游地产不受地区限制)
	 * 
	 * @return
	 */
	public String changeArea() {
		try {
			String district = RequestUtil.getParam(request, "district",
					"3200000000");
			String str = "district," + district;
			CookiesUtil.removeCookie(Contants.COOKIE_DISTRICT_INFO, request,
					response);
			CookiesUtil.addCookie(Contants.COOKIE_DISTRICT_INFO, str, 24 * 60
					* 60 * 1000 * 30, response, request);
			this.request.getSession().setAttribute(Contants.SESSION_DISTRICT,
					district);
			response.getWriter().print("true");
		} catch (Exception e) {
		}
		return null;
	}

	/**
	 * 二手房买卖
	 * 
	 * @return
	 */
	public String secondBulid() {
		String discode = "";
		try {
			menuIndex = "3";
			if (null == pageNo || "".equals(pageNo))
				pageNo = "1";
			if (null == limit || "".equals(limit))
				limit = "20";
			HttpSession session = this.request.getSession();
			Object disCodeObj = session.getAttribute(Contants.SESSION_DISTRICT);
			if (null != disCodeObj)
				discode = disCodeObj.toString();
			pu = secondService.findSecondBulidList(new Integer(pageNo),
					new Integer(limit), discode);
			List<TpSecondBuliding> tsbList = secondService
					.findTopWeight(3, "2");
			ActionContext.getContext().put("tsbList", tsbList);
			HomeData hd = CacheUtil.getHome();
            ActionContext.getContext().put("data", hd);
		} catch (Exception e) {
			log.error("住宅", e);
		}
		return "secondBulid";
	}

	/**
	 * 租房
	 * 
	 * @param hd
	 * @return
	 */
	public String rentHouse() {
		String discode = "";
		try {
			menuIndex = "4";
			if (null == pageNo || "".equals(pageNo))
				pageNo = "1";
			if (null == limit || "".equals(limit))
				limit = "20";
			HttpSession session = this.request.getSession();
			Object disCodeObj = session.getAttribute(Contants.SESSION_DISTRICT);
			if (null != disCodeObj)
				discode = disCodeObj.toString();
			pu = secondService.findSecondBulidRentList(new Integer(pageNo),
					new Integer(limit), discode);
			List<TpSecondBuliding> tsbList = secondService
					.findTopWeight(3, "1");
			ActionContext.getContext().put("tsbList", tsbList);
			HomeData hd = CacheUtil.getHome();
            ActionContext.getContext().put("data", hd);
		} catch (Exception e) {
			log.error("租房", e);
		}
		return "rentHouse";
	}

	/**
	 * 团购
	 * 
	 * @return
	 */
	public String tuan() {
		menuIndex = "5";
		try {
			List<TpSpecials> list = specialService.findActiveSpecials(1, "1");
			if (null != list && list.size() > 0)
				special = list.get(0);
		} catch (Exception e) {
			log.error("团购信息获取失败", e);
		}
		try {
			if (special != null) {
				TpBuilding tpbuild = tbsService.getById(special.getBulidingId()
						.toString());
				request.setAttribute("buliding", tpbuild);
			}
		} catch (Exception e) {
			log.error("楼盘信息获取失败", e);
		}
		return "tuan";
	}

	/**
	 * 团购
	 * 
	 * @return
	 */
	public String special() {
		menuIndex = "6";
		try {
			List<TpSpecials> list = specialService.findActiveSpecials(1, "2");
			if (null != list && list.size() > 0)
				special = list.get(0);
		} catch (Exception e) {
			log.error("团购信息获取失败", e);
		}
		try {
			if (special != null) {
				TpBuilding tpbuild = tbsService.getById(special.getBulidingId()
						.toString());
				request.setAttribute("buliding", tpbuild);
			}
		} catch (Exception e) {
			log.error("楼盘信息获取失败", e);
		}
		return "special";
	}

	/**
	 * 
	 * @return
	 */
	public String jointuan() {
		menuIndex = RequestUtil.getParam(request, "menuIndex", "5");
		String idstr = RequestUtil.getParam(request, "id", "");
		String bid = RequestUtil.getParam(request, "bid", "");
		try {
			List<TpSpecials> list = specialService.findbyId(idstr);
			if (null != list && list.size() > 0)
				request.setAttribute("tpSpecials", list.get(0));
		} catch (Exception e) {
			log.error("团购信息获取失败", e);
		}
		try {

			TpBuilding tpbuild = tbsService.getById(bid);
			request.setAttribute("tpbuild", tpbuild);
		} catch (Exception e) {
			log.error("楼盘信息获取失败", e);
		}

		return "jointuan";
	}

	/**
	 * 获取所有公告信息
	 * 
	 * @return
	 */
	public String showAnnouncement() {
		try {
			List<TsAnnouncement> contentList = annouService.findAnnouncement();
			ActionContext.getContext().put("contentList", contentList);
		} catch (Exception e) {
			log.error("获取公告信息列表失败", e);
		}
		return "annoumentList";
	}

	public String announcementRead() {
		try {
			Long id = RequestUtil.getParam(request, "id", 0l);
			TsAnnouncement announcement = annouService.findById(id);
			ActionContext.getContext().put("announcement", announcement);
		} catch (Exception e) {
			log.error("阅读公告信息出错", e);
		}
		return "announcementShow";
	}

	public String officeView() {
		try {
			Long id = RequestUtil.getParam(request, "id", 0l);
			if (id != 0l) {
				office = officeSerive.read(id);
			}
		} catch (Exception e) {
			log.error("写字楼详细信息查看错误", e);
		}
		return "officeShow";
	}

	public HomeData filterHomeData(HomeData hd) {
		return hd;
	}

	public String getJsonString() {
		return jsonString;
	}

	public void setJsonString(String jsonString) {
		this.jsonString = jsonString;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public List<Object> getRows() {
		return rows;
	}

	public void setRows(List<Object> rows) {
		this.rows = rows;
	}

	public String getSearchQuery() {
		return searchQuery;
	}

	public void setSearchQuery(String searchQuery) {
		this.searchQuery = searchQuery;
	}

	public String getSearchStatus() {
		return searchStatus;
	}

	public void setSearchStatus(String searchStatus) {
		this.searchStatus = searchStatus;
	}


	public String getSearchPro() {
		return searchPro;
	}

	public void setSearchPro(String searchPro) {
		this.searchPro = searchPro;
	}

	public String getPageNo() {
		return pageNo;
	}

	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}

	public String getLimit() {
		return limit;
	}

	public void setLimit(String limit) {
		this.limit = limit;
	}

	public TmBaseinfo getBaseinfo() {
		return baseinfo;
	}

	public void setBaseinfo(TmBaseinfo baseinfo) {
		this.baseinfo = baseinfo;
	}

	public List<Map<String, Object>> getDataList() {
		return dataList;
	}

	public void setDataList(List<Map<String, Object>> dataList) {
		this.dataList = dataList;
	}

	public List<Office> getOfficeList() {
		return officeList;
	}

	public void setOfficeList(List<Office> officeList) {
		this.officeList = officeList;
	}

	public List<Shop> getShopList() {
		return shopList;
	}

	public void setShopList(List<Shop> shopList) {
		this.shopList = shopList;
	}

	public List<TmBaseinfo> getBaseInfoList() {
		return baseInfoList;
	}

	public void setBaseInfoList(List<TmBaseinfo> baseInfoList) {
		this.baseInfoList = baseInfoList;
	}

	public List<OfficeNeed> getOfficeNeedList() {
		return officeNeedList;
	}

	public void setOfficeNeedList(List<OfficeNeed> officeNeedList) {
		this.officeNeedList = officeNeedList;
	}

	public List<OfficeNeed> getShopNeedList() {
		return shopNeedList;
	}

	public void setShopNeedList(List<OfficeNeed> shopNeedList) {
		this.shopNeedList = shopNeedList;
	}

	public PageUtil getPu() {
		return pu;
	}

	public void setPu(PageUtil pu) {
		this.pu = pu;
	}

	public Map<String, Object> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}

	public String getSelectedTab() {
		return selectedTab;
	}

	public void setSelectedTab(String selectedTab) {
		this.selectedTab = selectedTab;
	}

	public String getMenuIndex() {
		return menuIndex;
	}

	public void setMenuIndex(String menuIndex) {
		this.menuIndex = menuIndex;
	}

	public String getKeywordValue() {
		return keywordValue;
	}

	public void setKeywordValue(String keywordValue) {
		this.keywordValue = keywordValue;
	}

	public List<OfficeNeed> getNeedList() {
		return needList;
	}

	public void setNeedList(List<OfficeNeed> needList) {
		this.needList = needList;
	}

	public TpSpecials getSpecial() {
		return special;
	}

	public void setSpecial(TpSpecials special) {
		this.special = special;
	}

	/**
	 * 测试通过httpclient模拟登陆本系统
	 * 
	 * @return
	 */
	public String bulidImg() {
		HttpClient client = null;
		client = HttpClientUtil.getInstance().initCommonsHttpClient(client);
		WebSiteUtil wsu = new WebSiteUtil(client);
		String basePath = request.getSession().getServletContext().getRealPath(
				"/");
		try {
			String cookie = wsu.downLoadYZM(
					"http://localhost:8080/estate/member/yanzhengma.jsp",
					"123", basePath);
			HttpSession session = request.getSession();
			session.setAttribute("siteCookie", cookie);
			session.setAttribute("hclient", client);
			ActionContext.getContext().put("imgSrc",
					XmlUtil.getValue("imgTemp", "sysConfig") + "/" + "123.gif");
		} catch (HttpException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "sso";
	}

	/**
	 * 登陆本系统执行方法
	 * 
	 * @return
	 * @throws HttpException
	 * @throws IOException
	 */
	public String testSSO() throws HttpException, IOException {
		String code = RequestUtil.getParam(request, "code", "");
		HttpSession session = request.getSession();
		String cookie = (String) session.getAttribute("siteCookie");
		HttpClient client = (HttpClient) session.getAttribute("hclient");
		House365Util hu = new House365Util(client);
		hu.testLogin("fc19861011", "000000", cookie, code);
		return null;
	}

	public Office getOffice() {
		return office;
	}

	public void setOffice(Office office) {
		this.office = office;
	}

	public String getProShowPage() {
		return proShowPage;
	}

	public void setProShowPage(String proShowPage) {
		this.proShowPage = proShowPage;
	}

	public List<TpImage> getImgList() {
		return imgList;
	}

	public void setImgList(List<TpImage> imgList) {
		this.imgList = imgList;
	}

	public String getLptsValue() {
		return lptsValue;
	}

	public void setLptsValue(String lptsValue) {
		this.lptsValue = lptsValue;
	}
}
