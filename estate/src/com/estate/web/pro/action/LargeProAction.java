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
import com.estate.business.pro.LargeProService;
import com.estate.business.pro.LargeProServiceImpl;
import com.estate.domain.member.TmBaseinfo;
import com.estate.domain.pro.LargePro;
import com.estate.util.comm.Contants;
import com.estate.util.comm.RequestUtil;
import com.estate.util.comm.StringUtil;
import com.estate.util.file.FileUtil;
import com.estate.util.file.ImageSizer;
import com.estate.util.file.XmlUtil;

/**
 * @Title:大型项目Action
 * @Copyright: Copyright (c) 0.1
 * @author:鲁根成
 * @version: 1.0
 * @time: 2011-5-20
 * 
 */
@SuppressWarnings("serial")
public class LargeProAction extends BaseAction {
	private LargePro largePro;
	private LargeProService service;
	private BusinessService bsservice;
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

	public LargeProAction() {
		service = new LargeProServiceImpl();
		bsservice = new BusinessServiceImpl();
	}

	/**
	 * 增加项目
	 * 
	 */
	public String addPro() {
		String id = RequestUtil.getParam(request, "largePro.id", "");
		
			if (largePro.getImgName1() == null || "".equals(largePro.getImgName1()))
				largePro.setImgType1(null);
			if (largePro.getImgName2() == null || "".equals(largePro.getImgName2()))
				largePro.setImgType2(null);
			if (largePro.getImgName3() == null || "".equals(largePro.getImgName3()))
				largePro.setImgType3(null);
			if (largePro.getImgName4() == null || "".equals(largePro.getImgName4()))
				largePro.setImgType4(null);
			if (largePro.getImgName5() == null || "".equals(largePro.getImgName5()))
				largePro.setImgType5(null);
			String basePath = request.getSession().getServletContext()
			.getRealPath("/");
			String imagePatn = XmlUtil.getValue("imgPath", "sysConfig") + "/";
			String compressPath = XmlUtil.getValue("compression_diagram",
			"sysConfig")
			+ "/";
			
		
		    boolean  isFlag = false;
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
					largePro.setImgUrl1(imagePatn+fileName);
					largePro.setCompressUrl(compressPath + fileName);
					isFlag = true;
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
					largePro.setImgUrl2(imagePatn+fileName);
					if(!isFlag){
						ImageSizer
						.doCompress(imageFile2, basePath
								+ compressPath + fileName, 211, 120,
								1.0f, true);
						largePro.setCompressUrl(compressPath + fileName);
						isFlag = true;
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
				if (FileUtil.doUpFile(basePath + imagePatn + fileName,
						imageFile3)){
					largePro.setImgUrl3(imagePatn+fileName);
					if(!isFlag){
						ImageSizer
						.doCompress(imageFile3, basePath
								+ compressPath + fileName, 211, 120,
								1.0f, true);
						largePro.setCompressUrl(compressPath + fileName);
						isFlag = true;
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
					largePro.setImgUrl4(imagePatn+fileName);
					if(!isFlag){
						ImageSizer
						.doCompress(imageFile4, basePath
								+ compressPath + fileName, 211, 120,
								1.0f, true);
						largePro.setCompressUrl(compressPath + fileName);
						isFlag = true;
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
					largePro.setImgUrl5(imagePatn+fileName);
					if(!isFlag){
						ImageSizer
						.doCompress(imageFile5, basePath
								+ compressPath + fileName, 211, 120,
								1.0f, true);
						largePro.setCompressUrl(compressPath + fileName);
						isFlag = true;
					}
				}
			}
			if ("".equals(id)) {
			    TmBaseinfo td=(TmBaseinfo)RequestUtil.getLoginUserFromSession(request,"");
			    largePro.setAuthorId(td.getId().intValue());
			    largePro.setNum(bsservice.getNum(StringUtil.getShortZoneGB(largePro.getDistrict()),"50", "t_p_largepro"));
			}
			largePro.setCreateTime(new Date());
		isFlag = service.addPro(largePro);
//		if(isFlag && !"".equals(id)){
//			request.setAttribute("url","manageproject.jsp");
//			return "modifySuccess";
//		}
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
	 * 根据条件查询项目
	 */
	@SuppressWarnings("unchecked")
	public String search() {
		Map map = new HashMap<String, String>();
		String page = RequestUtil.getParam(request, "page", "");
		String row = RequestUtil.getParam(request, "rows", "");
		String name = RequestUtil.getParam(request, "name", "");
		String  discode= StringUtil.getShortZoneGB(RequestUtil.getParam(request, "discode", ""));
		map.put("discode", discode);
		map.put("nameparame", name);
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
	/**
	 * 根据Id查询 大型项目信息
	 */
	public String searchById() {
		String id = RequestUtil.getParam(request, "id", "");
		LargePro pro = service.getById(id);
		request.setAttribute("largePro", pro);
		return "modifyproject";
	}
	/**
	 * 根据id得到图片信息
	 * @return
	 */
    public   String  getPic(){
    	String id = RequestUtil.getParam(request, "id", "");
    	LargePro pro = service.getById(id);
    	HttpSession  session=request.getSession();
		session.setAttribute("pro", pro);
		return "modifyPic";
    }
    /**
	 * 根据id 图片url 删除图片 
	 * @return
	 */
	public  String  delPic(){
		String id = RequestUtil.getParam(request, "id", "");
		String url = RequestUtil.getParam(request, "url", "");
		String name = RequestUtil.getParam(request, "name", "");
	
		String basepath=request.getSession().getServletContext().getRealPath("/")+"imageFloder\\"+url;
		
		boolean  a=service.delPic(id, name);
		boolean  b=FileUtil.deleteFile(basepath);
		if(a && b ){
			LargePro pro = service.getById(id);
	    	HttpSession  session=request.getSession();
			session.setAttribute("pro", pro);
			
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

				map.put("name", largePro.getImgName1());
				map.put("type", largePro.getImgType1());
				map.put("url", fileName);
				map.put("id", largePro.getId().toString());
				String imageName = service.getImageName(largePro.getId()
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
			String fileName = new Date().getTime() + "";
			if (FileUtil.doUpFile(basePath + imagePatn + fileName, imageFile2)) {
				map.put("name", largePro.getImgName2());
				map.put("type", largePro.getImgType2());
				map.put("url", fileName);
				map.put("id", largePro.getId().toString());
				String imageName = service.getImageName(largePro.getId()
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
			String fileName = new Date().getTime() + "";
			if (FileUtil.doUpFile(basePath + imagePatn + fileName, imageFile3)) {
				map.put("name", largePro.getImgName3());
				map.put("type", largePro.getImgType3());
				map.put("url", fileName);
				map.put("id", largePro.getId().toString());
				String imageName = service.getImageName(largePro.getId()
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
			String fileName = new Date().getTime() + "";
			if (FileUtil.doUpFile(basePath + imagePatn + fileName, imageFile4)) {
				map.put("name", largePro.getImgName4());
				map.put("type", largePro.getImgType4());
				map.put("url", fileName);
				map.put("id", largePro.getId().toString());
				String imageName = service.getImageName(largePro.getId()
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
			String fileName = new Date().getTime() + "";
			if (FileUtil.doUpFile(basePath + imagePatn + fileName, imageFile5)) {
				map.put("name", largePro.getImgName5());
				map.put("type", largePro.getImgType5());
				map.put("url", fileName);
				map.put("id", largePro.getId().toString());
				String imageName = service.getImageName(largePro.getId()
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
		LargePro pro = service.getById(largePro.getId().toString());
    	HttpSession  session=request.getSession();
		session.setAttribute("pro", pro);
		return "modifyPic";
		
	}
	public LargePro getLargePro() {
		return largePro;
	}

	public void setLargePro(LargePro largePro) {
		this.largePro = largePro;
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
