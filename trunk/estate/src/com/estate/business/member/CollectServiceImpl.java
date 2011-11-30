package com.estate.business.member;

import java.util.List;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.member.TaCollect;

public class CollectServiceImpl implements CollectService {

	private IBaseDao<TaCollect, Long> dao;

	private final static String findTmBaseinfo_SQL = "select * from t_a_collect where ";

	public CollectServiceImpl() {
		dao = new BaseDao<TaCollect, Long>(TaCollect.class);
	}
	
	public Long saveEntity(TaCollect tb) {
		return dao.saveEntity(tb);
	}
	
	public TaCollect read(Long id) {
		return dao.read(id);
	}
	
	/**
	 * 根据登陆id查询留言信息
	 */
	public List<TaCollect> getMessageByLoginId(String loginId,String flag) {
		return dao.findList(findTmBaseinfo_SQL + " id = ?  limit 0,10", new Object[] { flag , loginId });
		//TODO  分页
	}

	/**
	 * 删除留言
	 */
	public void deleteCollectById(String id) {
		dao.deleteById(Long.valueOf(id));
	}

}
