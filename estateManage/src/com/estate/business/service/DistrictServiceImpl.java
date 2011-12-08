package com.estate.business.service;

import java.util.ArrayList;
import java.util.List;

import com.estate.base.dao.BaseDao;
import com.estate.base.dao.IBaseDao;
import com.estate.domain.TsDistrict;
import com.estate.util.comm.StringUtil;
import com.estate.web.action.DTO.TreeData;


public class DistrictServiceImpl implements IDistrictService {
	private IBaseDao<TsDistrict, Long> dao;

	private final static String FINDBYDISCODE_SQL = "select * from t_s_district t where t.code like ? and t.activity = '1' order by t.code asc";
	private final static String FINDBYLEVEL_SQL = "select * from t_s_district t where t.level = ? and t.activity = '1' order by t.code asc";
	private final static String FINDBYLEVEL1_SQL = "select * from t_s_district t where t.level between ? and ? and t.activity = '1' order by t.code asc";
	private final static String FINDBYDISCODEANDLEVEL_SQL = "select * from t_s_district t where t.code = ?  and t.activity = '1' order by t.code asc";
	private final static String FINDBYDISCODEANDLEVEL1_SQL = "select * from t_s_district t where t.code like ? and  t.level between ? and ? and t.activity = '1' order by t.code asc ";

	public DistrictServiceImpl() {
		dao = new BaseDao<TsDistrict, Long>(TsDistrict.class);
	}

	public List<TsDistrict> findByDisCode(String discode) {
		return dao.findList(FINDBYDISCODE_SQL, new Object[] { ("0000000000".equals(discode)?"":StringUtil
				.getShortZoneGB(discode))
				+ "%" });
	}

	public List<TreeData> findByDisCodeAndLevel(String discode, int level) {
		List<TsDistrict> disList = dao.findList(FINDBYDISCODEANDLEVEL_SQL,
				new Object[] { discode });
		List<TsDistrict> childrenList = findByDisCode(discode);
		List<TreeData> treeList = new ArrayList<TreeData>();
		if (null != disList && disList.size() > 0) {
			TsDistrict district = (TsDistrict) disList.get(0);
			TreeData td = new TreeData();
			td.setId(null == district.getCode() ? "" : district.getCode());
			td.setChecked(false);
			td.setState("closed");
			td.setText(district.getName());
			if (StringUtil.getZoneLevel(district.getCode()) < level) {
				td.setChildren(getTreeDistrictChildren(childrenList, district
						.getCode(), level));
			}
			treeList.add(td);
		}
		return treeList;
	}

	public List<TsDistrict> findByLevel(String level) {
		return dao.findList(FINDBYLEVEL_SQL, new Object[] { level });
	}

	public List<TsDistrict> findByLevel(String startLevel, String endLevel) {
		return dao.findList(FINDBYLEVEL1_SQL, new Object[] { startLevel,
				endLevel });
	}

	public List<TsDistrict> findByDisCodeAndLevel(String discode,
			String startLevel, String endLevel) {
		return dao.findList(FINDBYDISCODEANDLEVEL1_SQL,
				new Object[] { StringUtil.getShortZoneGB(discode) + "%",
						startLevel, endLevel });
	}

	private List<TreeData> getTreeDistrictChildren(List<TsDistrict> listAll,
			String gbcode, int level) {
		List<TsDistrict> list = findTreeDistrict(listAll, gbcode);
		List<TreeData> treeList = new ArrayList<TreeData>();
		for (int i = 0; i < list.size(); ++i) {
			TsDistrict district = (TsDistrict) list.get(i);
			TreeData td = new TreeData();
			td.setText(district.getName());
			td.setState("closed");
			td.setChecked(false);
			td.setId(null == district.getCode() ? "" : district.getCode()
					.toString());
			if (StringUtil.getZoneLevel(district.getCode()) < level)
				td.setChildren(getTreeDistrictChildren(listAll, district
						.getCode(), level));
			else
				td.setChildren(new ArrayList<TreeData>());

			treeList.add(td);
		}
		return treeList;
	}

	private List<TsDistrict> findTreeDistrict(List<TsDistrict> listAll,
			String gbcode) {
		List<TsDistrict> treeList = new ArrayList<TsDistrict>();
		for (int i = 0; i < listAll.size(); ++i)
			if ((!(((TsDistrict) listAll.get(i)).getCode().equals(gbcode)))
					&& (StringUtil.getParentZoneCode(((TsDistrict) listAll
							.get(i)).getCode()).equals(gbcode))) {
				treeList.add(listAll.get(i));
			}

		return treeList;
	}
}
