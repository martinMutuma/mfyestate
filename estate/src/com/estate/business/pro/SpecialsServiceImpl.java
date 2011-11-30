package com.estate.business.pro;

import java.util.ArrayList;
import java.util.List;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.pro.SpecialsBean;
import com.estate.domain.pro.TpSpecials;

public class SpecialsServiceImpl implements SpecialsService {
	
	private IBaseDao<TpSpecials, Long> dao;
	
	public SpecialsServiceImpl() {
		dao = new BaseDao<TpSpecials, Long>(TpSpecials.class);
	}

	public List<TpSpecials> findActiveSpecials(int count,String type) {
		String sql = "select * from t_p_specials where flag = '"+type+"' order by createTime desc";
		sql = dao.createSqlQuery(sql).setFirstResult(count).bulidSql();
		return dao.findList(sql);
	}
	public List<TpSpecials> findbyId(String id){
		if("".equals(id))return null;
		String sql = "select * from t_p_specials where id="+id;
		return dao.findList(sql);
	}

	public List<SpecialsBean> findTop6Specials(String type) {
	    List<SpecialsBean> list = new ArrayList<SpecialsBean>();
		String sql = "select b.Id,b.DISNAME,b.name,b.MIN_PRICE,s.specials,s.createTime,b.compressUrl from t_p_specials s join t_p_building b where s.bulidingId = b.Id and s.flag = "+type+" order by createTime desc  LIMIT 0,6 ";
			List<Object[]> re = dao.findObjectArryList(sql);
            for (int i = 0;i < re.size();i++) {
                Object[] objA = re.get(i);
                SpecialsBean bean = new SpecialsBean();
                bean.setId(Long.parseLong(objA[0].toString()));
                bean.setDisname(objA[1].toString());
                bean.setName(objA[2].toString());
                bean.setMinPrice(objA[3].toString());
                bean.setSpecials(objA[4].toString());
                bean.setCompressUrl(objA[6].toString());
                list.add(bean);
            }
		
		return list;
	}
}
