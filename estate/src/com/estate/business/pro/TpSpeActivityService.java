package com.estate.business.pro;

import com.estate.domain.pro.TpSpeActivity;

/**
 * 活动动态接口
 * @author lgc
 *
 */
public interface TpSpeActivityService {
   //增加动态信息
	
	public boolean saveTpActivity(TpSpeActivity tpSpeActivity);
}
