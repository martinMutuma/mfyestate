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
	<link rel="stylesheet" type="text/css" href="<%=basePath %>scripts/kindeditor/skins/default.css"></link>
	<link rel="stylesheet" href="<%=basePath%>resource/css/whole.css" type="text/css"></link>
	<link rel="stylesheet" href="<%=basePath%>resource/css/memberCenter/info.css" type="text/css"></link>
	
	<script type="text/javascript" src="<%=basePath%>scripts/jquery-1.4.2.js"></script>
    <script type="text/javascript" src="<%=basePath%>scripts/pro/modifyshop.js"></script>
    <script type="text/javascript" src="<%=basePath%>scripts/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>scripts/jquery.dataGridTip.js"></script>
	<script type="text/javascript" src="<%=basePath%>scripts/kindeditor/kindeditor.js"></script>
    <script type="text/javascript" src="<%=basePath%>scripts/whole.js"></script>
    <script type="text/javascript" src="<%=basePath%>scripts/googlemap.js"></script>
  </head>
  
  <body onunload="GUnload()">
     	<div style="width: 100%; margin-top: 10px;" align="center">
       		 <table width="100%" border="0" class="layoutTab">
			<tr>
				<td valign="top"  >
			                  <div class="info_top"></div><div class="info_mid">	
									<form name="form1" method="post" action="../shop/addSend.shtml" target="tempF"
										enctype="multipart/form-data"
										onsubmit="return checkshopsale();">
										<table width="710px;" border="0" cellpadding="1" cellspacing="1" id="shopsale">
											<tr>
												<th  align="center" colspan="2">
													<b>审核商铺<c:if test='${shop.flag eq "1"}'>出租</c:if><c:if test='${shop.flag eq "2"}'>出售</c:if>信息</b>
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
															readonly="readonly" id="name" style="width: 200px" value="${shop.name }" maxlength="25">
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>商铺地址:
												</td>
												<td align="left">
													<input name="shop.address" id="address" style="width: 300px"  readonly="readonly" value="${shop.address }"  class="easyui-validatebox" required="true" missingMessage="商铺地址必填"/>
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font><font color="red">*</font>所属区域:
												</td>
												<td align="left">
													<input type="text" style="width:200px" readonly="readonly"  value="${shop.disname }" id="districtShow"/>
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
														readonly="readonly" name="shop.area" maxlength="5" style="width: 60px" onKeyUp="isNum(this)" value="${shop.area }"  class="easyui-validatebox" required="true" missingMessage="建筑面积必填"/> 元/㎡·月
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>使用面积:
												</td>
												<td align="left">
													<input id="areauseful"
														readonly="readonly" name="shop.areauseful" maxlength="5" style="width: 60px" onKeyUp="isNum(this)" value="${shop.areauseful }"  class="easyui-validatebox" required="true" missingMessage="使用面积必填"/> 元/㎡·月
												</td>
											</tr>
											<c:if test='${shop.flag eq "1"}'>
											<tr>
												<td align="right">
														<font color="red">*</font>租赁方式:
												</td>
												<td align="left">
													<estateTag:convertCode code="${shop.rentType}"  codeType="租赁方式" ></estateTag:convertCode>
												</td>
											</tr>
											</c:if>
											
											<tr>
												<td align="right">
													<font color="red">*</font><c:if test='${shop.flag eq "1"}'>租金单价:</c:if><c:if test='${shop.flag eq "2"}'>售    价</c:if>
												</td>
												<td align="left">
														<input type="text" maxlength="10" name="shop.bursary"
															readonly="readonly" onKeyUp="isNum(this)" id="bursary" style="width: 60px" value="${shop.bursary }" class="easyui-validatebox" required="true" missingMessage="租金单价必填">
														<c:if test='${shop.flag eq "1"}'>元/㎡·天
														&nbsp;&nbsp;&nbsp;&nbsp;<estateTag:convertCode code="${shop.payInfo}" codeType="租赁支付方式" ></estateTag:convertCode>
														&nbsp;&nbsp;&nbsp;&nbsp;<estateTag:convertCode code="${shop.officeCost}" codeType="是否"></estateTag:convertCode>
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
														readonly="readonly" name="shop.propertyManagement" maxlength="5" style="width: 60px" value="${shop.propertyManagement}" class="easyui-validatebox" required="true" missingMessage="物业管理费必填"/> 元/㎡·月
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
														<estateTag:convertCode code="${shop.mright}"codeType="产权性质"></estateTag:convertCode>
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>装修程度:
												</td>
												<td align="left">
														<estateTag:convertCode code="${shop.fitment}" codeType="装修程度"></estateTag:convertCode>
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>朝     向:
												</td>
												<td align="left">
													<estateTag:convertCode code="${shop.forward}"  codeType="朝向" ></estateTag:convertCode>
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>所属商圈:
												</td>
												<td align="left">
													<input style="width: 120px;" value="${shop.cbd }" readonly="readonly" name="shop.cbd" id="cbd" maxlength="10" class="easyui-validatebox" required="true" missingMessage="所属商圈必填"/>
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>案源标题:
												</td>
												<td align="left">
														<input maxlength="50" name="shop.title" value="${shop.title}" id="title" type="text"
															readonly="readonly" style="width: 300px" class="easyui-validatebox" required="true" missingMessage="案源标题必填">
												</td>
											</tr>
											<tr>
												<td align="right">
														案源描述：
												</td>
												<td id="filter_ke" align="left">
														<textarea cols="60" rows="10" name="shop.content" readonly="readonly" id="content">${shop.content}</textarea>
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
														<estateTag:convertCode code="${shop.category}" codeType="商铺类型" ></estateTag:convertCode>
													</div>
												</td>
											</tr>
											<tr>
												<td align="right">
														建筑年代:
												</td>
												<td align="left">
														<input name="shop.consYear" value="${shop.consYear}" id="consYear" type="text"
															readonly="readonly" style="width: 60px" onKeyUp="isNum(this)" maxlength="4">年
												</td>
											</tr>
											<tr>
												<td align="right">
														基础设施:
												</td>
												<td align="left">
													<estateTag:convertCode  codeType="配套设施" code="${shop.baseService}"></estateTag:convertCode>
												</td>
											</tr>
											<tr>
												<td align="right">
														房屋设备:
												</td>
												<td align="left">
													<estateTag:convertCode  codeType="房屋设备" code="${shop.equipment}"/>
												</td>
											</tr>
											<tr>
												<td align="right">
														交通线路:
												</td>
												<td align="left">
														<input name="shop.traffic" value="${shop.traffic}" id="traffic" type="text"
															readonly="readonly" style="width: 300px" maxlength="50">
												</td>
											</tr>
											<tr>
												<td align="right">
														地图坐标:
												</td>
												<td>
														<input type="text" id="jing" size="20" readonly="readonly" value="${shop.positionY}" 
															readonly="readonly" name="shop.positionY">
														&nbsp;&nbsp;&nbsp;&nbsp;
														<input id="wei" readonly="readonly" type="text"
															name="shop.positionX" readonly="readonly" value="${shop.positionX}" size="20">
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
											<c:if test="${shop.imgUrl1 != null}">
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
													</div>
												</td>
											</tr>
											<tr>
												<td align="right">已传图片：</td>
												<td align="center">
													<img width="400px" src="<%=basePath %>${shop.imgUrl1 }"/>
												</td>
											</tr>
											</c:if>
											<c:if test="${shop.imgUrl2 != null}">
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
													</div>
												</td>
											</tr>
											<tr>
												<td align="right">已传图片：</td>
												<td align="center">
													<img width="400px" src="<%=basePath %>${shop.imgUrl2 }"/>
												</td>
											</tr>
											</c:if>
											<c:if test="${shop.imgUrl3 != null}">
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
													</div>
												</td>
											</tr>
											<tr>
												<td align="right">已传图片：</td>
												<td align="center">
													<img width="400px" src="<%=basePath %>${shop.imgUrl3 }"/>
												</td>
											</tr>
											</c:if>
											<c:if test="${shop.imgUrl4 != null}">
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
													</div>
												</td>
											</tr>
											<tr>
												<td align="right">已传图片：</td>
												<td align="center">
													<img width="400px" src="<%=basePath %>${shop.imgUrl4 }"/>
												</td>
											</tr>
											</c:if>
											<c:if test="${shop.imgUrl5 != null}">
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
													</div>
												</td>
											</tr>
											<tr>
												<td align="right">已传图片：</td>
												<td align="center">
													<img width="400px" src="<%=basePath %>${shop.imgUrl5 }"/>
												</td>
											</tr>
											</c:if>
											<tr>
												<td align="right">
														&nbsp;&nbsp;审核状态：
												</td>
												<td  align="left">
													<input id="rid" type="hidden" name="shop.id" value="${shop.id }"/>
													<input id="authorId" type="hidden" name="shop.authorId" value="${shop.authorId }"/>
													<estateTag:select cssStyle="width:120px" id="auditingState" value="${shop.auditingState }" name="shop.auditingState" codeType="审核状态" headerKey="" headerValue="请选择" />
												</td>
											</tr>
											<tr>
												<td align="right">
														审核意见：
												</td>
												<td id="filter_ke" align="left">
														<textarea cols="60" rows="10" name="shop.auditingRemark" id="auditingRemark">${shop.auditingRemark}</textarea>
												</td>
											</tr>
											<tr>
												<th colspan="2" align="center">
													<input type="submit" value="保存">
												</th>
											</tr>
										</table>
										</form>
										</div>
    </td>
  </tr>
</table>
<iframe name="tempF" style="display: none"></iframe>
   </div>
  <script language="javascript">
  var basePath = '<%=basePath%>';
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
		</script>
  </body>
    
</html>
