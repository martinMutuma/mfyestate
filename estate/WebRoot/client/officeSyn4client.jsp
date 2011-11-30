<%@ page language="java" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%@page import="com.estate.util.comm.RequestUtil"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String menuCls = RequestUtil.getParam(request,"menuCls","");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>管理出租</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css"
			href="<%=basePath %>resource/css/jqueryui/default/easyui.css">
		<link rel="stylesheet" type="text/css"
			href="<%=basePath %>resource/css/jqueryui/icon.css">
		<link rel="stylesheet" href="<%=basePath %>resource/css/global.css"
			type="text/css"></link>
		<link rel="stylesheet" href="<%=basePath %>resource/css/whole.css"
			type="text/css"></link>
		<script type="text/javascript" src="<%=basePath %>resource/js/jquery-1.4.2.js"></script>
		<script type="text/javascript"
			src="<%=basePath %>resource/js/jquery.easyui.min.js"></script>
		<script type="text/javascript"
			src="<%=basePath %>resource/js/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript" src="<%=basePath %>client/officeSyn4client.js"></script>
		<script type="text/javascript" src="<%=basePath %>resource/js/whole.js"></script>
		<style type="text/css">
<!--
td {
	font-size: 10pt;
	color: #000000;
}
#win table td,#win table th{
	border-bottom: 1px dotted #CCCCCC;
	border-right: 1px dotted #CCCCCC;
}
#win table img {
	cursor: pointer;
}
-->
</style>

	</head>

	<body>
		<div style="width: 100%; height: 100%;" align="center">
			<table width="100%" class="layoutTab">
				<tr>
					<td valign="top">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td valign="top" align="left">
									<form name="form" method="post">
										<table width="100%" border="0" cellpadding="1" cellspacing="1">
											<tr>
												<td>
													<div align="left">
														地区：
														<select id="discode" name="discode" style="width: 150px;"></select>
														&nbsp;&nbsp;
														<select name="area1" id="area1">
															<option value="-1">
																-
															</option>
															<option value="50">
																50
															</option>
															<option value="100">
																100
															</option>
															<option value="200">
																200
															</option>
															<option value="300">
																300
															</option>
															<option value="500">
																500
															</option>
															<option value="800">
																800
															</option>
															<option value="1000">
																1000
															</option>
														</select>
														&nbsp;&nbsp;至&nbsp;&nbsp;
														<select name="area2" id="area2">
															<option value="-1">
																-
															</option>
															<option value="50">
																50
															</option>
															<option value="100">
																100
															</option>
															<option value="200">
																200
															</option>
															<option value="300">
																300
															</option>
															<option value="500">
																500
															</option>
															<option value="800">
																800
															</option>
															<option value="1000">
																1000
															</option>
														</select>
														&nbsp;&nbsp;平米 &nbsp;&nbsp;
														<select name="price1" id="price1">
															<option value="-1">
																-
															</option>
															<option value="1">
																1
															</option>
															<option value="2">
																2
															</option>
															<option value="3">
																3
															</option>
															<option value="4">
																4
															</option>
															<option value="5">
																5
															</option>
															<option value="6">
																6
															</option>
															<option value="7">
																7
															</option>
															<option value="8">
																8
															</option>
															<option value="9">
																9
															</option>
															<option value="10">
																10
															</option>
															<option value="12">
																12
															</option>
															<option value="15">
																15
															</option>
															<option value="20">
																20
															</option>
														</select>
														&nbsp;&nbsp;至
														<select name="price2" id="price2">
															<option value="-1">
																-
															</option>
															<option value="1">
																1
															</option>
															<option value="2">
																2
															</option>
															<option value="3">
																3
															</option>
															<option value="4">
																4
															</option>
															<option value="5">
																5
															</option>
															<option value="6">
																6
															</option>
															<option value="7">
																7
															</option>
															<option value="8">
																8
															</option>
															<option value="9">
																9
															</option>
															<option value="10">
																10
															</option>
															<option value="12">
																12
															</option>
															<option value="15">
																15
															</option>
															<option value="20">
																20
															</option>
														</select>
														&nbsp;&nbsp;元/平米.天
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<br />
													<div align="left" style="float: left">
														案源或物业名称：&nbsp;
														<input type="text" name="name" id="name" size="16" />
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;案源状态：
														<select name="auditingState" id="auditingState">
															<option value="-1">
																全部
															</option>
															<option value="0">
																未审核
															</option>
															<option value="1">
																已审核
															</option>
															<option value="4">
																申请成交
															</option>
															<option value="3">
																审核驳回
															</option>
															<option value="5">
																成交通过
															</option>
															<option value="7">
																成交驳回
															</option>
														</select>
													</div>
													<div style="float: left; margin-left: 10px;">
														<a id="searchid" href="javascript:onSearch()">查询</a>
													</div>
												</td>
											</tr>
											<tr>
												<td valign="top" id="gridArea">
													<table id="rentgrid">
													</table>
												</td>
											</tr>
										</table>
										<br>

									</form>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<input name="menuCls" type="hidden" id="menuCls" value="<%=menuCls %>"/>
			<div id="win" title="My Window" >
			   <table width="100%">
			   <tr>
			   	<th height="30px" width="25%" align="center">网站</th><th width="20%" align="center">登陆状态</th><th width="15%" align="center">共享</th><th align="center">说明</th>
			   </tr>
			   	<tr>
			   		<td align="center"><img title="www.house365.com" width="100%" src="<%=basePath %>resource/images/integration/esf_logo.gif"/></td>
			   		<td align="center"><img id="imgLogin365" title="登陆365" src="<%=basePath %>resource/images/integration/login_03.gif" onclick="login('365')"/></td>
			   		<td align="center"><a href="#" id="integration_365">数据共享</a></td>
			   		<td align="left" valign="top">365数据同步。</td>
			   	</tr>
			   </table>
			</div>
			<div id="365login" title="登陆365" >
    			<table width="100%" height="100%">
    				<tr>
    					<td>用户名：</td><td><input id="uname_365" type="text" value=""/></td>
    				</tr> 
    				<tr>
    					<td>密码：</td><td><input id="password_365" type="text" value=""/></td>
    				</tr> 
    			</table>
			</div>
		</div>
	</body>
</html>
