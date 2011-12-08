package com.estate.web.action;

import java.util.List;

import com.estate.base.web.BaseAction;
import com.estate.business.service.ITsAnnouncementService;
import com.estate.business.service.TsAnnouncementServiceImpl;
import com.estate.domain.TsAnnouncement;
import com.estate.util.comm.Contants;
import com.estate.util.framework.PageUtil;

public class AnnouncementAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	private ITsAnnouncementService service;
	private TsAnnouncement announcement;
	private PageUtil pu;
	private List<Object> rows;
	private Long id;
	private int pageNo;
	private int limit;
	private int total;

	public AnnouncementAction() {
		service = new TsAnnouncementServiceImpl();
	}

	@SuppressWarnings("unchecked")
	public String manage() {
		try {
			if (pageNo <= 0)
				pageNo = 1;
			if (limit <= 0)
				limit = 20;
			pu = service.findAllAnnouncement(pageNo, limit);
			List list = pu.getList();
			int count = pu.getTotalRecords();
			if (list != null && list.size() > 0) {
				total = count;
				rows = list;
			}
		} catch (Exception e) {
			log.error("公告管理", e);
		}
		return Contants.JSONSTRING_RESULT_NAME;
	}

	/**
	 * 保存公告对象
	 * 
	 * @return
	 */
	public String save() {
		try {
			service.save(announcement);
			response.getWriter().print("<script>parent.operate('1')</script>");
		} catch (Exception e) {
			log.error("保存公告信息失败", e);
		}
		return null;
	}

	/**
	 * 跳转至修改页面
	 * 
	 * @return
	 */
	public String toModify() {
		try {
			announcement = service.findById(id);
		} catch (Exception e) {
			log.error("跳转至维护页面失败", e);
		}
		return "showInfo";
	}

	/**
	 * 删除公告对象
	 * @return
	 */
	public String delete() {
		try {
			service.deleteById(id);
			response.getWriter().print("success");
		} catch (Exception e) {
			log.error("删除公告信息失败", e);
		}
		return null;
	}

	public PageUtil getPu() {
		return pu;
	}

	public void setPu(PageUtil pu) {
		this.pu = pu;
	}

	public List<Object> getRows() {
		return rows;
	}

	public void setRows(List<Object> rows) {
		this.rows = rows;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public TsAnnouncement getAnnouncement() {
		return announcement;
	}

	public void setAnnouncement(TsAnnouncement announcement) {
		this.announcement = announcement;
	}
}
