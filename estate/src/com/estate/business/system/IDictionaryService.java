package com.estate.business.system;

import java.util.List;
/**
 * @author FC
 * 字典表
 */
import com.estate.domain.system.TdData;
import com.estate.domain.system.TdDefination;

public interface IDictionaryService {

	/**
	 * 根据码表类型查找相应集合
	 * @param code
	 * @return
	 */
	public List<TdDefination> findAllDefByCode(String code);
	
	/**
	 * 根据defination表主键查找其子元素集合
	 * @param pid
	 * @return
	 */
	public List<TdData> findAllDataByPid(Long pid);
}
