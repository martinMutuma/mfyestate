package com.estate.business.member;

import java.util.List;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.member.TsFile;
import com.estate.domain.member.TsMessage;
import com.estate.util.framework.PageUtil;

public class MessageServiceImpl implements MessageService {

	private IBaseDao<TsMessage, Long> dao;
	private IBaseDao<TsFile, Long> filedao;

	private final static String findTmBaseinfo_SQL = "select * from t_s_message where ";

	public MessageServiceImpl() {
		dao = new BaseDao<TsMessage, Long>(TsMessage.class);
		filedao = new BaseDao<TsFile, Long>(TsFile.class);
	}

	public Long saveEntity(TsMessage tb) {
		return dao.saveEntity(tb);
	}

	public void saveOrUpdate(TsMessage obj) {
		dao.saveOrUpdate(obj);
	}

	public TsMessage read(Long id) {
		return dao.read(id);
	}

	/**
	 * 根据登陆id查询留言信息
	 */
	public PageUtil getMessageByLoginId(String loginId,String flag,int pageNo, int limit) {
		PageUtil pu = new PageUtil();
		String countSql = "select count(*) from t_s_message where flag= "+flag+" and toId = "+loginId;
		String sql = findTmBaseinfo_SQL+" flag= "+flag+" and toId = "+loginId+" order by createTime";
		sql = dao.createSqlQuery(sql).setFirstResult((pageNo - 1) * limit)
				.setMaxSize(limit).bulidSql();
		List<Object[]> countList = dao
				.findObjectArryList(countSql);
		if (null != countList && countList.size() > 0) {
			Object[] obj = countList.get(0);
			pu.setTotalRecords(new Integer(null == obj[0] ? "0" : obj[0]
					.toString()));
		}
		pu.setList(dao.findList(sql));
		pu.setPageNo(pageNo);
		pu.setPageSize(limit);
		return pu;
	}

	/**
	 * 删除留言
	 */
	public void deleteMessageById(String id) {
		dao.deleteById(Long.valueOf(id));
	}

	/**
	 * 得到文件信息
	 */
	public TsFile readFile(Long id) {
		return filedao.read(id);
	}
	
	/**
	 * 得到文件列表
	 */
	public List<TsFile> getDownLoadFileList(String type) {
		if("0".equals(type))
			type = "%";
		return filedao.findList("select * from t_s_file where category like ?", new Object[] { type });
	}

}
