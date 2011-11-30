package com.estate.business.building;

import com.estate.domain.building.TpShowings;

public interface TpShowingsService {

	public TpShowings read(Long id);

	public void saveOrUpdate(TpShowings tb)  throws Exception;
	
	public int checkHasShowings(int pid,String tel,int proType) throws Exception;

}
