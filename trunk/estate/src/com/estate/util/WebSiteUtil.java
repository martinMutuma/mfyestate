package com.estate.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.commons.httpclient.Cookie;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.methods.GetMethod;

import com.estate.util.comm.HttpClientUtil;
import com.estate.util.file.XmlUtil;

/**
 * 用于连接其它网站工具类
 * 
 * @author F.C
 * @Time 211/9/25 14:43
 */
public class WebSiteUtil {

	private HttpClient httpclient;
	private String imgTemp = XmlUtil.getValue("imgTemp", "sysConfig");

	public WebSiteUtil(HttpClient httpclient) {
		this.httpclient = httpclient;
	}

	/**
	 * 禁止调用缺省构造函数
	 */
	private WebSiteUtil() {
	}

	public String downLoadYZM(String url, String fileName, String basePath)
			throws HttpException, IOException {
		GetMethod get = HttpClientUtil.getInstance().initGetMethod(url);
		httpclient.executeMethod(get);
		File storeFile = new File(basePath + imgTemp + "/" + fileName + ".gif");
		FileOutputStream output = new FileOutputStream(storeFile);
		// 得到网络资源的字节数组,并写入文件
		output.write(get.getResponseBody());
		output.close();
		Cookie[] cookies = httpclient.getState().getCookies();// 取出登陆成功后，服务器返回的cookies信息，里面保存了服务器端给的“临时证”
		String tmpcookies = "";
		for (Cookie c : cookies) {
			tmpcookies = tmpcookies + c.toString() + ";";
		}
		System.out.println(tmpcookies);
		get.abort();
		return tmpcookies;
	}

}
