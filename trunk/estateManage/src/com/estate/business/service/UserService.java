package com.estate.business.service;

import java.util.List;

import com.estate.domain.TsUser;

public interface UserService {

	/**
	 * 用户登录处理
	 * @param username
	 * @param password
	 * @return
	 */
	public TsUser checkLogin(String username, String password);

	/**
	 * 保存或修改用户信息
	 * @param tsUser
	 */
	public void saveOrUpdateUser(TsUser tsUser);

	/**
	 * 删除会员
	 * @param id
	 */

	public void delUser(Long id);

	/**
	 * 查询所有管理员
	 * @return List<TsUser>
	 */
	public List<TsUser> findAll();

	/**
	 * 查询会员信息
	 * @param id
	 * @return TsUser
	 */
	public TsUser read(Long id);

	/**
	 * 修改密码
	 * @param id
	 * @param password
	 */
	public void updatePassword(Long id, String password);
}
