<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="estateTag" prefix="estateTag" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
<link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>
<link rel="stylesheet" href="../resource/css/secondBulid.css" type="text/css"></link>
<script type="text/javascript" src="../resource/js/jquery-1.4.2.js" charset="utf-8"></script>
<script type="text/javascript" src="../resource/js/whole.js"></script>

</head>
  <body>
  	<jsp:include page="head.jsp"/>
  	<div style="width: 100%;" align="center">
  	<div class="l_loca">
    	<span class="left lo_le">您当前的位置：<a href="#">梦房园</a> <a href="#"><estateTag:convertCode codeType="导航" code="${menuIndex}"></estateTag:convertCode></a> <s:property value="tps.respDistrict"/></span>
    </div>
   		<div id="head" class="title stand_width split_height">
   			<table cellpadding="0" cellspacing="0" border="0" width="100%" height="100%">
   				<tr class="font1">
   					<td></td><td align="right">发布日期：<s:date name="tps.createDate" format="MM月dd日"/>&nbsp;&nbsp;&nbsp;&nbsp;更新日期：<s:date name="tps.updateDate" format="MM月dd日"/></td>
   				</tr>
   				<tr class="font2">
   					<td><s:property value="tps.title"/></td><td align="right">&nbsp;</td>
   				</tr>
   			</table>
   		</div>
   		<div class="stand_width split_height">
	   		<div id="contentLeft" align="left">
	   			<div class="leftDiv">
	   				<div class="jjrHead border_full"></div>
	   				<div class="jjrHead_bg">经纪人</div>
	   				<div class="jjrHead"><img class="she" src="../resource/images/she.gif"/></div>
	   				<div class="jjrH"></div>
	   				<div class="jjrBody border_full" align="center">
	   					<table cellpadding="0" width="90%" height="100%">
	   						<tr><td height="120px" align="center" valign="bottom">
	   							<img src="../imageFloder/<s:property value="baseinfo.headUrl"/>" height="110px"/>
	   						</td></tr>
	   						<tr><td>
	   							联&nbsp;系&nbsp;人：<s:property value="baseinfo.realName"/>
	   						</td></tr>
	   						<tr><td>
	   							免费咨询：<s:property value="tps.phone"/>
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
	   							<img src="../<s:property value="tps.sourceUrl"/>"/>
	   						</div>
	   						<div id="biImgList" align="center" style="display: none">
	   							<img /><img style="margin-left: 5px" /><img style="margin-left: 5px"/>
	   						</div>
	   						<div id="adds" align="center"><img src="../resource/images/adds.gif"/></div>
	   					</div>
	   					<div id="biRight">
	   						<table width="100%" cellspacing="0" border="0">
	   							<tr>
	   								<td width="50%">所属小区：<s:property value="tps.respDistrict"/></td>
	   								<td width="50%">区 域：<s:property value="tps.disname"/></td>
	   							</tr>
	   							<tr>
	   								<td colspan="2">售 价：<estateTag:format value='${tps.price}'></estateTag:format> 万元</td>
	   							</tr>
	   							<tr>
	   								<td colspan="2">单 价：<estateTag:format value='${tps.unitPrice}'></estateTag:format> 元/平方</td>
	   							</tr>
	   							<tr>
	   								<td>房 型：<s:property value="tps.home"/>房<s:property value="tps.hall"/>厅<s:property value="tps.bathroom"/>卫</td>
	   								<td>建筑面积：<estateTag:format value='${tps.consArea}'></estateTag:format> ㎡</td>
	   							</tr>
	   							<tr>
	   								<td>朝 向：<s:property value="tps.toward"/></td>
	   								<td>楼 层：<s:property value="tps.floor"/> 层/ 共<s:property value="tps.floorCount"/> 层</td>
	   							</tr>
	   							<tr>
	   								<td>建筑年代：<s:property value="tps.createTime"/>年</td>
	   								<td>房 龄：<s:property value="tps.age"/> 年</td>
	   							</tr>
	   							<tr>
	   								<td>装修状况：<s:property value="tps.fitCondition"/> </td>
	   								<td>家 具：<s:property value="tps.furniture"/></td>
	   							</tr>
	   							<tr>
	   								<td colspan="2">地址：<s:property value="tps.address"/></td>
	   							</tr>
	   							<tr>
	   								<td colspan="2">咨询电话：<s:property value="tps.phone"/></td>
	   							</tr>
	   						</table>
	   					</div>
	   				</div>
	   				<div align="right" id="content">
	   					<div class="instroduce" align="left">房源介绍</div>
	   					<div class="border_full instroduceContent" align="left"><s:property value="tps.introduction"/></div>
	   				</div>
	   				<div align="right" id="imageArea">
	   					<div class="instroduce" align="left">房源图片</div>
	   					<div class="border_full imageAreaContent" align="center">
	   						<s:iterator value="imgList">
	   							<img width="500px" src="../<s:property value="imgUrl"/>"/><br/>
	   							<font class="font1"><s:property value="imgName"/>(<a href="../<s:property value="imgUrl"/>" target="_blank">查看原图</a>)</font><br><br>
	   						</s:iterator>
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
   	<form id="" name="searchForm" action="search.shtml" method="post">
   	<s:hidden id="searchStatus" name="searchStatus"></s:hidden>
   	<s:hidden id="searchQuery" name="searchQuery"></s:hidden>
   	<s:hidden id="searchPro" name="searchPro"></s:hidden>
   	<s:hidden id="selectedTab" name="selectedTab"></s:hidden>
   	<s:hidden id="lptsValue" name="lpts"></s:hidden>
   </form>
  </body>
</html>
