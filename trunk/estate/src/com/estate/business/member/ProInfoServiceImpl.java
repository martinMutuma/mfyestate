package com.estate.business.member;

import java.util.List;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.member.TmProInfo;

public class ProInfoServiceImpl implements ProInfoService {

	private IBaseDao<TmProInfo, Long> dao;

	private final static String findTmProInfo_SQL = "select * from t_m_proinfo where ";

	public ProInfoServiceImpl() {
		dao = new BaseDao<TmProInfo, Long>(TmProInfo.class);
	}

	public Long save(TmProInfo tp) {
		return dao.saveEntity(tp);
	}

	public void saveOrUpdate(TmProInfo tmProInfo) {
		if(tmProInfo.getId()==0)
			dao.saveEntity(tmProInfo);
		else
			dao.saveOrUpdate(tmProInfo);
	}

	public TmProInfo read(Long id) {
		return dao.read(id);
	}

	public List<TmProInfo> showProInfo(Long id, String operateType) {
		return dao.findList(findTmProInfo_SQL + "authorId = ? and operateType=?",
				new Object[] { id, operateType });
	}

	public TmProInfo getProInfo(Long id,Long proId, String operateType,String proType) {
		return dao.uniqueResult(findTmProInfo_SQL + "proId = ? and operateType=? and authorId=? and proType=?",
				new Object[] { proId, operateType, id ,proType });
	}

	public void deleteAllproInfo(Long id, String operateType,String proType) {
		String sql = "delete from t_m_proinfo where authorId=? and operateType=? and proType=?";
		dao.delete(sql, new Object[] { id, operateType,proType });
	}

	public void deleteproInfo(Long id,Long proId, String operateType,String proType) {
		String sql = "delete from t_m_proinfo where authorId=? and proId=? and operateType=? and proType=?";
		dao.delete(sql, new Object[] { id,proId, operateType ,proType});
	}

	@SuppressWarnings("unchecked")
	public boolean checkHasAttention(String authorId, int proId, int operateType, int proType) {
		List list = dao.findList(findTmProInfo_SQL + " authorId = ? and proId = ? and operateType=? and proType = ?",new Object[] { authorId,proId, operateType,proType });
		if(list.isEmpty()){
			return false;
		}else{
		    return true;
		}
	}
}
