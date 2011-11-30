<%@ page language="java" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>管理住宅出租信息</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!-- easyui css -->
		<link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/icon.css">
		<!-- left menu css -->
		<link rel="stylesheet" href="../resource/css/global.css" type="text/css"></link>
		<!-- jquery base js -->
		<script type="text/javascript" src="../resource/js/jquery-1.4.2.js"></script>
		<!-- easyui base js -->
		<script type="text/javascript" src="../resource/js/jquery.easyui.min.js"></script>
		<!-- easyui lanaguage js -->
		<script type="text/javascript" src="../resource/js/easyui-lang-zh_CN.js"></script>
		<!-- head.jsp need css and js -->
	    <link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>
		<script type="text/javascript" src="../resource/js/whole.js"></script>
		<script type="text/javascript" src="../pro/secondBuliding_rentManage.js"></script>
	</head>

	<body>
		<jsp:include page="../head.jsp"></jsp:include>
		<div style="width: 100%; margin-top: 10px; " align="center">
			<table width="100%" class="layoutTab" >
				<tr>
					<td width="20%" align="left" valign="top"><jsp:include page="../left.jsp?selectItem=8"></jsp:include></td>
					<td valign="top">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td valign="top" align="left">
									<form name="form" method="post">
										<table width="100%" border="0" cellpadding="1" cellspacing="1">
											<tr>
												<td>
													<div class="searchhead"></div>
													<div class="searchcenter h25">
														<div align="left" style="width:735px;float: left">														<div class="searchline">
															住宅名称：
															<input type="text" name="name" id="name" size="16" />
															<img src="../resource/images/searchline.gif" align="middle"/>														
															<a id="searchid" href="javascript:onSearch()">查询</a>
														</div>
														</div>
														<div style="clear: both;"></div>
													</div>
													<div class="searchfloot"></div>
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
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
		<div style="margin-top: 10px;">
			<center>
				<jsp:include page="../copyright.jsp" />
			</center>
		</div>
	</body>
</html>
