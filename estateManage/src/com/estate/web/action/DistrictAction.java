package com.estate.web.action;

import java.util.List;

import net.sf.json.JSONArray;

import com.estate.base.web.BaseAction;
import com.estate.business.service.DistrictServiceImpl;
import com.estate.business.service.IDistrictService;
import com.estate.domain.TsDistrict;
import com.estate.util.comm.Contants;
import com.estate.util.comm.RequestUtil;
import com.estate.web.action.DTO.TreeData;

public class DistrictAction extends BaseAction {

	private TsDistrict district;
	private List<TsDistrict> districtList;
	private IDistrictService service;

	public DistrictAction() {
		service = new DistrictServiceImpl();
	}

	public String bulidDistrictTree() {
		try {
			String level = RequestUtil.getParam(this.request, "level", "2");
			String districtCode = RequestUtil.getParam(this.request,
					"districtCode", "");
			if (districtCode.length() == 0) {
				districtCode = (String) request.getSession().getAttribute(
						"district");
			}
			List<TreeData> list = service.findByDisCodeAndLevel(districtCode,
					new Integer(level));
			JSONArray jsonObject = JSONArray.fromObject(list);
			this.jsonString = jsonObject.toString();
		} catch (Exception e) {
			log.error("构建地区树错误", e);
			this.jsonString = "[]";
		}
		return Contants.JSONSTRING_RESULT_NAME_String;
	}
}
