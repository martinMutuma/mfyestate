package com.estate.business.pro;

import com.estate.domain.pro.TpMessage;

/**
 * 置业留言
 * @author lgc
 *
 */
public interface TpMessageService {
    /**
     * 增加留言
     */
	public  boolean  addMessage(TpMessage  tpMessage);
}
