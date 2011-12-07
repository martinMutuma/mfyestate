package com.estate.web.stage.action;

import java.util.List;

import com.estate.base.web.BaseAction;
import com.estate.business.system.ITsAnnouncementService;
import com.estate.business.system.TsAnnouncementServiceImpl;
import com.estate.domain.system.TsAnnouncement;

/**
 * 公告
 * 
 * @author F.C
 * 
 */
public class TsAnnouncementAction extends BaseAction {

	private static final long serialVersionUID = 6581253984582656049L;
	private ITsAnnouncementService service;
	private List<TsAnnouncement> announcementList;

	public TsAnnouncementAction() {
		service = new TsAnnouncementServiceImpl();
	}

	public String showAnnouncement() {
		try {
			announcementList = service.findAnnouncement();
		} catch (Exception e) {
			log.error("显示公告", e);
		}
		return "showAnnouncement";
	}

	public List<TsAnnouncement> getAnnouncementList() {
		return announcementList;
	}

	public void setAnnouncementList(List<TsAnnouncement> announcementList) {
		this.announcementList = announcementList;
	}
}
