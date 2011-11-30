<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>会员信息管理</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/jqueryui/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/jqueryui/icon.css">
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>css/jqueryui/icon.css">
		<script type="text/javascript" src="<%=basePath%>scripts/jquery-1.4.2.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>scripts/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="../scripts/baseinfoManage/baseinfoManage.js"></script>
		<style type="text/css">
<!--
td {
	font-size: 10pt;
	color: #000000;
}
-->
</style>

	</head>

	<body>
		<table width="100%" border="0" cellpadding="1" cellspacing="1">

			<tr>
				<td>
					<div align="left">
							会员名：&nbsp;
							<input type="text" name="username" id="username"
								value=<s:property value="baseinfo.username"/> >&nbsp;&nbsp;
							手机：&nbsp;
							<input type="text" name="mobile" id="mobile" size="12"
								value=<s:property value="baseinfo.mobile"/> >&nbsp;&nbsp;
							会员类型：&nbsp;
							<s:select list="#{'1':'经纪人','2':'个人业主','3':'公司业主','4':'开发商','5':'客户(需求方)','6':'银行','7':'贷款中介','8':'评估公司','9':'研究机构','10':'连锁企业','11':'其他'}"
											name="baseinfo.type" id="tbtype" theme="simple" headerKey=""
											headerValue="----"></s:select>&nbsp;&nbsp;
							地区：&nbsp;
							<s:select	list="#{'0101':'南京市玄武区','0102':'南京市鼓楼区','0103':'南京市雨花区'}"
											name="baseinfo.discode" theme="simple" headerKey=""
											id="discode" headerValue="----"></s:select>&nbsp;&nbsp;
							状态：&nbsp;
								<s:select	list="#{'0':'正常','1':'禁用'}"
											name="baseinfo.status" theme="simple" headerKey=""
											id="status" headerValue="--"></s:select>&nbsp;&nbsp;	
							<a id="searchid" href="javascript:onSearch()"></a>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<table id="grid"></table>
				</td>
			</tr>
		</table>
	</body>
</html>
