package com.estate.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;

import com.estate.util.comm.HttpClientUtil;

/**
 * 365房源信息同步类
 * 
 * @author F.C 说明: 出售:房源信息如下： 1.房源类型：a.住宅 b.别墅 c.写字楼 d.商铺 e.厂房仓库车库
 *         2.房源座落：15个中文字数以内 3.区域版块: 区域信息-存中文信息 4.
 */
public class House365 {

	private final static String LOGINURL = "http://bbs.house365.com/member.php";

	private final static String estate = "http://localhost:8080/estate/mem/baseinfo_mainPage.shtml";

	private final static String NOLOGINSALEURL = "http://www.house365.com/publish/?kind=1";

	private final static String NOLOGINRENTURL = "http://www.house365.com/publish/?kind=2";

	private final static String NOLOGINSALENEEDURL = "http://www.house365.com/publish/?kind=3";

	private final static String NOLOGINRENTNEEDURL = "http://www.house365.com/publish/?kind=4";

	private HttpClient httpclient;

	private org.apache.commons.httpclient.HttpClient commonHttpClient;

	private HttpResponse response;

	public boolean login(String username, String password) {
		if (null != httpclient)
			return true;
		httpclient = HttpClientUtil.getInstance().initHttpClient(httpclient);
		HttpPost httpost = HttpClientUtil.getInstance().initHttpPost(LOGINURL);
		// 设置参数
		List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		nvps.add(new BasicNameValuePair("username", username));
		nvps.add(new BasicNameValuePair("password", password));
		nvps.add(new BasicNameValuePair("action", "login"));
		nvps.add(new BasicNameValuePair("r", "3"));
		try {
			httpost.setEntity(new UrlEncodedFormEntity(nvps, HTTP.UTF_8));
			response = httpclient.execute(httpost);
			System.out.println(response.getAllHeaders());
			System.out.println(response.getLocale());
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			httpost.abort();
		}
		String redirectLocation = HttpClientUtil.getInstance()
				.getRedirectLocation(response);
		System.out.println(redirectLocation);
		if (redirectLocation != null) {
			// System.out.println(getText(redirectLocation));
			// 跳到首页，现在登录完成
			System.out.println(HttpClientUtil.getInstance().getText(
					redirectLocation, httpclient));
		}
		return true;
	}

	public String downLoadImg() throws HttpException, IOException {
		commonHttpClient = HttpClientUtil.getInstance().initCommonsHttpClient(
				commonHttpClient);
		GetMethod get = new GetMethod(
				"http://localhost:8080/estate/member/yanzhengma.jsp");
		commonHttpClient.executeMethod(get);
		InputStream iStream = get.getResponseBodyAsStream();
		File storeFile = new File("c:/2008sohu.bmp");
		FileOutputStream output = new FileOutputStream(storeFile);
		// 得到网络资源的字节数组,并写入文件
		output.write(get.getResponseBody());
		output.close();
		String str = convertStreamToString(iStream);
		return str;
	}

	public String convertStreamToString(InputStream is)
			throws UnsupportedEncodingException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(is,
				"gbk"));
		StringBuilder sb = new StringBuilder();
		String line = null;
		try {
			while ((line = reader.readLine()) != null) {
				sb.append(line + "\n");

			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return sb.toString();
	}

	public String getImg() {
		httpclient = HttpClientUtil.getInstance().initHttpClient(httpclient);
		HttpGet get = new HttpGet(
				"http://localhost:8080/estate/member/yanzhengma.jsp");
		ResponseHandler<String> responseHandler = new BasicResponseHandler();
		String friendPage = "";
		try {
			friendPage = httpclient.execute(get, responseHandler);
			// System.out.println(friendPage);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			get.abort();
		}
		return friendPage;
	}

	public boolean login(String username, String password, String url,
			String code) {
		if (null != httpclient)
			return true;
		httpclient = HttpClientUtil.getInstance().initHttpClient(httpclient);
		HttpPost httpost = HttpClientUtil.getInstance().initHttpPost(url);
		// 设置参数
		List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		nvps.add(new BasicNameValuePair("username", username));
		nvps.add(new BasicNameValuePair("password", password));
		nvps.add(new BasicNameValuePair("imgchk", code));
		try {
			httpost.setEntity(new UrlEncodedFormEntity(nvps, HTTP.UTF_8));
			response = httpclient.execute(httpost);
			System.out.println(response.getAllHeaders());
			System.out.println(response.getLocale());
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			httpost.abort();
		}
		String redirectLocation = HttpClientUtil.getInstance()
				.getRedirectLocation(response);
		System.out.println(redirectLocation);
		if (redirectLocation != null) {
			// System.out.println(getText(redirectLocation));
			// 跳到首页，现在登录完成
			System.out.println(HttpClientUtil.getInstance().getText(
					redirectLocation, httpclient));
		}
		return true;
	}

	public void nologin() {

	}

	public static void main(String[] args) throws HttpException, IOException {
		House365 h3 = new House365();
		System.out.println(h3.downLoadImg());
		// System.out.println(h3.login("fc19861011", "fc1986"));
		// h3.getImg();
	}
}
