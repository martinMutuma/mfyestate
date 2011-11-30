package com.estate.web.pro.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import com.estate.base.web.BaseAction;
import com.estate.business.pro.BusinessService;
import com.estate.business.pro.BusinessServiceImpl;
import com.estate.business.pro.IndustryService;
import com.estate.business.pro.IndustryServiceImpl;
import com.estate.domain.member.TmBaseinfo;
import com.estate.domain.pro.Industry;
import com.estate.util.comm.Contants;
import com.estate.util.comm.RequestUtil;
import com.estate.util.comm.StringUtil;
import com.estate.util.file.FileUtil;
import com.estate.util.file.ImageSizer;
import com.estate.util.file.XmlUtil;

/**
 * @Title:工业地产Action
 * @Copyright: Copyright (c) 0.1
 * @author:鲁根成
 * @version: 1.0
 * @time: 2011-5-20
 * 
 */
@SuppressWarnings("serial")
public class IndustryAction extends BaseAction {
	private IndustryService service;
	private BusinessService bsservice;
	private Industry industry;
	private File imageFile1;
	private File imageFile2;
	private File imageFile3;
	private File imageFile4;
	private File imageFile5;
	private String imageFile1FileName;
	private String imageFile2FileName;
	private String imageFile3FileName;
	private String imageFile4FileName;
	private String imageFile5FileName;
	private int total;
	@SuppressWarnings("unchecked")
	private List rows;

	/**
	 * 增加工业地产
	 * 
	 */
	public String addIndustry() {
		String id = RequestUtil.getParam(request, "id", "");
		if ("".equals(id)) {
			if (industry.getImgName1() == null
					|| "".equals(industry.getImgName1()))
				industry.setImgType1(null);
			if (industry.getImgName2() == null
					|| "".equals(industry.getImgName2()))
				industry.setImgType2(null);
			if (industry.getImgName3() == null
					|| "".equals(industry.getImgName3()))
				industry.setImgType3(null);
			if (industry.getImgName4() == null
					|| "".equals(industry.getImgName4()))
				industry.setImgType4(null);
			if (industry.getImgName5() == null
					|| "".equals(industry.getImgName5()))
				industry.setImgType5(null);
			String basePath = request.getSession().getServletContext()
					.getRealPath("/");
			String imagePatn = XmlUtil.getValue("imgPath", "sysConfig") + "/";
			String compressPath = XmlUtil.getValue("compression_diagram",
			"sysConfig")
			+ "/";
			boolean isFlag=false;
			if (imageFile1 != null) {
				String message = this.checkImage(imageFile1, 1);
				if (message.length() > 1) {
					response.setContentType("text/html;charset=utf-8");
					PrintWriter out = null;
					try {
						out = response.getWriter();
						out.println("<script>alert('" + message
								+ "');window.history.back(-1);</script>");
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					return null;
				}

				String fileName = new Date().getTime() + "";
				if (FileUtil.doUpFile(basePath + imagePatn + fileName,
						imageFile1)) {
					industry.setImgUrl1(imagePatn+fileName);
					ImageSizer
					.doCompress(imageFile1, basePath
							+ compressPath + fileName, 80, 60,
							1.0f, true);
					industry.setCompressUrl(compressPath + fileName);
				}
			}
			if (imageFile2 != null) {
				String message = this.checkImage(imageFile2, 2);
				if (message.length() > 1) {
					response.setContentType("text/html;charset=utf-8");
					PrintWriter out = null;
					try {
						out = response.getWriter();
						out.println("<script>alert('" + message
								+ "');window.history.back(-1);</script>");
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					return null;

				}
				String fileName = new Date().getTime() + "";
				if (FileUtil.doUpFile(basePath + imagePatn + fileName,
						imageFile2)){
					industry.setImgUrl2(imagePatn+fileName);
					if(!isFlag){
						ImageSizer
						.doCompress(imageFile2, basePath
								+ compressPath + fileName, 80, 60,
								1.0f, true);
						industry.setCompressUrl(compressPath + fileName);
					}
				}

			}
			if (imageFile3 != null) {
				String message = this.checkImage(imageFile3, 3);
				if (message.length() > 1) {
					response.setContentType("text/html;charset=utf-8");
					PrintWriter out = null;
					try {
						out = response.getWriter();
						out.println("<script>alert('" + message
								+ "');window.history.back(-1);</script>");
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					return null;

				}
				String fileName = new Date().getTime() +"";
				if (FileUtil.doUpFile(basePath + imagePatn + fileName,
						imageFile3)){
					industry.setImgUrl3(imagePatn+fileName);
					if(!isFlag){
						ImageSizer
						.doCompress(imageFile3, basePath
								+ compressPath + fileName, 80, 60,
								1.0f, true);
						industry.setCompressUrl(compressPath + fileName);
					}
				}

			}
			if (imageFile4 != null) {
				String message = this.checkImage(imageFile4, 4);
				if (message.length() > 1) {
					response.setContentType("text/html;charset=utf-8");
					PrintWriter out = null;
					try {
						out = response.getWriter();
						out.println("<script>alert('" + message
								+ "');window.history.back(-1);</script>");
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					return null;

				}
				String fileName = new Date().getTime() + "";
				if (FileUtil.doUpFile(basePath + imagePatn + fileName,
						imageFile4)){
					industry.setImgUrl4(imagePatn+fileName);
					if(!isFlag){
						ImageSizer
						.doCompress(imageFile4, basePath
								+ compressPath + fileName, 80, 60,
								1.0f, true);
						industry.setCompressUrl(compressPath + fileName);
					}
				}

			}
			if (imageFile5 != null) {
				String message = this.checkImage(imageFile5, 5);
				if (message.length() > 1) {
					response.setContentType("text/html;charset=utf-8");
					PrintWriter out = null;
					try {
						out = response.getWriter();
						out.println("<script>alert('" + message
								+ "');window.history.back(-1);</script>");
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					return null;

				}
				String fileName = new Date().getTime() + "";
				if (FileUtil.doUpFile(basePath + imagePatn + fileName,
						imageFile5)){
					industry.setImgUrl5(imagePatn+fileName);
					if(!isFlag){
						ImageSizer
						.doCompress(imageFile5, basePath
								+ compressPath + fileName, 80, 60,
								1.0f, true);
						industry.setCompressUrl(compressPath + fileName);
					}
				}

			}
			TmBaseinfo td=(TmBaseinfo)RequestUtil.getLoginUserFromSession(request,"");
			industry.setAuthorId(td.getId().intValue());
			industry.setCreateTime(new Date());
		} else {
			Industry newindustry = service.getById(id, industry.getFlag());
			industry.setAuditingState(newindustry.getAuditingState());
			industry.setId(newindustry.getId());
			industry.setCreateTime(newindustry.getCreateTime());
		}
		industry.setNum(bsservice.getNum(StringUtil.getShortZoneGB(industry.getDistrict()),"4"+industry.getFlag(), "t_p_industry"));
		industry.setCreateTime(new Date());
		String type = RequestUtil.getParam(request, "type", "");
		boolean  isFlag=service.addIndustry(industry);
		if(isFlag && !"".equals(id)){
			if("1".equals(type))	request.setAttribute("url","manageindustryrent.jsp");
			if("2".equals(type))request.setAttribute("url","manageindustrysale.jsp");
			return "modifySuccess";
		}
		if (isFlag)
			return "success";
		return "error";
	}

	/**
	 * 判断图片上传的大小 图片大小要小于5k
	 */
	public String checkImage(File file, int i) {
		StringBuffer buffer = new StringBuffer("第");
		if (file != null) {
			if (file.length() > 500*1024)
				buffer.append("" + i);

			if (buffer.length() > 1) {
				buffer.append("行图片超过500k，请修改图片大小");
				return buffer.toString();
			}

		}
		return "1";
	}

	/**
	 * 根据条件查询工业地产
	 */
	@SuppressWarnings("unchecked")
	public String search() {
		Map map = new HashMap<String, String>();
		String page = RequestUtil.getParam(request, "page", "");
		String type = RequestUtil.getParam(request, "type", "");// 表示出租 出售
		String row = RequestUtil.getParam(request, "rows", "");
		String name = RequestUtil.getParam(request, "name", "");
		String area1 = RequestUtil.getParam(request, "area1", "");
		String area2 = RequestUtil.getParam(request, "area2", "");
		String  price1= RequestUtil.getParam(request, "price1", "");
		String  price2= RequestUtil.getParam(request, "price2", "");
		String catogry = RequestUtil.getParam(request, "category", "");
		String  discode= StringUtil.getShortZoneGB(RequestUtil.getParam(request, "discode", ""));
		map.put("discode", discode);
		map.put("type", type);
		map.put("nameparame", name);
		map.put("area1", area1);
		map.put("area2", area2);
		map.put("price1", price1);
		map.put("catogry", catogry);
		map.put("price2", price2);
		String auting = RequestUtil.getParam(request, "auditingState", "");
		map.put("autingSate", auting);
		List list = service.getList(map, page, row);
		int count = service.getCount(map);
		if (list != null && list.size() > 0) {
			total = count;
			rows = list;
		}
		return Contants.JSONSTRING_RESULT_NAME;
	}

	/**
	 * 
	 * 删除商铺信息
	 */
	public String delete() {
		String id = RequestUtil.getParam(request, "id", "");
		String type = RequestUtil.getParam(request, "type", "");
		String idString = RequestUtil.getParam(request, "idString", "");
		boolean isFlag = false;
		if (!"".equals(id))
			isFlag = service.deleteById(id, type);
		else
			isFlag = service.deleteByIdString(idString, type);
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

	/**
	 * 根据Id查询 工业地产信息
	 */
	public String searchById() {
		String id = RequestUtil.getParam(request, "id", "");
		String type = RequestUtil.getParam(request, "type", "");// 表示出租 出售
		Industry idu = service.getById(id, type);
		request.setAttribute("industry", idu);
		if ("1".equals(type))
			return "modifyrent";
		else
			return "modifysale";
	}

	/**
	 * 根据id得到图片信息
	 * 
	 * @return
	 */
	public String getPic() {
		String id = RequestUtil.getParam(request, "id", "");
		String type = RequestUtil.getParam(request, "type", "");
		Industry idu = service.getById(id, type);
		HttpSession session = request.getSession();
		session.setAttribute("idu", idu);
		return "modifyPic";
	}

	/**
	 * 根据id 图片url 删除图片
	 * 
	 * @return
	 */
	public String delPic() {
		String id = RequestUtil.getParam(request, "id", "");
		String url = RequestUtil.getParam(request, "url", "");
		String type = RequestUtil.getParam(request, "type", "");
		String name = RequestUtil.getParam(request, "name", "");

		String basepath = request.getSession().getServletContext().getRealPath(
				"/")
				+ "imageFloder\\" + url;

		boolean a = service.delPic(id, name);
		boolean b = FileUtil.deleteFile(basepath);
		if (a && b) {
			Industry idu = service.getById(id, type);
			HttpSession session = request.getSession();
			session.setAttribute("idu", idu);
		}
		return "modifyPic";
	}
	public String modifAddPic() {
		String basePath = request.getSession().getServletContext().getRealPath(
				"/");
		String imagePatn = XmlUtil.getValue("imgPath", "sysConfig") + "/";
		Map<String, String> map = new HashMap<String, String>();

		if (imageFile1 != null) {
			String message = this.checkImage(imageFile1, 1);
			if (message.length() > 1) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = null;
				try {
					out = response.getWriter();
					out.println("<script>alert('" + message
							+ "');window.history.back(-1);</script>");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return null;

			}
			String fileName = new Date().getTime() + "";
			if (FileUtil.doUpFile(basePath + imagePatn + fileName, imageFile1)) {

				map.put("name", industry.getImgName1());
				map.put("type", industry.getImgType1());
				map.put("url", fileName);
				map.put("id", industry.getId().toString());
				String imageName = service.getImageName(
						industry.getId().toString(), 1);
				boolean isFlag = service.updateModPic(map, 1);
				if (!isFlag)
					return "error";
				if (imageName != null && (!"".equals(imageName))) {
					File file = new File(basePath + "imageFloder\\" + imageName);
					if (file.exists()) {
						if (!file.delete())
							return "error";
					}
				}

			}
		}
		if (imageFile2 != null) {
			String message = this.checkImage(imageFile2, 2);
			if (message.length() > 1) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = null;
				try {
					out = response.getWriter();
					out.println("<script>alert('" + message
							+ "');window.history.back(-1);</script>");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return null;

			}
			String fileName = new Date().getTime() + "";
			if (FileUtil.doUpFile(basePath + imagePatn + fileName, imageFile2)) {
				map.put("name", industry.getImgName2());
				map.put("type", industry.getImgType2());
				map.put("url", fileName);
				map.put("id", industry.getId().toString());
				String imageName = service.getImageName(
						industry.getId().toString(), 2);
				boolean isFlag = service.updateModPic(map, 2);
				if (!isFlag)
					return "error";
				if (imageName != null && (!"".equals(imageName))) {
					File file = new File(basePath + "imageFloder\\" + imageName);
					if (file.exists()) {
						if (!file.delete())
							return "error";
					}
				}

			}
		}
		if (imageFile3 != null) {
			String message = this.checkImage(imageFile3, 3);
			if (message.length() > 1) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = null;
				try {
					out = response.getWriter();
					out.println("<script>alert('" + message
							+ "');window.history.back(-1);</script>");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return null;

			}
			String fileName = new Date().getTime() + "";
			if (FileUtil.doUpFile(basePath + imagePatn + fileName, imageFile3)) {
				map.put("name", industry.getImgName3());
				map.put("type", industry.getImgType3());
				map.put("url", fileName);
				map.put("id", industry.getId().toString());
				String imageName = service.getImageName(
						industry.getId().toString(), 3);
				boolean isFlag = service.updateModPic(map, 3);
				if (!isFlag)
					return "error";
				if (imageName != null && (!"".equals(imageName))) {
					File file = new File(basePath + "imageFloder\\" + imageName);
					if (file.exists()) {
						if (!file.delete())
							return "error";
					}
				}
			}
		}
		if (imageFile4 != null) {
			String message = this.checkImage(imageFile4, 4);
			if (message.length() > 1) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = null;
				try {
					out = response.getWriter();
					out.println("<script>alert('" + message
							+ "');window.history.back(-1);</script>");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return null;

			}
			String fileName = new Date().getTime() + "";
			if (FileUtil.doUpFile(basePath + imagePatn + fileName, imageFile4)) {
				map.put("name", industry.getImgName4());
				map.put("type", industry.getImgType4());
				map.put("url", fileName);
				map.put("id", industry.getId().toString());
				String imageName = service.getImageName(
						industry.getId().toString(), 3);
				boolean isFlag = service.updateModPic(map, 4);
				if (!isFlag)
					return "error";
				if (imageName != null && (!"".equals(imageName))) {
					File file = new File(basePath + "imageFloder\\" + imageName);
					if (file.exists()) {
						if (!file.delete())
							return "error";
					}
				}
			}
		}
		if (imageFile5 != null) {
			String message = this.checkImage(imageFile5, 5);
			if (message.length() > 1) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = null;
				try {
					out = response.getWriter();
					out.println("<script>alert('" + message
							+ "');window.history.back(-1);</script>");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			String fileName = new Date().getTime() + "";
			if (FileUtil.doUpFile(basePath + imagePatn + fileName, imageFile5)) {
				map.put("name", industry.getImgName5());
				map.put("type", industry.getImgType5());
				map.put("url", fileName);
				map.put("id", industry.getId().toString());
				String imageName = service.getImageName(
						industry.getId().toString(), 5);
				boolean isFlag = service.updateModPic(map, 5);
				if (!isFlag)
					return "error";
				if (imageName != null && (!"".equals(imageName))) {
					File file = new File(basePath + "imageFloder\\" + imageName);
					if (file.exists()) {
						if (!file.delete())
							return "error";
					}

				}
			}
		}
		Industry idu = service.getById(industry.getId().toString(), industry.getFlag());
		HttpSession session = request.getSession();
		session.setAttribute("idu", idu);
		return "modifyPic";
	}
	public IndustryAction() {
		service = new IndustryServiceImpl();
		bsservice = new BusinessServiceImpl();
	}

	public Industry getIndustry() {
		return industry;
	}

	public void setIndustry(Industry industry) {
		this.industry = industry;
	}

	public IndustryService getService() {
		return service;
	}

	public void setService(IndustryService service) {
		this.service = service;
	}

	public File getImageFile1() {
		return imageFile1;
	}

	public void setImageFile1(File imageFile1) {
		this.imageFile1 = imageFile1;
	}

	public File getImageFile2() {
		return imageFile2;
	}

	public void setImageFile2(File imageFile2) {
		this.imageFile2 = imageFile2;
	}

	public File getImageFile3() {
		return imageFile3;
	}

	public void setImageFile3(File imageFile3) {
		this.imageFile3 = imageFile3;
	}

	public File getImageFile4() {
		return imageFile4;
	}

	public void setImageFile4(File imageFile4) {
		this.imageFile4 = imageFile4;
	}

	public File getImageFile5() {
		return imageFile5;
	}

	public void setImageFile5(File imageFile5) {
		this.imageFile5 = imageFile5;
	}

	public String getImageFile1FileName() {
		return imageFile1FileName;
	}

	public void setImageFile1FileName(String imageFile1FileName) {
		this.imageFile1FileName = imageFile1FileName;
	}

	public String getImageFile2FileName() {
		return imageFile2FileName;
	}

	public void setImageFile2FileName(String imageFile2FileName) {
		this.imageFile2FileName = imageFile2FileName;
	}

	public String getImageFile3FileName() {
		return imageFile3FileName;
	}

	public void setImageFile3FileName(String imageFile3FileName) {
		this.imageFile3FileName = imageFile3FileName;
	}

	public String getImageFile4FileName() {
		return imageFile4FileName;
	}

	public void setImageFile4FileName(String imageFile4FileName) {
		this.imageFile4FileName = imageFile4FileName;
	}

	public String getImageFile5FileName() {
		return imageFile5FileName;
	}

	public void setImageFile5FileName(String imageFile5FileName) {
		this.imageFile5FileName = imageFile5FileName;
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
}
