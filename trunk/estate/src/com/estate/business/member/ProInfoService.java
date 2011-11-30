package com.estate.business.member;

import java.util.List;

import com.estate.domain.member.TmProInfo;

public interface ProInfoService {

	public Long save(TmProInfo tb);

	public void saveOrUpdate(TmProInfo TmProInfo);

	public TmProInfo read(Long id);

	public List<TmProInfo> showProInfo(Long id, String operateType);

	public TmProInfo getProInfo(Long id,Long proId, String operateType,String proType);

	/**清空关注、浏览的楼盘*/
	public void deleteAllproInfo(Long id, String operateType,String proType);
	
	/**删除关注、浏览的楼盘*/
	public void deleteproInfo(Long id,Long proId, String operateType,String proType);
	
	public boolean checkHasAttention(String authorId,int proId, int operateType,int proType);
	
}
