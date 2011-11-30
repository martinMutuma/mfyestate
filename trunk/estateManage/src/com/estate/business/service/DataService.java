package com.estate.business.service;

import java.util.List;

import com.estate.domain.TdData;

public interface DataService {

	public List<TdData> findAll(String pid);
	
	public TdData read(long id);
	
	public void saveOrUpdate(TdData data);
	
	public void delete(String ids);
}
