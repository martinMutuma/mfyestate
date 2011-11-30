package com.estate.business.service;

import java.util.List;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.TsUser;

public class UserServiceImpl implements UserService {

	private IBaseDao<TsUser, Long> dao;

	private final static String LOGIN_SQL = "select * from t_s_user where username=? and password=? and state = 0";

	private final static String UPDATE_PASSWORD = "update t_s_user set password = ? where id = ?";

	public UserServiceImpl() {
		dao = new BaseDao<TsUser, Long>(TsUser.class);
	}

	public TsUser checkLogin(String username, String password) {
		TsUser tu = dao.uniqueResult(LOGIN_SQL, new Object[] { username, password });
		return tu;
	}

	public void delUser(Long id) {
		dao.deleteById(id);
	}

	public List<TsUser> findAll() {
		return dao.findAll();
	}

	public TsUser read(Long id) {
		return dao.read(id);
	}

	public void saveOrUpdateUser(TsUser tsUser) {
		dao.saveOrUpdate(tsUser);
	}

	public void updatePassword(Long id, String password) {
		dao.update(UPDATE_PASSWORD, new Object[] { password, id });
	}

}
