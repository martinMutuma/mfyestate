package com.estate.web.pro.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;

import com.estate.base.web.BaseAction;
import com.estate.business.pro.FloorService;
import com.estate.business.pro.FloorServiceImpl;
import com.estate.domain.member.TmBaseinfo;
import com.estate.domain.pro.Floor;
import com.estate.util.comm.Contants;
import com.estate.util.comm.RequestUtil;
import com.estate.util.file.FileUtil;
import com.estate.util.file.XmlUtil;

/**
 * @Title:楼盘Action
 * @Copyright: Copyright (c) 0.1
 * @author:鲁根成
 * @version: 1.0
 * @time: 2011-5-11
 * 
 */
@SuppressWarnings("serial")
public class FloorAction extends BaseAction {
	private Floor floor;
	private FloorService service;
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
	private String jsonString;

	/**
	 * 增加楼盘信息
	 * 
	 * @return
	 */
	public String addFloor() {
		if (floor.getImgName1() == null || "".equals(floor.getImgName1()))
			floor.setImgType1(null);
		if (floor.getImgName2() == null || "".equals(floor.getImgName2()))
			floor.setImgType2(null);
		if (floor.getImgName3() == null || "".equals(floor.getImgName3()))
			floor.setImgType3(null);
		if (floor.getImgName4() == null || "".equals(floor.getImgName4()))
			floor.setImgType4(null);
		if (floor.getImgName5() == null || "".equals(floor.getImgName5()))
			floor.setImgType5(null);
		String basePath = request.getSession().getServletContext().getRealPath(
				"/");
		String imagePatn = XmlUtil.getValue("imgPath", "sysConfig") + "/";

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
				floor.setImgUrl1(fileName);
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
			if (FileUtil.doUpFile(basePath + imagePatn + fileName, imageFile2))
				floor.setImgUrl2(fileName);

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
			if (FileUtil.doUpFile(basePath + imagePatn + fileName, imageFile3))
				floor.setImgUrl3(fileName);

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
			if (FileUtil.doUpFile(basePath + imagePatn + fileName, imageFile4))
				floor.setImgUrl4(fileName);

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
			if (FileUtil.doUpFile(basePath + imagePatn + fileName, imageFile5))
				floor.setImgUrl5(fileName);

		}
		TmBaseinfo td=(TmBaseinfo)RequestUtil.getLoginUserFromSession(request,Contants.SESSION_USER);
		floor.setAuthorId(td.getId().intValue());
		floor.setCreateTime(new Date());
		//floor.setAuditingState("0");//默认为0未审核
		if (service.addFloor(floor))
			return "success";
		else
			return "error";

	}

	/**
	 * 判断图片上传的大小 图片大小要小于5k
	 */
	public String checkImage(File file, int i) {
		StringBuffer buffer = new StringBuffer("第");
		if (file != null) {
			if (file.length() > 500* 1024)
				buffer.append("" + i);

			if (buffer.length() > 1) {
				buffer.append("行图片超过500k，请修改图片大小");
				return buffer.toString();
			}

		}
		return "1";
	}

	/**
	 * 
	 * 根据楼盘名简写 拼音查询所符合的楼盘信息
	 */
	public String search() {
		String pinyin = request.getParameter("ws");
		if (null == pinyin || "".equals(pinyin))
			this.jsonString = "[]";
		else {
			List<Floor> list = service.searchFloor(pinyin.trim());
			if (null != list && list.size() > 0) {
				JSONArray jsonObject = JSONArray.fromObject(list);
				this.jsonString = jsonObject.toString();
			} else
				this.jsonString = "[]";

		}
		return Contants.JSONSTRING_RESULT_NAME;
	}

	/**
	 * 
	 * @return
	 */

	public Floor getFloor() {
		return floor;
	}

	public void setFloor(Floor floor) {
		this.floor = floor;
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

	public FloorAction() {
		service = new FloorServiceImpl();
	}

	public String getJsonString() {
		return jsonString;
	}

	public void setJsonString(String jsonString) {
		this.jsonString = jsonString;
	}

}
