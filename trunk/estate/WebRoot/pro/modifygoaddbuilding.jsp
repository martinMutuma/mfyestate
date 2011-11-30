<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=utf-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>修改居住楼盘</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" href="../resource/css/global.css"
			type="text/css"></link>
		<!-- 1.css -->
		<link rel="stylesheet" type="text/css"
			href="../resource/css/jqueryui/default/easyui.css"></link>
		<script type="text/javascript" src="../resource/js/jquery-1.4.2.js"></script>
		<script type="text/javascript"
			src="../resource/js/jquery.dataGridTip.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>/pro/modifygoaddbuilding.js"></script>
		<!-- 2.js -->
		<script type="text/javascript"
			src="../resource/js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="../resource/js/global.js"></script>
		<script type="text/javascript"
			src="../resource/js/kindeditor/kindeditor.js"></script>
		<link rel="stylesheet" type="text/css"
			href="../resource/js/kindeditor/skins/default.css"></link>
		<script type="text/javascript" src="../resource/js/whole.js"></script>
		<link rel="stylesheet" href="../resource/css/whole.css"
			type="text/css"></link>
			<link rel="stylesheet" href="../resource/css/memberCenter/info.css" type="text/css"></link> 
	</head>

	<body>
		 <jsp:include page="../head.jsp"></jsp:include>
      <div style="width: 100%;margin-top: 10px;" align="center">
			<table width="100%" class="layoutTab">
				<tr>
					<!-- 1.align -->
					<td width="20%" align="left" valign="top"><jsp:include
							page="../left.jsp?selectItem=8"></jsp:include></td>
					<!-- 5.valign -->
					<td valign="top">
					   <div class="position" align="left"><label>您所在的位置：</label><a href="../home.shtml">梦房园</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="../mem/baseinfo_mainPage.shtml">会员中心</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="../pro/managerbuid.jsp?menuCls=11">楼盘管理</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;修改楼盘信息</div>
					<div class="info_top"></div>
					<div class="info_mid">
					      <table border="0" cellpadding="0" cellspacing="0" width="760px">
					                	<tr>
							             <td valign="top" align="center" >
									<form name="form" method="post"
										action="../building/modifyBuiding.shtml"
										onsubmit="return checkSave()">

										<table width="710px" border="0" cellpadding="1"
											id="buildingrent" cellspacing="1">
											<tr>
												<th align="center" colspan="2">
													<b>修改楼盘信息 </b>
												</th>
											</tr>
											<tr>
												<th align="left" colspan="2" class="title_info1">
													三、继续填写基本信息（<font color="red">*</font> 为必填项）
												</th>
											</tr>
											<tr>
												<td align="right" width="16%">
														<font color="red">*</font>开发商:
												</td>
												<td align="left">
														<input type="text" maxLength="23" name="tpBulding.businessDevelopment"
														  value="${tpBulding.businessDevelopment}"	id="businessDevelopment" />
												</td>
											</tr>
											<tr>
												<td align="right">
														投资商:
												</td>
												<td align="left">
														<input type="text" maxLength="23" name="tpBulding.investors"
															id="investors" value="${tpBulding.investors}">
												</td>
											</tr>
											<tr>
												<td align="right">
														预售许可证:
												</td>
												<td align="left">
														<input type="text" maxLength="13" id=preLicense name="tpBulding.preLicense" value="${tpBulding.preLicense}">
												</td>
											</tr>

											<tr>
												<td align="right">
														项目介绍：
												</td>
												<td align="left" id="filter_ke">
														<textarea cols="60" rows="20" id="projectIns"
															name="tpBulding.projectIns">${tpBulding.projectIns}</textarea>
												</td>
											</tr>
											<tr>
												<td align="right" >
														最新动态：
												</td>
												<td align="left" id="filter_ke1">
														<textarea cols="60" rows="20" id="trends"
															name="tpBulding.trends">${tpBulding.trends}</textarea>
												</td>
											</tr>
											<tr>
											<tr>
												<td colspan="2">
													<div align="center">
														<input type="hidden" name="id"
															value="${tpBulding.id}" />
														<input type="hidden" name="type" value="2" />
														<input type="submit" value="保存并继续填写" />
													</div>
												</td>

													</tr>
										</table>
									</form>
								</td>
						</tr>
					</table>
							</div>
			<div class="info_bottom">&nbsp;</div>

									
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
	<script>
			KE.show({
				id : 'projectIns',
				loadStyleMode : false,
				resizeMode : 0,
				items : [
				'fontname', 'fontsize', '|', 'textcolor', 'bgcolor', 'bold', 'italic', 'underline',
				'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
				'insertunorderedlist']
			});
			KE.show({
				id : 'trends',
				loadStyleMode : false,
				resizeMode : 0, 
				items : [
				'fontname', 'fontsize', '|', 'textcolor', 'bgcolor', 'bold', 'italic', 'underline',
				'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
				'insertunorderedlist']
			});
		</script>
</html>