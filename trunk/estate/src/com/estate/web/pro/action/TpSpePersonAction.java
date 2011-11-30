package com.estate.web.pro.action;

import com.estate.base.web.BaseAction;
import com.estate.business.pro.TpSpeActivityService;
import com.estate.business.pro.TpSpeActivityServiceImpl;
import com.estate.business.pro.TpSpePersonService;
import com.estate.business.pro.TpSpePersonServiceImpl;
import com.estate.domain.pro.TpSpeActivity;
import com.estate.domain.pro.TpSpePerson;

@SuppressWarnings("serial")
public class TpSpePersonAction extends  BaseAction {
     private   TpSpePersonService service;
     private   TpSpeActivityService  actService;
     private   TpSpeActivity    tpSpeActivity;
     private   TpSpePerson  tpSpePerson;
     public   TpSpePersonAction(){
    	 service=new  TpSpePersonServiceImpl();
    	 actService=new  TpSpeActivityServiceImpl();
     }
     public   String  saveTpSpe(){
    	 try{
    		 tpSpePerson.setType("0");
    		 tpSpeActivity.setFlag( tpSpePerson.getFlag());
    		 tpSpeActivity.setPid(tpSpePerson.getPid());
    		 String  sexValue=tpSpePerson.getSex().equals("1")?"先生":"女士";
    		 tpSpeActivity.setTitle(tpSpePerson.getName().substring(0,1)+sexValue+" "+tpSpePerson.getMobile());
    		 tpSpeActivity.setContent("已报名未下定");
    		 if(service.saveTpSpePerson(tpSpePerson) && actService.saveTpActivity(tpSpeActivity))
    			return "tuansuccess";
    	 }catch(Exception e){
    		 e.printStackTrace();
    	 }
    	 return null;
     }
	public TpSpeActivity getTpSpeActivity() {
		return tpSpeActivity;
	}
	public void setTpSpeActivity(TpSpeActivity tpSpeActivity) {
		this.tpSpeActivity = tpSpeActivity;
	}
	public TpSpePerson getTpSpePerson() {
		return tpSpePerson;
	}
	public void setTpSpePerson(TpSpePerson tpSpePerson) {
		this.tpSpePerson = tpSpePerson;
	}
}
