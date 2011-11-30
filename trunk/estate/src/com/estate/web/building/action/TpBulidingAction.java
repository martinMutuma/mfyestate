package com.estate.web.building.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.estate.base.web.BaseAction;
import com.estate.business.building.TpBuildingService;
import com.estate.business.building.TpBuildingServiceImpl;
import com.estate.business.building.TpImageService;
import com.estate.business.building.TpImageServiceImpl;
import com.estate.business.building.TpShowingsService;
import com.estate.business.building.TpShowingsServiceImpl;
import com.estate.business.member.ProInfoService;
import com.estate.business.member.ProInfoServiceImpl;
import com.estate.business.pro.TpNeedService;
import com.estate.business.pro.TpNeedServiceImpl;
import com.estate.domain.building.TpBuilding;
import com.estate.domain.building.TpImage;
import com.estate.domain.building.TpShowings;
import com.estate.domain.member.TmBaseinfo;
import com.estate.domain.member.TmProInfo;
import com.estate.domain.pro.TpNeed;
import com.estate.util.comm.Contants;
import com.estate.util.comm.PojoPropertiesUtil;
import com.estate.util.comm.RequestUtil;
import com.estate.util.comm.StringUtil;
import com.estate.util.file.FileUtil;
import com.estate.util.file.ImageSizer;
import com.estate.util.file.XmlUtil;
import com.opensymphony.xwork2.ActionContext;

@SuppressWarnings("serial")
public class TpBulidingAction extends BaseAction {
	private TpBuildingService service;
	private TpImageService imgService;
	private TpShowingsService showingsService;
	private TpBuilding tpBulding;
	private TpImage tpImage;
	private int total;
	private File[] img;
	private String[] imgFileName;
	@SuppressWarnings("unchecked")
	private List rows;
	private List<TpImage> selectedUnitList;
	private List<TpImage> aHomeList;
	private List<TpImage> effectList;
	private List<TpImage> twoHomeList;
	private List<TpBuilding> districtBulidList;
	private List<TpBuilding> averagePriceList;
	private List<TpImage> designsketchList;
	private ProInfoService proInfoService;
	private TpNeedService needService;
	private TpShowings tpShowings;
	private TpNeed needObj;
	private TmProInfo tp;
	private  String[] imgType;
	private  String[]  category;
	private  String[]   imgName;
	private  String[]   imageid;
	private  String[]   pid;
	private int page;
	private int lastPage;
	int rownum = 12;
	int categoryNum;
	int effectNum;
	int liveActionNum;
	int regionalMatchingNum;
	int prototypeRoomNum;
	int houseTypeNum;
	int otherNum;
	int type;
	long imgid;
    private File imgcomp;
    private String imgcompFileName;
	private String menuIndex ;
    
	public File getImgcomp() {
		return imgcomp;
	}

	public void setImgcomp(File imgcomp) {
		this.imgcomp = imgcomp;
	}

	public String getImgcompFileName() {
		return imgcompFileName;
	}

	public void setImgcompFileName(String imgcompFileName) {
		this.imgcompFileName = imgcompFileName;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	@SuppressWarnings("unchecked")
	public List getRows() {
		return rows;
	}

	@SuppressWarnings("unchecked")
	public void setRows(List rows) {
		this.rows = rows;
	}

	public TpBulidingAction() {
		service = new TpBuildingServiceImpl();
		proInfoService = new ProInfoServiceImpl();
		imgService = new TpImageServiceImpl();
		showingsService = new TpShowingsServiceImpl();
		needService = new TpNeedServiceImpl();
	}

	public TpBuilding getTpBulding() {
		return tpBulding;
	}

	public void setTpBulding(TpBuilding tpBulding) {
		this.tpBulding = tpBulding;
	}

	public TpImage getTpImage() {
		return tpImage;
	}

	public void setTpImage(TpImage tpImage) {
		this.tpImage = tpImage;
	}

	@SuppressWarnings("static-access")
	public String addTabuiding() {
		try {
			String idString = RequestUtil.getParam(request, "id", "");
			String buildname = RequestUtil.getParam(request, "name", "");
			TpBuilding oldtp = null;
			if ("".equals(idString))
				oldtp = service.findbyName(buildname);
			else
				oldtp = service.getById(idString);
			if (oldtp != null) {
				PojoPropertiesUtil pojoutil = PojoPropertiesUtil.getInstance();
				tpBulding = (TpBuilding) pojoutil.copyProperties(tpBulding, oldtp);
				tpBulding.setId(oldtp.getId());
			}else{
				tpBulding.setViews(0);
				tpBulding.setAttentionNum(0);
				tpBulding.setShowingsnum(0);
				tpBulding.setAuditingState("0");
			}
			String type = request.getParameter("type");
			if("1".equals(type)){
				TmBaseinfo td = (TmBaseinfo) RequestUtil.getLoginUserFromSession(request, "");
				tpBulding.setCreateTime(new Date());
				tpBulding.setAuthorId(td.getId().intValue());
				tpBulding.setNum(service.getNum(StringUtil.getShortZoneGB(tpBulding.getDistrict()),"8",
				 "t_p_building"));

			}
			String basePath = request.getSession().getServletContext()
			.getRealPath("/");
			String compressPath = XmlUtil.getValue("compression_diagram",
			"sysConfig")
			+ "/";
			String fileName ="";
			if(imgcomp!=null){
		     fileName= new Date().getTime() +imgcompFileName.substring(imgcompFileName.lastIndexOf("."));
			if (FileUtil.doUpFile(basePath + compressPath + fileName,
					imgcomp)) {
				ImageSizer
				.doCompress(imgcomp, basePath
						+ compressPath + fileName, 202, 112,
						1.0f, true);
		     tpBulding.setCompressUrl(compressPath+fileName);
			}
			}
			service.saveOrUpdate(tpBulding);
			
			

			if ("1".equals(type)){
				
				request.setAttribute("tpBulding", tpBulding);
				return "nextgo";
			}
			if ("2".equals(type))
				return "nextgoOn";
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return this.INPUT;
		}
	}
    public  String  modifyUpload(){
    	String basePath = request.getSession().getServletContext().getRealPath("/");
		String imagePatn = XmlUtil.getValue("imgPath", "sysConfig") + "/";
		String  pis=request.getParameter("pid");
			  if(tpImage==null)tpImage=new TpImage();
			
			  if(null==pis || "".equals(pis)){
				  if (img != null && img.length > 0) {
						if(tpImage==null)tpImage=new TpImage();
						 tpImage.setProtype("1");
						for (int i = 0; i < img.length; i++) {
							if (img[i] != null) {
								String fileName = new Date().getTime() + "";
								if (FileUtil.doUpFile(basePath + imagePatn + fileName, img[i])) {
									tpImage.setImgUrl(imagePatn+fileName);
								}
								
							}
						}

				}
				  if(imageid!=null &&  imageid.length>0){
					  for(int i=0;i<imageid.length ;i++){
						    tpImage.setId(Long.parseLong(imageid[i]));
						    TpImage  old=imgService.read(Long.parseLong(imageid[i]));
							tpImage.setPid(Integer.parseInt(pid[i]));
							tpImage.setCategory(category[i]);
							tpImage.setImgType(imgType[i]);
						    tpImage.setImgName(imgName[i]);
						    tpImage=(TpImage)PojoPropertiesUtil.getInstance().copyProperties(tpImage,old);
						    imgService.saveOrUpdate(tpImage);
					  }
					
			  }
			  }else{
					if (img != null && img.length > 0) {
						if(tpImage==null)tpImage=new TpImage();
						tpImage.setPid(Integer.parseInt(pis));
						tpImage.setProtype("1");
						for (int i = 0; i < img.length; i++) {
							if (img[i] != null) {
								tpImage.setCategory(category[i]);
								tpImage.setImgType(imgType[i]);
								tpImage.setImgName(imgName[i]);
								String fileName = new Date().getTime() + imgFileName[i].substring(imgFileName[i].lastIndexOf("."));
								if (FileUtil.doUpFile(basePath + imagePatn + fileName, img[i])) {
									tpImage.setImgUrl(imagePatn+fileName);
								}
								imgService.saveOrUpdate(tpImage);
							}
						}

					}
				   
				  
			  }
			 
		
		return "success";
    	
    }
	public String upload() {
		TpBuilding oldtp = service.findbyName(tpBulding.getName());
		if (oldtp != null) {
			PojoPropertiesUtil pojoutil = PojoPropertiesUtil.getInstance();
			tpBulding = (TpBuilding) pojoutil.copyProperties(tpBulding, oldtp);
			tpBulding.setId(oldtp.getId());
		}
		service.saveOrUpdate(tpBulding);
		String basePath = request.getSession().getServletContext().getRealPath("/");
		String imagePatn = XmlUtil.getValue("imgPath", "sysConfig") + "/";
		if (img != null && img.length > 0) {
			if(tpImage==null)tpImage=new TpImage();
			tpImage.setPid(oldtp.getId().intValue());
			tpImage.setProtype("1");
			for (int i = 0; i < img.length; i++) {
				if (img[i] != null) {
					tpImage.setCategory(category[i]);
					tpImage.setImgType(imgType[i]);
					tpImage.setImgName(imgName[i]);
					String fileName = new Date().getTime() +imgFileName[i].substring(imgFileName[i].lastIndexOf("."));
					if (FileUtil.doUpFile(basePath + imagePatn + fileName, img[i])) {
						tpImage.setImgUrl(imagePatn+fileName);
					}
					imgService.saveOrUpdate(tpImage);
				}
			}

		}
		return "success";
      }

	@SuppressWarnings("unchecked")
	public String search() {
		Map map = new HashMap<String, String>();
		TmBaseinfo tb = (TmBaseinfo) RequestUtil.getLoginUserFromSession(request, Contants.SESSION_USER);
		String page = RequestUtil.getParam(request, "page", "1");
		String row = RequestUtil.getParam(request, "rows", "10");
		String discode = StringUtil.getShortZoneGB(RequestUtil.getParam(request, "discode", ""));
		if("00".equals(discode)){
			discode="-1";
		}
		map.put("discode", discode);
		map.put("authorId", tb.getId().toString());
		List list = service.getList(map, page, row);
		int count = service.getCount(map);
		if (list != null && list.size() > 0) {
			total = count;
			rows = list;
		}
		return Contants.JSONSTRING_RESULT_NAME;
	}
    public  String  modifyBuiding(){
    	String id = RequestUtil.getParam(request, "id", "");
		String type = request.getParameter("type");
		TpBuilding  tpbuid=service.getById(id);
		if(tpbuid!=null){
			
			tpBulding.setId(tpbuid.getId());
		
			String fileName = new Date().getTime()+"";
			if(imgcomp!=null){
				String basePath = request.getSession().getServletContext()
				.getRealPath("/");
				String compressPath = XmlUtil.getValue("compression_diagram",
				"sysConfig")
				+ "/";
			if (FileUtil.doUpFile(basePath + compressPath + fileName,
					imgcomp)) {
				ImageSizer
				.doCompress(imgcomp, basePath
						+ compressPath + fileName, 202, 112,
						1.0f, true);
		     tpBulding.setCompressUrl(compressPath+fileName);
			}
			}
			PojoPropertiesUtil pojoutil = PojoPropertiesUtil.getInstance();
			tpbuid=(TpBuilding)pojoutil.copyProperties(tpbuid, tpBulding);
			service.saveOrUpdate(tpbuid);
			request.setAttribute("tpBulding", tpbuid);
			if ("1".equals(type))
				return "modifygo";
			if ("2".equals(type)){
			     
			     return "modifygoOn";
				
			  }
				
		}
		return  "error";
		
    }
    public String modifyAllPics(){
    	String subflag=request.getParameter("subflag");
    	String  idStr=request.getParameter("id");
		TpBuilding oldtp = service.getById(idStr);
		if (oldtp != null) {
			PojoPropertiesUtil pojoutil = PojoPropertiesUtil.getInstance();
			tpBulding = (TpBuilding) pojoutil.copyProperties(tpBulding, oldtp);
			tpBulding.setId(oldtp.getId());
		}
		service.saveOrUpdate(tpBulding);
		if("2".equals(subflag)){
			   List<TpImage> imagelist=imgService.getTpImageList(oldtp.getId());
			   ActionContext context=ActionContext.getContext();
			   context.put("imagelist",imagelist);
			   if(imagelist==null || imagelist.size()==0){
				   request.setAttribute("pid",oldtp.getId());
			    
			   }
			  return "modifyPic";
		}
		return "success";
    	
    }
	public String deleteBuiding() {
		String id = RequestUtil.getParam(request, "id", "");
		String idString = RequestUtil.getParam(request, "idString", "");
		
		boolean isFlag = false;
		if (!"".equals(id))
			isFlag = service.deleteById(id);
		else
			isFlag = service.deleteByIdString(idString);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		if (isFlag)
			message = "删除成功";
		else
			message = "删除失败";
		StringBuffer sb = new StringBuffer("[");
		sb.append("{\"message\":\"" + message + "\"" + "}");
		sb.append("]");

		try {
			out = response.getWriter();
			out.println(sb.toString());
		} catch (IOException e) {

			e.printStackTrace();
		}
		return null;
	}

	public String searchById() {
		String id = RequestUtil.getParam(request, "id", "");
		TpBuilding tp = service.getById(id);
		request.setAttribute("tpBulding", tp);
		return "modify";
	}

	// 前台页面展示楼盘信息
	public String toBuidingInfo() {
		menuIndex ="1";
		try {
			long id = RequestUtil.getParam(request, "id", 0l);
			service.updateviews(id);
			// 获取楼盘信息
			tpBulding = service.read(id);
			// 获取样板户型图片
			selectedUnitList = imgService.readByCategory(3, id, 0, 9);
			//获取4张效果图
			effectList = imgService.readByCategory(9, id, 0, 4);
			// 获取一居
			aHomeList = imgService.readByImgType(1, id);
			// 获取二居
			twoHomeList = imgService.readByImgType(2, id);

			districtBulidList = service.findDistrictBulid(tpBulding.getId(),tpBulding.getDistrict());
            
			if(tpBulding.getAveragePrice() == null){
				averagePriceList = service.findAveragePriceBulid(tpBulding.getId(),tpBulding.getMinPrice());
			}else{
				averagePriceList = service.findAveragePriceBulid(tpBulding.getId(),tpBulding.getAveragePrice());
			}
			designsketchList = imgService.readByCategory(1, id, 0, 3);
			//记录该用户浏览过该楼盘
			TmBaseinfo tb = (TmBaseinfo) RequestUtil.getLoginUserFromSession(request, Contants.SESSION_USER);
			if(tb !=null){
    			tp = proInfoService.getProInfo(tb.getId(),id,"1","6");
    			if(null==tp && null!=tb.getUsername()){
    				tp = new TmProInfo();
    				tp.setProId(Integer.valueOf(String.valueOf(id)));
    				tp.setAuthorId(Integer.valueOf(tb.getId().toString()));
    				tp.setProType("6");
    				tp.setOperateType("1");
    				tp.setCreateTime(new Date());
    				proInfoService.save(tp);
    			}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "toBuidingInfo";
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

	/**
	 * 关注
	 * @return
	 */
	public String attentionOff() {
		TmBaseinfo tb = (TmBaseinfo) RequestUtil.getLoginUserFromSession(request, Contants.SESSION_USER);
		String str = "";
		if (tb == null) {
			return "loginPage";
		} else {
			int id = RequestUtil.getParam(request, "id", 0);
			int attentionNum = RequestUtil.getParam(request, "attentioncount", 0) + 1;
			if (proInfoService.checkHasAttention(tb.getId().toString(), id, 2, 6)) {
				str = "1";
			} else {
				TmProInfo tmProInfo = new TmProInfo();
				tmProInfo.setAuthorId(Integer.parseInt(tb.getId().toString()));
				tmProInfo.setCreateTime(new Date());
				tmProInfo.setOperateType("2");
				tmProInfo.setProId(id);
				tmProInfo.setProType("6");
				proInfoService.save(tmProInfo);
				service.updateAttentionCount(id, attentionNum);
				str = "0";
			}
		}
		try {
			response.getWriter().print(str);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String showings() {
		String str = "";
		int flag = 0;
		try {
			// 验证是否参加过
			flag = showingsService.checkHasShowings(tpShowings.getPid(), tpShowings.getTel(), 0);
			if (flag == 1) {
				str = "<script>parent.chechShowings(1)</script>";
			} else {
				if (flag == 0) {
					TmBaseinfo tb = (TmBaseinfo) RequestUtil.getLoginUserFromSession(request, Contants.SESSION_USER);
					if (tb != null) {
						tpShowings.setParticipantsid(tb.getId());
					}
					tpShowings.setPtype("0");
					tpShowings.setInTime(new Date());
					tpShowings.setState("1");
					showingsService.saveOrUpdate(tpShowings);
					service.updateShowingsNum(tpShowings.getPid());

				}
				str = "<script>parent.chechShowings(2)</script>";
			}
			response.getWriter().print(str);
		} catch (Exception e) {
			str = "<script>parent.chechShowings(9)</script>";
			try {
				response.getWriter().print(str);
			} catch (IOException e1) {
			}
			e.printStackTrace();
		}
		return null;
	}

	public String housetype() {
		menuIndex ="1";
		Long pid = RequestUtil.getParam(request, "pid", 0l);
		tpBulding = service.read(pid);
		try {
			if (total == 0) {
				total = imgService.unitTotal(pid, 5);
			}
			if (page - 1 < 0)
				page = 1;

			lastPage = total / rownum;
			if (lastPage == 0)
				lastPage = 1;
			if (total > rownum && total % rownum != 0)
				lastPage++;
			if (page > lastPage)
				page = lastPage;
			selectedUnitList = imgService.readByCategory(5, pid, (page - 1) * rownum, page * rownum);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return "housetype";
	}

	public String buildingimages() {
		menuIndex ="1";
		try {
			Long pid = RequestUtil.getParam(request, "pid", 0l);
			type = RequestUtil.getParam(request, "type", 0);
			tpBulding = service.read(pid);
			if (effectNum == 0) {
				List<Object[]> list = imgService.imgageTypeGroupNum(pid);
				if (list != null ) {
					for (int i = 0; i < list.size(); i++) {
						switch (Integer.parseInt(list.get(i)[0] + "")) {
						case 1:
							effectNum = Integer.parseInt(list.get(i)[1] + "");
							break;
						case 2:
							liveActionNum = Integer.parseInt(list.get(i)[1] + "");
							break;
						case 3:
							regionalMatchingNum = Integer.parseInt(list.get(i)[1] + "");
							break;
						case 4:
							prototypeRoomNum = Integer.parseInt(list.get(i)[1] + "");
							break;
						case 5:
							houseTypeNum = Integer.parseInt(list.get(i)[1] + "");
							break;
						case 6:
							otherNum = Integer.parseInt(list.get(i)[1] + "");
							break;
						}
					}
				}
			}
			categoryNum = effectNum + liveActionNum + regionalMatchingNum + prototypeRoomNum + houseTypeNum + otherNum;

			if (total == 0) {
				switch (type) {
				case 1:
					total = effectNum;
					break;
				case 2:
					total = liveActionNum;
					break;
				case 3:
					total = regionalMatchingNum;
					break;
				case 4:
					total = prototypeRoomNum;
					break;
				case 5:
					total = houseTypeNum;
					break;
				case 6:
					total = otherNum;
					break;
				case 9:
					total = categoryNum;
					break;
				}
			}
			if (page - 1 < 0)
				page = 1;

			lastPage = total / rownum;
			if (lastPage == 0)
				lastPage = 1;
			if (total > rownum && total % rownum != 0)
				lastPage++;
			if (page > lastPage)
				page = lastPage;

			selectedUnitList = imgService.readByCategory(type, pid, (page - 1) * rownum, page * rownum);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return "buildingimages";
	}

	public String showimage() {
		menuIndex ="1";
		try {
			Long pid = RequestUtil.getParam(request, "pid", 0l);
			type = RequestUtil.getParam(request, "type", 0);
			imgid = RequestUtil.getParam(request, "imgid", 0l);
			tpBulding = service.read(pid);
			if (effectNum == 0) {
				List<Object[]> list = imgService.imgageTypeGroupNum(pid);
				for (int i = 0; i < list.size(); i++) {
					switch (Integer.parseInt(list.get(i)[0] + "")) {
					case 1:
						effectNum = Integer.parseInt(list.get(i)[1] + "");
						break;
					case 2:
						liveActionNum = Integer.parseInt(list.get(i)[1] + "");
						break;
					case 3:
						regionalMatchingNum = Integer.parseInt(list.get(i)[1] + "");
						break;
					case 4:
						prototypeRoomNum = Integer.parseInt(list.get(i)[1] + "");
						break;
					case 5:
						houseTypeNum = Integer.parseInt(list.get(i)[1] + "");
						break;
					case 6:
						otherNum = Integer.parseInt(list.get(i)[1] + "");
						break;
					}
				}
			}
			categoryNum = effectNum + liveActionNum + regionalMatchingNum + prototypeRoomNum + houseTypeNum + otherNum;

			if (total == 0) {
				switch (type) {
				case 1:
					total = effectNum;
					break;
				case 2:
					total = liveActionNum;
					break;
				case 3:
					total = regionalMatchingNum;
					break;
				case 4:
					total = prototypeRoomNum;
					break;
				case 5:
					total = houseTypeNum;
					break;
				case 6:
					total = otherNum;
					break;
				case 9:
					total = categoryNum;
					break;
				}
			}

			selectedUnitList = imgService.readByCategory(type, pid, 0, total);
			tpImage = imgService.read(imgid);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return "showimage";
	}

	public String checkName() {
		String name="";
		try {
			name = URLDecoder.decode(RequestUtil.getParam(request, "name", ""), "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		if (!"".equals(name)) {
			TpBuilding oldtp = service.findbyName(name);
			if (oldtp != null)
				message = "yes";
			else message = "no";
		}
		
		StringBuffer sb = new StringBuffer("[");
		sb.append("{\"message\":\"" + message + "\"" + "}");
		sb.append("]");


		try {
			out = response.getWriter();
			out.println(sb.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 购房需求
	 * @return
	 */
	public String save(){
		TmBaseinfo tb = (TmBaseinfo)RequestUtil.getLoginUserFromSession(request, Contants.SESSION_USER);
		try {
			if(null!=tb){
				needObj.setName(tb.getRealName());
				needObj.setPhone(tb.getMobile());
				needObj.setSex(tb.getSex());
			}
			needObj.setCreatetime(new Date());
			needService.save(needObj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public File[] getImg() {
		return img;
	}

	public void setImg(File[] img) {
		this.img = img;
	}

	public String[] getImgFileName() {
		return imgFileName;
	}

	public void setImgFileName(String[] imgFileName) {
		this.imgFileName = imgFileName;
	}

	public List<TpImage> getSelectedUnitList() {
		return selectedUnitList;
	}

	public void setSelectedUnitList(List<TpImage> selectedUnitList) {
		this.selectedUnitList = selectedUnitList;
	}

	public List<TpImage> getAHomeList() {
		return aHomeList;
	}

	public void setAHomeList(List<TpImage> homeList) {
		aHomeList = homeList;
	}

	public List<TpImage> getTwoHomeList() {
		return twoHomeList;
	}

	public void setTwoHomeList(List<TpImage> twoHomeList) {
		this.twoHomeList = twoHomeList;
	}

	public List<TpBuilding> getDistrictBulidList() {
		return districtBulidList;
	}

	public void setDistrictBulidList(List<TpBuilding> districtBulidList) {
		this.districtBulidList = districtBulidList;
	}

	public List<TpBuilding> getAveragePriceList() {
		return averagePriceList;
	}

	public void setAveragePriceList(List<TpBuilding> averagePriceList) {
		this.averagePriceList = averagePriceList;
	}

	public List<TpImage> getDesignsketchList() {
		return designsketchList;
	}

	public void setDesignsketchList(List<TpImage> designsketchList) {
		this.designsketchList = designsketchList;
	}

	public TpShowings getTpShowings() {
		return tpShowings;
	}

	public void setTpShowings(TpShowings tpShowings) {
		this.tpShowings = tpShowings;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	public int getCategoryNum() {
		return categoryNum;
	}

	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}

	public int getEffectNum() {
		return effectNum;
	}

	public void setEffectNum(int effectNum) {
		this.effectNum = effectNum;
	}

	public int getLiveActionNum() {
		return liveActionNum;
	}

	public void setLiveActionNum(int liveActionNum) {
		this.liveActionNum = liveActionNum;
	}

	public int getRegionalMatchingNum() {
		return regionalMatchingNum;
	}

	public void setRegionalMatchingNum(int regionalMatchingNum) {
		this.regionalMatchingNum = regionalMatchingNum;
	}

	public int getPrototypeRoomNum() {
		return prototypeRoomNum;
	}

	public void setPrototypeRoomNum(int prototypeRoomNum) {
		this.prototypeRoomNum = prototypeRoomNum;
	}

	public int getHouseTypeNum() {
		return houseTypeNum;
	}

	public void setHouseTypeNum(int houseTypeNum) {
		this.houseTypeNum = houseTypeNum;
	}

	public int getOtherNum() {
		return otherNum;
	}

	public void setOtherNum(int otherNum) {
		this.otherNum = otherNum;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public long getImgid() {
		return imgid;
	}

	public void setImgid(long imgid) {
		this.imgid = imgid;
	}

	public List<TpImage> getEffectList() {
		return effectList;
	}

	public void setEffectList(List<TpImage> effectList) {
		this.effectList = effectList;
	}

	public String getMenuIndex() {
		return menuIndex;
	}

	public void setMenuIndex(String menuIndex) {
		this.menuIndex = menuIndex;
	}

	public TpNeed getNeedObj() {
		return needObj;
	}

	public void setNeedObj(TpNeed needObj) {
		this.needObj = needObj;
	}

	public TmProInfo getTp() {
		return tp;
	}

	public void setTp(TmProInfo tp) {
		this.tp = tp;
	}

	public String[] getImgType() {
		return imgType;
	}

	public void setImgType(String[] imgType) {
		this.imgType = imgType;
	}

	public String[] getCategory() {
		return category;
	}

	public void setCategory(String[] category) {
		this.category = category;
	}

	public String[] getImgName() {
		return imgName;
	}

	public void setImgName(String[] imgName) {
		this.imgName = imgName;
	}

}
