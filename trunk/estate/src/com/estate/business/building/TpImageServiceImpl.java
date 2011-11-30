package com.estate.business.building;

import java.util.List;

import org.apache.log4j.Logger;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.building.TpImage;

public class TpImageServiceImpl implements TpImageService {

	private IBaseDao<TpImage, Long> dao;

	public static Logger log = Logger.getLogger(TpImageServiceImpl.class);

	private final static String findTpImageinfo_SQL = "select * from t_p_image where ";

	public TpImageServiceImpl() {
		dao = new BaseDao<TpImage, Long>(TpImage.class);
	}

	public Long saveEntity(TpImage tb) {
		return dao.saveEntity(tb);
	}

	public TpImage read(Long id) {
		return dao.read(id);
	}

	public List<TpImage> readByCategory(int category, long pid, int startrow,
			int endrow) throws Exception {
		String sql = "";
		if (category == 9) {
			sql = findTpImageinfo_SQL + " pid = " + pid
					+ " and PROTYPE = 1 limit " + startrow + "," + endrow;
		} else {
			sql = findTpImageinfo_SQL + " CATEGORY = " + category
					+ " and pid = " + pid + " and PROTYPE = 1 limit "
					+ startrow + "," + endrow;
		}
		return dao.findList(sql);
	}

	public List<TpImage> readByImgType(int imgtype, long pid) throws Exception {
		String sql = findTpImageinfo_SQL + " IMG_TYPE = " + imgtype
				+ " and  pid=" + pid + " and PROTYPE = 1 limit 0,4";
		return dao.findList(sql);
	}

	public void saveOrUpdate(TpImage tb) {
		dao.saveOrUpdate(tb);
	}

	public int unitTotal(long pid, int category) throws Exception {
		String sql = "select count(1) from t_p_image where category= "
				+ category + " and PROTYPE = 1 and pid=" + pid;
		try {
			return Integer.parseInt((dao.findObjectArryList(sql).get(0))[0]
					+ "");
		} catch (Exception e) {
			log.error(e.getMessage() + "####sql=" + sql, e);
			return 0;
		}

	}

	public List<Object[]> imgageTypeGroupNum(long pid) throws Exception {
		String sql = "select CATEGORY,count(id) from t_p_image where pid = "
				+ pid + " and PROTYPE = 1 group by CATEGORY ";
		try {
			return dao.findObjectArryList(sql);
		} catch (Exception e) {
			log.error(e.getMessage() + "####sql=" + sql, e);
			return null;
		}
	}

	public List<TpImage> findBySecondBulidId(Long id) {
		String sql = "select * from t_p_image where protype = 2 and pid = " + id;
		return dao.findList(sql);
	}

	public List<TpImage> findBySecondBulidId(Long id, int pageNo, int limit) {
		String sql = "select * from t_p_image where protype = 2 and pid = " + id;
		sql = dao.createSqlQuery(sql).setFirstResult((pageNo-1)*limit).setMaxSize(limit).bulidSql();
		return dao.findList(sql);
	}

	public void deleteById(Long id) {
		dao.deleteById(id);
	}
	public  List<TpImage>  getTpImageList(long pid){
		String sql = "select * from t_p_image where   pid = ?";
		return dao.findList(sql, new Object[]{pid});
	
	}
}
