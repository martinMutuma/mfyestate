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

		<title>居住楼盘信息</title>
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
			src="<%=basePath%>pro/goonaddbuilding.js"></script>
		<!-- 2.js -->
		<script type="text/javascript"
			src="../resource/js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="../resource/js/global.js"></script>
		<script type="text/javascript" src="../resource/js/whole.js"></script>
		<link rel="stylesheet" href="../resource/css/whole.css"
			type="text/css"></link>
			<link rel="stylesheet" href="../resource/css/memberCenter/info.css" type="text/css"></link>
			<script type="text/javascript" src="../resource/js/googlemap.js"></script>
	</head>

	<body onload="load()" onunload="GUnload()">
	<jsp:include page="../head.jsp"></jsp:include>
		 <div style="width: 100%; margin-top: 10px;" align="center">
			<table width="100%" class="layoutTab">
				<tr>
					<!-- 1.align -->
					<td width="20%" align="left" valign="top"><jsp:include
							page="../left.jsp?selectItem=8"></jsp:include></td>
					<!-- 5.valign -->
					<td valign="top">
					     <div class="position" align="left" style="width:80%;"><label>您所在的位置：</label><a href="../home.shtml">梦房园</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="../mem/baseinfo_mainPage.shtml">会员中心</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="managerbuid.jsp?menuCls=11">楼盘管理</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="tabuilding.jsp">发布楼盘信息</a></div>
                                 <div class="info_top"></div><div class="info_mid">
					             <table border="0" cellpadding="0" cellspacing="0" width="760px">
					                	<tr>
							             <td valign="top" align="center" >
									<form name="form" method="post"
										action="../building/upload.shtml"
										enctype="multipart/form-data" onsubmit="return checkSave()">

										<table  width="710px;" border="0" cellpadding="1"
											id="buildingrent" cellspacing="1">
											<tr>
												<th align="center" colspan="2">
													<b>发布新房信息 </b>
												</th>
											</tr>
											<tr>
												<th align="left" colspan="2" class="title_info1">
													三、继续填写基本信息（<font color="red">*</font> 为必填项）
												</th>
											</tr>
											<tr>
												<td width="16%">
													<div align="right">
														<font color="red">*</font>生活配套:
													</div>
												</td>
												<td>
													<div align="left">
														<input type="text" maxLength="99" name="tpBulding.lifeSupport"
															id="lifeSupport" />
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
														<input type="text" maxLength="99" name="tpBulding.neighborhoods"
															id="neighborhoods">
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
														<input type="text" maxLength="99" name="tpBulding.traffic" id="traffic">
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
														<input type="text" maxLength="99" id="other" name="tpBulding.other" />
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
															name="tpBulding.positionY">
														&nbsp;&nbsp;&nbsp;&nbsp;
														<input id="wei" readonly="readonly" type="text"
															name="tpBulding.positionX" size="20">
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
												<th align="left" colspan="2" class="title_info1">
													<br />
													四、上传案源图片 <font color="red">说明：单张图片不大于500k,如果大于500k请修改后上传</font>
												</th>
											</tr>
											<tr>
												<td colspan="2">
													<div align="right">

														&nbsp;&nbsp;图片名称:




														<input type="text" name="imgName" id="imgName" />

														<select name="category">
															<option value="1">
																效果图
															</option>
															<option value="2">
																实景图
															</option>
															<option value="3">
																周边配套
															</option>
															<option value="4">
																样板间
															</option>
															<option value="5">
																户型
															</option>
															<option value="6">
																其他
															</option>
														</select>

														<select name="imgType">
															<option value="0">
																一居
															</option>
															<option value="1">
																二居
															</option>
															<option value="2">
																三居
															</option>
														</select>

														<input type="file" name="img" />
														<input type="button" value="继续添加" onclick="addPic()" />
													</div>
													
												</td>
											</tr>
											<tr>
											<td colspan="2" align="center" id="picdiv">
											  
											</td>
											</tr>
											<tr>
												<td colspan="2" align="center">
													<input type="hidden" name="tpBulding.name"
														value="${tpBulding.name}" />
													<input type="submit" value="提交发布">
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
		<script>
		  var map;
          var geocoder = null; 
          var marker;
	</script>
		 <script src="http://maps.google.com/maps?file=api&v=2&key=ABQIAAAAC1djgrWT1Mqz3gM4Ge3XlhSchlZ7_IhAROXTdJ5EzY4J4yl1FBSStZmm__B2dywWaRXMSi8G6C5QLw"  type="text/javascript"></script>
	</body>

</html>