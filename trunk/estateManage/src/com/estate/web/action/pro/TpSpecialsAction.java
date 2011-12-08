package com.estate.web.action.pro;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.estate.base.web.BaseAction;
import com.estate.business.service.pro.TpSpecialsService;
import com.estate.business.service.pro.TpSpecialsServiceImpl;
import com.estate.domain.TpImage;
import com.estate.domain.TpSecondBuliding;
import com.estate.domain.TpSpecials;
import com.estate.domain.pro.TpBuilding;
import com.estate.util.comm.Contants;
import com.estate.util.comm.RequestUtil;
import com.estate.util.framework.PageUtil;

public class TpSpecialsAction extends BaseAction {

	private static final long serialVersionUID = -6803012646979207185L;
	private PageUtil pu;
	private List<Object> rows;
	private Long id;
	private int pageNo;
	private int limit;
	private int total;
	private String imgOne;
	private String imgTwo;
	private String imgThree;
	private String imgFour;
	private List<TpImage> imgList;

	private TpSpecials special;
	private TpSecondBuliding tsb;
	private TpBuilding buliding;
	private TpSpecialsService service;

	public TpSpecialsAction() {
		service = new TpSpecialsServiceImpl();
	}
	
	/**
	 * 显示团购/特价列表
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String searchSpecials() {
		try {
			if (pageNo <= 0)
				pageNo = 1;
			if (limit <= 0)
				limit = 20;
			pu = service.findSpecialsByParams(bulidParams(request), pageNo, limit, "1");
			List list = pu.getList();
			int count = pu.getTotalRecords();
			if (list != null && list.size() > 0) {
				total = count;
				rows = list;
			}
		} catch (Exception e) {
			log.error("查询二手房信息出错!", e);
		}
		return Contants.JSONSTRING_RESULT_NAME;
	}
	
	
	/**
	 * 显示特价列表
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String searchTejia() {
		try {
			if (pageNo <= 0)
				pageNo = 1;
			if (limit <= 0)
				limit = 20;
			pu = service.findSpecialsByParams(bulidParams(request), pageNo, limit,"2");
			List list = pu.getList();
			int count = pu.getTotalRecords();
			if (list != null && list.size() > 0) {
				total = count;
				rows = list;
			}
		} catch (Exception e) {
			log.error("查询二手房信息出错!", e);
		}
		return Contants.JSONSTRING_RESULT_NAME;
	}
	
	/**
	 * 查找楼盘列表
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String searchBuliding() {
		try {
			if (pageNo <= 0)
				pageNo = 1;
			if (limit <= 0)
				limit = 20;
			pu = service.findBulidingByParams(bulidParams(request), pageNo, limit);
			List list = pu.getList();
			int count = pu.getTotalRecords();
			if (list != null && list.size() > 0) {
				total = count;
				rows = list;
			}
		} catch (Exception e) {
			log.error("查询二手房信息出错!", e);
		}
		return Contants.JSONSTRING_RESULT_NAME;
	}
	
	/**
	 * 预览团购/特价信息
	 * @return
	 */
	public String view(){
		try{
			special = service.findById(id);
			buliding = service.findBulidingById(special.getBulidingId());
		}catch (Exception e) {
			log.error("查看团购/特价出错", e);
		}
		return "viewInfo";
	}

	/**
	 * 查找二手房列表
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String search() {
		try {
			if (pageNo <= 0)
				pageNo = 1;
			if (limit <= 0)
				limit = 20;
			pu = service.findByParams(bulidParams(request), pageNo, limit);
			List list = pu.getList();
			int count = pu.getTotalRecords();
			if (list != null && list.size() > 0) {
				total = count;
				rows = list;
			}
		} catch (Exception e) {
			log.error("查询二手房信息出错!", e);
		}
		return Contants.JSONSTRING_RESULT_NAME;
	}

	/**
	 * 显示楼盘信息
	 * @return
	 */
	public String showInfo() {
		try {
			id = RequestUtil.getParam(request, "id", 0l);
			buliding = service.findBulidingById(id);
		} catch (Exception e) {
			log.error("二手房查询出错", e);
		}
		return "showInfo";
	}

	/**
	 * 装配查询条件
	 * @param request
	 * @return
	 */
	private Map<String, Object> bulidParams(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		String name = RequestUtil.getParam(request, "name", "");
		if (!"".equals(name))
			map.put("name@2@2", "%" + name + "%");
		return map;
	}

	/**
	 * 跳转到特价房信息添加页面
	 * @return
	 */
	public String toTejia() {
		return "toTejia";
	}
	
	/**
	 * 跳转到团购/特价信息添加页面
	 * @return
	 */
	public String toSpecial() {
		return "toinfo";
	}

	/**
	 * 保存团购/特价信息
	 * @return
	 */
	public String saveSpecial() {
		try {
			if (null != special){
				if(null == special.getId()){
					special.setJoinCount(0);
					service.saveSpecial(special);
				}
				else{
					service.modifySpecials(special);
					response.getWriter().print("<script>parent.operate('1')</script>");
				}
			}
		} catch (Exception e) {
			log.error("保存团购/特价信息出错", e);
		}
		return null;
	}
	
	/**
	 * 获取二手房图片
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getImgList(){
		try{
			imgList = service.findBySecondBulidId(id);
			String imgSrc = "";
			for (Iterator iterator = imgList.iterator(); iterator.hasNext();) {
				TpImage image = (TpImage) iterator.next();
				if(!"".equals(imgSrc))
					imgSrc += ",";
				imgSrc += image.getImgUrl();
			}
			response.getWriter().print(imgSrc);
		}catch (Exception e) {
			log.error("显示图片出错",e);
		}
		return null;
	}
	
	/**
	 * 删除团购/特价信息
	 * @return
	 * @throws IOException
	 */
	public String deleteSpecials() throws IOException{
		try{
			service.deleteById(id);
			response.getWriter().print("success");
		}catch (Exception e) {
			log.error("删除团购/特价信息失败", e);
			response.getWriter().print("failed");
		}
		return null;
	}
	
	/**
	 * 
	 * @return
	 */
	public String toModify(){
		try{
			special = service.findById(id);
		}catch (Exception e) {
			log.error("跳转修改团购/特价页面失败", e);
		}
		return "toModify";
	}
	
	public String toImgModify(){
		try{
			special = service.findById(id);
			imgOne = special.getImgOne();
			imgTwo = special.getImgTwo();
			imgThree = special.getImgThree();
			imgFour = special.getImgFour();
		}catch (Exception e) {
			log.error("");
		}
		return "imgModify";
	}
	
	@SuppressWarnings("unchecked")
	public String getAllImg(){
		try{
			List<TpImage> imgList = service.findByProId(id);
			String str = "";
			if(null != imgList){
				for (Iterator iterator = imgList.iterator(); iterator.hasNext();) {
					TpImage imgObj = (TpImage) iterator.next();
					str += imgObj.getCategory()+":"+imgObj.getImgUrl()+",";
				}
			}
			response.getWriter().print(str);
		}catch (Exception e) {
		}
		return null;
	}
	
	public String saveImg(){
		try{
			special = service.findById(id);
			special.setImgOne(imgOne);
			special.setImgTwo(imgTwo);
			special.setImgThree(imgThree);
			special.setImgFour(imgFour);
			service.modifySpecials(special);
			response.getWriter().print("<script>parent.operate('1')</script>");
		}catch (Exception e) {
			log.error("保存团购/特价图片失败", e);
		}
		return null;
	}
	
	public PageUtil getPu() {
		return pu;
	}

	public void setPu(PageUtil pu) {
		this.pu = pu;
	}

	public List<Object> getRows() {
		return rows;
	}

	public void setRows(List<Object> rows) {
		this.rows = rows;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public TpSecondBuliding getTsb() {
		return tsb;
	}

	public void setTsb(TpSecondBuliding tsb) {
		this.tsb = tsb;
	}

	public TpSpecials getSpecial() {
		return special;
	}

	public void setSpecial(TpSpecials special) {
		this.special = special;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public TpBuilding getBuliding() {
		return buliding;
	}

	public void setBuliding(TpBuilding buliding) {
		this.buliding = buliding;
	}

	public String getImgOne() {
		return imgOne;
	}

	public void setImgOne(String imgOne) {
		this.imgOne = imgOne;
	}

	public String getImgTwo() {
		return imgTwo;
	}

	public void setImgTwo(String imgTwo) {
		this.imgTwo = imgTwo;
	}

	public String getImgThree() {
		return imgThree;
	}

	public void setImgThree(String imgThree) {
		this.imgThree = imgThree;
	}

	public String getImgFour() {
		return imgFour;
	}

	public void setImgFour(String imgFour) {
		this.imgFour = imgFour;
	}

}
