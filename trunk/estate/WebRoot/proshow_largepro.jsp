<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="estateTag" prefix="estateTag" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
<link rel="stylesheet" href="<%=basePath %>resource/css/whole.css" type="text/css"></link>
<link rel="stylesheet" href="<%=basePath %>resource/css/secondBulid.css" type="text/css"></link>
<script type="text/javascript" src="<%=basePath %>resource/js/jquery-1.4.2.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=basePath %>resource/js/whole.js"></script>
<script type="text/javascript" src="<%=basePath %>resource/js/googlemap.js"></script>
<script type="text/javascript" src="<%=basePath %>proShow.js"></script>
</head>
  <body  onload="load()" onunload="GUnload()">
  	<jsp:include page="head.jsp"/>
  	<div style="width: 100%;" align="center">
  	    <div class="l_loca">
    	<span class="left lo_le">您当前的位置：<a href="home.shtml">梦房园</a>&nbsp;&gt;&gt;&nbsp;<a href="search.shtml?searchPro=4"><estateTag:convertCode codeType="导航" code="${menuIndex}"></estateTag:convertCode></a>&nbsp;&gt;&gt;&nbsp;<s:property value="dataMap.title"/></span>
       </div>
   		<div id="head" class="title stand_width split_height">
   			<table cellpadding="0" cellspacing="0" border="0" width="100%" height="100%">
   				<tr class="font1">
   					<td></td><td align="right">发布日期：<s:date name="dataMap.createTime" format="MM月dd日"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
   				</tr>
   				<tr class="font2">
   					<td>&nbsp;&nbsp;<s:property value="dataMap.title"/></td><td align="right">&nbsp;</td>
   				</tr>
   			</table>
   		</div>
   		<div class="stand_width split_height">
	   		<div id="contentLeft" align="left">
	   			<div class="leftDiv">
	   				<div class="jjrHead border_full"></div>
	   				<div class="jjrHead_bg">经纪人</div>
	   				<div class="jjrHead"><img onclick="javascript:window.location.href='<%=basePath%>mem/baseinfo_toMyStore.shtml?authorId=<s:property value="dataMap.mid"/>&type=office'" title="点击进入他的店铺" class="she" src="<%=basePath %>resource/images/she.gif"/></div>
	   				<div class="jjrH"></div>
	   				<div class="jjrBody border_full" align="center">
	   					<table cellpadding="0" width="90%" height="100%">
	   						<tr><td height="120px" align="center" valign="bottom">
	   							<img src="<%=basePath %>imageFloder/<s:property value="dataMap.headurl"/>" height="110px"/>
	   						</td></tr>
	   						<tr><td>
	   							联&nbsp;系&nbsp;人：<s:property value="dataMap.realname"/>
	   						</td></tr>
	   						<tr><td>
	   							免费咨询：<s:property value="dataMap.tel"/>
	   						</td></tr>
	   					</table>
	   				</div>
	   			</div>
	   			<div class="leftDiv">
	   				<div class="">
	   					<div></div><div></div>
	   				</div>
	   				<div>
	   				</div>
	   			</div>
	   		</div>
	   		<div id="contentRight" align="right">
	   			<div class="rightDiv">
	   				<div id="baseinfo">
	   					<div id="biLeft">
	   						<div id="biImgDiv" align="center">
	   							<img src="<%=basePath %><s:property value="dataMap.compressUrl"/>"/>
	   						</div>
	   						<div id="biImgList" align="center" style="display: none">
	   							<img /><img style="margin-left: 5px" /><img style="margin-left: 5px"/>
	   						</div>
	   						<div id="adds" align="center"><img onclick="onAttion('<s:property value="dataMap.id"/>','<s:property value="dataMap.attentionNum"/>');" src="<%=basePath %>resource/images/adds.gif"/></div>
	   					</div>
	   					<div id="biRight">
	   						<table width="100%" cellspacing="0" border="0" cellpadding="0">
	   							<tr>
	   								<td valign="bottom" colspan="2">区&emsp;&emsp;域：<s:property value="dataMap.disname"/></td>	   								
	   							</tr>
	   							<tr>
	   								<td colspan="2" valign="bottom">地&emsp;&emsp;址：<s:property value="dataMap.address"/></td>
	   							</tr>
	   							<tr>
	   								<td valign="bottom">交易方式：<estateTag:convertCode codeType="交易方式" code="${dataMap.flag}"></estateTag:convertCode>  </td>
	   								<td valign="bottom"><s:if test='%{dataMap.flag=="1"}'>租金：<estateTag:format value="${dataMap.price}"/>元/月</s:if><s:else>售价：<estateTag:format value="${dataMap.price}"/>万元</s:else></td>
	   							</tr>
	   							<tr>
	   								<td valign="bottom">建筑面积：<estateTag:format value="${dataMap.area}"/>㎡</td>
	   								<td valign="bottom">使用面积：<estateTag:format value="${dataMap.areauseful}"/>㎡</td>
	   							</tr>
	   						</table>
	   					</div>
	   				</div>
	   				<div align="right" id="content">
	   					<div class="instroduce" align="left">房源介绍</div>
	   					<div class="border_full instroduceContent" align="left">${dataMap.content }</div>
	   				</div>
	   				<div align="right" id="mapArea">
	   					<div class="instroduce" align="left">地理位置</div>
	   					<div class="border_full instroduceContent" align="center">
	   						<div style="width: 95%; height: 250px" id="map"></div>
	   					</div>
	   				</div>
	   				<div align="right" id="imageArea">
	   					<div class="instroduce" align="left">房源图片</div>
	   					<div class="border_full imageAreaContent" align="center">
	   						<c:choose>
	   							<c:when test='${dataMap.imgUrl1 != null && dataMap.imgUrl1 != ""}'>
	   								<img width="500px" src="<%=basePath %><s:property value="dataMap.imgUrl1"/>"/><br/>
	   							<font class="font1"><s:property value="dataMap.imgName1"/>(<a href="<%=basePath %><s:property value="dataMap.imgUrl1"/>" target="_blank">查看原图</a>)</font><br><br>
	   							</c:when>
	   						</c:choose>
	   						<c:choose>
	   							<c:when test='${dataMap.imgUrl2 != null && dataMap.imgUrl2 != ""}'>
	   								<img width="500px" src="<%=basePath %><s:property value="dataMap.imgUrl2"/>"/><br/>
	   							<font class="font1"><s:property value="dataMap.imgName2"/>(<a href="<%=basePath %><s:property value="dataMap.imgUrl2"/>" target="_blank">查看原图</a>)</font><br><br>
	   							</c:when>
	   						</c:choose>
	   						<c:choose>
	   							<c:when test='${dataMap.imgUrl3 != null && dataMap.imgUrl3 != ""}'>
	   								<img width="500px" src="<%=basePath %><s:property value="dataMap.imgUrl3"/>"/><br/>
	   							<font class="font1"><s:property value="dataMap.imgName3"/>(<a href="<%=basePath %><s:property value="dataMap.imgUrl3"/>" target="_blank">查看原图</a>)</font><br><br>
	   							</c:when>
	   						</c:choose>
	   						<c:choose>
	   							<c:when test='${dataMap.imgUrl4 != null && dataMap.imgUrl4 != ""}'>
	   								<img width="500px" src="<%=basePath %><s:property value="dataMap.imgUrl4"/>"/><br/>
	   							<font class="font1"><s:property value="dataMap.imgName4"/>(<a href="<%=basePath %><s:property value="dataMap.imgUrl4"/>" target="_blank">查看原图</a>)</font><br><br>
	   							</c:when>
	   						</c:choose>
	   						<c:choose>
	   							<c:when test='${dataMap.imgUrl5 != null && dataMap.imgUrl5 != ""}'>
	   								<img width="500px" src="<%=basePath %><s:property value="dataMap.imgUrl5"/>"/><br/>
	   							<font class="font1"><s:property value="dataMap.imgName5"/>(<a href="<%=basePath %><s:property value="dataMap.imgUrl5"/>" target="_blank">查看原图</a>)</font><br><br>
	   							</c:when>
	   						</c:choose>
	   					</div>
	   					<br/>
	   				</div>
	   			</div>
	   		</div>
   		</div>
   			<div style="padding-top: 15px;text-algin:center;">
		<jsp:include page="copyright.jsp"/>
	</div>
   	</div>
   	<input type="hidden" id="mapX" value="${dataMap.positionX}"/>
   	<input type="hidden" id="mapY" value="${dataMap.positionY}"/>
  </body>
  <script src="http://maps.google.com/maps?file=api&v=2&key=ABQIAAAAC1djgrWT1Mqz3gM4Ge3XlhSchlZ7_IhAROXTdJ5EzY4J4yl1FBSStZmm__B2dywWaRXMSi8G6C5QLw"  type="text/javascript"></script>
</html>
