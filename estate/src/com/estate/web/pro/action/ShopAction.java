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
import com.estate.business.pro.ShopService;
import com.estate.business.pro.ShopServiceImpl;
import com.estate.domain.member.TmBaseinfo;
import com.estate.domain.pro.Shop;
import com.estate.util.comm.Contants;
import com.estate.util.comm.RequestUtil;
import com.estate.util.comm.StringUtil;
import com.estate.util.file.FileUtil;
import com.estate.util.file.ImageSizer;
import com.estate.util.file.XmlUtil;

/**
 * @Title:商铺Action
 * @Copyright: Copyright (c) 0.1
 * @author:鲁根成
 * @version: 1.0
 * @time: 2011-5-17
 * 
 */
@SuppressWarnings("serial")
public class ShopAction extends BaseAction {
	private ShopService service;
	private BusinessService bsservice;
	private Shop shop;
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

	/**
	 * 
	 * 增加商铺
	 */
	public String addShop() {
		String id = RequestUtil.getParam(request, "shop.id", "");
			if (shop.getImgName1() == null || "".equals(shop.getImgName1()))
				shop.setImgType1(null);
			if (shop.getImgName2() == null || "".equals(shop.getImgName2()))
				shop.setImgType2(null);
			if (shop.getImgName3() == null || "".equals(shop.getImgName3()))
				shop.setImgType3(null);
			if (shop.getImgName4() == null || "".equals(shop.getImgName4()))
				shop.setImgType4(null);
			if (shop.getImgName5() == null || "".equals(shop.getImgName5()))
				shop.setImgType5(null);
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
						e.printStackTrace();
					}
					return null;
				}

				String fileName = new Date().getTime() + "";
				if (FileUtil.doUpFile(basePath + imagePatn + fileName,
						imageFile1)) {
					ImageSizer
					.doCompress(imageFile1, basePath
							+ compressPath + fileName, 80, 60,
							1.0f, true);
					shop.setImgUrl1(imagePatn + fileName);
					shop.setCompressUrl(compressPath + fileName);
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
			
		if("".equals(id)){
			TmBaseinfo td=(TmBaseinfo)RequestUtil.getLoginUserFromSession(request,"");
			shop.setAuthorId(td.getId().intValue());
			shop.setNum(bsservice.getNum(StringUtil.getShortZoneGB(shop.getDistrict()),"2"+shop.getFlag(), "t_s_shops"));
		}
		shop.setCreateTime(new Date());
//		String type = RequestUtil.getParam(request, "type", "");
		boolean flag=service.addShop(shop);
//		if(flag && !"".equals(id)){
//	      if("1".equals(type))request.setAttribute("url","manageshoprent.jsp");
//	      if("2".equals(type))request.setAttribute("url","manageshopsale.jsp");
//			return "modifySuccess";
//		}
		if (flag)
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
			String fileName = new Date().getTime() + "";
			if (FileUtil.doUpFile(basePath + imgPath + fileName, image)) {
				switch (index) {
				case 2:
					shop.setImgUrl2(imgPath + fileName);
					break;
				case 3:
					shop.setImgUrl3(imgPath + fileName);
					break;
				case 4:
					shop.setImgUrl4(imgPath + fileName);
					break;
				case 5:
					shop.setImgUrl5(imgPath + fileName);
					break;
				default:
					break;
				}
				if (!flag) {
					ImageSizer.doCompress(image, basePath + compressPath
							+ fileName, 252, 200, 1.0f, true);
					shop.setCompressUrl(compressPath + fileName);
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
	 * 根据条件查询 商铺
	 */
	@SuppressWarnings("unchecked")
	public String search() {
		tb = (TmBaseinfo)RequestUtil.getLoginUserFromSession(request, Contants.SESSION_USER);
		Map map = new HashMap<String, String>();
		String page = RequestUtil.getParam(request, "page", "");
		String type = RequestUtil.getParam(request, "type", "");// 表示出租 出售
		String row = RequestUtil.getParam(request, "rows", "");
		String name = RequestUtil.getParam(request, "name", "");
		String area1 = RequestUtil.getParam(request, "area1", "");
		String area2 = RequestUtil.getParam(request, "area2", "");
		String  price1= RequestUtil.getParam(request, "price1", "");
		String  price2= RequestUtil.getParam(request, "price2", "");
		String  discode= StringUtil.getShortZoneGB(RequestUtil.getParam(request, "discode", ""));
		map.put("discode", discode);
		map.put("type", type);
		map.put("nameparame", name);
		map.put("area1", area1);
		map.put("area2", area2);
		map.put("price1", price1);
		map.put("price2", price2);
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
	 * 根据Id查询 商铺信息
	 */
	public String searchById() {
		menuCls=RequestUtil.getParam(request, "menuCls", "");
		String id = RequestUtil.getParam(request, "id", "");
		try {
			Shop shop = service.getById(id);
			request.setAttribute("shop", shop);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "modifyrent";
	}

	/**
	 * 通过id查询商铺的图片信息
	 * 
	 * @return
	 */
	public String getPic() {
		String id = RequestUtil.getParam(request, "id", "");
		Shop sp = service.getById(id);
		HttpSession session = request.getSession();
		session.setAttribute("sp", sp);
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
		String name = RequestUtil.getParam(request, "name", "");
		String basepath = request.getSession().getServletContext().getRealPath(
				"/")
				+ "imageFloder\\" + url;

		boolean a = service.delPic(id, name);
		boolean b = FileUtil.deleteFile(basepath);
		if (a && b) {
			Shop sp = service.getById(id);
			HttpSession session = request.getSession();
			session.setAttribute("sp", sp);
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
					e.printStackTrace();
				}
				return null;

			}
			String fileName = new Date().getTime() + "";
			if (FileUtil.doUpFile(basePath + imagePatn + fileName, imageFile1)) {

				map.put("name", shop.getImgName1());
				map.put("type", shop.getImgType1());
				map.put("url", fileName);
				map.put("id", shop.getId().toString());
				String imageName = service.getImageName(
						shop.getId().toString(), 1);
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
					e.printStackTrace();
				}
				return null;

			}
			String fileName = new Date().getTime() + "";
			if (FileUtil.doUpFile(basePath + imagePatn + fileName, imageFile2)) {
				map.put("name", shop.getImgName2());
				map.put("type", shop.getImgType2());
				map.put("url", fileName);
				map.put("id", shop.getId().toString());
				String imageName = service.getImageName(
						shop.getId().toString(), 2);
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
					e.printStackTrace();
				}
				return null;

			}
			String fileName = new Date().getTime() + "";
			if (FileUtil.doUpFile(basePath + imagePatn + fileName, imageFile3)) {
				map.put("name", shop.getImgName3());
				map.put("type", shop.getImgType3());
				map.put("url", fileName);
				map.put("id", shop.getId().toString());
				String imageName = service.getImageName(
						shop.getId().toString(), 3);
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
					e.printStackTrace();
				}
				return null;

			}
			String fileName = new Date().getTime() + "";
			if (FileUtil.doUpFile(basePath + imagePatn + fileName, imageFile4)) {
				map.put("name", shop.getImgName4());
				map.put("type", shop.getImgType4());
				map.put("url", fileName);
				map.put("id", shop.getId().toString());
				String imageName = service.getImageName(
						shop.getId().toString(), 3);
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
					e.printStackTrace();
				}
			}
			String fileName = new Date().getTime() + "";
			if (FileUtil.doUpFile(basePath + imagePatn + fileName, imageFile5)) {
				map.put("name", shop.getImgName5());
				map.put("type", shop.getImgType5());
				map.put("url", fileName);
				map.put("id", shop.getId().toString());
				String imageName = service.getImageName(
						shop.getId().toString(), 5);
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
		Shop sp = service.getById(shop.getId().toString());
		HttpSession session = request.getSession();
		session.setAttribute("sp", sp);
		return "modifyPic";
	}

	public ShopAction() {
		service = new ShopServiceImpl();
		bsservice = new BusinessServiceImpl();
	}

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
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
