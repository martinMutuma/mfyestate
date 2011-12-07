<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="estateTag" prefix="estateTag" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
<link rel="stylesheet" href="<%=basePath%>resource/css/whole.css" type="text/css"></link>
<link rel="stylesheet" href="<%=basePath%>resource/css/global.css" type="text/css"></link>
<link rel="stylesheet" href="<%=basePath%>resource/css/listShow.css" type="text/css"></link>
<link rel="stylesheet" href="<%=basePath%>resource/css/hbody.css" type="text/css"></link>
<link rel="stylesheet" href="<%=basePath%>resource/css/pagination2.css" type="text/css"></link>
<script type="text/javascript" src="<%=basePath%>resource/js/jquery-1.4.2.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=basePath%>resource/js/whole.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/js/search.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/js/pagination2.js"></script>
<script type="text/javascript" src="<%=basePath%>bulidShow.js"></script>
<script type="text/javascript" src="resource/js/hbody.js"></script>
<STYLE type="text/css">
	#searchPanel{
		height:180px;
		*height: 180px;
	}
	#searchPanel{
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
   				<table border="0" width="100%" style="margin-top: 5px;border-bottom: 1px dotted #CACACA;">
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
   							<span class="list_title"><a class="titleClick" href="javascript:showBulid('<s:property value="id"/>')"><s:property value="name"/></a>&nbsp;&nbsp;&nbsp;&nbsp;<img src="building/images/<s:property value="salesStatus"/>.gif"/></span>
   							<span class="list_content">区域：<s:property value="disname"/></span>
   							<span class="list_content">装修：<estateTag:convertCode codeType="装修程度" code="${fitCondition}"></estateTag:convertCode></span>
   							<span class="list_content">地址：<s:if test="address.length()>20"><s:property value="address.substring(0,20)"/>...</s:if><s:else><s:property value="address"/></s:else></span>
   							<span class="list_content">特色：<estateTag:convertCode codeType="项目特色" code="${features}"></estateTag:convertCode></span>
   							<span class="list_content">开盘日期：<s:date name="openDate" format="yyyy-MM-dd"/>&nbsp;&nbsp;&nbsp;&nbsp;入住日期：<s:date name="checkDate" format="yyyy-MM-dd"/></span>
   						</td>
   						<td>
   							<span class="list_price">起价：<estateTag:format value="${minPrice}"></estateTag:format>元/㎡</span>
   							<span class="list_content"><a href="<%=basePath%>building/toBuidingInfo.shtml?id=<s:property value="id"/>#tuan"><img src="building/images/joi_t.gif" alt="参加看房团"/></a></span>
   							&nbsp;<span class="list_content"><a href="<%=basePath%>building/attention.shtml?id=<s:property value='id'/>&attentioncount=<s:property value="attentionNum"/>" title="关注该楼盘" rel="nofollow" target="tempF" ><img src="building/images/guan_z.gif" alt="关注楼盘" /></a></span>
   						</td>
   					</tr>
   				</table>
   				</s:iterator>
	   			<div id="pagenation" align="left">
	   				<input type="hidden" id="totalRecords" value="<s:property value="pu.totalRecords"/>"/>
	   				<input type="hidden" id="pageNo" value="<s:property value="pu.pageNo"/>"/>
	   				<input type="hidden" id="limit" value="20"/>
	   				<input type="hidden" id="uri" value=""/>
			   	</div>
   			</div>
   			<div class="list_ri" >
   				 <div id="attention" style="background: #ffffff;">
								<div class="guanzhu"></div>
								<div id="atBody" align="center">
								<ul>
									<s:iterator value="#attentionBulidList" status="sta">
										<s:if test="#sta.index == 0">
											<li id="atBody_s<s:property value="#sta.index"/>" style="height: 75px;line-height: 75px;">
												<table width="100%" height="75px" cellpadding="0" cellspacing="0" border="0">
													<tr>
														<td align="left"><font color="#FF0000" size="5px"><s:property value="#sta.index+1"/></font></td>
														<td>
														<img onclick="showBulid('<s:property value="id"/>')" src="<s:property value="compressUrl"/>" width="70px" height="60px"/>
														</td>
														<td>
															<span>&nbsp;<a class="bulidTile" href="javascript:showBulid('<s:property value="id"/>')"><s:property value="name"/></a></span>
															<span>&nbsp;<font class="fontcolor3">地区：<s:property value="disname"/></font></span>
															<span>&nbsp;<font class="fontcolor3">起价：<s:property value="minPrice"/> 元/㎡ </font></span>
														</td>
													</tr>
												</table>
											</li>
											<li id="atBody_t<s:property value="#sta.index"/>" class="selected_li">
											    <div style="width:110px;float:left">
											    <font color="#FF0000" size="3px"><s:property value="#sta.index+1"/></font>&nbsp;<s:property value="name"/> 
											    </div>
											    <div style="width:90px;float:right;padding-right:3px;">
											    <font class="fontcolor6">起价:<s:property value="minPrice"/>元/㎡</font>
											    </div>
											</li>
										</s:if>
										<s:else>
											<li id="atBody_s<s:property value="#sta.index"/>" class="selected_li" style="height: 75px;line-height: 75px;">
												<table width="100%" height="75px" cellpadding="0" cellspacing="0">
													<tr>
														<td align="left"><font color="#FF0000" size="5px"><s:property value="#sta.index+1"/></font></td>
														<td>
														<img src="<s:property value="compressUrl"/>" width="70px" height="60px"/>
														</td>
														<td>
															<span>&nbsp;<a class="bulidTile" href="javascript:showBulid('<s:property value="id"/>')"><s:property value="name"/></a></span><br/>
															<span>&nbsp;<font class="fontcolor3">地址：<s:property value="disname"/></font></span><br/>
															<span>&nbsp;<font class="fontcolor3">起价：</font><font class="prominentfont"><s:property value="minPrice"/> 元/㎡ </font></span><br/>
														</td>
													</tr>
												</table>
											</li>
											<li id="atBody_t<s:property value="#sta.index"/>">
												<div style="width:110px;float:left">
											    <font color="#FF0000" size="3px"><s:property value="#sta.index+1"/></font>&nbsp;<s:property value="name"/> 
											    </div>
											    <div style="width:90px;float:right;padding-right:3px;">
											         <font class="fontcolor6">起价:<s:property value="minPrice"/>元/㎡</font>
											    </div>
											</li>
										</s:else>
									</s:iterator>
								</ul>
								</div>
							</div>
   			</div>
   		</div>
   	</div>
   	<iframe name="tempF" style="display: none"></iframe>
   	<jsp:include page="copyright.jsp"></jsp:include>
   	</div>
  </body>
</html>
