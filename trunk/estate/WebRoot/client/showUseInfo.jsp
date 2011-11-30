<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息</title>
<link rel="stylesheet" href="<%=basePath %>client/client.css" type="text/css"></link>
</head>
<body>
<div>
	<table width="100%" align="center" id="userinfoTable">
		<tr>
			<td colspan="2" align="center">
				<img src="<%=basePath %>imageFloder/${sessionScope.userinfo.headUrl }"/>
			</td>
		</tr>
		<tr>
			<td class="dotted_border" width="40%">
				用户名：
			</td>
			<td class="dotted_border td_padding">
				${sessionScope.userinfo.username }
			</td>
		</tr>
		<tr>
			<td class="dotted_border">
				姓名：
			</td>
			<td class="dotted_border td_padding">
				${sessionScope.userinfo.realName }
			</td>
		</tr>
		<tr>
			<td class="dotted_border">
				手机：
			</td>
			<td class="dotted_border td_padding">
				${sessionScope.userinfo.mobile }
			</td>
		</tr>
		<tr>
			<td class="dotted_border">
				积分：
			</td>
			<td class="dotted_border td_padding">
				${sessionScope.userinfo.integral }
			</td>
		</tr>
		<tr>
			<td class="dotted_border">
				注册日期：
			</td>
			<td class="dotted_border td_padding">
				${sessionScope.userinfo.createTimeString }&nbsp;
			</td>
		</tr>
		<tr>
			<td class="dotted_border">
				上次登录<br>时间：
			</td>
			<td class="dotted_border td_padding">
				${sessionScope.userinfo.lastLoginTimeString }
			</td>
		</tr>
	</table>
</div>
</body>
</html>