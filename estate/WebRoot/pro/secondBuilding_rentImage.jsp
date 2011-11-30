<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>住宅</title>
		<!-- jquery -->
		<script type="text/javascript" src="../resource/js/jquery-1.4.2.js"></script>
		<!-- 载入 head.jsp 需要的css及js-->
		<link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>
		<script type="text/javascript" src="../resource/js/whole.js"></script>
		<!-- left.jsp 需要的css及js -->
		<link rel="stylesheet" href="../resource/css/global.css" type="text/css"></link>
		<script type="text/javascript" src="../resource/js/global.js"></script>
		<!-- easyui -->
		<link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/default/easyui.css"></link>
		<link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/icon.css"></link>
	    <script type="text/javascript" src="../resource/js/jquery.easyui.min.js"></script>
	    <script type="text/javascript" src="../resource/js/easyui-lang-zh_CN.js"></script>
		<!-- richer editor -->
		<script type="text/javascript" src="../resource/js/kindeditor/kindeditor.js"></script>
		<link rel="stylesheet" type="text/css" href="../resource/js/kindeditor/skins/default.css"></link>
		
		<link rel="stylesheet" href="../resource/css/memberCenter/info.css" type="text/css"></link>
		<script type="text/javascript" src="../pro/secondBuilding_rentImage.js"></script>
	</head>

	<body>
		<jsp:include page="../head.jsp"></jsp:include>
		<div style="width: 100%;margin-top: 10px;" align="center">
		<form name="imgForm" action="../secondBd/saveImgs.shtml" method="post" enctype="multipart/form-data">
		<table width="100%" class="layoutTab" border="0">
			<tr>
				<td width="20%" align="left" valign="top">
					<jsp:include page="../left.jsp"></jsp:include>
				</td>
				<td valign="top">
					<div class="position" align="left"><label>您所在的位置：</label><a href="../home.shtml">梦房园</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="../mem/baseinfo_mainPage.shtml">会员中心</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="../pro/secondBuliding_manage.jsp?menuCls=12">住宅管理</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="secondBuilding_info.jsp">住宅发布</a></div>
					<div class="info_top"></div><div class="info_mid" align="center">
					<table width="680px" cellspacing="0" cellpadding="0" border="0">
						<tr>
							<td class="underLine title td_padding" height="30px">住宅图片管理:</td>
						</tr>
						<tr>
							<td class="td_padding" height="50px" valign="middle">
								<a href="javascript:addImg();" id="addImg"></a>
							</td>
						</tr>
						<tr>
							<td class="title1 td_padding" height="28px" valign="middle">
								<table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td align="left"><span>已上传图片:</span></td>
								<td align="right"><span id="saveBtnSpan" style="float: right;display: none"><a href="javascript:saveImg();" id="saveBtn"></a></span></td></tr>
								</table>
							</td>
						</tr>
						<tr>
							<td class="td_padding topLine">
								<div id="uploadFileReview" class="">
									<font color="red">您还没有上传图片,请点击添加图片进行添加!</font>
								</div>
								
									<input type="hidden" name="tpsId" value="${tpsId }"/>
								<div id="fileArea" style="display: none;margin-top: 10px;">
										
  								</div>
								<br/>
							</td>
						</tr>
						<tr>
							<td class="title1 td_padding topLine" height="28px">&nbsp;住宅图片:</td>
						</tr>
						<tr>
							<td class="td_padding">
								<c:choose>
									<c:when test="${imgList eq null || f:length(imgList) eq 0}">
										<font color="red">该住宅房源暂时没有图片,请添加!</font>
									</c:when>
									<c:otherwise>
										<c:forEach items="${imgList}" var="img" varStatus="status">
											<div class='imgDiv<c:if test="${status.index > 2}"> imgDiv_top</c:if><c:if test="${status.index % 3 != 0}"> imgDiv_split</c:if>'>
												<img src='../<c:out value="${img.imgUrl}"/>'/>
												<div><c:out value="${img.imgRealName}"/>【<a href='javascript:deleteImg(${tpsId },<c:out value="${img.id}"/>)'>删除</a>】</div>
											</div>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</table>
					</div>
					<div class="info_bottom">&nbsp;</div>
				</td>
			</tr>
		</table>
		</form>
		</div>
		<div style="margin-top: 10px;">
			<center>
				<jsp:include page="../copyright.jsp" />
			</center>
		</div>
		<div id="uploadFilePanel" align="center">
	  		<div id="filecontainer"></div>
  		</div>
	</body>
</html>
