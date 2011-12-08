<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page import="com.estate.util.comm.RequestUtil"%>
<%@taglib uri="estateTag" prefix="estateTag" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String menuCls = RequestUtil.getParam(request,"menuCls","");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>写字楼${office.flagString}</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" href="<%=basePath %>resource/css/global.css" type="text/css"></link>
		<!-- 1.css -->
		<link rel="stylesheet" type="text/css" href="<%=basePath %>resource/css/jqueryui/default/easyui.css"></link>
		<script type="text/javascript" src="<%=basePath %>resource/js/jquery-1.4.2.js"></script>
	    <script type="text/javascript" src="<%=basePath %>resource/js/jquery.dataGridTip.js"></script>
	    <script type="text/javascript" src="../scripts/pro/modifyOffice.js"></script>
	    <!-- 2.js -->
	    <script type="text/javascript" src="<%=basePath %>resource/js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="<%=basePath %>resource/js/global.js"></script>
		<script type="text/javascript" src="<%=basePath %>resource/js/kindeditor/kindeditor.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>resource/js/kindeditor/skins/default.css"></link>
		  <script type="text/javascript" src="<%=basePath %>resource/js/whole.js"></script>
	    <link rel="stylesheet" href="<%=basePath %>resource/css/whole.css" type="text/css"></link>
	    <link rel="stylesheet" href="<%=basePath %>resource/css/memberCenter/info.css" type="text/css"></link>
	</head>

	<body>
	 <jsp:include page="../../head.jsp"></jsp:include>
	      <div style="width: 100%;margin-top: 10px;" align="center">
		<table width="100%" class="layoutTab">
			<tr>
				<!-- 1.align -->
				<td width="20%" align="left" valign="top"><jsp:include page="../../left.jsp"></jsp:include></td>
				<!-- 5.valign -->
				<td valign="top">
				<div class="position" align="left"><label>您所在的位置：</label><a href="../home.shtml">梦房园</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="../mem/baseinfo_mainPage.shtml">会员中心</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="<c:if test='${office.flag eq "1"}'>../pro/office/managerent.jsp?menuCls=11</c:if><c:if test='${office.flag eq "2"}'>../pro/office/managesale.jsp?menuCls=13</c:if>">写字楼${office.flagString}管理</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="buildingrent.jsp">发布写字楼${office.flagString}信息</a></div>
					<div class="info_top"></div><div class="info_mid">
					<table border="0" cellpadding="0" cellspacing="0" width="760px">
						<tr>
							<td valign="top" align="center" >
									<form name="form" method="post"
										action="../office/addSend.shtml" enctype="multipart/form-data"
										onsubmit="return checkrent()">

										<table width="710px;" border="0" cellpadding="1" id="buildingrent" cellspacing="1">
											<tr>
												<th align="center" colspan="2">
													<b>发布写字楼${office.flagString}信息 </b>
												</th>
											</tr>
											<tr>
												<th align="left" colspan="2" class="title_info1" valign="bottom">
													一、填写基本信息（<font color="red">*</font> 为必填项）
												</th>
											</tr>
											<tr>
												<td width="15%" align="right">
														<font color="red">*</font>楼盘名称:
												</td>
												<td align="left">
												<%-- onKeyUp="this.value=this.value.replace(/^[0-9\u4e00-\u9faf]+$/,'')"--%>
														<input class="easyui-validatebox" required="true" missingMessage="楼盘名称必填" type="text" name="office.name"
															id="name" style="width: 200px" value="${office.name }" maxlength="25">
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>楼盘地址:
												</td>
												<td align="left">
													<input name="office.address" id="address" style="width: 300px" value="${office.address }"  class="easyui-validatebox" required="true" missingMessage="楼盘地址必填"/>
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>所属区域:
												</td>
												<td align="left">
													<input type="text" style="width:200px"  value="${office.disname }" id="districtShow"/>
													<input type="hidden" name="office.district" id="district" value="${office.district }"/>
													<input type="hidden" name="office.disname" id="disname" value="${office.disname }"/>
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>建筑面积:
												</td>
												<td align="left">
													<input id="area"
														name="office.area" maxlength="8" style="width: 60px" onKeyUp="isNum(this)" value="${office.area }"  class="easyui-validatebox" required="true" missingMessage="建筑面积必填"/> ㎡
													
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>使用面积:
												</td>
												<td align="left">
													<input id="areauseful"
														name="office.areauseful" maxlength="8" style="width: 60px" onKeyUp="isNum(this)" value="${office.areauseful }"  class="easyui-validatebox" required="true" missingMessage="使用面积必填"/> ㎡
												</td>
											</tr>
											<c:if test='${office.flag eq "1"}'>
											<tr>
												<td align="right">
														<font color="red">*</font>租赁方式:
												</td>
												<td align="left">
													<estateTag:select cssStyle="width:120px" id="rentType" value="${office.rentType}" name="office.rentType" codeType="租赁方式" headerKey="" headerValue="请选择" />
												</td>
											</tr>
											</c:if>
											
											
											<tr>
												<td align="right">
													<font color="red">*</font><c:if test='${office.flag eq "1"}'>租金单价:</c:if><c:if test='${office.flag eq "2"}'>售    价</c:if>
												</td>
												<td align="left">
														<input type="text" maxlength="10" name="office.price"
															onKeyUp="isNum(this)" id="price" style="width: 60px" value="${office.price }" class="easyui-validatebox" required="true" missingMessage="租金单价必填">
														<c:if test='${office.flag eq "1"}'>元/㎡·天
														&nbsp;&nbsp;&nbsp;&nbsp;<estateTag:select cssStyle="width:120px" value="${office.payInfo}" name="office.payInfo" id="payInfo" codeType="租赁支付方式" headerKey="" headerValue="请选择支付方式" />
														&nbsp;&nbsp;&nbsp;&nbsp;<estateTag:select cssStyle="width:120px" value="${office.officeCost}" name="office.officeCost" id="officeCost" codeType="是否" headerKey="" headerValue="是否包含物业费" />
														</c:if><c:if test='${office.flag eq "2"}'>万元</c:if>
												</td>
											</tr>
											<tr>
												<td>
													<div align="right" >
														<font color="red">*</font>物业管理费:
													</div>
												</td>
												<td align="left">
													<input id="propertyManagement"
														name="office.propertyManagement" maxlength="8" style="width: 60px" value="${office.propertyManagement}" class="easyui-validatebox" required="true" missingMessage="物业管理费必填"/> 元/㎡·月
													
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>楼层位置:
												</td>
												<td align="left">
														<estateTag:select cssStyle="width:120px" value="${office.floorType}" name="office.floorType" id="floorType" codeType="楼层类型" headerKey="" headerValue="请选择" />
												</td>
											</tr>
											<tr>
												<td align="right">
													<font color="red">*</font>楼    层:
												</td>
												<td align="left">
												
												<c:choose>
													<c:when  test="${office.floorCategory eq null}">
														<label><input type="radio" id="floorCategoryS" name="office.floorCategory" value="1" checked="checked">单层</label>
															<span id="floorType_single" ><input id="subFloorS" maxlength="2" name="office.subFloor" value="${office.subFloor }" style="width: 30px;">/<input maxlength="2" id="totalFloorS"  value="${office.totalFloor }" name="office.totalFloor" style="width: 30px;"></span>
															<label><input type="radio" id="floorCategoryF" name="office.floorCategory" value="2">跃层</label>
															<span id="floorType_fs" style="display: none"><input maxlength="2" id="subFloor_fs" disabled="disabled" name="office.subFloor" value="${office.subFloor}" style="width: 30px;">－<input maxlength="2" id="floor2_fs" disabled="disabled" value="${office.floor2}" name="office.floor2" style="width: 30px;">/<input maxlength="2" id="totalFloor_fs" disabled="disabled" value="${office.totalFloor }" name="office.totalFloor" style="width: 30px;"></span>
													</c:when>
													<c:otherwise>
														<c:if test='${office.floorCategory eq "1"}'>
															<label><input type="radio" id="floorCategoryS" name="office.floorCategory" value="1" checked="checked">单层</label>
															<span id="floorType_single" ><input maxlength="2" id="subFloorS" value="${office.subFloor }" name="office.subFloor" style="width: 30px;">/<input maxlength="2" id="totalFloorS" value="${office.totalFloor }" name="office.totalFloor" style="width: 30px;"></span>
															<label><input type="radio" id="floorCategoryF" name="office.floorCategory" value="2">跃层</label>
															<span id="floorType_fs" style="display: none"><input maxlength="2" id="subFloor_fs" disabled="disabled" value="${office.subFloor}" name="office.subFloor" style="width: 30px;">－<input maxlength="2" id="floor2_fs" disabled="disabled" value="${office.floor2}" name="office.floor2" style="width: 30px;">/<input maxlength="2" id="totalFloor_fs" name="office.totalFloor" disabled="disabled" value="${office.totalFloor}"  style="width: 30px;"></span>
														</c:if>
														<c:if test='${office.floorCategory eq "2"}'>
															<label><input type="radio" id="floorCategoryS" name="office.floorCategory" value="1" >单层</label>
															<span id="floorType_single" style="display: none"><input maxlength="2" id="subFloorS" disabled="disabled" value="${office.subFloor}" name="office.subFloor" style="width: 30px;">/<input maxlength="2" id="totalFloorS" disabled="disabled" value="${office.totalFloor}" name="office.totalFloor" style="width: 30px;"></span>
															<label><input type="radio" id="floorCategoryF" name="office.floorCategory" value="2" checked="checked">跃层</label>
															<span id="floorType_fs"><input id="subFloor_fs" maxlength="2" value="${office.subFloor}" name="office.subFloor" style="width: 30px;">－<input maxlength="2" id="floor2_fs" value="${office.floor2}" name="office.floor2" style="width: 30px;">/<input maxlength="2" id="totalFloor_fs" value="${office.totalFloor}" name="office.totalFloor" style="width: 30px;"></span>
														</c:if>
													</c:otherwise>
												</c:choose>
												</td>
											</tr>
											
											<tr>
												<td align="right">
														<font color="red">*</font>权属:
												</td>
												<td align="left">
														<estateTag:select cssStyle="width:120px" value="${office.mright}" id="mright" name="office.mright" codeType="产权性质" headerKey="" headerValue="请选择" />
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>装修程度:
												</td>
												<td align="left">
														<estateTag:radio id="fitment" value="${office.fitment}" name="office.fitment" codeType="装修程度" />
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>朝     向:
												</td>
												<td align="left">
													<estateTag:select cssStyle="width:120px" value="${office.forward}" name="office.forward" id="forward" codeType="朝向" headerKey="" headerValue="请选择" />
												</td>
											</tr>
											<c:if test='${office.flag eq "2"}'>
											<tr>
												<td align="right">
														<font color="red">*</font>所属商圈:
												</td>
												<td align="left">
													<input style="width: 120px;" value="${office.cbd }" name="office.cbd" id="cbd" maxlength="10" class="easyui-validatebox" required="true" missingMessage="所属商圈必填"/>
												</td>
											</tr>
											</c:if>
											<tr>
												<td align="right">
														<font color="red">*</font>案源标题:
												</td>
												<td align="left">
														<input maxlength="50" name="office.title" value="${office.title}" id="title" type="text"
															style="width: 300px" class="easyui-validatebox" required="true" missingMessage="案源标题必填">
												</td>
											</tr>
											<tr>
												<td align="right">
														案源描述：
												</td>
												<td id="filter_ke" align="left">
														<textarea cols="60" rows="10" name="office.content" id="content">${office.content}</textarea>
												</td>
											</tr>
											<tr>
												<th align="left" colspan="2" class="title_info1" valign="bottom">
													二、填写写字楼详细信息
												</th>
											</tr>
											<tr>
												<td align="right">
														写字楼类型:
												</td>
												<td>
													<div align="left">
														<estateTag:select cssStyle="width:120px" value="${office.category}" name="office.category" id="category" codeType="写字楼类别" headerKey="" headerValue="请选择" />
													</div>
												</td>
											</tr>
											<tr>
												<td align="right">
														建筑年代:
												</td>
												<td align="left">
														<input name="office.consYear" value="${office.consYear}" id="consYear" type="text"
															style="width: 120px" onKeyUp="isNum(this)" maxlength="4">年
												</td>
											</tr>
											<tr>
												<td align="right">
														基础设施:
												</td>
												<td align="left">
													<estateTag:checkbox  id="baseService"  name="office.baseService" codeType="配套设施" value="${office.baseService}"/>
												</td>
											</tr>
											<tr>
												<td align="right">
														房屋设备:
												</td>
												<td align="left">
													<estateTag:checkbox  id="equipment" name="office.equipment" codeType="房屋设备" value="${office.equipment}"/>
												</td>
											</tr>
											<tr>
												<td align="right">
														交通线路:
												</td>
												<td align="left">
														<input name="office.traffic" value="${office.traffic}" id="traffic" type="text"
															style="width: 300px" maxlength="50">
												</td>
											</tr>
											<tr>
												<th align="left" colspan="2" class="title_info1" valign="bottom">
													三、上传案源图片(<font color="red">说明：单张图片不大于500k,如果大于500k请修改后上传。</font>)
												</th>
											</tr>
											<tr>
												<td>
														&nbsp;&nbsp;1.图片名称:
												</td>
												<td>
														<input type="text" name="office.imgName1" id="imgName1" value="${office.imgName1 }" maxlength="25"/>
														&nbsp; &nbsp; &nbsp;
														<estateTag:select cssStyle="width:80px" value="${office.imgType1==null?1:office.imgType1}" name="office.imgType1" id="imgType1" codeType="新房图片类型" />
														&nbsp; &nbsp; &nbsp;
														<input id="img1" type="file" name="imageFile1" />
												</td>
											</tr>
											<c:if test="${office.imgUrl1 != null}">
											<tr>
												<td align="right">已传图片：</td>
												<td align="center">
													<img width="400px" src="<%=basePath %>${office.imgUrl1 }"/>
												</td>
											</tr>
											</c:if>
											<tr>
												<td>
														&nbsp;&nbsp;2.图片名称:
												</td>
												<td>
														<input type="text" name="office.imgName2" id="imgName2" value="${office.imgName2 }" maxlength="25"/>
														&nbsp; &nbsp; &nbsp;
														<estateTag:select cssStyle="width:80px" value="${office.imgType2==null?2:office.imgType2}" name="office.imgType2" id="imgType2" codeType="新房图片类型" />
														&nbsp; &nbsp; &nbsp;
														<input id="img2" type="file" name="imageFile2" />
												</td>
											</tr>
											<c:if test="${office.imgUrl2 != null}">
											<tr>
												<td align="right">已传图片：</td>
												<td align="center">
													<img width="400px" src="<%=basePath %>${office.imgUrl2 }"/>
												</td>
											</tr>
											</c:if>
											<tr>
												<td>
														&nbsp;&nbsp;3.图片名称:
												</td>
												<td>
														<input type="text" name="office.imgName3" id="imgName3" value="${office.imgName3 }" maxlength="25"/>
														&nbsp; &nbsp; &nbsp;
														<estateTag:select cssStyle="width:80px" value="${office.imgType3==null?3:office.imgType3}" name="office.imgType3" id="imgType3" codeType="新房图片类型" />
														&nbsp; &nbsp; &nbsp;
														<input id="img3" name="imageFile3" type="file" />
												</td>
											</tr>
											<c:if test="${office.imgUrl3 != null}">
											<tr>
												<td align="right">已传图片：</td>
												<td align="center">
													<img width="400px" src="<%=basePath %>${office.imgUrl3 }"/>
												</td>
											</tr>
											</c:if>
											<tr>
												<td>
														&nbsp;&nbsp;4.图片名称:
												</td>
												<td>
														<input type="text" name="office.imgName4" id="imgName4" value="${office.imgName4 }" maxlength="25"/>
														&nbsp; &nbsp; &nbsp;
														<estateTag:select cssStyle="width:80px" value="${office.imgType4==null?4:office.imgType4}" name="office.imgType4" id="imgType4" codeType="新房图片类型" />
														&nbsp; &nbsp; &nbsp;
														<input id="img4" type="file" name="imageFile4" />
												</td>
											</tr>
											<c:if test="${office.imgUrl4 != null}">
											<tr>
												<td align="right">已传图片：</td>
												<td align="center">
													<img width="400px" src="<%=basePath %>${office.imgUrl4 }"/>
												</td>
											</tr>
											</c:if>
											<tr>
												<td>
														&nbsp;&nbsp;5.图片名称:
												</td>
												<td>
														<input type="text" name="office.imgName5" id="imgName5" value="${office.imgName5 }" maxlength="25"/>
														&nbsp; &nbsp; &nbsp;
														<estateTag:select cssStyle="width:80px" value="${office.imgType5==null?5:office.imgType5}" name="office.imgType5" id="imgType5" codeType="新房图片类型" />
														&nbsp; &nbsp; &nbsp;
														<input id="img5" type="file" name="imageFile5" />
												</td>
											</tr>
											<c:if test="${office.imgUrl5 != null}">
											<tr>
												<td align="right">已传图片：</td>
												<td align="center">
													<img width="400px" src="<%=basePath %>${office.imgUrl5 }"/>
												</td>
											</tr>
											</c:if>
											<tr>
												<th colspan="2" align="center">
													<input type="hidden" name="office.flag" value="${office.flag }" id="officeFlag">
													<input type="hidden" name="office.id" value="${office.id }"/>
													<input type="hidden" name="office.auditingState" value="0">
													<input type="submit" value="保存">
												</th>
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
		<input id="menuCls" value="<%=menuCls %>" type="hidden">
		<div style="margin-top: 10px;">
			<center>
				<jsp:include page="../../copyright.jsp" />
			</center>
		</div>
	</body>
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
</html>