package com.estate.business.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.TsNews;
import com.estate.domain.TsNewsFormBean;

public class NewsServiceImpl implements NewsService {

	private IBaseDao<TsNews, Long> dao;

	public NewsServiceImpl() {
		dao = new BaseDao<TsNews, Long>(TsNews.class);
	}

	public boolean deleteByIdString(String idString) {
		boolean isFlag = true;
		if (idString == null || "".equals(idString))
			return false;
		String sql = "delete from t_s_news where id in (" + idString + ")";
		try {
			dao.delete(sql);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return isFlag;
	}

	public Map<String, Object> findAll(TsNewsFormBean news, String page, String row) {
		String sql = "select * from t_s_news n where 1=1 ";
		String countSql = "select count(n.id) from t_s_news n where 1=1 ";
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
			}if (news.getStressFlag() != null && !"".equals(news.getStressFlag())) {
				sql += " and n.stressflag = " + news.getStressFlag();
				countSql += " and n.stressflag = " + news.getStressFlag();
			}if (news.getImgFlag() != null && !"".equals(news.getImgFlag())) {
				sql += " and n.imgflag = " + news.getImgFlag();
				countSql += " and n.imgflag = " + news.getImgFlag();
			}
			if (news.getStartTime() != null && !"".equals(news.getStartTime())) {
				sql += " and n.CreateTime >= '" + news.getStartTime() + " 00:00:00'";
				countSql += " and n.CreateTime >= '" + news.getStartTime()+" 00:00:00'";
			}
			if (news.getEndTime() != null && !"".equals(news.getEndTime())) {
				sql += " and n.CreateTime <= '" + news.getEndTime() + " 23:59:59'";
				countSql += " and n.CreateTime <= '" + news.getEndTime() + " 23:59:59'";
			}

		}
		if (page != null && row != null) {
			int snum = Integer.parseInt(page) - 1;
			sql += " order by id desc   limit  " + (snum * Integer.parseInt(row)) + "," + row + " ";
		}
		List<TsNews> list = dao.findList(sql);
		int total = 0;
		if (list.size() != 0) {
			total = Integer.parseInt((dao.findObjectArryList(countSql).get(0))[0] + "");
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("total", total);
		return map;
	}

	public TsNews read(Long id) {
		return dao.read(id);
	}

	public void saveOrUpdate(TsNews news) {
		dao.saveOrUpdate(news);
		
	}

}
