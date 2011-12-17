package com.estate.web.building.action;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.estate.base.web.BaseAction;
import com.estate.business.building.TpImageService;
import com.estate.business.building.TpImageServiceImpl;
import com.estate.business.building.TpSecondBulidingService;
import com.estate.business.building.TpSecondBulidingServiceImpl;
import com.estate.business.member.BaseInfoService;
import com.estate.business.member.BaseInfoServiceImpl;
import com.estate.business.member.ProInfoService;
import com.estate.business.member.ProInfoServiceImpl;
import com.estate.domain.building.TpImage;
import com.estate.domain.building.TpSecondBuliding;
import com.estate.domain.member.TmBaseinfo;
import com.estate.domain.member.TmProInfo;
import com.estate.util.comm.Contants;
import com.estate.util.comm.DateTimeUtil;
import com.estate.util.comm.RequestUtil;
import com.estate.util.file.FileUtil;
import com.estate.util.file.ImageSizer;
import com.estate.util.file.XmlUtil;
import com.estate.util.framework.PageUtil;

public class TpSecondBulidingAction extends BaseAction {

	private static final long serialVersionUID = 8262576199168377579L;
	private TpSecondBuliding tps;
	private PageUtil pu;
	private Long tpsId;
	private Long imgId;
	private File tpsImage;
	private String tpsImageFileName;
	private List<TpImage> imgList;
	private File[] imageFile;
	private String[] imageFileFileName;
	private TmBaseinfo baseinfo;
	private TpSecondBulidingService service;
	private TpImageService imageService;
	private ProInfoService proInfoService;
	private BaseInfoService baseInfoService;
	private String menuIndex;

	private List<Object> rows;
	private int pageNo;
	private int limit;
	private int total;

	public TpSecondBulidingAction() {
		service = new TpSecondBulidingServiceImpl();
		imageService = new TpImageServiceImpl();
		baseInfoService = new BaseInfoServiceImpl();
		proInfoService = new ProInfoServiceImpl();
	}

	@SuppressWarnings("unchecked")
	public String search() {
		try {
			if (pageNo <= 0)
				pageNo = 1;
			if (limit <= 0)
				limit = 20;
			pu = service.searchByParams(bulidParams(request), pageNo, limit);
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

	private Map<String, Object> bulidParams(HttpServletRequest request) {
		baseinfo = (TmBaseinfo) request.getSession().getAttribute(Contants.SESSION_USER);
		Map<String, Object> map = new HashMap<String, Object>();
		String name = RequestUtil.getParam(request, "name", "");
		if (!"".equals(name))
			map.put("title@2@2", "%" + name + "%");
		map.put("authorId@1@1", baseinfo.getId());
		String flag = RequestUtil.getParam(request, "flag", "");
		if (!"".equals(flag))
			map.put("flag@2", flag);
		return map;
	}

	/**
	 * 二手房出售
	 * @return
	 */
	public String saveSB() {
		String submitFlag = RequestUtil.getParam(request, "submitFlag", "1");
		baseinfo = (TmBaseinfo) request.getSession().getAttribute(Contants.SESSION_USER);
		try {
			if (null != tps) {
				if (null != tpsImage) {
					String basePath = request.getSession().getServletContext()
							.getRealPath("/");
					String imageFloder = XmlUtil.getValue(
							"compression_diagram", "sysConfig");
					String sourceFloder = XmlUtil.getValue("imgPath", "sysConfig");
					String imageName = (new Date()).getTime()+tpsImageFileName.substring(tpsImageFileName.lastIndexOf("."));
					ImageSizer.doCompress(tpsImage, basePath + imageFloder
							+ "/" + imageName, 211, 120, 1.0f, true);
					FileUtil.doUpFile(basePath + sourceFloder
							+ "/" + imageName, tpsImage);
					tps.setSourceUrl(sourceFloder  +"/"+ imageName);
					tps.setCompressUrl(imageFloder  +"/"+ imageName);
				}
				tps.setAuthorId(baseinfo.getId());
				if(null==tps.getFlag()||"".equals(tps.getFlag()))
				tps.setFlag("2");
				if(tps.getAuditingState()==null || "".equals(tps.getAuditingState())){
					tps.setAuditingState("0");
				}
				if (null == tps.getId()) {
					tps.setCreateDate(DateTimeUtil.getCurrentDateTime());
					tpsId = service.save(tps);
				} else {
					tps.setUpdateDate(DateTimeUtil.getCurrentDateTime());
					tpsId = tps.getId();
					service.update(tps);
				}
			}
		} catch (Exception e) {
			log.error("二手房出售保存失败", e);
		}
		if ("1".equals(submitFlag))
			return "success";
		else
			return "toImage";
	}

	/**
	 * 二手房出租信息保存
	 * @return
	 */
	public String saveSBrent() {
		String submitFlag = RequestUtil.getParam(request, "submitFlag", "1");
		baseinfo = (TmBaseinfo) request.getSession().getAttribute(Contants.SESSION_USER);
		try {
			if (null != tps) {
				tps.setFlag("1");
				if (null != tpsImage) {
					String basePath = request.getSession().getServletContext()
							.getRealPath("/");
					String imageFloder = XmlUtil.getValue(
							"compression_diagram", "sysConfig");
					String sourceFloder = XmlUtil.getValue("imgPath", "sysConfig");
					String imageName = (new Date()).getTime()+tpsImageFileName.substring(tpsImageFileName.lastIndexOf("."));
					ImageSizer.doCompress(tpsImage, basePath + imageFloder
							+ "/" + imageName, 211, 120, 1.0f, true);
					FileUtil.doUpFile(basePath + sourceFloder
							+ "/" + imageName, tpsImage);
					tps.setSourceUrl(sourceFloder +"/" +imageName);
					tps.setCompressUrl(imageFloder  +"/"+ imageName);
				}
				if(tps.getAuditingState()==null || "".equals(tps.getAuditingState())){
					tps.setAuditingState("0");
				}
				tps.setAuthorId(baseinfo.getId());
				if (null == tps.getId()) {
					tps.setCreateDate(DateTimeUtil.getCurrentDateTime());
					tpsId = service.save(tps);
				} else {
					tps.setUpdateDate(DateTimeUtil.getCurrentDateTime());
					tpsId = tps.getId();
					service.update(tps);
				}
			}
		} catch (Exception e) {
			log.error("二手房出租保存失败", e);
		}
		if ("1".equals(submitFlag))
			return "success";
		else
			return "toImage";
	}
	/**
	 * 关注
	 * @return
	 */
	public String attention() {
		TmBaseinfo tb = (TmBaseinfo) RequestUtil.getLoginUserFromSession(request, Contants.SESSION_USER);
		String str = "";
		if (tb == null) {
			str = "<script>parent.notLogged();</script>";
		} else {
			int id = RequestUtil.getParam(request, "id", 0);
			int attentionNum = RequestUtil.getParam(request, "attentioncount", 0) + 1;
			if (proInfoService.checkHasAttention(tb.getId().toString(), id, 2, 6)) {
				str = "<script>parent.hasattention();</script>";
			} else {
				TmProInfo tmProInfo = new TmProInfo();
				tmProInfo.setAuthorId(Integer.parseInt(tb.getId().toString()));
				tmProInfo.setCreateTime(new Date());
				tmProInfo.setOperateType("2");
				tmProInfo.setProId(id);
				tmProInfo.setProType("6");
				proInfoService.save(tmProInfo);
				service.updateAttentionCount(id, attentionNum);
				str = "<script>parent.attention(" + attentionNum + ");</script>";
			}
		}
		try {
			response.getWriter().print(str);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	public String toUpdate() {
		try {
			if (null != tpsId) {
				tps = service.find(tpsId);
			}
		} catch (Exception e) {
		}
		return "toInfo";
	}
	public String toUpdateRent() {
		try {
			if (null != tpsId) {
				tps = service.find(tpsId);
			}
		} catch (Exception e) {
		}
		return "torentInfo";
	}
	public String deleteSB() throws IOException {
		try {
			if (null != tpsId) {
				service.deleteById(tpsId);
			}
			this.response.getWriter().print("success");
		} catch (Exception e) {
			this.response.getWriter().print("fail");
		}
		return null;
	}

	public String deleteSB2() throws IOException {
		try {
			String ids = RequestUtil.getParam(request, "ids", "");
			service.deleteByIds(ids);
			this.response.getWriter().print("success");
		} catch (Exception e) {
			this.response.getWriter().print("fail");
		}
		return null;
	}

	/**
	 * 删除出租信息
	 * @return
	 * @throws IOException
	 */
	public String deleteSBrent() throws IOException {
		try {
			String ids = RequestUtil.getParam(request, "ids", "");
			service.deleteByIds(ids);
			this.response.getWriter().print("success");
		} catch (Exception e) {
			this.response.getWriter().print("fail");
		}
		return null;
	}
	
	public String showImgs() {
		try {
			imgList = imageService.findBySecondBulidId(tpsId);
		} catch (Exception e) {
			log.error("显示图片出错", e);
		}
		return "proImg";
	}

	public TpSecondBuliding getTps() {
		return tps;
	}

	public String saveImgs() {
		String submitFlag = RequestUtil.getParam(request, "submitFlag", "1");
		try {
			if (null != imageFile) {
				String basePath = request.getSession().getServletContext()
						.getRealPath("/");
				String imageFloder = XmlUtil.getValue("imgPath", "sysConfig");
				for (int i = 0; i < imageFile.length; i++) {
					File image = imageFile[i];
					String imageName = imageFileFileName[i];
					imageName = (new Date()).getTime() +"";
					FileUtil.doUpFile(basePath + imageFloder + "/" + imageName,
							image);
					TpImage ti = new TpImage();
					ti.setImgName(imageName);
					ti.setPid(new Integer(tpsId.toString()));
					ti.setProtype("2");
					ti.setImgType("1");
					ti.setImgUrl(imageFloder + "/" + imageName);
					imageService.saveEntity(ti);
				}
			}
		} catch (Exception e) {
			log.error("二手房图片保存失败", e);
		}
		if ("1".equals(submitFlag))
			return "success";
		else
			return "toImage";
	}

	public String delImg() {
		try {
			if (null != imgId) {
				imageService.deleteById(imgId);
			}
		} catch (Exception e) {
			log.error("删除图片出错", e);
		}
		return "toImage";
	}

	/**
	 * 根据主键查看二手房 
	 * @return
	 */
	public String showBuliding(){
		menuIndex = RequestUtil.getParam(request, "menuIndex", "3");
		try {
			if (null != tpsId) {
				tps = service.find(tpsId);
				baseinfo = baseInfoService.read(tps.getAuthorId());
				imgList = imageService.findBySecondBulidId(tpsId);
			}
		} catch (Exception e) {
		}
		return "showBuliding";
	}

	public void setTps(TpSecondBuliding tps) {
		this.tps = tps;
	}

	public PageUtil getPu() {
		return pu;
	}

	public void setPu(PageUtil pu) {
		this.pu = pu;
	}

	public File getTpsImage() {
		return tpsImage;
	}

	public void setTpsImage(File tpsImage) {
		this.tpsImage = tpsImage;
	}

	public String getTpsImageFileName() {
		return tpsImageFileName;
	}

	public void setTpsImageFileName(String tpsImageFileName) {
		this.tpsImageFileName = tpsImageFileName;
	}

	public File[] getImageFile() {
		return imageFile;
	}

	public void setImageFile(File[] imageFile) {
		this.imageFile = imageFile;
	}

	public String[] getImageFileFileName() {
		return imageFileFileName;
	}

	public void setImageFileFileName(String[] imageFileFileName) {
		this.imageFileFileName = imageFileFileName;
	}

	public Long getTpsId() {
		return tpsId;
	}

	public void setTpsId(Long tpsId) {
		this.tpsId = tpsId;
	}

	public List<TpImage> getImgList() {
		return imgList;
	}

	public void setImgList(List<TpImage> imgList) {
		this.imgList = imgList;
	}

	public Long getImgId() {
		return imgId;
	}

	public void setImgId(Long imgId) {
		this.imgId = imgId;
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

	public TmBaseinfo getBaseinfo() {
		return baseinfo;
	}

	public void setBaseinfo(TmBaseinfo baseinfo) {
		this.baseinfo = baseinfo;
	}

	public String getMenuIndex() {
		return menuIndex;
	}

	public void setMenuIndex(String menuIndex) {
		this.menuIndex = menuIndex;
	}

}
