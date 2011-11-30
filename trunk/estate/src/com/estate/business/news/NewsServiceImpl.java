package com.estate.business.news;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.news.TsNews;
import com.estate.domain.news.TsNewsFormBean;

public class NewsServiceImpl implements NewsService {

	private IBaseDao<TsNews, Long> dao;

	public static Logger log = Logger.getLogger(NewsServiceImpl.class);

	public NewsServiceImpl() {
		dao = new BaseDao<TsNews, Long>(TsNews.class);
	}

	public Map<String, Object> findAll(TsNewsFormBean news, String page, String row) throws Exception {
		String sql = "select * from t_s_news n where 1=1 ";
		String countSql = "select count(n.id) from t_s_news n where 1=1 ";
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if (news != null) {
				if (news.getTitle() != null && !"".equals(news.getTitle())) {
					sql += " and n.title like '%" + news.getTitle() + "%' ";
					countSql += " and n.title like '%" + news.getTitle() + "%' ";
				}
				if (news.getColumnType() != null && !"".equals(news.getColumnType())) {
					sql += " and n.columnType = " + news.getColumnType();
					countSql += " and n.columnType = " + news.getColumnType();
				}
				if (news.getRecommendFlag() != null && !"".equals(news.getRecommendFlag())) {
					sql += " and n.recommendflag = " + news.getRecommendFlag();
					countSql += " and n.recommendflag = " + news.getRecommendFlag();
				}
				if (news.getStressFlag() != null && !"".equals(news.getStressFlag())) {
					sql += " and n.stressflag = " + news.getStressFlag();
					countSql += " and n.stressflag = " + news.getStressFlag();
				}
				if (news.getImgFlag() != null && !"".equals(news.getImgFlag())) {
					sql += " and n.imgflag = " + news.getImgFlag();
					countSql += " and n.imgflag = " + news.getImgFlag();
				}
			}

			if (page != null && row != null) {
				int snum = Integer.parseInt(page) - 1;
				sql += "   limit  " + (snum * Integer.parseInt(row)) + "," + row + " ";
			}
			List<TsNews> list = dao.findList(sql);
			int total = 0;
			if (list.size() != 0) {
				total = Integer.parseInt((dao.findObjectArryList(countSql).get(0))[0] + "");
			}
			map.put("list", list);
			map.put("total", total);
		} catch (Exception e) {
			log.error(e.getMessage() + "###sql=" + sql, e);
		}
		return map;
	}

	public TsNews read(Long id) throws Exception {
		try {
			return dao.read(id);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return null;
		}
	}

	public List<TsNews> getImgList(int startRow, int endRow) throws Exception {
		String sql = "select * from t_s_news where ImgFlag = 0 order by createtime desc limit " + startRow + ","
				+ endRow;
		try {
			return dao.findList(sql);
		} catch (Exception e) {
			log.error(e.getMessage() + "####sql=" + sql, e);
			return null;
		}
	}

	public List<TsNews> getNewesList(int startRow, int endRow) throws Exception {
		String sql = "select * from t_s_news where columnType !=7  order by createtime desc limit " + startRow + "," + endRow;
		try {
			log.info(sql);
			return dao.findList(sql);
		} catch (Exception e) {
			log.error(e.getMessage() + "####sql=" + sql, e);
			return null;
		}
	}

	public List<TsNews> getRankingList(int startRow, int endRow) throws Exception {
		String sql = "select * from t_s_news order by ClickNum desc limit " + startRow + "," + endRow;
		try {
			return dao.findList(sql);
		} catch (Exception e) {
			log.error(e.getMessage() + "####sql=" + sql, e);
			return null;
		}
	}

	public List<TsNews> getRecommendList(int startRow, int endRow) throws Exception {
		String sql = "select * from t_s_news where recommendFlag = 0 order by createtime desc limit " + startRow + ","
				+ endRow;
		try {
			log.info(sql);
			return dao.findList(sql);
		} catch (Exception e) {
			log.error(e.getMessage() + "####sql=" + sql, e);
			return null;
		}
	}

	public List<TsNews> gethotpsotList(int startRow, int endRow) throws Exception {
		String sql = "select * from t_s_news order by ClickNum desc limit " + startRow + "," + endRow;
		try {
			return dao.findList(sql);
		} catch (Exception e) {
			log.error(e.getMessage() + "####sql=" + sql, e);
			return null;
		}
	}

	public int newsTotal(int type, String searchContent) throws Exception {
		String sql = "select count(1) from t_s_news where title like '%" + searchContent + "%' ";
		try {
			if (type != 0) {
				sql += " and ColumnType = " + type;
			}
			log.info(sql);
			return Integer.parseInt((dao.findObjectArryList(sql).get(0))[0] + "");
		} catch (Exception e) {
			log.error(e.getMessage() + "####sql=" + sql, e);
			return 0;
		}

	}

	public List<TsNews> getListByteType(int startRow, int endRow, int type, String searchContent) throws Exception {
		String sql = "select * from t_s_news where ";
		try {
			if (type == 0) {
				sql += "  title like '%" + searchContent + "%' ";
			} else {
				if (searchContent == null || "".equals(searchContent)) {
					sql += " ColumnType = " + type;
				} else {
					sql += " title like '%" + searchContent + "%' and ColumnType =  " + type;
				}
			}
			sql += "  order by createtime desc limit " + startRow + "," + endRow;
			return dao.findList(sql);
		} catch (Exception e) {
			log.error(e.getMessage() + "####sql=" + sql, e);
			return null;
		}

	}

	public void addcheckNum(long id) throws Exception {
		String sql = "update t_s_news set ClickNum = ClickNum+1 where id = "+id;
		try {
			dao.update(sql);
		} catch (Exception e) {
			log.error(e.getMessage() + "####sql=" + sql, e);
		}
		
	}

}
