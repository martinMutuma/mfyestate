package com.estate.business.news;

import java.util.List;
import java.util.Map;

import com.estate.domain.news.TsNews;
import com.estate.domain.news.TsNewsFormBean;

public interface NewsService {

	/**
	 * 根据条件查询新闻
	 * 
	 * @return Map<String,Object>
	 */
	public Map<String, Object> findAll(TsNewsFormBean news, String page, String row) throws Exception;

	/**
	 * 查看新闻
	 */
	public TsNews read(Long id) throws Exception;

	/**
	 * 根据条件获取最新资讯
	 */
	public List<TsNews> getNewesList(int startRow, int endRow) throws Exception;

	/**
	 * 根据条件获取热点关注
	 */
	public List<TsNews> gethotpsotList(int startRow, int endRow) throws Exception;

	/**
	 * 根据条件获取热门推荐
	 */
	public List<TsNews> getRecommendList(int startRow, int endRow) throws Exception;

	/**
	 * 根据条件获取热门排名
	 */
	public List<TsNews> getRankingList(int startRow, int endRow) throws Exception;

	/**
	 * 根据条件获取精彩图文
	 */
	public List<TsNews> getImgList(int startRow, int endRow) throws Exception;
	
	/**
	 * 点击数+1
	 */
	public void addcheckNum (long id) throws Exception;

	/**
	 * 根据条件获取新闻数目
	 */
	
	public int newsTotal(int type, String searchContent) throws Exception;

	/**
	 * 根据栏目及查询内容获取新闻
	 */
	public List<TsNews> getListByteType(int startRow, int endRow, int type, String searchContent) throws Exception;

}
