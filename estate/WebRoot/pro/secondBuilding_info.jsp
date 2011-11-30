<%@ page language="java" import="java.util.*,com.estate.util.comm.RequestUtil;" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="estateTag" prefix="estateTag" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>发布住宅出售信息</title>
		<!-- jquery -->
		<script type="text/javascript" src="../resource/js/jquery-1.4.2.js"></script>
		<!-- left.jsp 需要的css及js -->
		<link rel="stylesheet" href="../resource/css/global.css" type="text/css"></link>
		<script type="text/javascript" src="../resource/js/global.js"></script>
		<!-- 载入 head.jsp 需要的css及js-->
		<link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>
		<script type="text/javascript" src="../resource/js/whole.js"></script>
		<!-- easyui -->
		<link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/default/easyui.css"></link>
		<link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/icon.css"></link>
	    <script type="text/javascript" src="../resource/js/jquery.easyui.min.js"></script>
		<!-- richer editor -->
		<script type="text/javascript" src="../resource/js/kindeditor/kindeditor.js"></script>
		<link rel="stylesheet" type="text/css" href="../resource/js/kindeditor/skins/default.css"></link>
		
		<link rel="stylesheet" href="../resource/css/memberCenter/info.css" type="text/css"></link>
		<script type="text/javascript" src="../pro/secondBuilding_info.js"></script>
	</head>

	<body>
		<jsp:include page="../head.jsp"></jsp:include>
		<div style="width: 100%;margin-top: 10px;" align="center">
		<form name="infoForm" method="post" enctype="multipart/form-data">
		<table width="100%" class="layoutTab" border="0">
			<tr>
				<td  align="left" valign="top">
					<jsp:include page="../left.jsp?selectItem=8"></jsp:include>
				</td>
				<td valign="top">
					<div class="position" align="left"><label>您所在的位置：</label><a href="../home.shtml">梦房园</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="../mem/baseinfo_mainPage.shtml">会员中心</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="../pro/secondBuliding_manage.jsp?menuCls=12">住宅管理</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="secondBuilding_info.jsp">发布出售信息</a></div>
					<div class="info_top"></div><div class="info_mid">
					     <table border="0" cellpadding="0" cellspacing="0" width="760px">
					                	<tr>
							             <td valign="top" align="center" >
					<table width="710px" id="buildingrent">
						<tr>
							<th colspan="2" align="center"><b>住宅出售信息发布</b></th>
						</tr>
						<tr>
							<th colspan="2" align="left" class="title_info1">一、填写基本信息（<font color="red">*</font> 为必填项）</th>
						</tr>
						<tr>
							<td  align="right"><font color="red">*</font>所属地区：</td>
							<td><input type="text" style="width:200px"  value="${tps.disname }" id="districtShow"/>
							<input type="hidden" name="tps.id" value="${tps.id }"/>
							<input type="hidden" name="tps.flag" value="2"/>
							<input type="hidden" name="tps.district" id="district" value="${tps.district }"/>
							<input type="hidden" name="tps.disname" id="disname" value="${tps.disname }"/>
							</td>
						</tr>
						<tr>
							<td  align="right"><font color="red">*</font>标题：</td>
							<td><input type="text" style="width:200px" maxlength="25" name="tps.title" id="title" value="${tps.title }"/><span>例如：地铁周边精装小户型一居30万</span></td>
						</tr>
						<tr>
							<td align="right"><font color="red">*</font>住宅名称：</td>
							<td><input type="text" style="width:200px" maxlength="25" name="tps.name" id="name" value="${tps.name }"/></td>
						</tr>
						<tr>
							<td align="right"><font color="red">*</font>缩略图：</td>
							<td>
							<c:choose >
							    <c:when test='${tps.compressUrl != null && tps.compressUrl != ""}'>    
								<img src="../${tps.compressUrl}"/> &nbsp;&nbsp;&nbsp; <input type="button"  onclick="modifyPic()" value="修改"/><br>
								<div id="modifyPic"></div>
							</c:when>
							   <c:otherwise>
							        <input type="file" style="width:200px"  name="tpsImage" id="compressUrl" />
							   </c:otherwise>
						     </c:choose>
                             </td>
						</tr>
						<tr>
							<td align="right"><font color="red">*</font>详细地址：</td>
							<td><input type="text" style="width:400px" maxlength="50" name="tps.address" id="address" value="${tps.address }"/></td>
						</tr>
						<tr>
							<td  align="right"><font color="red">*</font>咨询电话：</td>
							<td><input type="text" onKeyUp="isNum(this)"  maxlength="15"  name="tps.phone" id="phone" value="${tps.phone }"/></td>
						</tr>
						<!--  <tr>
							<td width="25%" align="right"><font color="red">*</font>用途：</td>
							<td>
								<select name="tps.useType" id="useType">
									<option value="">请选择</option>
									<option value="1" <c:if test='${tps.useType eq "1"}'>selected="selected"</c:if>>住宅</option>
									<option value="2" <c:if test='${tps.useType eq "2"}'>selected="selected"</c:if>>商住</option>
									<option value="3" <c:if test='${tps.useType eq "3"}'>selected="selected"</c:if>>商铺</option>
									<option value="4" <c:if test='${tps.useType eq "4"}'>selected="selected"</c:if>>别墅</option>
									<option value="5" <c:if test='${tps.useType eq "5"}'>selected="selected"</c:if>>写字楼</option>
									<option value="6" <c:if test='${tps.useType eq "6"}'>selected="selected"</c:if>>厂房</option>
									<option value="7" <c:if test='${tps.useType eq "7"}'>selected="selected"</c:if>>仓库</option>
									<option value="8" <c:if test='${tps.useType eq "8"}'>selected="selected"</c:if>>地皮</option>
									<option value="9" <c:if test='${tps.useType eq "9"}'>selected="selected"</c:if>>车位</option>
									<option value="0" <c:if test='${tps.useType eq "0"}'>selected="selected"</c:if>>其它</option>
								</select>
							</td>
						</tr>
						-->
						<tr>
							<td  align="right"><font color="red">*</font>小区名称：</td>
							<td><input type="text"  name="tps.respDistrict" id="respDistrict" maxlength="25" id="respDistrict" value="${tps.respDistrict }"/></td>
						</tr>
						<tr>
							<td  align="right"><font color="red">*</font>楼栋号：</td>
							<td><input type="text" size="8" name="tps.bulidNo" id="bulidNo" maxlength="3" onKeyUp="isNum(this)"  id="bulidNo" maxlength="3" value="${tps.bulidNo }"/>&nbsp;号/栋&nbsp;&nbsp;&nbsp;<input name="tps.room" id="room" type="text" size="8" maxlength="4" id="room" onkeydown="onlyNum()" value="${tps.room }">&nbsp;室</td>
						</tr>
						<tr>
							<td align="right"><font color="red">*</font>建筑面积：</td>
							<td><input type="text" size="8" onkeydown="onlyNum()" maxlength="5"size="8" name="tps.consArea" id="consArea" value="${tps.consArea }"/>&nbsp;㎡&nbsp;</td>
						</tr>
						<tr>
							<td  align="right"><font color="red">*</font>使用面积：</td>
							<td><input type="text" onkeydown="onlyNum()" maxlength="8" size="5" name="tps.userArea" id="userArea" value="${tps.userArea }"/>&nbsp;㎡&nbsp;　</td>
						</tr>
						<tr>
							<td  align="right"><font color="red">*</font>产权性质：</td>
							<td><estateTag:select cssStyle="width:80px"  name="tps.nature" id="nature" codeType="产权性质" />　</td>
						</tr>
						<tr>
							<td align="right"><font color="red">*</font>朝向：</td>
							<td><estateTag:select cssStyle="width:80px"  name="tps.toward" id="toward" codeType="朝向" />　</td>
						</tr>
						<tr>
							<td  align="right"><font color="red">*</font>楼层：</td>
							<td> 第<input type="text" onkeydown="onlyNum()" maxlength="2" size="6" value="${tps.floor}" id="floor" name="tps.floor" >层　&nbsp;&nbsp; 共<input name="tps.floorCount" id="floorCount" value="${tps.floorCount}" onkeydown="onlyNum()" maxlength="2" size="6" type="text">层</td>
						</tr>
						<tr>
							<td align="right"><font color="red">*</font>房型：</td>
							<td><select name="tps.home" id="home">
								<option value="1" <c:if test='${tps.home eq "1"}'>selected="selected"</c:if>>1居</option>
								<option value="2" <c:if test='${tps.home eq "2"}'>selected="selected"</c:if>>2居</option>
								<option value="3" <c:if test='${tps.home eq "3"}'>selected="selected"</c:if>>3居</option>
								<option value="4" <c:if test='${tps.home eq "4"}'>selected="selected"</c:if>>4居</option>
								<option value="5" <c:if test='${tps.home eq "5"}'>selected="selected"</c:if>>5居</option>
								<option value="6" <c:if test='${tps.home eq "6"}'>selected="selected"</c:if>>5居以上</option>
							</select>&nbsp;室&nbsp;&nbsp;&nbsp;<select name="tps.hall" id="hall">
								<option value="1" <c:if test='${tps.hall eq "1"}'>selected="selected"</c:if>>1</option>
								<option value="2" <c:if test='${tps.hall eq "2"}'>selected="selected"</c:if>>2</option>
								<option value="3" <c:if test='${tps.hall eq "3"}'>selected="selected"</c:if>>3</option>
							</select>&nbsp;厅&nbsp;&nbsp;&nbsp;
								<select name="tps.bathroom" id="bathroom">
								<option value="1" <c:if test='${tps.bathroom eq "1"}'>selected="selected"</c:if>>1</option>
								<option value="2" <c:if test='${tps.bathroom eq "2"}'>selected="selected"</c:if>>2</option>
								<option value="3" <c:if test='${tps.bathroom eq "3"}'>selected="selected"</c:if>>3</option>
							</select>&nbsp;卫
							<select name="tps.chu">
							    <option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
							</select>
							&nbsp;厨<br/>
							<select name="tps.yangTai">
							    <option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
							</select>
							&nbsp;阳台
							</td>
						</tr>
						<tr>
							<td align="right"><font color="red">*</font>售价：</td>
							<td><input type="text" style="width:60px" onkeydown="onlyNum()" maxlength="6" name="tps.price" id="price" value="${tps.price }"/>&nbsp;万元/套</td>
						</tr>
						<tr>
							<td  align="right">建筑年代：</td>
							<td><input type="text" style="width:60px" onkeydown="onlyNum()" onchange="changeBuildYear('1')" maxlength="4" name="tps.createTime" id="createTime" value="${tps.createTime }"/>&nbsp;年</td>
						</tr>
						<tr>
							<td align="right">房龄：</td>
							<td><input type="text" style="width:60px" onkeydown="onlyNum()" onchange="changeBuildYear('2')" maxlength="3" name="tps.age" id="age" value="${tps.age }"/>&nbsp;年</td>
						</tr>
						<tr>
							<td  align="right">装修状况：</td>
							<td><estateTag:select cssStyle="width:80px"  name="tps.fitCondition" id="fitCondition" codeType="装修程度" /></td>
						</tr>
						<tr>
							<td  align="right">家具：</td>
							<td><input type="text" style="width:400px" name="tps.furniture" id="furniture" maxlength="100" value="${tps.furniture }"/></td>
						</tr>
						<tr>
						    
							<td  align="right" valign="top">房源介绍：</td>
							<td><textarea cols="50" rows="15" name="tps.introduction"  id="introduction">${tps.introduction }</textarea></td>
						</tr>
						<tr>
							<td   align="center" valign="top">
							<input type="hidden" name="tps.auditingState"  value="${tps.auditingState}"/>
							</td>
							<td >
							<a href="javascript:formSubmit('1')" id="submit"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="javascript:formSubmit('2')" id="submit4Image"></a>
							</td>
						</tr>
					</table>
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
	</body>
</html>
