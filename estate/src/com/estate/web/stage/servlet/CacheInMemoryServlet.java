package com.estate.web.stage.servlet;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Timer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.log4j.Logger;

import com.estate.business.system.DictionaryServiceImpl;
import com.estate.business.system.IDictionaryService;
import com.estate.business.system.ISearchService;
import com.estate.business.system.SearchServiceImpl;
import com.estate.domain.system.TdDefination;
import com.estate.domain.system.TsPro;
import com.estate.util.CacheUtil;
import com.estate.util.comm.TaskUtil;

public class CacheInMemoryServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -5842016980685305102L;
	private static boolean debug = true;// 是否debug模式
	public static Logger log = Logger.getLogger(CacheInMemoryServlet.class);

	@SuppressWarnings("unchecked")
	public void init() throws ServletException {
		// 从web.xml中读取debug模式
		debug = (new Boolean(getInitParameter("debug"))).booleanValue();
		if (debug)
			log.info("\r\n---- Debug model on ----");
		if (debug)
			log.info("\r\n---- CacheInMemoryServlet initialization started ----");
		if (debug)
			log.info("\r\n---- project loading ----");
		ISearchService searchSev = new SearchServiceImpl();
		List<TsPro> proList = searchSev.findAllPro();
		CacheUtil.setProAllList(proList);
		if (debug)
			log.info("\r\n---- all project load success:"
					+ proList.size() + " ----");
		if (debug)
			log.info("\r\n---- dictionary data loading ----");
		Map<String, Object> dictionaryMap = new HashMap<String, Object>();
		IDictionaryService definationService = new DictionaryServiceImpl();
		List<TdDefination> prodefinationList = definationService
				.findAllDefByCode("01");
		dictionaryMap.put("01", prodefinationList);
		List<TdDefination> defList = definationService.findAllDefByCode("99");
		dictionaryMap.put("99", defList);
		CacheUtil.setDictionaryMap(dictionaryMap);
		if (debug)
			log.info("\r\n---- all dictionary load success ----");
		// if (debug)
		// System.out
		// .println("---- home page cache starting load ----\r\n");
		// OfficeService officeSerive = new OfficeServiceImpl();
		// ShopService shopService = new ShopServiceImpl();
		// BaseInfoService baseInfoService = new BaseInfoServiceImpl();
		// OfficeNeedService needService = new OfficeNeedServiceImpl();
		// TpBuildingService bulidService = new TpBuildingServiceImpl();
		// HomeData hd = new HomeData();
		// hd.setBaseinfoList(baseInfoService.findFreshManage());
		// hd.setOfficeList(officeSerive.findFreshOffice());
		// hd.setOfficeNeedList(needService.findFreshNeed("1"));
		// hd.setShopNeedList(needService.findFreshNeed("2"));
		// hd.setShopList(shopService.findFreshShop());
		// hd.setBulidList(bulidService.findTop6Bulid());
		// CacheUtil.setHome(hd);
		// if (debug)
		// System.out
		// .println("---- home cache load success ----\r\n");
		if (debug)
			log.info("---- CacheInMemoryServlet initialization completed ----\r\n");
		if (debug)
			log.info("---- Task on ----\r\n");
		Timer timer = new Timer();
		timer.schedule(new TaskUtil(), 1000, 60000 * 30);// 在系统启动后1S开始执行任务调度，每隔30S执行一次
		if (debug)
			log.info("---- Task on success ----\r\n");
		// if (debug)
		// System.out
		// .println("---- load menu start ----\r\n");
		// CacheUtil.setMenuList(XmlUtil.getMenuList("menu"));
		// if (debug)
		// System.out
		// .println("---- load menu success ----\r\n");
		System.gc();
	}
}
