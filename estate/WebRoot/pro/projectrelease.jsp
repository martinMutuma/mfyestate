<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.estate.util.comm.RequestUtil"%>
<%@taglib uri="estateTag" prefix="estateTag" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String menuCls = RequestUtil.getParam(request,"menuCls","");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>发布大型项目信息</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" href="../resource/css/global.css" type="text/css"></link>
		<link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/default/easyui.css"></link>
	    <link rel="stylesheet" href="../resource/css/memberCenter/info.css" type="text/css"></link>
	    <link rel="stylesheet" type="text/css" href="../resource/js/kindeditor/skins/default.css"></link>
	    <link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>
		<script type="text/javascript" src="../resource/js/jquery-1.4.2.js"></script>
		<script type="text/javascript" src="projectrelease.js"></script>
		<script type="text/javascript" src="../resource/js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="../resource/js/global.js"></script>
		<script type="text/javascript" src="../resource/js/kindeditor/kindeditor.js"></script>
	    <script type="text/javascript" src="../resource/js/whole.js"></script>
	    <script type="text/javascript" src="../resource/js/googlemap.js"></script>
	</head>

	<body onunload="GUnload()">
	<jsp:include page="../head.jsp"></jsp:include>
			<div style="width: 100%; margin-top: 10px;" align="center">
			<table width="100%" class="layoutTab">
				<tr>
					<td width="20%" align="center" valign="top"><jsp:include page="../left.jsp"></jsp:include></td>
					<td>
									<form name="form" method="post" enctype="multipart/form-data"
										action="../largePro/addPro.shtml" onsubmit="return checkpro()">
                           <div class="position" align="left" style="width:80%"><label>您所在的位置：</label><a href="../home.shtml">梦房园</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="../mem/baseinfo_mainPage.shtml">会员中心</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="manageshoprent.jsp?menuCls=12">大型项目管理</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="projectrelease.jsp?menuCls=17">发布大型项目信息</a></div>
					                  <div class="info_top"></div><div class="info_mid">
										<table width="710px;" id="projectrelease" border="0" cellpadding="1" cellspacing="1">
											<tr>
												<th align="center" colspan="2">
													<b>发布大型项目信息</b>
												</th>
											</tr>
											<tr>
												<th align="left" colspan="2" class="title_info1" valign="bottom">
													一、填写基本信息（<font color="red">*</font> 为必填项）
												</th>
											</tr>
											<tr>
												<td align="right" width="16%">
														<font color="red">*</font>省/市/区县:
												</td>
												<td>
													<input type="text" style="width:200px"  value="${largePro.disname }" id="districtShow"/>
													<input type="hidden" name="largePro.district" id="district" value="${largePro.district }"/>
													<input type="hidden" name="largePro.disname" id="disname" value="${largePro.disname }"/>
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>地址:
												</td>
												<td>
														<input type="text" name="largePro.address" id="address" size="40">
												</td>
											</tr>
											<tr>
												<td align="right">
														交易方式:
												</td>
												<td>
														<select name="largePro.flag" onchange="selectNeedFlag(this.value)">
															<option value="1" selected="selected">
																求租
															</option>
															<option value="2">
																求购
															</option>
															<option value="3">
																合作
															</option>
														</select>
												</td>
											</tr>
											<tr>
												<td align="right">
														<span id="moneyFlag">租金</span>:
												</td>
												<td>
														<input type="text" size="8" onKeyUp="isNum(this)" maxlength="5"
															id="price" name="largePro.price">
														<span id="payFlag">元/月</span>
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>建筑面积:
												</td>
												<td align="left">
													<input id="area"
														name="largePro.area" maxlength="5" style="width: 60px" onKeyUp="isNum(this)" value="${largePro.area }"  class="easyui-validatebox" required="true" missingMessage="建筑面积必填"/> 平方米
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>使用面积:
												</td>
												<td align="left">
													<input id="areauseful"
														name="largePro.areauseful" maxlength="5" style="width: 60px" onKeyUp="isNum(this)" value="${largePro.areauseful }"  class="easyui-validatebox" required="true" missingMessage="使用面积必填"/> 平方米
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>项目名称:
												</td>
												<td>
														<input type="text" size="40" name="largePro.title" maxlength="20"
															id="title" />
												</td>
											</tr>



											<tr>
												<td align="right">
														案源描述:
												</td>
												<td id="filter_ke" align="left">
														<textarea cols="60" rows="10" name="largePro.content" id="content"></textarea>
												</td>
											</tr>
											<tr>
												<td align="right">
														地图坐标:
												</td>
												<td>
														<input type="text" id="jing" size="20"
															name="largePro.positionY">
														&nbsp;&nbsp;&nbsp;&nbsp;
														<input id="wei" type="text" name="largePro.positionX"
															size="20">
														<font color="red">(在地图上双击鼠标左键标注案源位置 )</font>
												</td>
											</tr>
											<tr>
														 <td align="right">
																根据地区定位:
															</td>
															<td >
																<input id="addressText" name="largePro.addressName" style="width: 290px" type="text"/>
																<input type="button" onclick="goAddress()" value="定位"/>
															</td>
											       </tr>
											<tr>
													<td colspan="2" align="center">
													<div align="right" id="map"
														style="width: 85%; height: 250px"></div>
												</td>
											</tr>
											<tr>
												<th align="left" colspan="2" class="title_info1" valign="bottom">
													二、上传案源图片(<font color="red">说明：单张图片不大于500k,如果大于500k请修改后上传。</font>)
												</th>
											</tr>
											<tr>
												<td align="right">
														1.图片名称:
												</td>
												<td>
														<input type="text" name="largePro.imgName1" id="imgName1" />
														&nbsp; &nbsp; &nbsp;
														<estateTag:select cssStyle="width:80px" value="1" name="largePro.imgType1" id="imgType1" codeType="新房图片类型" />
														&nbsp; &nbsp; &nbsp;
														<input id="img1" type="file" name="imageFile1" />
												</td>
											</tr>
											<tr>
												<td align="right"> 
														2.图片名称:
												</td>
												<td>
														<input type="text" name="largePro.imgName2" id="imgName2" />
														&nbsp; &nbsp; &nbsp;
														<estateTag:select cssStyle="width:80px" value="2" name="largePro.imgType2" id="imgType2" codeType="新房图片类型" />
														&nbsp; &nbsp; &nbsp;
														<input id="img2" type="file" name="imageFile2" />
												</td>
											</tr>
											<tr>
												<td align="right">
														3.图片名称:
												</td>
												<td>
														<input type="text" name="largePro.imgName3" id="imgName3" />
														&nbsp; &nbsp; &nbsp;
														<estateTag:select cssStyle="width:80px" value="3" name="largePro.imgType3" id="imgType3" codeType="新房图片类型" />
														&nbsp; &nbsp; &nbsp;
														<input id="img3" name="imageFile3" type="file" />
												</td>
											</tr>
											<tr>
												<td align="right">
														&nbsp;&nbsp;4.图片名称:
												</td>
												<td>
														<input type="text" name="largePro.imgName4" id="imgName4" />
														&nbsp; &nbsp; &nbsp;
														<estateTag:select cssStyle="width:80px" value="4" name="largePro.imgType4" id="imgType4" codeType="新房图片类型" />
														&nbsp; &nbsp; &nbsp;
														<input id="img4" type="file" name="imageFile4" />
												</td>
											</tr>
											<tr>
												<td align="right">
														5.图片名称:
												</td>
												<td>
													<div align="left">
														<input type="text" name="largePro.imgName5" id="imgName5" />
														&nbsp; &nbsp; &nbsp;
														<estateTag:select cssStyle="width:80px" value="5" name="largePro.imgType5" id="imgType5" codeType="新房图片类型" />
														&nbsp; &nbsp; &nbsp;
														<input id="img5" type="file" name="imageFile5" />
													</div>
												</td>
											</tr>
											<tr>
												<td colspan="2" align="center">
													<input type="hidden" name="largePro.auditingState"
														value="0">
													<input type="submit" value="提交发布">
												</td>
											</tr>
										</table>
										</div>
										<input id="menuCls" type="hidden" value="<%=menuCls %>">
					         <div class="info_bottom">&nbsp;</div>
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
		  <script language="javascript">
 var map;
 var geocoder = null; 
 var marker;
		</script> 	
		 <script src="http://maps.google.com/maps?file=api&v=2key=ABQIAAAAC1djgrWT1Mqz3gM4Ge3XlhSchlZ7_IhAROXTdJ5EzY4J4yl1FBSStZmm__B2dywWaRXMSi8G6C5QLw"  type="text/javascript"></script>
		<script>
			KE.show({
				id : 'content',
				loadStyleMode : false,
				resizeMode : 0,
				allowUpload:true, //允许上传图片 
				imageUploadJson:'<%=basePath%>/comutil/upload.shtml',    
				items : [
				'fontname', 'fontsize', '|', 'textcolor', 'bgcolor', 'bold', 'italic', 'underline',
				'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
				'insertunorderedlist', '|','image']
			});
		</script>							
	</body>
	
	
</html>

