package com.estate.business.building;

import java.util.List;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.building.TpShowings;

public class TpShowingsServiceImpl implements TpShowingsService {

	private IBaseDao<TpShowings, Long> dao;

	public TpShowingsServiceImpl() {
		dao = new BaseDao<TpShowings, Long>(TpShowings.class);
	}

	public TpShowings read(Long id) {
		return dao.read(id);
	}

	public void saveOrUpdate(TpShowings tp) throws Exception {
		try {
			dao.saveOrUpdate(tp);
		} catch (Exception e) {
			throw e;
		}
	}

	public int checkHasShowings(int pid, String tel, int proType) throws Exception {
		try {
			String sql = "select state from t_p_showings where pid = ? and tel = ? and pType = ? limit 0,1";
			List<Object[]> list = dao.findObjectArryList(sql, new Object[] { pid, tel, proType });
			if (list==null) {
				return 0;
			} else {
				int state = Integer.parseInt(list.get(0)[0].toString());
				if (state == 1) {
					return 1;
				} else {
					sql = "update  t_p_showings set state = 1 where pid = ? and tel = ? and pType = ? ";
					dao.update(sql, new Object[] { pid, tel, proType });
					return 2;
				}
			}
		} catch (Exception e) {
			throw e;
		}
	}
}
