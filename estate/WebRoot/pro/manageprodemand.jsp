<%@ page language="java" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>管理项目需求</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" href="../resource/css/global.css"
			type="text/css"></link>
		<link rel="stylesheet" type="text/css"
			href="../resource/css/jqueryui/default/easyui.css">
		<link rel="stylesheet" type="text/css"
			href="../resource/css/jqueryui/icon.css">
		<script type="text/javascript" src="../resource/js/jquery-1.4.2.js"></script>
		<script type="text/javascript"
			src="../resource/js/jquery.easyui.min.js"></script>
			<script type="text/javascript" src="../resource/js/global.js"></script>
		<script type="text/javascript" src="manageprodemand.js"></script>
		 <script type="text/javascript"	src="../resource/js/easyui-lang-zh_CN.js"></script>
		   <script type="text/javascript" src="../resource/js/whole.js"></script>
	    <link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>

	</head>

	<body>
	<jsp:include page="../head.jsp"></jsp:include>
	<div style="width: 100%; margin-top: 10px;" align="center">
			<table width="100%" class="layoutTab">
				<tr>
					<td width="20%" align="left" valign="top"><jsp:include page="../left.jsp?selectItem=5"></jsp:include></td>
					<td valign="top">
									<form name="form" method="post">
										<table width="100%" border="0" cellpadding="1" cellspacing="1">
											<tr>
												<td>
												<div class="searchhead"></div>
													<div class="searchcenter h25">
														<div align="left" style="width:735px;float: left">														<div class="searchline">
														<img src="../resource/images/searchline.gif" align="middle"/>
														租售:
														<select id="flag" name="flag">
															<option value="0">
																全部
															</option>
															<option value="1">
																求租
															</option>
															<option value="2">
																求购
															</option>
														</select>
														<img src="../resource/images/searchline.gif" align="middle"/>
														案源状态:
														<select id="auditing" name="auditing">
															<option value="-1">
																全部
															</option>
															<option value="0">
																未审核
															</option>
															<option value="1">
																已审核
															</option>
															<option value="3">
																审核驳回
															</option>
														</select>
														<img src="../resource/images/searchline.gif" align="middle"/>
														<a id="searchid" href="javascript:onSearch()">查询</a>
														</div>
														</div>
													 <div style="clear:both;"></div>
													</div>
													 <div  class="searchfloot" ></div>
												</td>
											</tr>
											<tr>
												<td>
													<table id="grid"></table>
												</td>
											</tr>
										</table>
									</form>
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
