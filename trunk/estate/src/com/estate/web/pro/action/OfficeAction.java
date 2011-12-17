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
import com.estate.business.pro.OfficeService;
import com.estate.business.pro.OfficeServiceImpl;
import com.estate.domain.member.TmBaseinfo;
import com.estate.domain.pro.Office;
import com.estate.util.comm.Contants;
import com.estate.util.comm.RequestUtil;
import com.estate.util.comm.StringUtil;
import com.estate.util.file.FileUtil;
import com.estate.util.file.ImageSizer;
import com.estate.util.file.XmlUtil;

/**
 * 修改意见： 1.与Null做比较时，请将null放在前面
 * 
 * @author FC
 * 
 */

@SuppressWarnings("serial")
public class OfficeAction extends BaseAction {
	private Office office;
	private BusinessService bsservice;
	private OfficeService service;
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
	private TmBaseinfo tb;
	@SuppressWarnings("unchecked")
	private List rows;

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

	public OfficeAction() {
		service = new OfficeServiceImpl();
		bsservice = new BusinessServiceImpl();
	}

	/**
	 * 发布写字楼出租信息
	 * 
	 * @return
	 */
	public String addSend() {
		String id = RequestUtil.getParam(request, "id", "");
		String type = RequestUtil.getParam(request, "type", "");
		if (office.getImgName1() == null || "".equals(office.getImgName1()))
			office.setImgType1(null);
		if (office.getImgName2() == null || "".equals(office.getImgName2()))
			office.setImgType2(null);
		if (office.getImgName3() == null || "".equals(office.getImgName3()))
			office.setImgType3(null);
		if (office.getImgName4() == null || "".equals(office.getImgName4()))
			office.setImgType4(null);
		if (office.getImgName5() == null || "".equals(office.getImgName5()))
			office.setImgType5(null);
		String basePath = request.getSession().getServletContext().getRealPath(
				"/");
		String compressPath = XmlUtil.getValue("compression_diagram",
				"sysConfig")
				+ "/";
		String imagePatn = XmlUtil.getValue("imgPath", "sysConfig") + "/";
		boolean isFlag = false;
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
					e.printStackTrace();
				}
				return null;

			}
			String fileName = new Date().getTime() + imageFile1FileName.substring(imageFile1FileName.lastIndexOf("."));
			if (FileUtil.doUpFile(basePath + imagePatn + fileName, imageFile1)) {
				ImageSizer.doCompress(imageFile1, basePath + compressPath
						+ fileName, 80, 60, 1.0f, true);
				office.setImgUrl1(imagePatn + fileName);
				office.setCompressUrl(compressPath + fileName);
				isFlag = true;
			}
		}
		operateImg(imageFile2, imageFile2FileName, isFlag, basePath, imagePatn,
				compressPath, 2);
		operateImg(imageFile3, imageFile3FileName, isFlag, basePath, imagePatn,
				compressPath, 3);
		operateImg(imageFile4, imageFile4FileName, isFlag, basePath, imagePatn,
				compressPath, 4);
		operateImg(imageFile5, imageFile5FileName, isFlag, basePath, imagePatn,
				compressPath, 5);
		TmBaseinfo td = (TmBaseinfo) RequestUtil.getLoginUserFromSession(
				request, "");
		office.setAuthorId(td.getId().intValue());
		office.setCreateTime(new Date());
		if (null == office.getId())
			office.setNum(bsservice.getNum(StringUtil.getShortZoneGB(office
					.getDistrict()), "1" + office.getFlag(), "t_p_office"));
		boolean saveFlag = service.addOfficeRent(office);
		if (saveFlag && !"".equals(id)) {
			if ("1".equals(type))
				request.setAttribute("url", "managerent.jsp");
			if ("2".equals(type))
				request.setAttribute("url", "managesale.jsp");
			return "modifySuccess";
		}
		if (saveFlag && "".equals(id))
			return "success";
		return "error";

	}

	private boolean operateImg(File image, String imageFileFileName,
			boolean flag, String basePath, String imgPath, String compressPath,
			int index) {
		if (null != image) {
			String message = this.checkImage(image, 2);
			if (message.length() > 1) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = null;
				try {
					out = response.getWriter();
					out.println("<script>alert('" + message
							+ "');window.history.back(-1);</script>");
				} catch (IOException e) {
					e.printStackTrace();
				}
				return false;

			}
			String fileName = new Date().getTime() + imageFileFileName.substring(imageFileFileName.lastIndexOf("."));
			if (FileUtil.doUpFile(basePath + imgPath + fileName, image)) {
				switch (index) {
				case 2:
					office.setImgUrl2(imgPath + fileName);
					break;
				case 3:
					office.setImgUrl3(imgPath + fileName);
					break;
				case 4:
					office.setImgUrl4(imgPath + fileName);
					break;
				case 5:
					office.setImgUrl5(imgPath + fileName);
					break;
				default:
					break;
				}
				if (!flag) {
					ImageSizer.doCompress(image, basePath + compressPath
							+ fileName, 211, 120, 1.0f, true);
					office.setCompressUrl(compressPath + fileName);
				}
			}
		}
		return true;
	}

	/**
	 * 判断图片上传的大小 图片大小要小于5k
	 */
	public String checkImage(File file, int i) {
		StringBuffer buffer = new StringBuffer("第");
		if (file != null) {
			if (file.length() > 500 * 1024)
				buffer.append("" + i);

			if (buffer.length() > 1) {
				buffer.append("行图片超过500k，请修改图片大小");
				return buffer.toString();
			}

		}
		return "1";
	}

	/**
	 * 写字楼出租或出售查询
	 * 
	 */
	@SuppressWarnings("unchecked")
	public String search() {
		tb = (TmBaseinfo) RequestUtil.getLoginUserFromSession(request,
				Contants.SESSION_USER);
		Map map = new HashMap<String, String>();
		String page = RequestUtil.getParam(request, "page", "");
		String type = RequestUtil.getParam(request, "type", "");
		String row = RequestUtil.getParam(request, "rows", "");
		String name = RequestUtil.getParam(request, "name", "");
		String area1 = RequestUtil.getParam(request, "area1", "");
		String area2 = RequestUtil.getParam(request, "area2", "");
		String price1 = RequestUtil.getParam(request, "price1", "");
		String price2 = RequestUtil.getParam(request, "price2", "");
		String discode = StringUtil.getShortZoneGB(RequestUtil.getParam(
				request, "discode", ""));
		map.put("type", type);
		map.put("area1", area1);
		map.put("area2", area2);
		map.put("price1", price1);
		map.put("price2", price2);
		map.put("discode", discode);
		map.put("nameparame", name);
		try {
			map.put("authorId", tb.getId().toString());
		} catch (Exception e) {
			return "loginPage";
		}
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
	 * 删除写字楼出租信息
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 通过id查询写字楼信息
	 * 
	 * @return
	 */
	public String searchById() {
		String id = RequestUtil.getParam(request, "id", "");
		String flag = RequestUtil.getParam(request, "flag", "");// 查看 or 修改
		String type = RequestUtil.getParam(request, "type", "");
		Office office = service.getOfficeById(id, type);
		if ("1".equals(office.getFlag()))
			office.setFlagString("出租");
		if ("2".equals(office.getFlag()))
			office.setFlagString("出售");
		request.setAttribute("office", office);
		if ("see".equals(flag))
			return "see";
		return "modify";
	}

	/**
	 * 通过id查询写字楼的图片信息
	 * 
	 * @return
	 */
	public String getPic() {
		String id = RequestUtil.getParam(request, "id", "");
		String type = RequestUtil.getParam(request, "type", "");
		Office office = service.getOfficeById(id, type);
		HttpSession session = request.getSession();
		session.setAttribute("off", office);
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
			Office office = service.getOfficeById(id, type);
			HttpSession session = request.getSession();
			session.setAttribute("off", office);
		}
		return "modifyPic";
	}

	/**
	 * 修改时 新增的图片
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
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
			String fileName = new Date().getTime() + imageFile1FileName.substring(imageFile1FileName.lastIndexOf("."));
			if (FileUtil.doUpFile(basePath + imagePatn + fileName, imageFile1)) {

				map.put("name", office.getImgName1());
				map.put("type", office.getImgType1());
				map.put("url", fileName);
				map.put("id", office.getId().toString());
				String imageName = service.getImageName(office.getId()
						.toString(), 1);
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
			String fileName = new Date().getTime() + imageFile2FileName.substring(imageFile2FileName.lastIndexOf("."));
			if (FileUtil.doUpFile(basePath + imagePatn + fileName, imageFile2)) {
				map.put("name", office.getImgName2());
				map.put("type", office.getImgType2());
				map.put("url", fileName);
				map.put("id", office.getId().toString());
				String imageName = service.getImageName(office.getId()
						.toString(), 2);
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
			String fileName = new Date().getTime() + imageFile3FileName.substring(imageFile3FileName.lastIndexOf("."));
			if (FileUtil.doUpFile(basePath + imagePatn + fileName, imageFile3)) {
				map.put("name", office.getImgName3());
				map.put("type", office.getImgType3());
				map.put("url", fileName);
				map.put("id", office.getId().toString());
				String imageName = service.getImageName(office.getId()
						.toString(), 3);
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
			String fileName = new Date().getTime() + imageFile4FileName.substring(imageFile4FileName.lastIndexOf("."));
			if (FileUtil.doUpFile(basePath + imagePatn + fileName, imageFile4)) {
				map.put("name", office.getImgName4());
				map.put("type", office.getImgType4());
				map.put("url", fileName);
				map.put("id", office.getId().toString());
				String imageName = service.getImageName(office.getId()
						.toString(), 3);
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
			String fileName = new Date().getTime() + imageFile5FileName.substring(imageFile5FileName.lastIndexOf("."));
			if (FileUtil.doUpFile(basePath + imagePatn + fileName, imageFile5)) {
				map.put("name", office.getImgName5());
				map.put("type", office.getImgType5());
				map.put("url", fileName);
				map.put("id", office.getId().toString());
				String imageName = service.getImageName(office.getId()
						.toString(), 5);
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
		Office off = service.getOfficeById(office.getId().toString(), office
				.getFlag().toString());
		HttpSession session = request.getSession();
		session.setAttribute("off", off);
		return "modifyPic";
	}

	public Office getOffice() {
		return office;
	}

	public void setOffice(Office office) {
		this.office = office;
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

}
