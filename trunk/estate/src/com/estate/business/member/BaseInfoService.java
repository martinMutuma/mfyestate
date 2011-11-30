package com.estate.business.member;

import java.util.List;

import com.estate.domain.member.MystoreVO;
import com.estate.domain.member.StatisticsVO;
import com.estate.domain.member.TmBaseinfo;

public interface BaseInfoService {

	public List<TmBaseinfo> menberLogin(String username, String password);

	public Long saveEntity(TmBaseinfo tb);

	/**检测用户名是否已经使用*/
	public List<TmBaseinfo> checkUserNameIsExistMember(String username);

	/** 检测手机号码是否已经使用*/
	public List<TmBaseinfo> checkMobileIsExistMember(String mobile);

	/** 检测邮箱是否已经使用*/
	public List<TmBaseinfo> checkEmailIsExistMember(String email);

	public void saveOrUpdate(TmBaseinfo tmBaseinfo);

	public TmBaseinfo read(Long id);

	public List<TmBaseinfo> findFreshMessage(String discode);

	/**个人中心统计*/
	public StatisticsVO getStatisticsInfoByLoginId(Long id);

	/** 根据邮箱、用户名检测用户是否存在*/
	public List<TmBaseinfo> checkEmailIsExistMemberAndUseName(String email,
			String username);

	/**得到个人商铺*/
	public List<MystoreVO> getMyStoreByAuthorId(String authorId, String type);
	
	/**得到会员等级*/
	public Long getMemberLevel(TmBaseinfo tb);

	/**得到会员头衔头像*/
	public String getHonorHeadUrl(TmBaseinfo tb);
	
	/**
	 * 获得头衔
	 * @param args
	 */
	public String getHononrType(TmBaseinfo tb);

}
