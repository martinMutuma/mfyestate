package com.estate.business.pro;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.pro.TpMessage;

public class TpMessageServiceImpl implements TpMessageService {
     private IBaseDao<TpMessage,Long> dao;
     public  TpMessageServiceImpl(){
    	 dao=new BaseDao<TpMessage,Long>(TpMessage.class);
     }
     public  boolean  addMessage(TpMessage  tpMessage){
    	 try{
    		 dao.saveOrUpdate(tpMessage);
    		 return  true;
    	 }catch(Exception e){
    		 e.printStackTrace();
    		 return false;
    	 }
     }
}
