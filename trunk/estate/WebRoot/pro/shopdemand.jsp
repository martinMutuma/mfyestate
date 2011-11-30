<%@ page language="java" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
	<%@taglib uri="estateTag" prefix="estateTag" %>
	<%@page import="com.estate.util.comm.RequestUtil"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String menuCls = RequestUtil.getParam(request,"menuCls","");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>发布商铺需求</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" href="../resource/css/global.css" type="text/css"></link>
	    <link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/default/easyui.css"></link>
	    <link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>
	    <link rel="stylesheet" href="../resource/css/memberCenter/info.css" type="text/css"></link>
	    <link rel="stylesheet" type="text/css" href="../resource/js/kindeditor/skins/default.css"></link>
		<script type="text/javascript" src="../resource/js/jquery-1.4.2.js"></script>
		<script type="text/javascript" src="../resource/js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="../resource/js/global.js"></script>
		<script type="text/javascript" src="../resource/js/kindeditor/kindeditor.js"></script>
	    <script type="text/javascript" src="../resource/js/whole.js"></script>
		<script type="text/javascript" src="shopdemand.js"></script>
	</head>

	<body>
	 <jsp:include page="../head.jsp"></jsp:include>
			<div style="width: 100%;margin-top: 10px;" align="center">
			<table width="100%" class="layoutTab">
				<tr>
					<td width="20%" align="left" valign="top"><jsp:include page="../left.jsp"></jsp:include></td>
					<td valign="top">
									<form name="form" method="post"
										action="../officeneed/addNeed.shtml"
										onsubmit="return checkneed()">
										<div class="position" align="left"><label>您所在的位置：</label><a href="../home.shtml">梦房园</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="../mem/baseinfo_mainPage.shtml">会员中心</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="manageshopdemand.jsp?menuCls=12">商铺需求管理</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="shopdemand.jsp?menuCls=14">发布需求</a></div>
								<div class="info_top"></div>
								<div class="info_mid">
										<table width="710px;" border="0" id="shopdemand" cellpadding="1" cellspacing="1">
											<tr>
												<th align="center" colspan="2">
													<b>发布商铺需求信息</b>
												</th>
											</tr>
											<tr>
												<th align="left" colspan="2" class="title_info1" valign="bottom">
													填写基本信息（<font color="red">*</font> 为必填项）
												</th>
											</tr>
											<tr>
												<td width="20%" align="right">
														<font color="red">*</font>需求类型:
												</td>
												<td>
													<select name="need.flag" onchange="selectNeedFlag(this.value)">
														<option value="1" ${need.flag eq 1?'selected' :''}>
															求租
														</option>
														<option ${need.flag eq 2?'selected' :''} value="2">
															求购
														</option>
													</select>
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>标题:
												</td>
												<td>
														<input type="text" name="need.title" id="title" size="40" maxlength="50"
															value="${need.title}">
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>区属板块:
												</td>
												<td>
													<input type="text" style="width:200px"  value="${need.disname }" id="districtShow"/>
													<input type="hidden" name="need.district" id="district" value="${need.district }"/>
													<input type="hidden" name="need.disname" id="disname" value="${need.disname }"/>
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>房源座落:
												</td>
												<td>
														<input type="text" name="need.address"
															value="${need.address}" id="address" size="35" />
														&nbsp;临近&nbsp;
														<input name="need.nearAddress" id="nearAddress" value="${need.nearAddress}"
															type="text" size="35" />
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>建筑年代:
												</td>
												<td align="left">
														<input name="need.consYearStart" value="${need.consYearStart}" id="consYearStart" type="text"
															size="8" onKeyUp="isNum(this)" maxlength="4">
															&nbsp;-&nbsp;
															<input name="need.consYearEnd" value="${need.consYearEnd}" id="consYearEnd" type="text"
															size="8" onKeyUp="isNum(this)" maxlength="4">年
												</td>
											</tr>
											<tr>
												<td align="right">
													<font color="red">*</font>	面积:
												</td>
												<td>
														<input type="text" size="8" name="need.minArea"
															id="minArea" onKeyUp="isNum(this)" maxlength="5"/>
														&nbsp;-&nbsp;
														<input type="text" id="maxArea" name="need.maxArea"
															onKeyUp="isNum(this)" size="8"  maxlength="5"/>
														㎡
												</td>
											</tr>
											<tr>
												<td align="right">
													<font color="red">*</font>	<span id="moneyFlag">租金</span>:
												</td>
												<td>
														<input type="text" size="8" name="need.minPrice"
															id="minPrice" maxlength="5" onKeyUp="isNum(this)" />
														&nbsp;-&nbsp;
														<input type="text" name="need.maxPrice" id="maxPrice"
															onKeyUp="isNum(this)" size="8" maxlength="5" /><span id="payFlag">元/月</span>
															<span id="renttype">&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">*</font>租赁方式:</span>
													    <estateTag:select cssStyle="width:120px" id="rentType" value="1" name="need.rentType" codeType="租赁方式"  />
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>联系人:
												</td>
												<td>
														<input type="text" name="need.userName" id="userName" size="22"
															value="${need.userName}">
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>联系电话:
												</td>
												<td>
														<input type="text" name="need.phone" id="phone" size="22"
															value="${need.phone}">
												</td>
											</tr>
											<tr>
												<td align="right">
														需求描述：
												</td>
												<td id="filter_ke" align="left">
														<textarea cols="60" rows="10" name="need.descr" id="content">
									                      ${need.descr}
									                  	</textarea>
												</td>
											</tr>
											<tr>
												<td colspan="2" align="center">
													<input type="hidden" name="need.needType" value="2">
													<!-- 商铺需求 -->
													<input type="hidden" name="need.id" value="${need.id}">
													<input type="hidden" name="need.auditing" value="0">
													<!-- 审核状态 未审核 -->
													<input type="submit" value="提交审核">
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
