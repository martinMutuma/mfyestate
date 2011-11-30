<%@ page language="java" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>管理团购/特价房信息</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!-- easyui css -->
		<link rel="stylesheet" type="text/css" href="../css/jqueryui/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="../css/jqueryui/icon.css">
		<link rel="stylesheet" type="text/css" href="../resource/tabPlugin.css">
		<!-- jquery base js -->
		<script type="text/javascript" src="../scripts/jquery-1.4.2.js"></script>
		<!-- easyui base js -->
		<script type="text/javascript" src="../scripts/jquery.easyui.min.js"></script>
		<!-- easyui lanaguage js -->
		<script type="text/javascript" src="../scripts/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript" src="../scripts/tabPlugin.js"></script>
		<script type="text/javascript" src="../buliding/tejia_manage.js"></script>
		<style type="text/css">
		html,body,span,div,td,th,select,input{font-family: 宋体, Arial, Helvetica, sans-serif;font-size: 13px;color:black;}
		.fun a:link {color: black;text-decoration: none;}     /* unvisited link */
		.fun a:visited {color: black;text-decoration: none;}  /* visited link */
		.fun a:hover {color: #FFA028;text-decoration: underline;}   /* mouse over link */
		.fun a:active {color: #FFA028;text-decoration: none;}   /* selected link */
		</style>
	</head>

	<body>
			<form name="form" method="post">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td height="35px;">
							<div align="left" style="float: left">
								团购简述：&nbsp;
								<input type="text" name="name" id="name" size="32" />
							</div>
							<div  style="float: left;margin-left: 10px;">
								<a id="searchid" href="javascript:onSearch()">查询</a>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top">
							<table id="rentgrid">
							</table>
						</td>
					</tr>
				</table>
			</form>
	</body>
</html>
