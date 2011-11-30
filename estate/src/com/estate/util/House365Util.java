package com.estate.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;

import com.estate.util.comm.HttpClientUtil;

public class House365Util {
	private HttpClient httpClient;

	private final static String LOGINURL = "http://bbs.house365.com/member.php";

	private final static String NOLOGINSALEURL = "'''http://www.house365.com/publish/?kind=1";

	private final static String NOLOGINRENTURL = "http://www.house365.com/publish/?kind=2";

	private final static String NOLOGINSALENEEDURL = "http://www.house365.com/publish/?kind=3";

	private final static String NOLOGINRENTNEEDURL = "http://www.house365.com/publish/?kind=4";

	public House365Util(HttpClient httpClient) {
		this.httpClient = httpClient;
	}

	public boolean login(String url, String username, String password,
			String cookie) throws HttpException, IOException {
		PostMethod post = HttpClientUtil.getInstance().initPostMethod(url);
		try {
			NameValuePair[] data = { new NameValuePair("username", username),
					new NameValuePair("password", password),
					new NameValuePair("action", "login"),
					new NameValuePair("r", "3") };
			if (null != cookie && !"".equals(cookie))
				post.setRequestHeader("cookie", cookie);// 将“临时证明”放入下一次的发贴请求操作中
			post.setRequestBody(data);
			httpClient.executeMethod(post);
			StringBuffer response = new StringBuffer();
			BufferedReader reader = new BufferedReader(new InputStreamReader(
					post.getResponseBodyAsStream(), "gb2312"));// 以gb2312编码方式打印从服务器端返回的请求
			String line;
			while ((line = reader.readLine()) != null) {
				response.append(line).append(
						System.getProperty("line.separator"));
			}
			reader.close();
			if (response.toString().indexOf("您已成功登录") != -1)
				return true;
			else
				return false;
		} finally {
			post.abort();
		}

	}

	public void testLogin(String username, String password, String cookie,
			String code) throws HttpException, IOException {
		PostMethod post = HttpClientUtil.getInstance().initPostMethod(
				"http://localhost:8080/estate/mem/baseinfo_loginMember.shtml");
		NameValuePair[] data = { new NameValuePair("username", username),
				new NameValuePair("password", password),
				new NameValuePair("imgchk", code) };
		post.setRequestHeader("cookie", cookie);// 将“临时证明”放入下一次的发贴请求操作中
		post.setRequestBody(data);
		httpClient.executeMethod(post);
		StringBuffer response = new StringBuffer();
		BufferedReader reader = new BufferedReader(new InputStreamReader(post
				.getResponseBodyAsStream(), "gb2312"));// 以gb2312编码方式打印从服务器端返回的请求
		String line;
		while ((line = reader.readLine()) != null) {
			response.append(line).append(System.getProperty("line.separator"));
		}
		reader.close();
		System.out.println(response.toString());
		post.abort();
	}
}
