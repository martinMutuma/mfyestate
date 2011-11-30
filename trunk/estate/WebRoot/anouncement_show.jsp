<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title></title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" href="resource/css/whole.css" type="text/css"></link>
		<script type="text/javascript" src="resource/js/jquery-1.4.2.js"
			charset="utf-8"></script>
		<script type="text/javascript" src="resource/js/whole.js"></script>
		<style type="text/css">
			.title{font-size: 14px;font-weight: bold;}
			.date{font-size: 12px;}
			body{text-align: center;}
		</style>
	</head>

	<body>
		<jsp:include page="head.jsp" />
		<div style="width: 960px; margin-top: 15px;" align="center">
			<table width="100%">
				<tr><td class="title" align="center" valign="middle"><s:property value="#announcement.title"/></td></tr>
				<tr><td align="right" valign="bottom">【<s:date name="#announcement.createTime" format="yyyy-MM-dd kk:mm:ss"/>】</td></tr>
				<tr><td align="left"><s:property value="#announcement.content"/> </td></tr>
				<tr><td align="right" class="title">南京梦房园网络科技有限公司</td></tr>
			</table>
		</div>
		<jsp:include page="copyright.jsp"></jsp:include>
	</body>
</html>
