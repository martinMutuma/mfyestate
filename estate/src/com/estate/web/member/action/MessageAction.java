package com.estate.web.member.action;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.estate.base.web.BaseAction;
import com.estate.business.member.BaseInfoService;
import com.estate.business.member.BaseInfoServiceImpl;
import com.estate.business.member.MessageService;
import com.estate.business.member.MessageServiceImpl;
import com.estate.domain.member.TmBaseinfo;
import com.estate.domain.member.TsFile;
import com.estate.domain.member.TsMessage;
import com.estate.util.comm.Contants;
import com.estate.util.comm.RequestUtil;
import com.estate.util.file.XmlUtil;
import com.estate.util.framework.PageUtil;
import com.opensymphony.xwork2.ActionContext;

public class MessageAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7730284833959800414L;
	private MessageService service;
	private BaseInfoService tbService;
	private int reLogin;
	private TmBaseinfo tb;
	private String imgchk;
	private List<TsMessage> list;
	private List<TsFile> filelist;
	private TsMessage ts;
	private PageUtil pu;// 分页工具类
	private String pageNo;
	private String limit;
	private static final String CONTENT_TYPE = "text/html; charset=GBK";

	public MessageAction() {
		service = new MessageServiceImpl();
		tbService = new BaseInfoServiceImpl();
	}

	/**
	 * 跳转留言页面
	 * 
	 * @return
	 */
	public String showMessage() {
		tb = (TmBaseinfo)RequestUtil.getLoginUserFromSession(request, Contants.SESSION_USER);
		String flag = RequestUtil.getParam(request, "flag", "");
		if (null == pageNo || "".equals(pageNo))
			pageNo = "1";
		if (null == limit || "".equals(limit))
			limit = "10";
		try {
			pu = service.getMessageByLoginId(tb.getId().toString(),flag, new Integer(pageNo),
					new Integer(limit));
		} catch (Exception e) {
			e.printStackTrace();
		}
		ActionContext.getContext().put("flag", flag);
		return "mseeageShowPage";
	}
	/**
	 * 查看留言
	 * @return
	 */
	public String readMessage(){
		Long id = RequestUtil.getParam(request, "id", (long)0);
		try {
			ts = service.read(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "viewmessagePage";
	}

	/**
	 * 删除留言
	 * 
	 * @return
	 */
	public String deleteMessage() {
		String flag = RequestUtil.getParam(request, "flag", "");
		String id = RequestUtil.getParam(request, "id", "0");
		TsMessage obj = service.read(Long.valueOf(id));
		service.deleteMessageById(id);
		tb = (TmBaseinfo)RequestUtil.getLoginUserFromSession(request, Contants.SESSION_USER);
		if (null == pageNo || "".equals(pageNo))
			pageNo = "1";
		if (null == limit || "".equals(limit))
			limit = "10";
		try {
			pu = service.getMessageByLoginId(tb.getId().toString(),obj.getFlag(), new Integer(pageNo),
					new Integer(limit));
		} catch (Exception e) {
			e.printStackTrace();
		}
		ActionContext.getContext().put("flag", flag);
		return "mseeageShowPage";
	}

	/**
	 * 留言新增界面
	 * @return
	 */
	public String addmessagePage(){
		String flag = RequestUtil.getParam(request, "flag", "1");//默认留言
		ts.setFlag(flag);
		tb = (TmBaseinfo)RequestUtil.getLoginUserFromSession(request, Contants.SESSION_USER);
		return "addMessagePage";
	}
	/**
	 * 增加留言
	 * @return
	 */
	public String addMessage(){
		String toid = RequestUtil.getParam(request, "toid", "0");
		ts.setToId(Long.valueOf(toid));
		ts.setCreateTime(new Date());
		try {
			service.saveEntity(ts);
		} catch (Exception e) {
			e.printStackTrace();
		}
		tb = (TmBaseinfo)RequestUtil.getLoginUserFromSession(request, Contants.SESSION_USER);
		if (null == pageNo || "".equals(pageNo))
			pageNo = "1";
		if (null == limit || "".equals(limit))
			limit = "10";
		try {
			pu = service.getMessageByLoginId(tb.getId().toString(),ts.getFlag(), new Integer(pageNo),
					new Integer(limit));
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (null == list || list.size() == 0)
			list = new ArrayList<TsMessage>();
		return "mseeageShowPage";
	}
	
	/**
	 * 文件下载列表
	 * @return
	 */
	public String fileDownLoad(){
		String type = RequestUtil.getParam(request, "type", "0");
		try {
			filelist = service.getDownLoadFileList(type);
			tb = (TmBaseinfo)RequestUtil.getLoginUserFromSession(request, Contants.SESSION_USER);
			request.getSession().setAttribute("fileType",type);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "fileDownLoadPage";
	}
	
	/**
	 * 下载文件
	 * @return
	 */
	public String downloadFile() {
		response.setContentType(CONTENT_TYPE);
		// 得到下载文件的名字
		String id = request.getParameter("id");
		try {
			String basePath = request.getSession().getServletContext().getRealPath("/");
			String imagePatn = XmlUtil.getValue("filePath", "sysConfig") + "/";
			// 解决中文乱码问题
//			filename = new String(request.getParameter("filename").getBytes("iso-8859-1"), "gbk");
			TsFile obj = service.readFile(Long.valueOf(id));
			if(obj.getIntegral()!=0){
				tb = (TmBaseinfo)RequestUtil.getLoginUserFromSession(request, Contants.SESSION_USER);
				if(obj.getIntegral()>tb.getIntegral())
					response.getWriter().println("<script>alert('你的积分不够');window.history.back(-1);</script>");
				return null;
			}
			// 创建file对象
			File file = new File(basePath + imagePatn + obj.getFilePath());

			// 设置response的编码方式
			response.setContentType("application/x-msdownload");

			// 写明要下载的文件的大小
			response.setContentLength((int) file.length());

			// 设置附加文件名
			// response.setHeader("Content-Disposition","attachment;filename="+filename);

			// 解决中文乱码
			response.setHeader("Content-Disposition", "attachment;filename="
					+ new String((obj.getFileName()+"."+obj.getFileType()).getBytes("gbk"), "iso-8859-1"));

			// 读出文件到i/o流
			FileInputStream fis = new FileInputStream(file);
			BufferedInputStream buff = new BufferedInputStream(fis);

			byte[] b = new byte[1024];// 相当于我们的缓存

			long k = 0;// 该值用于计算当前实际下载了多少字节

			// 从response对象中得到输出流,准备下载
			OutputStream myout = response.getOutputStream();

			// 开始循环下载
			while (k < file.length()) {
				int j = buff.read(b, 0, 1024);
				k += j;
				// 将b中的数据写到客户端的内存
				myout.write(b, 0, j);
			}
			if(obj.getIntegral()!=0){
				tb = (TmBaseinfo)RequestUtil.getLoginUserFromSession(request, Contants.SESSION_USER);
				if(obj.getIntegral()>tb.getIntegral())
					response.getWriter().println("<script>alert('你的积分不够');window.history.back(-1);</script>");
				tb.setIntegral(tb.getIntegral()-obj.getIntegral());
				tbService.saveEntity(tb);
			}
			// 将写入到客户端的内存的数据,刷新到磁盘
			myout.flush();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 得到房源收藏列表
	 * @return
	 */
	public String showCollect(){
		tb = (TmBaseinfo)RequestUtil.getLoginUserFromSession(request, Contants.SESSION_USER);
		return "collectPage";// 转向个人主页
	}
	
	/**
	 * 查看店铺公告
	 * @return
	 */
	public String showNotice(){
		tb = (TmBaseinfo)RequestUtil.getLoginUserFromSession(request, Contants.SESSION_USER);
		String flag = RequestUtil.getParam(request, "flag", "3");
		if (null == pageNo || "".equals(pageNo))
			pageNo = "1";
		if (null == limit || "".equals(limit))
			limit = "10";
		try {
			pu = service.getMessageByLoginId(tb.getId().toString(),flag, new Integer(pageNo),
					new Integer(limit));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (null == pu.getList() || pu.getList().size() == 0){
			ts = new TsMessage();
			ts.setFlag(flag);
		}else
			ts = (TsMessage)pu.getList().get(0);
		return "noticePage";
	}
	
	/**
	 * 修改店铺公告
	 * @return
	 */
	public String addNotice(){
		tb = (TmBaseinfo)RequestUtil.getLoginUserFromSession(request, Contants.SESSION_USER);
		if(null==ts.getId()||"".equals(ts.getId())){
			ts.setId(null);
			ts.setToId(tb.getId());
			ts.setFromId(tb.getId());
			ts.setCreateTime(new Date());
			service.saveEntity(ts);
		}else{
			ts.setCreateTime(new Date());
			service.saveOrUpdate(ts);
		}
		return "noticePage";
	}
	
	public List<TsMessage> getList() {
		return list;
	}

	public void setList(List<TsMessage> list) {
		this.list = list;
	}

	public String getImgchk() {
		return imgchk;
	}

	public void setImgchk(String imgchk) {
		this.imgchk = imgchk;
	}

	public TmBaseinfo getTb() {
		return tb;
	}

	public void setTb(TmBaseinfo tb) {
		this.tb = tb;
	}

	public int getReLogin() {
		return reLogin;
	}

	public void setReLogin(int reLogin) {
		this.reLogin = reLogin;
	}
	
	public TsMessage getTs() {
		return ts;
	}

	public void setTs(TsMessage ts) {
		this.ts = ts;
	}
	
	public List<TsFile> getFilelist() {
		return filelist;
	}

	public void setFilelist(List<TsFile> filelist) {
		this.filelist = filelist;
	}

	public PageUtil getPu() {
		return pu;
	}

	public void setPu(PageUtil pu) {
		this.pu = pu;
	}

	public String getPageNo() {
		return pageNo;
	}

	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}

	public String getLimit() {
		return limit;
	}

	public void setLimit(String limit) {
		this.limit = limit;
	}
}
