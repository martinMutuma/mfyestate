package com.estate.business.web.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.estate.base.web.BaseAction;
import com.estate.business.service.NewsService;
import com.estate.business.service.NewsServiceImpl;
import com.estate.domain.TmBaseinfo;
import com.estate.domain.TsNews;
import com.estate.domain.TsNewsFormBean;
import com.estate.domain.TsUser;
import com.estate.util.comm.Contants;
import com.estate.util.comm.RequestUtil;
import com.estate.util.file.ImageSizer;
import com.estate.util.file.XmlUtil;

/**
 * 新闻相关Action
 * 
 * @author SFF
 * 
 */
public class NewsAction extends BaseAction {

	private static final long serialVersionUID = 688970037309060648L;

	private int total;
	private TsNews news;
	private List rows;
	private int flag;
	private File imageFile;
	private String imageFileFileName;

	private NewsService service;

	public NewsAction() {
		service = new NewsServiceImpl();
	}

	/*
	 * 转向管理页面
	 */
	@SuppressWarnings("unchecked")
	public String toNewsManage() {
		return "newsManage";
	}

	public String getNewsManage() {
		try {
			String page = RequestUtil.getParam(request, "page", "1");
			String row = RequestUtil.getParam(request, "rows", "10");
			String title = RequestUtil.getParam(request, "title", "");
			String startTime = RequestUtil.getParam(request, "startTime", "");
			String endTime = RequestUtil.getParam(request, "endTime", "");
			String columnType = RequestUtil.getParam(request, "columnType", "");
			String stressFlag = RequestUtil.getParam(request, "stressFlag", "");
			String recommendFlag = RequestUtil.getParam(request, "recommendFlag", "");
			String imgFlag = RequestUtil.getParam(request, "imgFlag", "");
			TsNewsFormBean formBean = new TsNewsFormBean();
			formBean.setColumnType(columnType);
			formBean.setEndTime(endTime);
			formBean.setRecommendFlag(recommendFlag);
			formBean.setStartTime(startTime);
			formBean.setTitle(title);
			formBean.setStressFlag(stressFlag);
			formBean.setImgFlag(imgFlag);
			Map<String, Object> map = service.findAll(formBean, page, row);
			rows = (List<TmBaseinfo>) map.get("list");
			total = Integer.parseInt(map.get("total").toString());
		} catch (Exception e) {
			log.error("新闻管理信息出错", e);
		}
		return Contants.JSONSTRING_RESULT_NAME;
	}

	public String saveOrUpdate() {
		try {
			TsUser user = (TsUser) RequestUtil.getLoginUserFromSession(request, "");
			news.setCreator(user.getUsername());
			news.setCreateTime(new Date());
			if (news.getRecommendFlag() == null)
				news.setRecommendFlag(new Byte("1"));
			if (news.getStressFlag() == null)
				news.setStressFlag(new Byte("1"));
			if (news.getImgFlag() == null)
				news.setImgFlag(new Byte("1"));
			service.saveOrUpdate(news);
		} catch (Exception e) {
			log.error("保存或修改信息出错", e);
		}
		return "toNewsManage";
	}

	public String delete() {
		String id = RequestUtil.getParam(request, "id", "");
		String idString = RequestUtil.getParam(request, "idString", "");
		boolean isFlag = false;
		if (!"".equals(id))
			isFlag = service.deleteByIdString(id);
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
			log.error("删除信息出错", e);
		}
		return null;
	}

	/*
	 * 跳转信息页面
	 */
	public String toNewsInfo() {
		try {
			long id = RequestUtil.getParam(request, "id", 0l);
			if (!"".equals(id)) {
				news = service.read(id);
			}
		} catch (Exception e) {
			log.error("查询信息出错", e);
		}
		return "toNewsInfo";
	}

	/**
	 * 上传图片
	 * 
	 * @return
	 */
	public String preview() {
		try {
			if (null != imageFile) {
				String basePath = getBasePath();
				String fileName = new Date().getTime() + "_" + imageFileFileName;
				String newsImgPath = "/" + XmlUtil.getValue("newsImgPath", "sysConfig") + "/";

				/*
				 * if (FileUtil .doUpFile(basePath + "/newsimage/" + fileName,
				 * imageFile)) {
				 */
				ImageSizer.doCompress(imageFile, basePath + newsImgPath + fileName, 116, 100, 1.0f, true);
				response.getWriter().print(
						"<script>parent.showimg('" + request.getContextPath() + newsImgPath + fileName + "')</script>");

			}
		} catch (Exception e) {
			log.error("图片预览错误", e);
		}
		return null;
	}

	/**
	 * 获取系统路径
	 * 
	 * @return
	 */
	private String getBasePath() {
		return request.getSession().getServletContext().getRealPath("");
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public TsNews getNews() {
		return news;
	}

	public void setNews(TsNews news) {
		this.news = news;
	}

	public List getRows() {
		return rows;
	}

	public void setRows(List rows) {
		this.rows = rows;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public File getImageFile() {
		return imageFile;
	}

	public void setImageFile(File imageFile) {
		this.imageFile = imageFile;
	}

	public String getImageFileFileName() {
		return imageFileFileName;
	}

	public void setImageFileFileName(String imageFileFileName) {
		this.imageFileFileName = imageFileFileName;
	}

}
