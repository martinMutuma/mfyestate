<%@ page language="java" pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
           
		<title>修改居住楼盘信息</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
    
         <script>
           var basePath="<%=basePath%>";
         </script>
		<link rel="stylesheet" href="../resource/css/global.css"
			type="text/css"></link>
		<!-- 1.css -->
		<link rel="stylesheet" type="text/css"
			href="../resource/css/jqueryui/default/easyui.css"></link>
		<script type="text/javascript" src="../resource/js/jquery-1.4.2.js"></script>
		<script type="text/javascript"
			src="../resource/js/jquery.dataGridTip.js"></script>
			<script type="text/javascript" src="../resource/js/googlemap.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>pro/modifygoonaddbuilding.js"></script>
		<!-- 2.js -->
		<script type="text/javascript"
			src="../resource/js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="../resource/js/global.js"></script>
		<link rel="stylesheet" type="text/css"
			href="../resource/js/kindeditor/skins/default.css"></link>
		<script type="text/javascript" src="../resource/js/whole.js"></script>
		<link rel="stylesheet" href="../resource/css/whole.css"
			type="text/css"></link>
			<link rel="stylesheet" href="../resource/css/memberCenter/info.css" type="text/css"></link> 
				
	</head>

	<body  onunload="GUnload()">
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
										enctype="multipart/form-data" >

										<table width="710px" border="0" cellpadding="1"
											id="buildingrent" cellspacing="1">
											<tr>
												<th align="center" colspan="2">
													<b>修改楼盘信息 </b>
												</th>
											</tr>
											<tr>
												<th align="left" colspan="2" class="title_info1">
													四、继续填写基本信息（<font color="red">*</font> 为必填项）
												</th>
											</tr>
											<tr>
												<td>
													<div align="right">
														<font color="red">*</font>生活配套:
													</div>
												</td>
												<td>
													<div align="left">
														<input type="text" class="easyui-validatebox" required="true" missingMessage="生活配套必填" name="tpBulding.lifeSupport"
															id="lifeSupport" maxLength="99" value="${tpBulding.lifeSupport}"/>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div align="right">
														<font color="red">*</font>小区配套:
													</div>
												</td>
												<td>
													<div align="left">
														<input type="text" name="tpBulding.neighborhoods"
															id="neighborhoods" maxLength="99" class="easyui-validatebox" required="true" missingMessage="小区配套必填" value="${tpBulding.neighborhoods}">
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div align="right">
														<font color="red">*</font>交通状况:
													</div>
												</td>
												<td>
													<div align="left">
														<input type="text"  maxLength="99" class="easyui-validatebox" required="true" missingMessage="交通状况必填" value="${tpBulding.traffic}" name="tpBulding.traffic" id="traffic">
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div align="right">
														其他:
													</div>
												</td>
												<td>
													<div align="left">
														<input type="text" name="tpBulding.other"  maxLength="99" id="other" value="${tpBulding.other}" />
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div align="right">
														地图坐标:
													</div>
												</td>
												<td>
													<div align="left">
														<input type="text" id="jing" size="20" readonly="readonly"
															name="tpBulding.positionY" value="${tpBulding.positionY}">
														&nbsp;&nbsp;&nbsp;&nbsp;
														<input id="wei" readonly="readonly" type="text"
															name="tpBulding.positionX" size="20" value="${tpBulding.positionX}">
														<font color="red">(在地图上双击鼠标左键标注案源位置 )</font>
													</div>
												</td>
											</tr>
                                             <tr>
														 <td align="right">
																根据地区定位:
															</td>
															<td >
																<input id="addressText" name="tpBulding.addressName" style="width: 290px" type="text"/>
																<input type="button" onclick="goAddress()" value="定位"/>
															</td>
											       </tr>
											<tr>

												<td colspan="2">
													<div align="left" id="map"
														style="width: 100%; height: 250px"></div>
												</td>
										</tr>
											
											<tr>
												<td colspan="2" align="center">
													<input type="hidden" name="tpBulding.name"
														value="${tpBulding.name}" />
													<input type="button" onclick='subForm(1,${tpBulding.id})' value="保存">  <a onclick="subForm(2,${tpBulding.id})" ><font color="red">---&gt;&gt;修改图片信息</font></a>
													
												
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
		  var map;
          var geocoder = null; 
          var marker;
	</script>
		 <script src="http://maps.google.com/maps?file=api&v=2&key=ABQIAAAAC1djgrWT1Mqz3gM4Ge3XlhSchlZ7_IhAROXTdJ5EzY4J4yl1FBSStZmm__B2dywWaRXMSi8G6C5QLw"  type="text/javascript"></script>
</html>