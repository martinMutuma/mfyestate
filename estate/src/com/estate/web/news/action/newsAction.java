package com.estate.web.news.action;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import com.estate.base.web.BaseAction;
import com.estate.business.news.NewsService;
import com.estate.business.news.NewsServiceImpl;
import com.estate.domain.news.TsNews;
import com.estate.util.comm.RequestUtil;
import com.estate.util.comm.StringUtil;

/**
 * 新闻相关Action
 * 
 * @author SFF
 * 
 */
public class newsAction extends BaseAction {

	private static final long serialVersionUID = 688970037309060648L;

	private int total;
	private int page;
	private int lastPage;
	private TsNews news;
	private int type;
	private File imageFile;
	private String imageFileFileName;
	private List<TsNews> newestList;
	private List<TsNews> todayList;
	private List<TsNews> tradeList;
	private List<TsNews> imgList;
	private List<TsNews> commentList;
	private List<TsNews> landedEstateList;
	private List<TsNews> personageList;
	private List<TsNews> projectList;
	private List<TsNews> rankingList;
	private List<TsNews> recommendList;
	private List<TsNews> hotpsotList;
	private List<TsNews> typeList;
	private NewsService service;
	private String searchContent = "";
	int rownum = 20;
	int typeTitleLength = 40;
	int newsTitleLength = 20;
	private String menuIndex ;

	public String getMenuIndex() {
		return menuIndex;
	}

	public void setMenuIndex(String menuIndex) {
		this.menuIndex = menuIndex;
	}

	public newsAction() {
		service = new NewsServiceImpl();
	}

	/*
	 * 转向管理页面
	 */
	@SuppressWarnings("unchecked")
	public String toNews() {
		menuIndex ="7";
		List<TsNews> list = new ArrayList<TsNews>();
		try {
			list = service.getNewesList(0, 9);
			newestList = new ArrayList<TsNews>();
			for (TsNews news : list) {
				news.setTitle(StringUtil.formatTitle(news.getTitle(), newsTitleLength));
				newestList.add(news);
			}
			list = service.getListByteType(0, 9, 1, "");
			todayList = new ArrayList<TsNews>();
			for (TsNews news : list) {
				news.setTitle(StringUtil.formatTitle(news.getTitle(), newsTitleLength));
				todayList.add(news);
			}
			list = service.getListByteType(0, 9, 2, "");
			tradeList = new ArrayList<TsNews>();
			for (TsNews news : list) {
				news.setTitle(StringUtil.formatTitle(news.getTitle(), newsTitleLength));
				tradeList.add(news);
			}
			list = service.getImgList(0, 4);
			imgList = new ArrayList<TsNews>();
			for (TsNews news : list) {
				news.setTitle(StringUtil.formatTitle(news.getTitle(), newsTitleLength));
				imgList.add(news);
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return "toNews";
	}

	public String toNewsType() {
		menuIndex ="7";
		List<TsNews> list = new ArrayList<TsNews>();
		try {
			total = service.newsTotal(type, searchContent.trim());
			if (page - 1 < 0)
				page = 1;

			lastPage = total / rownum;
			if (lastPage == 0)
				lastPage = 1;
			if (total > rownum && total % rownum != 0)
				lastPage++;
			if (page > lastPage)
				page = lastPage;

			list = service.getListByteType((page - 1) * rownum, page * rownum, type, searchContent.trim());

			typeList = new ArrayList<TsNews>();
			for (TsNews news : list) {
				news.setTitle(StringUtil.formatTitle(news.getTitle(), typeTitleLength));
				typeList.add(news);
			}

			list = service.getImgList(0, 4);
			imgList = new ArrayList<TsNews>();
			for (TsNews news : list) {
				news.setTitle(StringUtil.formatTitle(news.getTitle(), typeTitleLength));
				imgList.add(news);
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return "toNewsType";
	}

	/*
	 * 跳转信息页面
	 */
	public String toNewsInfo() {
		menuIndex ="7";
		try {
			long id = RequestUtil.getParam(request, "id", 0l);
			service.addcheckNum(id);	
			if (!"".equals(id)) {
				news = service.read(id);
			}
			List<TsNews> list = service.getImgList(0, 4);
			imgList = new ArrayList<TsNews>();
			for (TsNews news : list) {
				news.setTitle(StringUtil.formatTitle(news.getTitle(), typeTitleLength));
				imgList.add(news);
			}
		} catch (Exception e) {
			log.error("查询信息出错", e);
		}
		return "toNewsInfo";
	}

	public String getHotspot() {
		try {
			hotpsotList = service.gethotpsotList(0, 9);
			PrintWriter out = response.getWriter();
			if (hotpsotList!=null) {
				String jsonsb = "[";
				for (TsNews news : hotpsotList) {
					jsonsb += "{title:'" + StringUtil.formatTitle(news.getTitle(), newsTitleLength) + "',";
					jsonsb += "id:'" + news.getId() + "',";
					jsonsb += "columnType:'" + news.getColumnType() + "',";
					jsonsb += "createTime:'" + news.getCreateTime().toString().substring(5, 10) + "'},";
				}
				jsonsb = jsonsb.substring(0, jsonsb.length() - 1);
				jsonsb += "]";
				out.write(jsonsb);
			} else {
				out.write("1");
			}
		} catch (Exception e) {
			log.error("查询热点新闻出错", e);
		}
		return null;
	}

	public String getRecommend() {
		try {
			recommendList = service.getRecommendList(0, 9);
			PrintWriter out = response.getWriter();
			
			if (recommendList!=null && recommendList.size() > 0) {
				String jsonsb = "[";
				for (TsNews news : recommendList) {
					jsonsb += "{title:'" + StringUtil.formatTitle(news.getTitle(), newsTitleLength) + "',";
					jsonsb += "id:'" + news.getId() + "',";
					jsonsb += "columnType:'" + news.getColumnType() + "',";
					jsonsb += "createTime:'" + news.getCreateTime().toString().substring(5, 10) + "'},";
				}
				jsonsb = jsonsb.substring(0, jsonsb.length() - 1);
				jsonsb += "]";
				out.write(jsonsb);
			} else {
				out.write("1");
			}
		} catch (Exception e) {
			log.error("查询推荐新闻出错", e);
		}
		return null;
	}

	public String getRanking() {
		try {
			rankingList = service.getRankingList(0, 9);
			PrintWriter out = response.getWriter();
			if (rankingList != null) {
				if (rankingList.size() > 0) {
					String jsonsb = "[";
					for (TsNews news : rankingList) {
						jsonsb += "{title:'" + StringUtil.formatTitle(news.getTitle(), newsTitleLength) + "',";
						jsonsb += "id:'" + news.getId() + "',";
						jsonsb += "columnType:'" + news.getColumnType() + "',";
						jsonsb += "createTime:'" + news.getCreateTime().toString().substring(5, 10) + "'},";
					}
					jsonsb = jsonsb.substring(0, jsonsb.length() - 1);
					jsonsb += "]";
					out.write(jsonsb);
				} else {
					out.write("1");
				}
			}
		} catch (Exception e) {
			log.error("查询热门排行新闻出错", e);
		}
		return null;
	}

	public String getTypeNews() {
		try {
			int type = new Integer(RequestUtil.getParam(request, "type", "0"));
			List<TsNews> list = service.getListByteType(0, 9, type, "");
			PrintWriter out = response.getWriter();
			if (list!=null) {
				String jsonsb = "[";
				for (TsNews news : list) {
					jsonsb += "{title:'" + StringUtil.formatTitle(news.getTitle(), newsTitleLength) + "',";
					jsonsb += "id:'" + news.getId() + "',";
					jsonsb += "columnType:'" + news.getColumnType() + "',";
					jsonsb += "createTime:'" + news.getCreateTime().toString().substring(5, 10) + "'},";
				}
				jsonsb = jsonsb.substring(0, jsonsb.length() - 1);
				jsonsb += "]";
				out.write(jsonsb);
			} else {
				out.write("1");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public TsNews getNews() {
		return news;
	}

	public void setNews(TsNews news) {
		this.news = news;
	}

	public File getImageFile() {
		return imageFile;
	}

	public void setImageFile(File imageFile) {
		this.imageFile = imageFile;
	}

	public String getImageFileFileName() {
		return imageFileFileName;
	}

	public void setImageFileFileName(String imageFileFileName) {
		this.imageFileFileName = imageFileFileName;
	}

	public List<TsNews> getNewestList() {
		return newestList;
	}

	public void setNewestList(List<TsNews> newestList) {
		this.newestList = newestList;
	}

	public List<TsNews> getTodayList() {
		return todayList;
	}

	public void setTodayList(List<TsNews> todayList) {
		this.todayList = todayList;
	}

	public List<TsNews> getTradeList() {
		return tradeList;
	}

	public void setTradeList(List<TsNews> tradeList) {
		this.tradeList = tradeList;
	}

	public List<TsNews> getImgList() {
		return imgList;
	}

	public void setImgList(List<TsNews> imgList) {
		this.imgList = imgList;
	}

	public List<TsNews> getCommentList() {
		return commentList;
	}

	public void setCommentList(List<TsNews> commentList) {
		this.commentList = commentList;
	}

	public List<TsNews> getLandedEstateList() {
		return landedEstateList;
	}

	public void setLandedEstateList(List<TsNews> landedEstateList) {
		this.landedEstateList = landedEstateList;
	}

	public List<TsNews> getPersonageList() {
		return personageList;
	}

	public void setPersonageList(List<TsNews> personageList) {
		this.personageList = personageList;
	}

	public List<TsNews> getProjectList() {
		return projectList;
	}

	public void setProjectList(List<TsNews> projectList) {
		this.projectList = projectList;
	}

	public List<TsNews> getRankingList() {
		return rankingList;
	}

	public void setRankingList(List<TsNews> rankingList) {
		this.rankingList = rankingList;
	}

	public List<TsNews> getRecommendList() {
		return recommendList;
	}

	public void setRecommendList(List<TsNews> recommendList) {
		this.recommendList = recommendList;
	}

	public List<TsNews> getHotpsotList() {
		return hotpsotList;
	}

	public void setHotpsotList(List<TsNews> hotpsotList) {
		this.hotpsotList = hotpsotList;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public List<TsNews> getTypeList() {
		return typeList;
	}

	public void setTypeList(List<TsNews> typeList) {
		this.typeList = typeList;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	public int getTypeTitleLength() {
		return typeTitleLength;
	}

	public void setTypeTitleLength(int typeTitleLength) {
		this.typeTitleLength = typeTitleLength;
	}

	public int getNewsTitleLength() {
		return newsTitleLength;
	}

	public void setNewsTitleLength(int newsTitleLength) {
		this.newsTitleLength = newsTitleLength;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public String getSearchContent() {
		return searchContent;
	}

	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}
}
