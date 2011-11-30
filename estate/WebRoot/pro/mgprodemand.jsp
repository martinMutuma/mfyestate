<%@ page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@page import="com.estate.util.comm.RequestUtil"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String menuCls = RequestUtil.getParam(request,"menuCls","");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>发布项目需求</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" href="../resource/css/global.css" type="text/css"></link>
		<link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/default/easyui.css"></link>
		<script type="text/javascript" src="../resource/js/jquery-1.4.2.js"></script>
		<script type="text/javascript" src="../resource/js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="mgprodemand.js"></script>
		<script type="text/javascript" src="../resource/js/global.js"></script>
	     <script type="text/javascript"  src="mgprodemand.js"></script>
	     <script type="text/javascript" src="../resource/js/kindeditor/kindeditor.js"></script>
	    <link rel="stylesheet" type="text/css" href="../resource/js/kindeditor/skins/default.css"></link>
	      <script type="text/javascript" src="../resource/js/whole.js"></script>
	    <link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>
	     <link rel="stylesheet" href="../resource/css/memberCenter/info.css" type="text/css"></link>
	</head>

	<body>
	<jsp:include page="../head.jsp"></jsp:include>
		<div style="width: 100%;margin-top: 10px;" align="center">
			<table width="100%" class="layoutTab">
				<tr>
					<td width="20%" align="left" valign="top"><jsp:include page="../left.jsp?selectItem=5"></jsp:include></td>
					<td valign="top">
									<form name="form" method="post"
										action="../largePro/addPro.shtml"
										onsubmit="return  checkneed()">
										<div class="position" align="left"><label>您所在的位置：</label><a href="../home.shtml">梦房园</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="../mem/baseinfo_mainPage.shtml">会员中心</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="manageprodemand.jsp?menuCls=15">大型项目需求管理</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="mgprodemand.jsp?menuCls=17">发布大项目需求信息</a></div>
										<div class="info_top"></div>
					                          <div class="info_mid">
										<table width="710px;" border="0" id="mgprodemand" cellpadding="1" cellspacing="1">
											<tr>
												<th align="center" colspan="2">
													<b>发布大项目需求信息</b>
												</th>
											</tr>
											<tr>
												<th align="left" colspan="2" class="title_info1" valign="bottom">
													填写基本信息（<font color="red">*</font> 为必填项）
												</th>
											</tr>
											<tr>
												<td align="right" width="20%">
														<font color="red">*</font>交易方式:
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
														地址:
												</td>
												<td>
														<input type="text" size="30" id="address" name="largePro.address" />
														临近
														<input name="largePro.nearAddress" id="nearAddress" type="text" size="30" />
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>建筑面积:
												</td>
												<td align="left">
													<input id="area"
														name="largePro.area" maxlength="8" style="width: 60px" onKeyUp="isNum(this)" value="${largePro.area }"  class="easyui-validatebox" required="true" missingMessage="建筑面积必填"/> 元/㎡·月
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>使用面积:
												</td>
												<td align="left">
													<input id="areauseful"
														name="largePro.areauseful" maxlength="8" style="width: 60px" onKeyUp="isNum(this)" value="${largePro.areauseful }"  class="easyui-validatebox" required="true" missingMessage="使用面积必填"/> 元/㎡·月
												</td>
											</tr>
											<tr>
												<td align="right">
													<font color="red">*</font>	<span id="moneyFlag">租金</span>:
												</td>
												<td>
														<input type="text" name="largePro.minPrice" id="minPrice"
															onKeyUp="isNum(this)" size="10" />
														-
														<input name="largePro.maxPrice" id="maxPrice"
															onKeyUp="isNum(this)" type="text" size="10" />
														<span id="payFlag">元/月</span>
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>需求标题:
												</td>
												<td>
														<input type="text" name="largePro.title" id="title" size="40">
												</td>
											</tr>
											<tr>
												<td align="right">
														需求描述:
												</td>
												<td id="filter_ke" align="left">
														<textarea cols="60" rows="20" name="largePro.descr" id="content"></textarea>
												</td>
											</tr>

											<tr>
												<td colspan="2" align="center">
													<input type="hidden" name="largePro.needType" value="4">
													<!-- 大型项目 -->
													<input type="hidden" name="largePro.auditing" value="0">
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
