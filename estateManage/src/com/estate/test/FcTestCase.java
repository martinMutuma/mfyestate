package com.estate.test;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.business.service.UserService;
import com.estate.business.service.UserServiceImpl;
import com.estate.domain.TsUser;

import junit.framework.TestCase;

public class FcTestCase extends TestCase {
	
	public void testLogin(){
		UserService us = new UserServiceImpl();
		assertNull(us.checkLogin("fc", "123"));
	}
	
	public void testSqlQuery(){
		IBaseDao<TsUser, Long> dao = new BaseDao<TsUser, Long>(TsUser.class);
		System.out.println(dao.createSqlQuery("select * from t where a = ?").setParameters(1, "'1'").setFirstResult(0).setMaxSize(10).bulidSql());
	}
}
