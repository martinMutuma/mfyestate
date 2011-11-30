package com.estate.business.member;

import java.util.List;

import com.estate.domain.member.TaCollect;

public interface CollectService {

	public TaCollect read(Long id);
	
	public Long saveEntity(TaCollect tb);

	public void deleteCollectById(String id);
	
	public List<TaCollect> getMessageByLoginId(String loginId,String flag);
}
