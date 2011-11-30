package com.estate.util.comm;

import java.util.TimerTask;

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
import com.estate.domain.system.HomeData;
import com.estate.util.CacheUtil;

public class TaskUtil extends TimerTask {

	public void run() {
		OfficeService officeSerive = new OfficeServiceImpl();
		ShopService shopService = new ShopServiceImpl();
		BaseInfoService baseInfoService = new BaseInfoServiceImpl();
		OfficeNeedService needService = new OfficeNeedServiceImpl();
		TpBuildingService bulidService = new TpBuildingServiceImpl();
		TpSecondBulidingService sbservice = new TpSecondBulidingServiceImpl();
		NewsService newsService = new NewsServiceImpl();
		SpecialsService specialService = new SpecialsServiceImpl();
		HomeData hd = CacheUtil.bulidHomeData(officeSerive, shopService,
				baseInfoService, needService, bulidService,newsService,sbservice,specialService, "");
		CacheUtil.setHome(hd);
	}

}
