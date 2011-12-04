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


		<title>投诉与建议信息管理</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>css/jqueryui/default/easyui.css">
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>css/jqueryui/icon.css">
		<script type="text/javascript"
			src="<%=basePath%>scripts/jquery-1.4.2.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>scripts/jquery.easyui.min.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>scripts/My97DatePicker/WdatePicker.js" /></script>	
		<script type="text/javascript"
			src="../scripts/suggestionManage/suggestionManage.js"></script>
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
						发布时间：从
						 <input size="12" type="text" class="Wdate" id="stime" onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'etime\');}'})"/>
						至<input size="12" type="text" class="Wdate" id="etime" onFocus="WdatePicker({minDate:'#F{$dp.$D(\'stime\');}'})"/>
						&nbsp;&nbsp;状态：<s:select
							list="#{'0':'未处理','1':'处理中','2':'处理完'}"
							name="tpSuggestion.state" id="state" theme="simple"
							headerKey="" headerValue="--"></s:select>
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
