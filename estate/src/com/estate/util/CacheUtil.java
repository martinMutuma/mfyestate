package com.estate.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.estate.business.building.TpBuildingService;
import com.estate.business.building.TpSecondBulidingService;
import com.estate.business.member.BaseInfoService;
import com.estate.business.news.NewsService;
import com.estate.business.pro.OfficeNeedService;
import com.estate.business.pro.OfficeService;
import com.estate.business.pro.ShopService;
import com.estate.business.pro.SpecialsService;
import com.estate.domain.pro.TpSpecials;
import com.estate.domain.system.HomeData;
import com.estate.domain.system.TsMenu;
import com.estate.domain.system.TsPro;

public class CacheUtil {
	private static List<TsPro> proAllList;
	private static Map<String, Object> dictionaryMap; // 字典表
	private static Map<String, String> proMap;// 存放商业地产查询语句
	private static HomeData home;
	private static List<TsMenu> menuList;
	static {
		if (null == getProMap())
			setProMap(new HashMap<String, String>());
		Map<String, String> map = getProMap();
		map
				.put(
						"0",
						""
								+ " ");
		map
				.put(
						"1",
						""
								+ ""
								+ ""
								+ "");
		map.put("2", "t_p_business t");
		map.put("3", "t_p_industry t");
		map.put("4", "t_p_largepro t");
		map.put("5", "");
		map
				.put(
						"9",
						"");
		map
		.put(
				"10",
				"");
		map
		.put(
				"11",
		"");
	}

	public static Map<String, String> getProMap() {
		return proMap;
	}

	public static void setProMap(Map<String, String> proMap) {
		CacheUtil.proMap = proMap;
	}

	public static Map<String, Object> getDictionaryMap() {
		return dictionaryMap;
	}

	public static void setDictionaryMap(Map<String, Object> dictionaryMap) {
		CacheUtil.dictionaryMap = dictionaryMap;
	}

	public static List<TsPro> getProAllList() {
		return proAllList;
	}

	public static void setProAllList(List<TsPro> proAllList) {
		CacheUtil.proAllList = proAllList;
	}

	public static HomeData getHome() {
		return home;
	}

	public static void setHome(HomeData home) {
		CacheUtil.home = home;
	}

	public static HomeData bulidHomeData(OfficeService officeSerive,
			ShopService shopService, BaseInfoService baseInfoService,
			OfficeNeedService needService, TpBuildingService bulidService,NewsService newService,TpSecondBulidingService sbservice,
			SpecialsService specialService,String district) {
		String[] priceAry = new String[] { "< 5000", "between 5000 and 8000",
				"between 8000 and 10000", "between 10000 and 12000",
				"between 12000 and 15000", "between 15000 and 20000", "> 20000" };
		String[] priceTipAry = new String[] { "5000元/㎡以下", "5000-8000元/㎡",
				"8000-1万元/㎡", "1万-1.2万元/㎡", "1.2万-1.5万元/㎡", "1.5万-2万元/㎡",
				"2万元/㎡以上" };
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		List<String> list1 = bulidService.findByTypeAndPrice(priceAry,
				priceTipAry, "0", district);
		if (null != list1)
			map.put("a", list1);
		List<String> list2 = bulidService.findByTypeAndPrice(priceAry,
				priceTipAry, "1", district);
		if (null != list1)
			map.put("b", list2);
		List<String> list3 = bulidService.findByTypeAndPrice(priceAry,
				priceTipAry, "2", district);
		if (null != list1)
			map.put("c", list3);
		List<String> list4 = bulidService.findByTypeAndPrice(priceAry,
				priceTipAry, "3", district);
		if (null != list1)
			map.put("d", list4);
		List<String> list5 = bulidService.findByTypeAndPrice(priceAry,
				priceTipAry, "4", district);
		if (null != list1)
			map.put("e", list5);
		List<String> list6 = bulidService.findByTypeAndPrice(priceAry,
				priceTipAry, "5", district);
		if (null != list1)
			map.put("f", list6);
		List<String> list7 = officeSerive.findByTypeAndPrice(priceAry,
				priceTipAry, district);
		if (null != list1)
			map.put("g", list7);
		List<String> list8 = shopService.findByTypeAndPrice(priceAry,
				priceTipAry, district);
		if (null != list1)
			map.put("h", list8);
		HomeData hd = new HomeData();
		hd.setBaseinfoList(baseInfoService.findFreshMessage(district));//经纪人
		hd.setOfficeList(officeSerive.findFreshOffice(district));//6条写字楼信息
		hd.setOfficeNeedList(needService.findFreshNeed("1",district));//写字楼需求
		hd.setShopNeedList(needService.findFreshNeed("2",district));//商铺需求
		hd.setShopList(shopService.findFreshShop(district));//6商铺
		hd.setBulidList(bulidService.findTop6Bulid(district));//最新楼盘
		hd.setAttentionBulidList(bulidService.findFreshBulid(district));//关注
		hd.setSpecialsList(specialService.findTop6Specials("2"));//折扣
		try {
			hd.setXylNewsList(newService.getListByteType(0, 8, 7, ""));
			hd.setEstateNews(newService.getNewesList(0, 8));
			hd.setSbList(sbservice.sbList(2));
			hd.setRentList(sbservice.sbList(1));
			hd.setRecommendSbList(sbservice.findTopWeight(10,"2"));
			hd.setRecommendRentList(sbservice.findTopWeight(10,"1"));
			//最新一条团购
			List<TpSpecials> list = specialService.findActiveSpecials(1, "1");
			if(!list.isEmpty())
			hd.setTpSpecialsTuan(list.get(0));
			//特价一套。
			list = specialService.findActiveSpecials(1, "2");
			if(!list.isEmpty())
			hd.setTpSpecialstOne(list.get(0));
		} catch (Exception e) {
			e.printStackTrace();
		}
		hd.setDhMap(map);
		return hd;
	}

	public static List<TsMenu> getMenuList() {
		return menuList;
	}

	public static void setMenuList(List<TsMenu> menuList) {
		CacheUtil.menuList = menuList;
	}

}
