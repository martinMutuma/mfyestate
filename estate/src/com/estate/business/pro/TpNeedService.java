package com.estate.business.pro;

import com.estate.domain.pro.TpNeed;

/**
 * @Title:购房需求类��service
 * @Copyright: Copyright (c) 0.1
 * @author:lgc
 * @version: 1.0
 * @time: 2011-10-08
 * 
 */
public interface TpNeedService {
	
	public Long save(TpNeed tb);

	public void saveOrUpdate(TpNeed TmProInfo);

	public TpNeed read(Long id);
}
