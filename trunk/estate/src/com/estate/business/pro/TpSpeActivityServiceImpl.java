package com.estate.business.pro;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.pro.TpSpeActivity;



public class TpSpeActivityServiceImpl implements  TpSpeActivityService {
   //增加动态信息
	private  IBaseDao<TpSpeActivity,Long > dao;
	public   TpSpeActivityServiceImpl(){
		dao=new  BaseDao<TpSpeActivity, Long>(TpSpeActivity.class);
	}	
	public boolean saveTpActivity(TpSpeActivity tpSpeActivity){
		try{
			dao.saveOrUpdate(tpSpeActivity);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	
}
