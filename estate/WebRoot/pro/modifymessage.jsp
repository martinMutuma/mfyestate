<%@ page language="java" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
	<%@taglib prefix="s" uri="/struts-tags" %>
	<%@taglib uri="estateTag" prefix="estateTag" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>修改生意转让信息</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" href="../resource/css/global.css" type="text/css"></link>
        <link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/default/easyui.css">
	    <link rel="stylesheet" type="text/css" href="../resource/js/kindeditor/skins/default.css"></link>
	    <link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>
	    <link rel="stylesheet" href="../resource/css/memberCenter/info.css" type="text/css"></link>	
		<script type="text/javascript" src="../resource/js/jquery-1.4.2.js"></script>
       	<script type="text/javascript" src="../resource/js/jquery.easyui.min.js"></script>
	    <script type="text/javascript" src="../resource/js/whole.js"></script>
		<script type="text/javascript" src="<%=basePath%>pro/modifymessage.js"></script>
        <script type="text/javascript" src="../resource/js/kindeditor/kindeditor.js"></script>
	    <script type="text/javascript" src="../resource/js/googlemap.js"></script>
		<script type="text/javascript" src="../resource/js/My97DatePicker/WdatePicker.js"></script>
	</head>

	<body onunload="GUnload()">
		  <jsp:include page="../head.jsp"></jsp:include>
		<div style="width: 100%; margin-top: 10px;" align="center">
			<table width="100%" class="layoutTab">
				<tr>
					<td width="20%" align="left" valign="top"><jsp:include page="../left.jsp"></jsp:include></td>
					<td valign="top">
									<form name="form" method="post"
										action="../business/addBusiness.shtml" enctype="multipart/form-data"
										onsubmit="return checksendMessage()">
							<div class="position" align="left" style="width:80%"><label>您所在的位置：</label><a href="../home.shtml">梦房园</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="../mem/baseinfo_mainPage.shtml">会员中心</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="../pro/manageMessage.jsp?menuCls=13">生意转让管理</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;转让信息修改</div>
			                    <div class="info_top"></div>
			                    <div class="info_mid">					
										<table width="710px;" id="modifymessage" border="0" cellpadding="1" cellspacing="1">
											<tr>
												<th align="center" colspan="4">
													修改生意转让信息
												</th>
											</tr>
											<tr>
												<th align="left" colspan="4" class="title_info1" valign="bottom">
													一、填写基本信息（<font color="red">*</font> 为必填项）
												</th>
											</tr>
											<tr>
												<td align="left" colspan="4">
														<font color="red">*请选择行业类别</font>
											   </td>
											   <td colspan="3">
											   </td>
											</tr>
											<tr>   
											    <td colspan="4" >
											    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<input type="radio" name="business.category"
															${business.category eq 1?'checked' :''}  value="1"
															checked="checked">
														&nbsp;餐饮美食（包括中餐、西餐、小吃、咖啡、茶坊、熟食、面包房、快餐、奶茶铺）
											</td>
											</tr>
											<tr>   
											    <td colspan="4" >
											    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<input type="radio" name="business.category"
															${business.category eq 2?'checked' :''}  value="2">
														&nbsp;娱乐休闲（包括夜总会、酒吧、KTV歌城、足浴、桑拿、会所、健身中心、网吧、美容美发、游艺厅）
												 </td>
											</tr>
											<tr>   
											    <td colspan="4" >
											    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															
														<input type="radio" name="business.category"
															${business.category eq 3?'checked' :''}  value="3">
														&nbsp;百货零售（包括服装店、鞋店、超市、大卖场、便利店、医药房、婚纱店、母婴用品店、烟酒店、眼镜店、文具店）
												 </td>
											</tr>
											<tr>   
											    <td colspan="4" >
											    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<input type="radio" name="business.category"
															${business.category eq 4?'checked' :''}  value="4">
														&nbsp;公司工厂
												 </td>
											</tr>
											<tr>   
											    <td colspan="4" >
											    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<input type="radio" name="business.category"
															${business.category eq 5?'checked' :''}   value="5">
														 其他服务业（包括宾馆酒店、文化教育、洗衣清洁、维修配件、宠物、房产中介、打字复印、旅行社、人才中介、法律服务、养老院、摄影店、会计服务）
												 </td>
											</tr>
											<tr>
												<td  align="right">
														<font color="red">*</font>地区:
												</td>
												<td colspan="3">
													<input type="text" style="width:200px"  value="${business.disname }" id="districtShow"/>
													<input type="hidden" name="business.district" id="district" value="${business.district }"/>
													<input type="hidden" name="business.disname" id="disname" value="${business.disname }"/>
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>信息标题:
												</td>
												<td colspan="3">
														<input type="text" name="business.title" id="title" value="${business.title}"maxlength="50"
															size="50">
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>地址:
												</td>
												<td colspan="3">
														<input type="text" name="business.address" id="address"maxlength="50"
															value="${business.address}" size="50">
												</td>
											</tr>

											<tr>
												<td align="right">
														<font color="red">*</font>物业面积:
												</td>
												<td>
														<input type="text" size="10" name="business.area" value="${business.area==0.0?'':business.area}"maxlength="5"
															id="area" onKeyUp="isNum(this)">
														㎡
												</td>
												<td align="right" >
														<font color="red">*</font>转让价格:
												</td>
												<td >
														<input type="text" size="10" name="business.price" value="${business.price==0.0?'':business.price}"maxlength="5"
															id="price" onKeyUp="isNum(this)">
														万元
												</td>
											</tr>
											<tr>
												<td align="right" >
														<font color="red">*</font>房源持有状况:
												</td>
												<td>
														<input type="radio" value="1" ${business.state
															eq 1?'checked' :''} name="business.state" onclick="clickradio(this.value)"
															checked="checked">
														租赁 &nbsp;&nbsp;&nbsp;
														<input type="radio" value="2" ${business.state
															eq 2?'checked' :''} name="business.state" onclick="clickradio(this.value)">
														自有
															<br />
												</td>
												<td align="right">
														租金:
												</td>
												<td>
														<input type="text" name="business.propertyRent" value="${business.propertyRent==0.0?'':business.propertyRent}" 
															id="propertyRent" size="10" id="propertyRent" onKeyUp="isNum(this)" />
															元/月
												</td>
											</tr>
											<tr>
												<td align="right">
														租赁到期日:
												</td>
												<td>
														<input type="text" name="business.rentDate" id="rentDate"
																readonly="readonly" value="${business.createTimeString}" 
																onFocus="WdatePicker({firstDayOfWeek:7,dateFmt:'yyyy-MM-dd'})"
																class="Wdate" size="20"  />
												</td>
												<td align="right">
														租金付款方式:
												</td>
												<td>
														<estateTag:select cssStyle="width:120px" value="${business.payWay}" name="business.payWay" id="payWay" codeType="租赁支付方式" headerKey="" headerValue="请选择支付方式" />
												</td>
											</tr>	
											<tr>	
												<td align="right">
														租金递增状况:
												</td>
												<td colspan="3"> 
														<input type="text" name="business.rentState" value="${business.rentState}" id="rentState" size="20" maxlength="20"/>
												</td>
											</tr>
											<tr>
												<th colspan="4" align="center">
														&nbsp;
												</th>
											</tr>
											<tr>
												<td align="left" colspan="4" >
														<font color="red">*经营状况</font>
											   </td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>公司类型:
												</td>
												<td colspan="3">
														<input type="radio" name="business.companyType" id="geTi"
															value="1" ${business.companyType
															eq 1?'checked' :''} checked="checked">
														个体工商户
														<input name="business.companyType" value="2"
															${business.companyType eq 2?'checked' :''} type="radio">
														个人独资 （无限责任公司）
														<input name="business.companyType" ${business.companyType
															eq 3?'checked' :''} value="3" type="radio">
														国内合资
														<input name="business.companyType" ${business.companyType
															eq 4?'checked' :''} value="4" type="radio">
														中外合资
														<input name="business.companyType" ${business.companyType
															eq 5?'checked' :''} value="5" type="radio">
														外方独资
												</td>
											</tr>
											<tr>
											<tr>
												<td align="right">
														<font color="red">*</font>注册资金:
												</td>
												<td> 
														<input type="text" name="business.capital" value="${business.capital==0.0?'':business.capital}" size="8" maxlength="5"
															id="capital" onKeyUp="isNum(this)">
														万元
														<font color="red">(个体工商户可不填)</font>
												</td>
												<td align="right">
														转让股份:
												</td>
												<td>
														<input type="text" onKeyUp="isNum(this)" value="${business.shares==0.0?'':business.shares}" maxlength="5"
															name="business.shares" id="shares" size="8">
														%
												</td>
											</tr>
											<tr>
												<td align="right">
														经营范围:
												</td>
												<td >
														<input type="text" size="30" id="scope"  name="business.scope"maxlength="50" value="${business.scope}">
												</td>
												<td align="right">
														已经营年限:
												</td>
												<td>
														<input type="text" name="business.businessYear"
															onKeyUp="this.value=this.value.replace(/\D/g,'')" maxlength="4" value="${business.businessYear==0?'':business.businessYear}"
															size="8" id="businessYear">
														月
												</td>
											</tr>
											<tr>
												<td  align="right">
														过去一年营业额:
												</td>
												<td>
														<input
																name="business.businessturnover" id="businessturnover"maxlength="4" type="text" value="${business.businessturnover==0.0?'':business.businessturnover}"
																onKeyUp="isNum(this)" size="8">万元
												</td>
												<td  align="right">
														过去一年利润:
												</td>
												<td>
														 <input	type="text" size="8" id="businessprofits" name="business.businessprofits"maxlength="4"
																onKeyUp="isNum(this)" value="${business.businessprofits==0.0?'':business.businessprofits}">万元
												</td>

											</tr>
											<tr>
												<td  align="right">
														过去一年营业税:
												</td>
												<td>
														<input
																name="business.businessTax" id="businessTax" maxlength="4" type="text" value="${business.businessTax==0.0?'':business.businessTax}"
																onKeyUp="isNum(this)" size="8">万元
												</td>
												<td  align="right">
														过去一年所得税:
												</td>
												<td>
													<input type="text" onKeyUp="isNum(this)"
																name="business.incomeTax" id="incomeTax" size="8" maxlength="4" value="${business.incomeTax==0.0?'':business.incomeTax}">万元
												</td>

											</tr>
											<tr>
												<td align="right">
														是否会员制:
												</td>
												<td >
														<c:choose>
														<c:when test="${business.isMember eq null}">
															<label><input type="radio" id="isMemberF" name="business.isMember" value="2" checked="checked">否</label>
																<label><input type="radio" id="isMemberS" name="business.isMember" value="1">是</label>
																<span id="isMember_single" style="display: none">&nbsp;&nbsp;&nbsp;&nbsp;已有会员<input id="isMemberS" maxlength="2" name="business.members" value="${business.isMember}" style="width: 30px;">人</span>
														</c:when>
														<c:otherwise>
															<c:if test='${business.isMember eq "1"}'>
																<label><input type="radio" id="isMemberF" name="business.isMember" value="2">否</label>
																<label><input type="radio" id="isMemberS" name="business.isMember" value="1" checked="checked">是</label>
																<span id="isMember_single" >&nbsp;&nbsp;&nbsp;&nbsp;已有会员<input id="isMemberS" maxlength="2" name="business.members" value="${business.isMember}" style="width: 30px;">人</span>
															</c:if>
															<c:if test='${business.isMember eq "2"}'>
																<label><input type="radio" id="isMemberF" name="business.isMember" value="2" checked="checked">否</label>
																<label><input type="radio" id="isMemberS" name="business.isMember" value="1">是</label>
																<span id="isMember_single" style="display: none">&nbsp;&nbsp;&nbsp;&nbsp;已有会员<input id="isMemberS" maxlength="2" name="business.members" value="${business.isMember}" style="width: 30px;">人</span>
															</c:if>
														</c:otherwise>
													</c:choose>
												</td>
												<td align="right">
														雇员:
												</td>
												<td>
														<input type="text" name="business.employees" maxlength="4" onKeyUp="this.value=this.value.replace(/\D/g,'')" value="${business.employees==0?'':business.employees}" size="8">人
												</td>
											</tr>
											
											<tr>
												<td align="right">
														案源描述：
												</td>
												<td colspan="3" id="filter_ke" align="left">
														<textarea cols="57" rows="20" name="business.content" id="content"> ${business.content}</textarea>
												</td>
											</tr>
											<tr>
												<td align="right">
														地图坐标:
												</td>
												<td colspan="3">
														<input type="text" id="jing" size="20" readonly="readonly" value="${business.positionY}" 
															name="business.positionY">
														&nbsp;&nbsp;&nbsp;&nbsp;
														<input id="wei" readonly="readonly" type="text"
															name="business.positionX" value="${business.positionX}" size="20">
														<font color="red">(在地图上双击鼠标左键标注案源位置 )</font>
												</td>
											</tr>
											<tr>
											 <td align="right">
													根据地区定位:
												</td>
												<td colspan="3">
													<input id="addressText" name="business.addressName" style="width: 290px" type="text"/>
													<input type="button" onclick="goAddress()" value="定位"/>
												</td>
											</tr>
											<tr>
												<td colspan="4" align="center">
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
												<td colspan="3">
														<input type="text" name="business.imgName1" id="imgName1" value="${business.imgName1 }" maxlength="25"/>
														&nbsp; &nbsp; &nbsp;
														<estateTag:select cssStyle="width:80px" value="${business.imgType1==null?1:business.imgType1}" name="business.imgType1" id="imgType1" codeType="新房图片类型" />
														&nbsp; &nbsp; &nbsp;
														<input id="img1" type="file" name="imageFile1" />
												</td>
											</tr>
											<c:if test="${business.imgUrl1 != null}">
											<tr>
												<td align="right">已传图片：</td>
												<td align="center" colspan="3">
													<img width="400px" src="<%=basePath %>${business.imgUrl1 }"/>
												</td>
											</tr>
											</c:if>
											<tr>
												<td>
														&nbsp;&nbsp;2.图片名称:
												</td>
												<td colspan="3">
														<input type="text" name="business.imgName2" id="imgName2" value="${business.imgName2 }" maxlength="25"/>
														&nbsp; &nbsp; &nbsp;
														<estateTag:select cssStyle="width:80px" value="${business.imgType2==null?2:business.imgType2}" name="business.imgType2" id="imgType2" codeType="新房图片类型" />
														&nbsp; &nbsp; &nbsp;
														<input id="img2" type="file" name="imageFile2" />
												</td>
											</tr>
											<c:if test="${business.imgUrl2 != null}">
											<tr>
												<td align="right">已传图片：</td>
												<td align="center" colspan="3">
													<img width="400px" src="<%=basePath %>${business.imgUrl2 }"/>
												</td>
											</tr>
											</c:if>
											<tr>
												<td>
														&nbsp;&nbsp;3.图片名称:
												</td>
												<td colspan="3">
														<input type="text" name="business.imgName3" id="imgName3" value="${business.imgName3}" maxlength="25"/>
														&nbsp; &nbsp; &nbsp;
														<estateTag:select cssStyle="width:80px" value="${business.imgType3==null?3:business.imgType3}" name="business.imgType3" id="imgType3" codeType="新房图片类型" />
														&nbsp; &nbsp; &nbsp;
														<input id="img3" name="imageFile3" type="file" />
												</td>
											</tr>
											<c:if test="${business.imgUrl3 != null}">
											<tr>
												<td align="right">已传图片：</td>
												<td align="center" colspan="3">
													<img width="400px" src="<%=basePath %>${business.imgUrl3 }"/>
												</td>
											</tr>
											</c:if>
											<tr>
												<td>
														&nbsp;&nbsp;4.图片名称:
												</td>
												<td colspan="3">
														<input type="text" name="business.imgName4" id="imgName4" value="${business.imgName4}" maxlength="25"/>
														&nbsp; &nbsp; &nbsp;
														<estateTag:select cssStyle="width:80px" value="${business.imgType4==null?4:business.imgType4}" name="business.imgType4" id="imgType4" codeType="新房图片类型" />
														&nbsp; &nbsp; &nbsp;
														<input id="img4" type="file" name="imageFile4" />
												</td>
											</tr>
											<c:if test="${business.imgUrl4 != null}">
											<tr>
												<td align="right">已传图片：</td>
												<td align="center" colspan="3">
													<img width="400px" src="<%=basePath %>${business.imgUrl4 }"/>
												</td>
											</tr>
											</c:if>
											<tr>
												<td>
														&nbsp;&nbsp;5.图片名称:
												</td>
												<td colspan="3">
														<input type="text" name="business.imgName5" id="imgName5" value="${business.imgName5}" maxlength="25"/>
														&nbsp; &nbsp; &nbsp;
														<estateTag:select cssStyle="width:80px" value="${business.imgType5==null?5:business.imgType5}" name="business.imgType5" id="imgType5" codeType="新房图片类型" />
														&nbsp; &nbsp; &nbsp;
														<input id="img5" type="file" name="imageFile5" />
												</td>
											</tr>
											<c:if test="${business.imgUrl5 != null}">
											<tr>
												<td align="right">已传图片：</td>
												<td align="center" colspan="3">
													<img width="400px" src="<%=basePath %>${business.imgUrl5 }"/>
												</td>
											</tr>
											</c:if>
											<tr>
												<td colspan="4" align="center">
													<input type="hidden" name="business.id" value="${business.id }"/>
													<input type="hidden" name="business.authorId" value="${business.authorId}"/>
													<input type="hidden" name="business.num" value="${business.num}"/>
													<input type="hidden" name="business.auditingState" value="0"/>
													<input id="menuCls" type="hidden" value="${menuCls}"/>
													<input type="submit" value="提交发布"/>
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
	<script src="http://maps.google.com/maps?file=api&v=2key=ABQIAAAAC1djgrWT1Mqz3gM4Ge3XlhSchlZ7_IhAROXTdJ5EzY4J4yl1FBSStZmm__B2dywWaRXMSi8G6C5QLw" type="text/javascript"></script>
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
			var state= '<s:property value="#request.business.state"/>';
		</script>
</html>
