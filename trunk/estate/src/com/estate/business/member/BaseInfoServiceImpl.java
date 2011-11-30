package com.estate.business.member;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.member.Hononr;
import com.estate.domain.member.MystoreVO;
import com.estate.domain.member.StatisticsVO;
import com.estate.domain.member.TmBaseinfo;
import com.estate.util.comm.StringUtil;
import com.estate.util.file.XmlUtil;

public class BaseInfoServiceImpl implements BaseInfoService {

	private IBaseDao<TmBaseinfo, Long> dao;

	private final static String findTmBaseinfo_SQL = "select * from t_m_baseinfo where ";

	public BaseInfoServiceImpl() {
		dao = new BaseDao<TmBaseinfo, Long>(TmBaseinfo.class);
	}

	public List<TmBaseinfo> menberLogin(String username, String password) {
		if(password==null || "".equals(password)) 	return dao.findList(findTmBaseinfo_SQL + "username = ? ",
				new Object[] { username});
		return dao.findList(findTmBaseinfo_SQL + "username = ? and password=?",
				new Object[] { username, password });
	}

	public Long saveEntity(TmBaseinfo tb) {
		return dao.saveEntity(tb);
	}

	public List<TmBaseinfo> checkUserNameIsExistMember(String username) {
		return dao.findList(findTmBaseinfo_SQL + "username = ?",
				new Object[] { username });
	}

	public List<TmBaseinfo> checkEmailIsExistMember(String email) {
		return dao.findList(findTmBaseinfo_SQL + "email = ?",
				new Object[] { email });
	}

	public List<TmBaseinfo> checkMobileIsExistMember(String mobile) {
		return dao.findList(findTmBaseinfo_SQL + "mobile = ?",
				new Object[] { mobile });
	}

	public void saveOrUpdate(TmBaseinfo tmBaseinfo) {
		dao.saveOrUpdate(tmBaseinfo);
	}

	public TmBaseinfo read(Long id) {
		return dao.read(id);
	}

	public List<TmBaseinfo> findFreshMessage(String discode) {
		String sql = "select t.id,t.realName,t.disname,t.company,t.headUrl from t_m_baseinfo t,t_s_district d where t.discode = d.code and type = '1'";
		if (null != discode && !"".equals(discode))
			sql += " and t.discode like '" + StringUtil.getShortZoneGB(discode)
					+ "%'";
		sql += " order by  integral desc";
		sql = dao.createSqlQuery(sql).setFirstResult(0).setMaxSize(10)
				.bulidSql();
		return dao.findList(sql);
	}

	public StatisticsVO getStatisticsInfoByLoginId(Long id) {
		// String sql = "select * from ";
		return null;
	}

	public List<TmBaseinfo> checkEmailIsExistMemberAndUseName(String email,
			String username) {
		return dao.findList(findTmBaseinfo_SQL + " email= ? and username = ?",
				new Object[] { email , username });
	}

	@SuppressWarnings("unchecked")
	public List<MystoreVO> getMyStoreByAuthorId(String authorId, String type) {
		String sql = "";
		if("office".equals(type))
			sql = "select id,category,compressurl,name,disname,price,area,flag, createtime from t_p_office where authorId=?";
		else if("shop".equals(type))
			sql = "select id,suitIndustry as category,compressurl,title as name,disname,bursary as price,firstFloor as area,flag,createtime from t_s_shops where authorId=?"; 
		else if("build".equals(type))
			sql = "select id,building_type as category,compressurl,name,disname,average_price as price,construction_area as area,1 as flag,createtime from t_p_building where protype=1 and authorid=?"; 
		else if("second".equals(type))
			sql = "select id,useType as category,sourceUrl,respDistrict as name,disname, price,consArea,flag,createDate as createtime from t_p_second_buliding where authorid=?"; 
		else if("business".equals(type))
			sql = "select id,category ,compressurl,title as name,disname, price,area,1 as flag,createtime from t_p_business where authorid=?"; 
		else if("industry".equals(type))
			sql = "select id,concat(industry,',',category),compressurl,title as name,disname,bursary as price,area,flag,createtime from t_p_industry where authorid=?"; 
		else if("lagrepro".equals(type))
			sql = "select id, 0 as category,compressurl,title as name,disname, price,address as area,payWay as flag,createtime from t_p_largepro where authorid=?"; 
		List mapList =  dao.createSqlQuery(sql).setParameters(1, authorId).mapList();
		List<MystoreVO> objList = new ArrayList<MystoreVO>();
		if(null!=mapList && mapList.size()>0){
			for (int i = 0; i < mapList.size(); i++) {
				MystoreVO myVO = new MystoreVO();
				Map voMap = (Map)mapList.get(i);
				myVO.setId(voMap.get("id")+"");
				myVO.setCategory(voMap.get("category")+"");
				myVO.setCompressUrl(voMap.get("compressurl")+"");
				myVO.setName(voMap.get("name")+"");
				myVO.setDisname(voMap.get("disname")+"");
				myVO.setPrice(voMap.get("price")+"");
				myVO.setArea(voMap.get("area")+"");
				myVO.setFlag(voMap.get("flag")+"");
				myVO.setCreateTime(voMap.get("createtime").toString().substring(0, 10));
				myVO.setType(type);
				objList.add(myVO);
			}
		}
		return objList;
	}

	public Long getMemberLevel(TmBaseinfo tb) {
		Long totalIntegral = tb.getTotalIntegral();
		Long level = tb.getLevel();
		if(totalIntegral==0||null==totalIntegral)
			return (long)1;
		Map<String, Hononr> map = XmlUtil.getHononrList();
		Hononr hononr1 = map.get("1");
		Map<String, Hononr> map2 = hononr1.getChildren();
		for (int i = 0; i < map2.size(); i++) {
			if(getIn(totalIntegral,map2.get(String.valueOf(i+1)).getScore().split("-")))
				return Long.valueOf(map2.get(String.valueOf(i+1)).getType().toString());
		}
		return (level==0||null==level)?(long)1:level;
	}

	/**
	 * 获得头衔 中文
	 * @param args
	 */
	public String getHononrType(TmBaseinfo tb) {
		String type = tb.getHonorType();
		Long level = tb.getLevel();
		String types =null;
		try {
			types = XmlUtil.getHononrList().get(type).getChildren().get(level.toString()).getName();
		} catch (Exception e) {
			try {
				types = XmlUtil.getHononrList().get(type).getChildren().get("1").getName();
				tb.setLevel((long)1);
				this.saveOrUpdate(tb);
			} catch (Exception e1) {
				try {
					types = XmlUtil.getHononrList().get("1").getChildren().get(level.toString()).getName();
					tb.setHonorType("1");
					this.saveOrUpdate(tb);
				} catch (RuntimeException e2) {
					types = XmlUtil.getHononrList().get("1").getChildren().get("1").getName();
					tb.setLevel((long)1);
					tb.setHonorType("1");
					this.saveOrUpdate(tb);
				}
			}
		}
		return types;
	}
	
	private boolean getIn(Long inte,String[]integ){
		boolean flag = false;
		if(integ.length==1)
			return inte>Long.valueOf(1000000)?true:false;
		if(inte>=Long.valueOf(integ[0])&&inte<Long.valueOf(integ[1]))
			flag = true;
		return flag;
	}
	
	public String getHonorHeadUrl(TmBaseinfo tb){
		return "resource/images/honor_pic/"+tb.getHonorType()+"/"+tb.getSex()+"/"+tb.getLevel()+".gif";
	}
}
