<%@ page language="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="estateTag" prefix="estateTag" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>修改大型项目信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="<%=basePath %>/resource/css/global.css" type="text/css"></link>
    <link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/default/easyui.css">
	<link rel="stylesheet" href="../resource/css/memberCenter/info.css" type="text/css"></link>
	<link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>
	<link rel="stylesheet" type="text/css" href="../resource/js/kindeditor/skins/default.css"></link>
	<script type="text/javascript" src="../resource/js/jquery-1.4.2.js"></script>
	<script type="text/javascript" src="../resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../resource/js/kindeditor/kindeditor.js"></script>
	<script type="text/javascript" src="../resource/js/whole.js"></script>
    <script type="text/javascript" src="<%=basePath %>pro/modifyproject.js"></script>
	<script type="text/javascript" src="../resource/js/googlemap.js"></script>		
  </head>      
   <body onunload="GUnload()">
    		<jsp:include page="../head.jsp"></jsp:include>
		<div style="width: 100%; margin-top: 10px;" align="center">
       		 <table width="100%" class="layoutTab">
			<tr>
				<td width="20%" align="left" valign="top"><jsp:include page="../left.jsp"></jsp:include></td>
				<td valign="top">
								<form enctype="multipart/form-data" method="post" action="../largePro/addPro.shtml" onsubmit="return checkpro()">
		  <div class="position" align="left" style="width:80%"><label>您所在的位置：</label><a href="../home.shtml">梦房园</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="../mem/baseinfo_mainPage.shtml">会员中心</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="../pro/manageproject.jsp?menuCls=15">大型项目管理</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;大型项目信息修改</div>
                                      <div class="info_top"></div><div class="info_mid">
				            <table width="710px;" border="0" cellpadding="1" cellspacing="1" id="modifyproject" >
							            <tr><th align="center" colspan="2"><b>修改大型项目信息  </b></th></tr>
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
														<input type="text" name="largePro.address" id="address" size="40" maxlength="30"  value="${largePro.address}">
												</td>
											</tr>
											<tr>
												<td align="right">
														交易方式:
												</td>
												<td>
														<select onchange="selectNeedFlag(this.value)" >
															<option ${largePro.flag eq 1?'selected' :''} value="1" >
																求租
															</option>
															<option ${largePro.flag eq 2?'selected' :''} value="2">
																求购
															</option>
															<option ${largePro.flag eq 3?'selected' :''} value="3">
																合作
															</option>
														</select>
												</td>
											</tr>
											<tr>
												<td align="right">
														<span id="moneyFlag"><c:if test='${largePro.flag eq "1"}'>租    金</c:if><c:if test='${largePro.flag eq "2"}'>售    价</c:if></span>:
												</td>
												<td>
														<input type="text" style="width: 80px" maxlength="5" onKeyUp="isNum(this)" value="${largePro.price }"
															id="price" name="largePro.price">
														<span id="payFlag"><c:if test='${largePro.flag eq "1"}'>元/月</c:if><c:if test='${largePro.flag eq "2"}'>万元</c:if></span>
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>建筑面积:
												</td>
												<td align="left">
													<input id="area"
														name="largePro.area" maxlength="5" style="width: 80px" onKeyUp="isNum(this)" value="${largePro.area }"  class="easyui-validatebox" required="true" missingMessage="建筑面积必填"/> 元/㎡·月
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>使用面积:
												</td>
												<td align="left">
													<input id="areauseful"
														name="largePro.areauseful" maxlength="5" style="width: 80px" onKeyUp="isNum(this)" value="${largePro.areauseful }"  class="easyui-validatebox" required="true" missingMessage="使用面积必填"/> 元/㎡·月
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>项目名称:
												</td>
												<td>
														<input type="text" size="40" name="largePro.title" value="${largePro.title}"
															id="title" maxlength="20" />
												</td>
											</tr>
											<tr>
												<td align="right">
														案源描述:
												</td>
												<td id="filter_ke" align="left">
														<textarea cols="60" rows="10" name="largePro.content" id="content">${largePro.content}</textarea>
												</td>
											</tr>
											<tr>
												<td align="right">
														地图坐标:
												</td>
												<td>
														<input type="text" id="jing" size="20"
															name="largePro.positionY" value="${largePro.positionY}">
														&nbsp;&nbsp;&nbsp;&nbsp;
														<input id="wei" type="text" name="largePro.positionX" value="${largePro.positionX}"
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
												<td>
														&nbsp;&nbsp;1.图片名称:
												</td>
												<td>
														<input type="text" name="largePro.imgName1" id="imgName1" value="${largePro.imgName1 }" maxlength="25"/>
														&nbsp; &nbsp; &nbsp;
														<estateTag:select cssStyle="width:80px" value="${largePro.imgType1==null?1:largePro.imgType1}" name="largePro.imgType1" id="imgType1" codeType="新房图片类型" />
														&nbsp; &nbsp; &nbsp;
														<input id="img1" type="file" name="imageFile1" />
												</td>
											</tr>
											<c:if test="${largePro.imgUrl1 != null}">
											<tr>
												<td align="right">已传图片：</td>
												<td align="center">
													<img width="400px" src="<%=basePath %>${largePro.imgUrl1 }"/>
												</td>
											</tr>
											</c:if>
											<tr>
												<td>
														&nbsp;&nbsp;2.图片名称:
												</td>
												<td>
														<input type="text" name="largePro.imgName2" id="imgName2" value="${largePro.imgName2 }" maxlength="25"/>
														&nbsp; &nbsp; &nbsp;
														<estateTag:select cssStyle="width:80px" value="${largePro.imgType2==null?2:largePro.imgType2}" name="largePro.imgType2" id="imgType2" codeType="新房图片类型" />
														&nbsp; &nbsp; &nbsp;
														<input id="img2" type="file" name="imageFile2" />
												</td>
											</tr>
											<c:if test="${largePro.imgUrl2 != null}">
											<tr>
												<td align="right">已传图片：</td>
												<td align="center">
													<img width="400px" src="<%=basePath %>${largePro.imgUrl2 }"/>
												</td>
											</tr>
											</c:if>
											<tr>
												<td>
														&nbsp;&nbsp;3.图片名称:
												</td>
												<td>
														<input type="text" name="largePro.imgName3" id="imgName3" value="${largePro.imgName3}" maxlength="25"/>
														&nbsp; &nbsp; &nbsp;
														<estateTag:select cssStyle="width:80px" value="${largePro.imgType3==null?3:largePro.imgType3}" name="largePro.imgType3" id="imgType3" codeType="新房图片类型" />
														&nbsp; &nbsp; &nbsp;
														<input id="img3" name="imageFile3" type="file" />
												</td>
											</tr>
											<c:if test="${largePro.imgUrl3 != null}">
											<tr>
												<td align="right">已传图片：</td>
												<td align="center">
													<img width="400px" src="<%=basePath %>${largePro.imgUrl3 }"/>
												</td>
											</tr>
											</c:if>
											<tr>
												<td>
														&nbsp;&nbsp;4.图片名称:
												</td>
												<td>
														<input type="text" name="largePro.imgName4" id="imgName4" value="${largePro.imgName4}" maxlength="25"/>
														&nbsp; &nbsp; &nbsp;
														<estateTag:select cssStyle="width:80px" value="${largePro.imgType4==null?4:largePro.imgType4}" name="largePro.imgType4" id="imgType4" codeType="新房图片类型" />
														&nbsp; &nbsp; &nbsp;
														<input id="img4" type="file" name="imageFile4" />
												</td>
											</tr>
											<c:if test="${largePro.imgUrl4 != null}">
											<tr>
												<td align="right">已传图片：</td>
												<td align="center">
													<img width="400px" src="<%=basePath %>${largePro.imgUrl4 }"/>
												</td>
											</tr>
											</c:if>
											<tr>
												<td>
														&nbsp;&nbsp;5.图片名称:
												</td>
												<td>
														<input type="text" name="largePro.imgName5" id="imgName5" value="${largePro.imgName5}" maxlength="25"/>
														&nbsp; &nbsp; &nbsp;
														<estateTag:select cssStyle="width:80px" value="${largePro.imgType5==null?5:largePro.imgType5}" name="largePro.imgType5" id="imgType5" codeType="新房图片类型" />
														&nbsp; &nbsp; &nbsp;
														<input id="img5" type="file" name="imageFile5" />
												</td>
											</tr>
											<c:if test="${largePro.imgUrl5 != null}">
											<tr>
												<td align="right">已传图片：</td>
												<td align="center">
													<img width="400px" src="<%=basePath %>${largePro.imgUrl5 }"/>
												</td>
											</tr>
											</c:if>
											<tr>
												<th colspan="2" align="center">
													<input type="hidden" name="largePro.flag" value="${largePro.flag }" id="largeProFlag">
													<input type="hidden" name="largePro.id" value="${largePro.id }"/>
													<input type="hidden" name="largePro.num" value="${largePro.num }"/>
												</th>
											</tr>
						              <tr><td colspan="2" align="center">
						              <input type="hidden" name="largePro.auditingState" value="0">
						                 <input  type="hidden"  name="id"   value="${largePro.id}">
						              <input type="submit" value="提交审核">
						              </td>
						              </tr>
						            </table>
						          	</div>
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
  </body>

   <script>
     var map;
     var geocoder = null; 
     var marker; 
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
		 <script src="http://maps.google.com/maps?file=api&v=2key=ABQIAAAAC1djgrWT1Mqz3gM4Ge3XlhSchlZ7_IhAROXTdJ5EzY4J4yl1FBSStZmm__B2dywWaRXMSi8G6C5QLw" type="text/javascript"></script>
</html>
