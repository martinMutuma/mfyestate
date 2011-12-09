<%@ page language="java" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
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


		<title>发布生意转让信息</title>

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
		<script type="text/javascript" src="sendMessage.js"></script>
	    <script type="text/javascript" src="../resource/js/kindeditor/kindeditor.js"></script>
	    <script type="text/javascript" src="../resource/js/whole.js"></script>
		<script type="text/javascript" src="../resource/js/My97DatePicker/WdatePicker.js"></script>	
	    <script type="text/javascript" src="../resource/js/googlemap.js"></script>
	</head>

	<body onunload="GUnload()">
						<jsp:include page="../head.jsp"></jsp:include>
		<div style="width: 100%;margin-top: 10px;" align="center">
			<table width="100%" class="layoutTab">
				<tr>
					<td width="20%" align="left" valign="top"><jsp:include page="../left.jsp"></jsp:include></td>
					<td valign="top">
									<form name="form" method="post" enctype="multipart/form-data"
										action="../business/addBusiness.shtml"
										onsubmit="return checksendMessage()">
									 <div class="position" align="left" style="width:80%"><label>您所在的位置：</label><a href="../home.shtml">梦房园</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="../mem/baseinfo_mainPage.shtml">会员中心</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="manageMessage.jsp?menuCls=13">生意转让管理</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="sendMessage.jsp">发布生意转让信息</a></div>
					                  <div class="info_top"></div><div class="info_mid">		
										<table width="710px;" id="sendMessage" border="0" cellpadding="1" cellspacing="1">
											<tr>
												<th align="center" colspan="4">
													发布生意转让信息
												</th>
											</tr>
											<tr>
												<th align="left" colspan="4" class="title_info1" valign="bottom">
													一、填写基本信息（<font color="red">*</font> 为必填项）
												</th>
											</tr>
											<tr>
												<td align="left" colspan="4" >
														<font color="red">*请选择行业类别</font>
											   </td>
											</tr>
											<tr>   
											    <td colspan="4" >
											    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<input type="radio" name="business.category" value="1"
															checked="checked">
												餐饮美食（包括中餐、西餐、小吃、咖啡、茶坊、熟食、面包房、快餐、奶茶铺）
												 </td>
											</tr>
											<tr>   
											    <td colspan="4" >
											    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<input type="radio" name="business.category" value="2">
												娱乐休闲（包括夜总会、酒吧、KTV歌城、足浴、桑拿、会所、健身中心、网吧、美容美发、游艺厅）
												 </td>
											</tr>
											<tr>   
											    <td colspan="4" >
											    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<input type="radio" name="business.category" value="3">
												百货零售（包括服装店、鞋店、超市、大卖场、便利店、医药房、婚纱店、母婴用品店、烟酒店、眼镜店、文具店）
												 </td>
											</tr>
											<tr>   
											    <td colspan="4" >
											    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<input type="radio" name="business.category" value="4">
												公司工厂
												 </td>
											</tr>
											<tr>   
											    <td colspan="4" >
											    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<input type="radio" name="business.category" value="5">
												 其他服务业（包括宾馆酒店、文化教育、洗衣清洁、维修配件、宠物、房产中介、打字复印、旅行社、人才中介、法律服务、养老院、摄影店、会计服务）
												 </td>
											</tr>
										
											<tr>
												<td  align="right">
														<font color="red">*</font>地  区:
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
														<input type="text" name=" business.title" id="title" maxlength="50"
															size="50">
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>地址:
												</td>
												<td colspan="3">
														<input type="text" name="business.address" id="address"
															size="50" maxlength="50">
												</td>
											</tr>

											<tr>
												<td align="right">
														<font color="red">*</font>物业面积:
												</td>
												<td>
														<input type="text" size="10" name="business.area"maxlength="5"
															id="area" onKeyUp="isNum(this)">
														㎡
												</td>
												<td align="right" >
														<font color="red">*</font>转让价格:
												</td>
												<td >
														<input type="text" size="10" name="business.price"maxlength="5"
															id="price" onKeyUp="isNum(this)">
														万元
												</td>
											</tr>
											<tr>
												<td align="right" >
														<font color="red">*</font>房源持有状况:
												</td>
												<td>
														<input type="radio" value="1" name="business.state"
															checked="checked">
														租赁 &nbsp;&nbsp;&nbsp;
														<input type="radio" value="2" name="business.state">
														自有
														<br />
												</td>
												<td align="right">
														租金:
												</td>
												<td>
														<input type="text" name="business.propertyRent"maxlength="5"
																size="10" id="propertyRent" onKeyUp="isNum(this)" />
															元/月
												</td>
											</tr>
											<tr>
												<td align="right">
														租赁到期日:
												</td>
												<td>
														<input type="text" name="business.rentDate"
																readonly="readonly"
																onFocus="WdatePicker({firstDayOfWeek:7,dateFmt:'yyyy-MM-dd'})"
																class="Wdate" size="20">
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
														<input type="text" name="business.rentState" id="rentState" size="20" maxlength="20" />
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
															value="1" checked="checked">
														个体工商户
														<input name="business.companyType" value="2" type="radio">
														个人独资 （无限责任公司）
														<input name="business.companyType" value="3" type="radio">
														国内合资
														<input name="business.companyType" value="4" type="radio">
														中外合资
														<input name="business.companyType" value="5" type="radio">
														外方独资
												</td>
											</tr>
											<tr>
											<tr>
												<td align="right">
														<font color="red">*</font>注册资金:
												</td>
												<td> 
														<input type="text" name="business.capital" size="8"maxlength="5"maxlength="5"
															id="capital" onKeyUp="isNum(this)">
														万元
														<font color="red">(个体工商户可不填)</font>
												</td>
												<td align="right">
														转让股份:
												</td>
												<td>
														<input type="text" onKeyUp="isNum(this)"maxlength="5"
															name="business.shares" id="shares"  size="8">
														%
												</td>
											</tr>
											<tr>
												<td align="right">
														经营范围:
												</td>
												<td >
														<input type="text" size="30" id="scope" maxlength="50" name="business.scope">
												</td>
												<td align="right">
														已经营年限:
												</td>
												<td>
														<input type="text" maxlength="2"  name="business.businessYear"
															onKeyUp="this.value=this.value.replace(/\D/g,'')"
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
																name="business.businessturnover" id="businessturnover" type="text"maxlength="5"
																onKeyUp="isNum(this)" size="8">万元
												</td>
												<td  align="right">
														过去一年利润:
												</td>
												<td>
														 <input	type="text" size="8" id="businessprofits" name="business.businessprofits"maxlength="5"
																onKeyUp="isNum(this)">万元
												</td>

											</tr>
											<tr>
												<td  align="right">
														过去一年营业税:
												</td>
												<td>
														<input
																name="business.businessTax" id="businessTax"  type="text"maxlength="5"
																onKeyUp="isNum(this)" size="8">万元
												</td>
												<td  align="right">
														过去一年所得税:
												</td>
												<td>
													<input type="text" onKeyUp="isNum(this)"
																name="business.incomeTax" id="incomeTax"maxlength="5" size="8">万元
												</td>

											</tr>
											<tr>
												<td align="right">
														是否会员制:
												</td>
												<td>
													<c:choose>
														<c:when test="${business.isMember eq null}">
															<label><input type="radio" id="isMemberF" name="business.isMember" value="2" checked="checked">否</label>
																<label><input type="radio" id="isMemberS" name="business.isMember" value="1">是</label>
																<span id="isMember_single" style="display: none">&nbsp;&nbsp;&nbsp;&nbsp;已有会员<input id="isMemberS" maxlength="2" name="business.members" value="${business.members}" style="width: 30px;">人</span>
														</c:when>
														<c:otherwise>
															<c:if test='${business.isMember eq "1"}'>
																<label><input type="radio" id="isMemberF" name="business.isMember" value="2">否</label>
																<label><input type="radio" id="isMemberS" name="business.isMember" value="1" checked="checked">是</label>
																<span id="isMember_single" >&nbsp;&nbsp;&nbsp;&nbsp;已有会员<input id="isMemberS" maxlength="2" name="business.members" value="${business.members}" style="width: 30px;">人</span>
															</c:if>
															<c:if test='${business.isMember eq "2"}'>
																<label><input type="radio" id="isMemberF" name="business.isMember" value="2" checked="checked">否</label>
																<label><input type="radio" id="isMemberS" name="business.isMember" value="1">是</label>
																<span id="isMember_single" style="display: none">&nbsp;&nbsp;&nbsp;&nbsp;已有会员<input id="isMemberS" maxlength="2" name="business.members" value="${business.members}" style="width: 30px;">人</span>
															</c:if>
														</c:otherwise>
													</c:choose>
												</td>
												<td align="right">
														雇员:
												</td>
												<td>
														<input type="text" name="business.employees" maxlength="4" onKeyUp="this.value=this.value.replace(/\D/g,'')" size="8">人
												</td>
											</tr>
											
											<tr>
												<td align="right">
														案源描述：
												</td>
												<td colspan="3" id="filter_ke" align="left">
														<textarea cols="60" rows="20" name="business.content" id="content"></textarea>
												</td>
											</tr>
											<tr>
												<td align="right">
														地图坐标:
												</td>
												<td colspan="3">
														<input type="text" id="jing" size="20" readonly="readonly"
															name="business.positionY">
														&nbsp;&nbsp;&nbsp;&nbsp;
														<input id="wei" readonly="readonly" type="text"
															name="business.positionX" size="20">
														<font color="red">(在地图上双击鼠标左键标注案源位置 )</font>
												</td>
											</tr>
											<tr>
												<td align="right">
														地理位置:
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
											<tr>
												<th align="left" colspan="4" class="title_info1" valign="bottom">
													二、上传案源图片(<font color="red">说明：单张图片不大于500k,如果大于500k请修改后上传。</font>)
												</th>
											</tr>
											<tr>
												<td align="right">
														1.图片名称:
												</td>
												<td colspan="3">
														<input type="text" name="business.imgName1" id="imgName1" />
														&nbsp; &nbsp; &nbsp;
														<estateTag:select cssStyle="width:80px" value="1" name="business.imgType1" id="imgType1" codeType="新房图片类型" />
														&nbsp; &nbsp; &nbsp;
														<input id="img1" type="file" name="imageFile1" />
												</td>
											</tr>
											<tr>
												<td align="right">
														2.图片名称:
												</td>
												<td colspan="3">
														<input type="text" name="business.imgName2" id="imgName2" />
														&nbsp; &nbsp; &nbsp;
														<estateTag:select cssStyle="width:80px" value="2" name="business.imgType2" id="imgType2" codeType="新房图片类型" />
														&nbsp; &nbsp; &nbsp;
														<input id="img2" type="file" name="imageFile2" />
												</td>
											</tr>
											<tr>
												<td align="right">
														3.图片名称:
												</td>
												<td colspan="3">
														<input type="text" name="business.imgName3" id="imgName3" />
														&nbsp; &nbsp; &nbsp;
														<estateTag:select cssStyle="width:80px" value="3" name="business.imgType3" id="imgType3" codeType="新房图片类型" />
														&nbsp; &nbsp; &nbsp;
														<input id="img3" name="imageFile3" type="file" />
												</td>
											</tr>
											<tr>
												<td align="right">
														4.图片名称:
												</td>
												<td colspan="3">
														<input type="text" name="business.imgName4" id="imgName4" />
														&nbsp; &nbsp; &nbsp;
														<estateTag:select cssStyle="width:80px" value="4" name="business.imgType4" id="imgType4" codeType="新房图片类型" />
														&nbsp; &nbsp; &nbsp;
														<input id="img4" type="file" name="imageFile4" />
												</td>
											</tr>
											<tr>
												<td align="right">
														5.图片名称:
												</td>
												<td colspan="3">
														<input type="text" name="business.imgName5" id="imgName5" />
														&nbsp; &nbsp; &nbsp;
														<estateTag:select cssStyle="width:80px" value="5" name="business.imgType5" id="imgType5" codeType="新房图片类型" />
														&nbsp; &nbsp; &nbsp;
														<input id="img5" type="file" name="imageFile5" />
												</td>
											</tr>
											<tr>
												<td colspan="4" align="center">
													<input id="menuCls" type="hidden" value="<%=menuCls %>">
													<input type="hidden" name="business.auditingState" value="0"/>
													<input type="submit" value="提交发布">
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
		<script language="javascript">
			var map;
			var geocoder = null; 
			var marker; 
		</script>
	<script src="http://maps.google.com/maps?file=api&v=2key=ABQIAAAAC1djgrWT1Mqz3gM4Ge3XlhSchlZ7_IhAROXTdJ5EzY4J4yl1FBSStZmm__B2dywWaRXMSi8G6C5QLw" type="text/javascript"></script>
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
