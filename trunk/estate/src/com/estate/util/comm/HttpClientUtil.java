package com.estate.util.comm;

import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.http.Header;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;

public class HttpClientUtil {
	private static HttpClientUtil instance;

	private HttpClientUtil() {
	}

	public static HttpClientUtil getInstance() {
		if (null == instance)
			instance = new HttpClientUtil();
		return instance;
	}

	/**
	 * 创建httpclient示例
	 */
	public HttpClient initHttpClient(HttpClient httpclient) {
		if (null != httpclient)
			return httpclient;
		httpclient = new DefaultHttpClient();
		return httpclient;
	}

	public org.apache.commons.httpclient.HttpClient initCommonsHttpClient(
			org.apache.commons.httpclient.HttpClient commonHttpClient) {
		if (null != commonHttpClient)
			return commonHttpClient;
		commonHttpClient = new org.apache.commons.httpclient.HttpClient();
		return commonHttpClient;
	}

	/**
	 * 初始化HttpPost方法
	 * 
	 * @param url
	 * @return
	 */
	public HttpPost initHttpPost(String url) {
		HttpPost httpost = new HttpPost(url);
		return httpost;
	}

	/**
	 * 初始化PostMethod方法
	 * 
	 * @param url
	 * @return
	 */
	public PostMethod initPostMethod(String url) {
		PostMethod postMethod = new PostMethod(url);
		return postMethod;
	}

	/**
	 * 初始化HttpGet方法
	 * 
	 * @param url
	 * @return
	 */
	public HttpGet initHttpGet(String url) {
		HttpGet httpget = new HttpGet(url);
		return httpget;
	}

	/**
	 * 初始化GetMethod方法
	 * 
	 * @param url
	 * @return
	 */
	public GetMethod initGetMethod(String url) {
		GetMethod getMethod = new GetMethod(url);
		return getMethod;
	}

	/**
	 * 获取目标地址内容
	 * 
	 * @param redirectLocation
	 * @return
	 */
	public String getText(String redirectLocation, HttpClient httpclient) {
		HttpGet httpget = new HttpGet(redirectLocation);
		ResponseHandler<String> responseHandler = new BasicResponseHandler();
		String responseBody = "";
		try {
			responseBody = httpclient.execute(httpget, responseHandler);
		} catch (Exception e) {
			e.printStackTrace();
			responseBody = null;
		} finally {
			httpget.abort();
		}
		return responseBody;
	}

	/**
	 * 获取跳转路径
	 * 
	 * @param response
	 * @return
	 */
	public String getRedirectLocation(HttpResponse response) {
		Header locationHeader = response.getFirstHeader("Location");
		if (locationHeader == null) {
			return null;
		}
		return locationHeader.getValue();
	}
}
