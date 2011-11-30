<%@ page language="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="estateTag" prefix="estateTag" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>修改商铺信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="<%=basePath%>resource/css/global.css" type="text/css"></link>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/css/jqueryui/default/easyui.css"></link>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>resource/js/kindeditor/skins/default.css"></link>
	<link rel="stylesheet" href="<%=basePath%>resource/css/whole.css" type="text/css"></link>
	<link rel="stylesheet" href="<%=basePath%>resource/css/memberCenter/info.css" type="text/css"></link>
	<script type="text/javascript" src="<%=basePath%>resource/js/jquery-1.4.2.js"></script>
    <script type="text/javascript" src="<%=basePath%>pro/modifyshoprent.js"></script>
    <script type="text/javascript" src="<%=basePath%>resource/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>resource/js/jquery.dataGridTip.js"></script>
	<script type="text/javascript" src="<%=basePath%>resource/js/global.js"></script>
	<script type="text/javascript" src="<%=basePath%>resource/js/kindeditor/kindeditor.js"></script>
    <script type="text/javascript" src="<%=basePath%>resource/js/whole.js"></script>
	<script type="text/javascript" src="<%=basePath%>resource/js/googlemap.js"></script>
  </head>
  
  <body onunload="GUnload()">
	<jsp:include page="../head.jsp"></jsp:include>
     	<div style="width: 100%; margin-top: 10px;" align="center">
       		 <table width="100%" border="0" class="layoutTab">
			<tr>
				<td width="20%" align="left" valign="top"><jsp:include page="../left.jsp"></jsp:include></td>
				<td valign="top"  >
                            <div class="position" align="left" style="width:80%"><label>您所在的位置：</label><a href="../home.shtml">梦房园</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="../mem/baseinfo_mainPage.shtml">会员中心</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<c:if test='${shop.flag eq "2"}'><a href="../pro/manageshopsale.jsp?menuCls=12">商铺出售管理</a></c:if><c:if test='${shop.flag eq "1"}'><a href="../pro/manageshoprent.jsp?menuCls=12">商铺出租管理</a></c:if>&nbsp;&nbsp;&gt;&nbsp;&nbsp;修改商铺租售信息</div>
					                  <div class="info_top"></div><div class="info_mid">	
									<form name="form" method="post" action="../shop/addShop.shtml"
										enctype="multipart/form-data"
										onsubmit="return checkshopsale();">
										<table width="710px;" border="0" cellpadding="1" cellspacing="1" id="shopsale">
											<tr>
												<th  align="center" colspan="2">
													<b>修改商铺<c:if test='${shop.flag eq "1"}'>出租</c:if><c:if test='${shop.flag eq "2"}'>出售</c:if>信息</b>
												</th>
											</tr>
											<tr>
												<th align="left" colspan="2" class="title_info1" valign="bottom">
													一、填写基本信息（<font color="red">*</font> 为必填项）
												</th>
											</tr>
											<tr>
												<td width="15%" align="right">
														<font color="red">*</font>商铺名称:
												</td>
												<td align="left">
												<%-- onKeyUp="this.value=this.value.replace(/^[0-9\u4e00-\u9faf]+$/,'')"--%>
														<input class="easyui-validatebox" required="true" missingMessage="商铺名称必填" type="text" name="shop.name"
															id="name" style="width: 200px" value="${shop.name }" maxlength="25">
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>商铺地址:
												</td>
												<td align="left">
													<input name="shop.address" id="address" style="width: 300px" value="${shop.address }"  class="easyui-validatebox" required="true" missingMessage="商铺地址必填"/>
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font><font color="red">*</font>所属区域:
												</td>
												<td align="left">
													<input type="text" style="width:200px"  value="${shop.disname }" id="districtShow"/>
													<input type="hidden" name="shop.district" id="district" value="${shop.district }"/>
													<input type="hidden" name="shop.disname" id="disname" value="${shop.disname }"/>
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>建筑面积:
												</td>
												<td align="left">
													<input id="area"
														name="shop.area" maxlength="5" style="width: 60px" onKeyUp="isNum(this)" value="${shop.area }"  class="easyui-validatebox" required="true" missingMessage="建筑面积必填"/> 元/㎡·月
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>使用面积:
												</td>
												<td align="left">
													<input id="areauseful"
														name="shop.areauseful" maxlength="5" style="width: 60px" onKeyUp="isNum(this)" value="${shop.areauseful }"  class="easyui-validatebox" required="true" missingMessage="使用面积必填"/> 元/㎡·月
												</td>
											</tr>
											<c:if test='${shop.flag eq "1"}'>
											<tr>
												<td align="right">
														<font color="red">*</font>租赁方式:
												</td>
												<td align="left">
													<estateTag:select cssStyle="width:120px" id="rentType" value="${shop.rentType}" name="shop.rentType" codeType="租赁方式" headerKey="" headerValue="请选择" />
												</td>
											</tr>
											</c:if>
											
											<tr>
												<td align="right">
													<font color="red">*</font><c:if test='${shop.flag eq "1"}'>租金单价:</c:if><c:if test='${shop.flag eq "2"}'>售    价</c:if>
												</td>
												<td align="left">
														<input type="text" maxlength="10" name="shop.bursary"
															onKeyUp="isNum(this)" id="bursary" style="width: 60px" value="${shop.bursary }" class="easyui-validatebox" required="true" missingMessage="租金单价必填">
														<c:if test='${shop.flag eq "1"}'>元/㎡·天
														&nbsp;&nbsp;&nbsp;&nbsp;<estateTag:select cssStyle="width:120px" value="${shop.payInfo}" name="shop.payInfo" id="payInfo" codeType="租赁支付方式" headerKey="" headerValue="请选择支付方式" />
														&nbsp;&nbsp;&nbsp;&nbsp;<estateTag:select cssStyle="width:120px" value="${shop.officeCost}" name="shop.officeCost" id="officeCost" codeType="是否" headerKey="" headerValue="是否包含物业费" />
														</c:if><c:if test='${shop.flag eq "2"}'>万元</c:if>
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
														name="shop.propertyManagement" maxlength="5" style="width: 60px" value="${shop.propertyManagement}" class="easyui-validatebox" required="true" missingMessage="物业管理费必填"/> 元/㎡·月
												</td>
											</tr>
											<tr>
												<td align="right">
													<font color="red">*</font>楼    层:
												</td>
												<td align="left">
												
												<c:choose>
													<c:when test="${shop.floorCategory eq null}">
														<label><input type="radio" id="floorCategoryS" name="shop.floorCategory" value="1" checked="checked">单层</label>
															<span id="floorType_single" ><input id="subFloorS" maxlength="2" name="shop.subFloor" value="${shop.subFloor }" style="width: 30px;">/<input maxlength="2" id="totalFloorS"  value="${shop.totalFloor }" name="shop.totalFloor" style="width: 30px;"></span>
															<label><input type="radio" id="floorCategoryF" name="shop.floorCategory" value="2">跃层</label>
															<span id="floorType_fs" style="display: none"><input maxlength="2" id="subFloor_fs" disabled="disabled" name="shop.subFloor" value="${shop.subFloor}" style="width: 30px;">－<input maxlength="2" id="floor2_fs" disabled="disabled" value="${shop.floor2}" name="shop.floor2" style="width: 30px;">/<input maxlength="2" id="totalFloor_fs" disabled="disabled" value="${shop.totalFloor }" name="shop.totalFloor" style="width: 30px;"></span>
													</c:when>
													<c:otherwise>
														<c:if test='${shop.floorCategory eq "1"}'>
															<label><input type="radio" id="floorCategoryS" name="shop.floorCategory" value="1" checked="checked">单层</label>
															<span id="floorType_single" ><input maxlength="2" id="subFloorS" value="${shop.subFloor }" name="shop.subFloor" style="width: 30px;">/<input maxlength="2" id="totalFloorS" value="${shop.totalFloor }" name="shop.totalFloor" style="width: 30px;"></span>
															<label><input type="radio" id="floorCategoryF" name="shop.floorCategory" value="2">跃层</label>
															<span id="floorType_fs" style="display: none"><input maxlength="2" id="subFloor_fs" disabled="disabled" value="${shop.subFloor}" name="shop.subFloor" style="width: 30px;">－<input maxlength="2" id="floor2_fs" disabled="disabled" value="${shop.floor2}" name="shop.floor2" style="width: 30px;">/<input maxlength="2" id="totalFloor_fs" name="shop.totalFloor" disabled="disabled" value="${shop.totalFloor}"  style="width: 30px;"></span>
														</c:if>
														<c:if test='${shop.floorCategory eq "2"}'>
															<label><input type="radio" id="floorCategoryS" name="shop.floorCategory" value="1" >单层</label>
															<span id="floorType_single" style="display: none"><input maxlength="2" id="subFloorS" disabled="disabled" value="${shop.subFloor}" name="shop.subFloor" style="width: 30px;">/<input maxlength="2" id="totalFloorS" disabled="disabled" value="${shop.totalFloor}" name="shop.totalFloor" style="width: 30px;"></span>
															<label><input type="radio" id="floorCategoryF" name="shop.floorCategory" value="2" checked="checked">跃层</label>
															<span id="floorType_fs"><input id="subFloor_fs" maxlength="2" value="${shop.subFloor}" name="shop.subFloor" style="width: 30px;">－<input maxlength="2" id="floor2_fs" value="${shop.floor2}" name="shop.floor2" style="width: 30px;">/<input maxlength="2" id="totalFloor_fs" value="${shop.totalFloor}" name="shop.totalFloor" style="width: 30px;"></span>
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
														<estateTag:select cssStyle="width:120px" value="${shop.mright}" id="mright" name="shop.mright" codeType="产权性质" headerKey="" headerValue="请选择" />
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>装修程度:
												</td>
												<td align="left">
														<estateTag:radio id="fitment" value="${shop.fitment}" name="shop.fitment" codeType="装修程度" />
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>朝     向:
												</td>
												<td align="left">
													<estateTag:select cssStyle="width:120px" value="${shop.forward}" name="shop.forward" id="forward" codeType="朝向" headerKey="" headerValue="请选择" />
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>所属商圈:
												</td>
												<td align="left">
													<input style="width: 120px;" value="${shop.cbd }" name="shop.cbd" id="cbd" maxlength="10" class="easyui-validatebox" required="true" missingMessage="所属商圈必填"/>
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>案源标题:
												</td>
												<td align="left">
														<input maxlength="50" name="shop.title" value="${shop.title}" id="title" type="text"
															style="width: 300px" class="easyui-validatebox" required="true" missingMessage="案源标题必填">
												</td>
											</tr>
											<tr>
												<td align="right">
														案源描述：
												</td>
												<td id="filter_ke" align="left">
														<textarea cols="60" rows="10" name="shop.content" id="content">${shop.content}</textarea>
												</td>
											</tr>
											<tr>
												<th align="left" colspan="2" class="title_info1" valign="bottom">
													二、填写写字楼详细信息
												</th>
											</tr>
											<tr>
												<td align="right">
														商铺类型:
												</td>
												<td>
													<div align="left">
														<estateTag:select cssStyle="width:120px" value="${shop.category}" name="shop.category" id="category" codeType="商铺类型" headerKey="" headerValue="请选择" />
													</div>
												</td>
											</tr>
											<tr>
												<td align="right">
														建筑年代:
												</td>
												<td align="left">
														<input name="shop.consYear" value="${shop.consYear}" id="consYear" type="text"
															style="width: 60px" onKeyUp="isNum(this)" maxlength="4">年
												</td>
											</tr>
											<tr>
												<td align="right">
														基础设施:
												</td>
												<td align="left">
													<estateTag:checkbox  id="baseService"  name="shop.baseService" codeType="配套设施" value="${shop.baseService}"/>
												</td>
											</tr>
											<tr>
												<td align="right">
														房屋设备:
												</td>
												<td align="left">
													<estateTag:checkbox  id="equipment" name="shop.equipment" codeType="房屋设备" value="${shop.equipment}"/>
												</td>
											</tr>
											<tr>
												<td align="right">
														交通线路:
												</td>
												<td align="left">
														<input name="shop.traffic" value="${shop.traffic}" id="traffic" type="text"
															style="width: 300px" maxlength="50">
												</td>
											</tr>
											<tr>
												<td align="right">
														地图坐标:
												</td>
												<td>
														<input type="text" id="jing" size="20" readonly="readonly" value="${shop.positionY}" 
															name="shop.positionY">
														&nbsp;&nbsp;&nbsp;&nbsp;
														<input id="wei" readonly="readonly" type="text"
															name="shop.positionX" value="${shop.positionX}" size="20">
														<font color="red">(在地图上双击鼠标左键标注案源位置 )</font>
												</td>
											</tr>
											<tr>
											 <td align="right">
													根据地区定位:
												</td>
												<td >
													<input id="addressText" name="shop.addressName" style="width: 290px" type="text"/>
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
													三、上传案源图片(<font color="red">说明：单张图片不大于500k,如果大于500k请修改后上传。</font>)
												</th>
											</tr>
											<tr>
												<td>
													<div align="right">
														&nbsp;&nbsp;1.图片名称:
													</div>
												</td>
												<td>
													<div align="left">
														<input type="text" name="shop.imgName1" id="imgName1" value="${shop.imgName1 }" maxlength="25"/>
														&nbsp; &nbsp; &nbsp;
														<estateTag:select cssStyle="width:80px" value="${shop.imgType1==null?1:largePro.imgType1}" name="shop.imgType1" id="imgType1" codeType="新房图片类型" />
														&nbsp; &nbsp; &nbsp;
														<input id="img1" type="file" name="imageFile1" />
													</div>
												</td>
											</tr>
											<c:if test="${shop.imgUrl1 != null}">
											<tr>
												<td align="right">已传图片：</td>
												<td align="center">
													<img width="400px" src="<%=basePath %>${shop.imgUrl1 }"/>
												</td>
											</tr>
											</c:if>
											<tr>
												<td>
													<div align="right">
														&nbsp;&nbsp;2.图片名称:
													</div>
												</td>
												<td>
													<div align="left">
														<input type="text" name="shop.imgName2" id="imgName2" value="${shop.imgName2 }" maxlength="25"/>
														&nbsp; &nbsp; &nbsp;
														<estateTag:select cssStyle="width:80px" value="${shop.imgType2==null?2:largePro.imgType2}" name="shop.imgType2" id="imgType2" codeType="新房图片类型" />
														&nbsp; &nbsp; &nbsp;
														<input id="img2" type="file" name="imageFile2" />
													</div>
												</td>
											</tr>
											<c:if test="${shop.imgUrl2 != null}">
											<tr>
												<td align="right">已传图片：</td>
												<td align="center">
													<img width="400px" src="<%=basePath %>${shop.imgUrl2 }"/>
												</td>
											</tr>
											</c:if>
											<tr>
												<td>
													<div align="right">
														&nbsp;&nbsp;3.图片名称:
													</div>
												</td>
												<td>
													<div align="left">
														<input type="text" name="shop.imgName3" id="imgName3" value="${shop.imgName3}" maxlength="25"/>
														&nbsp; &nbsp; &nbsp;
														<estateTag:select cssStyle="width:80px" value="${shop.imgType3==null?3:largePro.imgType3}" name="shop.imgType3" id="imgType3" codeType="新房图片类型" />
														&nbsp; &nbsp; &nbsp;
														<input id="img3" name="imageFile3" type="file" />
													</div>
												</td>
											</tr>
											<c:if test="${shop.imgUrl3 != null}">
											<tr>
												<td align="right">已传图片：</td>
												<td align="center">
													<img width="400px" src="<%=basePath %>${shop.imgUrl3 }"/>
												</td>
											</tr>
											</c:if>
											<tr>
												<td>
													<div align="right">
														&nbsp;&nbsp;4.图片名称:
													</div>
												</td>
												<td>
													<div align="left">
														<input type="text" name="shop.imgName4" id="imgName4" value="${shop.imgName4}" maxlength="25"/>
														&nbsp; &nbsp; &nbsp;
														<estateTag:select cssStyle="width:80px" value="${shop.imgType4==null?4:largePro.imgType4}" name="shop.imgType4" id="imgType4" codeType="新房图片类型" />
														&nbsp; &nbsp; &nbsp;
														<input id="img4" type="file" name="imageFile4" />
													</div>
												</td>
											</tr>
											<c:if test="${shop.imgUrl4 != null}">
											<tr>
												<td align="right">已传图片：</td>
												<td align="center">
													<img width="400px" src="<%=basePath %>${shop.imgUrl4 }"/>
												</td>
											</tr>
											</c:if>
											<tr>
												<td>
													<div align="right">
														&nbsp;&nbsp;5.图片名称:
													</div>
												</td>
												<td>
													<div align="left">
														<input type="text" name="shop.imgName5" id="imgName5" value="${shop.imgName5}" maxlength="25"/>
														&nbsp; &nbsp; &nbsp;
														<estateTag:select cssStyle="width:80px" value="${shop.imgType5==null?5:largePro.imgType5}" name="shop.imgType5" id="imgType5" codeType="新房图片类型" />
														&nbsp; &nbsp; &nbsp;
														<input id="img5" type="file" name="imageFile5" />
													</div>
												</td>
											</tr>
											<c:if test="${shop.imgUrl5 != null}">
											<tr>
												<td align="right">已传图片：</td>
												<td align="center">
													<img width="400px" src="<%=basePath %>${shop.imgUrl5 }"/>
												</td>
											</tr>
											</c:if>
											<tr>
												<th colspan="2" align="center">
													<input type="hidden" name="shop.flag" value="${shop.flag }" id="shopFlag">
													<input type="hidden" name="shop.id" value="${shop.id }"/>
													<input type="hidden" name="shop.num" value="${shop.num}"/>
													<input type="hidden" name="shop.authorId" value="${shop.authorId}"/>
													<input type="hidden" name="shop.auditingState" value="0">
													<input type="hidden" name="menuCls" value="${menuCls }">
													<input type="submit" value="保存">
												</th>
											</tr>
											
										</table>
										</form>
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
  		<script language="javascript">
  	var map;
 var geocoder = null; 
 var marker; 
		</script> 
		<script src="http://maps.google.com/maps?file=api&v=2&key=ABQIAAAAC1djgrWT1Mqz3gM4Ge3XlhSchlZ7_IhAROXTdJ5EzY4J4yl1FBSStZmm__B2dywWaRXMSi8G6C5QLw"  type="text/javascript"></script>
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
		//document.all("imgType1").value='1';
		//document.all("imgType2").value='2';
		//document.all("imgType3").value='3';
		//document.all("imgType4").value='4';
		//document.all("imgType5").value='5';
		</script>	
  </body>
    
</html>
