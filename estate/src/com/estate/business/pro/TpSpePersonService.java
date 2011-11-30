package com.estate.business.pro;

import com.estate.domain.pro.TpSpePerson;

/**
 * 活动参与人员接口
 * @author Administrator
 *
 */
public interface TpSpePersonService {
   /**
    * 保存活动参与人员
    */
   public  boolean  saveTpSpePerson(TpSpePerson  tpperson);
}
