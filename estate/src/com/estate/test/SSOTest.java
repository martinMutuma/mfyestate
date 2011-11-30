package com.estate.test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.http.Header;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;

/**
 * 利用httpclient操作人人网 比如登陆，发状态，模拟你访问任何人主页等等
 * 代码参考http://liubey.javaeye.com/,在他的基础上实现取到所有好友，访问所有好友页面,words这个变量就是requestToken
 * 
 * @author Chen Chun
 */
public class SSOTest {
	// 人人网账号
	private String userName = "";
	// 人人网密码
	private String password = "";
	// 实时更改的字串
	private String words = "";
	private static String redirectURL = "http://www.renren.com/home";
	// Don't change the following URL
	private static String renRenLoginURL = "http://www.renren.com/PLogin.do";
	// The HttpClient is used in one session
	private HttpResponse response;
	private DefaultHttpClient httpclient = null;

	public SSOTest(String userName, String password, String words) {
		this.userName = userName;
		this.password = password;
		this.words = words;
	}

	/**
	 * 登陆
	 * 
	 * @return
	 */
	public boolean login() {
		if (httpclient != null) {
			System.out.println("登陆成功");
			return true;
		}
		httpclient = null;
		httpclient = new DefaultHttpClient();
		HttpPost httpost = new HttpPost(renRenLoginURL);
		// All the parameters post to the web site
		List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		nvps.add(new BasicNameValuePair("origURL", redirectURL));
		nvps.add(new BasicNameValuePair("domain", "renren.com"));
		nvps.add(new BasicNameValuePair("autoLogin", "true"));
		nvps.add(new BasicNameValuePair("formName", ""));
		nvps.add(new BasicNameValuePair("method", ""));
		nvps.add(new BasicNameValuePair("submit", "登录"));
		nvps.add(new BasicNameValuePair("email", userName));
		nvps.add(new BasicNameValuePair("password", password));
		try {
			httpost.setEntity(new UrlEncodedFormEntity(nvps, HTTP.UTF_8));
			response = httpclient.execute(httpost);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			httpost.abort();
		}
		String redirectLocation = getRedirectLocation();
		if (redirectLocation != null) {
			// System.out.println(getText(redirectLocation));
			// 跳到首页，现在登录完成
			getText(redirectLocation);
		}
		System.out.println(redirectLocation);

		return true;
	}

	public String getRedirectLocation() {
		Header locationHeader = response.getFirstHeader("Location");
		if (locationHeader == null) {
			return null;
		}
		return locationHeader.getValue();
	}

	public String getText(String redirectLocation) {
		HttpGet httpget = new HttpGet(redirectLocation);
		// Create a response handler
		ResponseHandler<String> responseHandler = new BasicResponseHandler();
		String responseBody = "";
		try {
			responseBody = httpclient.execute(httpget, responseHandler);
		} catch (Exception e) {
			e.printStackTrace();
			responseBody = null;
		} finally {
			httpget.abort();
			// httpclient.getConnectionManager().shutdown();
		}
		return responseBody;
	}

	/**
	 * 更新本人状态
	 * 
	 * @return
	 */
	public boolean update(String status) {
		if (login()) {
			HttpPost post = new HttpPost(
					"http://status.renren.com/doing/update.do?");
			List<NameValuePair> cp = new ArrayList<NameValuePair>();
			cp.add(new BasicNameValuePair("c", status));
			cp.add(new BasicNameValuePair("isAtHome", "1"));
			cp.add(new BasicNameValuePair("publisher_form_ticket", words));
			cp.add(new BasicNameValuePair("raw", status));
			cp.add(new BasicNameValuePair("requestToken", words));
			cp.add(new BasicNameValuePair("statusPage", "1"));
			try {
				post.setEntity(new UrlEncodedFormEntity(cp, HTTP.UTF_8));
				response = httpclient.execute(post);
				System.out.println(response.getStatusLine());

			} catch (Exception e) {
				e.printStackTrace();
				return false;
			} finally {
				post.abort();
			}
			return true;
		}
		return false;
	}

	/**
	 * 发表本人日志
	 * 
	 * @return
	 */
	public boolean writeBlog(String title, String content) {
		if (login()) {
			HttpPost post = new HttpPost(
					"http://blog.renren.com/blog/0/addBlog");
			List<NameValuePair> cp = new ArrayList<NameValuePair>();
			cp.add(new BasicNameValuePair("title", title));
			cp.add(new BasicNameValuePair("body", content));
			cp.add(new BasicNameValuePair("categoryId", "0"));
			cp.add(new BasicNameValuePair("blogControl", "99"));
			cp.add(new BasicNameValuePair("editBlogControl", "99"));
			cp.add(new BasicNameValuePair("postFormId", words));
			cp.add(new BasicNameValuePair("isVip", "false"));
			cp.add(new BasicNameValuePair("jf_vip_em", "-true"));
			cp.add(new BasicNameValuePair("requestToken", words));
			try {
				post.setEntity(new UrlEncodedFormEntity(cp, HTTP.UTF_8));
				response = httpclient.execute(post);
				System.out.println(response.getStatusLine());

			} catch (Exception e) {
				e.printStackTrace();
				return false;
			} finally {
				post.abort();
			}
			return true;
		}
		return false;
	}

	/**
	 * 访问
	 * 
	 * @param id
	 * @return
	 */
	public boolean visit(int id) {

		HttpPost post = new HttpPost(
				"http://www.renren.com/profile.do?portal=profileFootprint&ref=profile_footprint&id="
						+ id);
		try {
			response = httpclient.execute(post);
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("访问成功！id号：" + id);
		post.abort();
		return true;
	}

	/**
	 * 给好友留言,可以无限刷
	 * 
	 * @param 好友ID,留言内容message
	 * @return
	 */
	public boolean lveMsgToAFriend(int id, String message) {
		if (login()) {
			HttpPost post = new HttpPost("http://gossip.renren.com/gossip.do");
			List<NameValuePair> cp = new ArrayList<NameValuePair>();
			cp.add(new BasicNameValuePair("body", message));
			cp.add(new BasicNameValuePair("curpage", ""));
			cp.add(new BasicNameValuePair("from", "main"));
			cp.add(new BasicNameValuePair("id", "" + id));
			cp.add(new BasicNameValuePair("cc", "" + id));

			cp.add(new BasicNameValuePair("ak",
					"9b04ac2c405e00923df2664d5d512422")); // ??
			cp.add(new BasicNameValuePair("cccc", ""));
			cp.add(new BasicNameValuePair("tsc", ""));
			cp.add(new BasicNameValuePair("headUrl", ""));
			cp.add(new BasicNameValuePair("largeUrl", ""));
			cp.add(new BasicNameValuePair("profilever", "2008"));
			cp.add(new BasicNameValuePair("requestToken", words));
			cp.add(new BasicNameValuePair("only_to_me", "0"));
			cp.add(new BasicNameValuePair("color", ""));
			cp.add(new BasicNameValuePair("ref",
					"http://www.renren.com/profile.do&mode=&requestToken="
							+ words));
			try {
				post.setEntity(new UrlEncodedFormEntity(cp, HTTP.UTF_8));
				response = httpclient.execute(post);
				System.out.println(response.getStatusLine()
						+ response.getAllHeaders().toString()
						+ response.getParams() + response);
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			} finally {
				post.abort();
			}
			return true;
		}
		return false;
	}

	/**
	 * 取到你所有的好友ID
	 * 
	 * @return 好友id list
	 */
	public List<String> getFriends() {

		List<String> friends = new ArrayList<String>();
		if (login()) {
			HttpGet get = new HttpGet(
					"http://friend.renren.com/myfriendlistx.do");
			ResponseHandler<String> responseHandler = new BasicResponseHandler();
			try {
				String friendPage = httpclient.execute(get, responseHandler);
				Pattern pattern = Pattern.compile("var friends=(.*);");
				Matcher matcher = pattern.matcher(friendPage);
				if (matcher.find()) {
					String str = matcher.group(1);
					System.out.println("friends info： " + str);
					Pattern p = Pattern.compile("\"id\":([1-9][0-9]{0,9})");
					Matcher m = p.matcher(str);
					while (m.find()) {
						friends.add(m.group(1));
					}
					return friends;
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				get.abort();
			}
		}
		return null;
	}

	public void delMessage(int id) {
		if (login()) {
			HttpGet get = new HttpGet(
					"http://gossip.renren.com/getgossiplist.do?id="+id+"&age=recent");
			ResponseHandler<String> responseHandler = new BasicResponseHandler();
			try {
				String friendPage = httpclient.execute(get, responseHandler);
//				System.out.println(friendPage);
				Pattern pattern = Pattern.compile("<div class=\"cmt-body\"><div class=\"info\">h");
				Matcher matcher = pattern.matcher(friendPage);
				if (matcher.find()) {
						System.out.println(matcher.group());
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				get.abort();
			}
		}
	}

	/**
	 * @param args
	 * @throws InterruptedException
	 */
	public static void main(String[] args) throws InterruptedException {
		SSOTest lw = new SSOTest("fcaizj@126.com", "7976908", "asdfasdfasd");
		lw.login();
		lw.visit(220818906);
		lw.lveMsgToAFriend(220818906, "httpclient测试");
		lw.delMessage(220818906);
		// List<String> friends = lw.getFriends();
		// for(int i=0;i<friends.size() && i<40;i++)
		// {
		// int id = Integer.parseInt(friends.get(i));
		// System.out.println("id="+id);
		// lw.visit(id);
		// lw.lveMsgToAFriend(id, "测试程序--好友留言 AUTO BY F.C");
		// }
		/*
		 * for(int i=0;i<25;i++) { lw.lveMsgToAFriend(260231042, "踩踩踩"+i);
		 * Thread.sleep(1000); }
		 */
		String aa = "<div class=\"cmt-body\"><div class=\"info\">asdfsdf</div></div>";
		System.out.println(aa.matches("<div class=\"cmt-body\"><div class=\"info\">.*</div></div>"));
	}

}