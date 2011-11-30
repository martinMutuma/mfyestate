package com.estate.business.member;

import java.util.List;

import com.estate.domain.member.TsFile;
import com.estate.domain.member.TsMessage;
import com.estate.util.framework.PageUtil;

public interface MessageService {

	public Long saveEntity(TsMessage tb);

	public void saveOrUpdate(TsMessage tmBaseinfo);

	public TsMessage read(Long id);

	/**得到留言站内信*/
	public PageUtil getMessageByLoginId(String loginId,String flag,int pageNo, int limit);

	public void deleteMessageById(String id);
	
	public TsFile readFile(Long id);

	public List<TsFile> getDownLoadFileList(String type);
}
