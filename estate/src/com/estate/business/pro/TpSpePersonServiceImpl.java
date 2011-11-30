package com.estate.business.pro;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;

import com.estate.domain.pro.TpSpePerson;

public class TpSpePersonServiceImpl implements TpSpePersonService{
	 private IBaseDao<TpSpePerson,Long> dao;
	 public  TpSpePersonServiceImpl(){
		 dao=new BaseDao<TpSpePerson, Long>(TpSpePerson.class);
	 }
	 public  boolean  saveTpSpePerson(TpSpePerson  tpperson){
		   try{
			    dao.saveOrUpdate(tpperson);
			    return true;
		   }catch(Exception e){
			   
			   e.printStackTrace();
			   return false;
		   }
	 }
}
