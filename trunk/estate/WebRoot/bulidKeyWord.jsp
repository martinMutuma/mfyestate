<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="estateTag" prefix="estateTag" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
<link rel="stylesheet" href="resource/css/whole.css" type="text/css"></link>
<link rel="stylesheet" href="resource/css/global.css" type="text/css"></link>
<link rel="stylesheet" href="resource/css/listShow.css" type="text/css"></link>
<link rel="stylesheet" href="<%=basePath%>resource/css/pagination2.css" type="text/css"></link>
<script type="text/javascript" src="resource/js/jquery-1.4.2.js" charset="utf-8"></script>
<script type="text/javascript" src="resource/js/whole.js"></script>
<script type="text/javascript" src="resource/js/search.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/js/pagination2.js"></script>
<script type="text/javascript" src="<%=basePath%>bulidKeyWord.js"></script>
<script type="text/javascript" src="resource/js/hbody.js"></script>
<STYLE type="text/css">
	#searchPanel{
		height:180px;
		*height: 180px;
	}
	#searchPanel{
		margin-top: 15px;
		padding-top: 5px;
	}
	#searchPanel td{
		height: 35px;
	}
	.line{
		border-bottom:1px dotted #F1F1F1;
	}
</STYLE>
</head>
  <body>
  	<jsp:include page="head.jsp"/>
  	<div style="width: 100%;" align="center">
   	<div class="layoutTab">
   		<jsp:include page="bulidSenorSearch.jsp"></jsp:include>
   		<div id="resultPanel" class="layoutTab">
   			<div class="list_re" id="bulidListDiv">
   				<s:iterator value="pu.list">
   				<table border="0" width="100%" style="margin-top: 10px;border-bottom: 1px dotted #CACACA;">
   					<tr>
   						<td width="20%" align="center">
   							<div class="list_img_div" align="center">
   								<div class="img_div">
   									<img onclick="showBulid('<s:property value="id"/>')" src="<s:property value="compressUrl"/>">
   								</div>
   								<estateTag:convertCode codeType="楼盘类型" code="${buildingType}"></estateTag:convertCode>
   							</div>
   						</td>
   						<td width="50%">
   							<span class="list_title"><a class="titleClick" href="javascript:showBulid('<s:property value="id"/>')"><s:property value="name"/></a></span>
   							<span class="list_content">区域：<s:property value="disname"/></span>
   							<span class="list_content">装修：<estateTag:convertCode codeType="装修程度" code="${fitCondition}"></estateTag:convertCode></span>
   							<span class="list_content">地址：<s:property value="address"/></span>
   							<span class="list_content">特色：<estateTag:convertCode codeType="项目特色" code="${features}"/></span>
   							<span class="list_content">开盘日期：<s:date name="openDate" format="yyyy-MM-dd"/>&nbsp;&nbsp;入住日期：<s:date name="checkDate" format="yyyy-MM-dd"/></span>
   						</td>
   						<td>
   							<span class="list_price">起价：<s:property value='minPrice'/></span>
   							<span class="list_content"><a href="<%=basePath%>building/toBuidingInfo.shtml?id=<s:property value="id"/>#tuan"><img src="building/images/joi_t.gif" alt="参加看房团"/></a></span>
   							&nbsp;<span class="list_content"><a href="<%=basePath%>building/attention.shtml?id=<s:property value='id'/>&attentioncount=<s:property value="attentionNum"/>" title="关注该楼盘" rel="nofollow" target="tempF" ><img src="building/images/guan_z.gif" alt="关注楼盘" /></a></span>
   						</td>
   					</tr>
   				</table>
   				</s:iterator>
	   			<div id="pagenation">
	   				<input type="hidden" id="totalRecords" value="<s:property value="pu.totalRecords"/>"/>
	   				<input type="hidden" id="pageNo" value="<s:property value="pu.pageNo"/>"/>
	   				<input type="hidden" id="limit" value="20"/>
	   				<input type="hidden" id="uri" value=""/>
	   				<input type="hidden" id="keyword" value="<s:property value="#keyword"/>"/>
	   				<input type="hidden" id="proIndex" value="<s:property value="#proIndex"/>"/>
			   	</div>
   			</div>
   			<div class="list_ri">
   				<div id="attention">
					<div id="atHead">最受关注楼盘</div>
					<div id="atBody" align="center">
					<ul>
						<s:iterator value="#attentionBulidList" status="sta">
							<li><span onclick="showBulid('<s:property value="id"/>')"><font color="#FF0000" size="3px"><s:property value="#sta.index+1"/></font>&nbsp;<a href="#"><s:property value="name"/>(<s:property value="attentionNum"/>)</a></span></li>
						</s:iterator>
					</ul>
					</div>
				</div>
   			</div>
   		</div>
   	</div>
   	</div>
  </body>
</html>
