<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="estateTag" prefix="estateTag" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
<link rel="stylesheet" href="resource/css/search.css" type="text/css"></link>
</head>
  <body>
   	<div class="search_result">
   		<div class="search_result_list">
   			<div class="search_title_bg search_title_bellow" align="left">
		   		<span class="search_title_tab checked_title_tab">写字楼</span>
		   		<span class="search_title_tab" onclick="search_home('1','0')">写字楼出租</span>
		   		<span class="search_title_tab" onclick="search_home('2','0')">写字楼出售</span>
		   	</div>
		   	<div class="search_result_pro">
		   	 <s:iterator value="#data.officeList">
		   		<div class="home_result_column">
		   			<table cellspacing="5px" width="100%" border="0" height="100%">
		   				<tr>
		   					<td align="left" width="90px" valign="top">
		   						<img onclick="show('<s:property value="id"/>','0')" src="<%=basePath %><s:property value="compressUrl"/>" height="60px" alt="案源图片" width="80px">
		   						<img 
		   							<s:if test='flag=="1"'>
		   								src="<%=basePath %>resource/images/tag_rent.gif"
		   							</s:if>
		   							<s:else>
		   								src="<%=basePath %>resource/images/tag_resale.gif"
		   							</s:else>
		   						/>
		   					</td>
		   					<td align="left" width="140px">
   								<a class="title_a" href="javascript:show('<s:property value="id"/>','0')"><s:property value="title"/></a><br/>
   								<s:property value="address"/>
   							</td>
   							<td align="left">
   								<estateTag:format value="${propertyManagement}"/>元/平方米·天<br/>
	   							<estateTag:format value="${area}"/>平方米
   							</td>
		   				</tr>
		   			</table>
		   		</div>
		   	</s:iterator>
		   	</div>
		   	<div class="search_title_bg search_title_bellow" align="left">
		   		<span class="search_title_tab checked_title_tab">商铺</span>
		   		<span class="search_title_tab" onclick="search_home('1','1')">商铺出租</span>
		   		<span class="search_title_tab" onclick="search_home('2','1')">商铺出售</span>
		   	</div>
		   	<div class="search_result_pro" >
		   		 <s:iterator value="#data.shopList">
			   		<div class="home_result_column">
			   			<table cellspacing="5px" width="100%" border="0" height="100%">
			   				<tr>
			   					<td align="left" width="90px" valign="top">
			   						<img onclick="show('<s:property value="id"/>','1')" src="<%=basePath %><s:property value="compressUrl"/>" height="60px" alt="案源图片" width="80px">
			   						<img 
			   							<s:if test='flag=="1"'>
			   								src="<%=basePath %>resource/images/tag_rent.gif"
			   							</s:if>
			   							<s:else>
			   								src="<%=basePath %>resource/images/tag_resale.gif"
			   							</s:else>
			   						/>
			   					</td>
			   					<td align="left" width="140px">
	   								<a class="title_a" href="javascript:show('<s:property value="id"/>','1')"><s:property value="title"/></a><br/>
	   								<s:property value="address"/>
	   							</td>
	   							<td align="left">
	   								<estateTag:format value="${propertyManagement}"/>元/平方米·天<br/>
	   								<estateTag:format value="${area}"/>平方米
	   							</td>
			   				</tr>
			   			</table>
			   		</div>
			   	</s:iterator>	
		   	</div>
   		</div>
   		<div class="search_result_ad">
   			<img width="100%" height="100px"/>
   			  <div id="p_center" >
							<div class="title_news"><font class="headtitle">&nbsp;&nbsp;写字楼需求</font></div>
							<div class="atBody" align="center" >
												<ul>
												        <li style=" border-bottom: 0px; ">
															<span style="width:100px;"><font class="fonthead">标题</font></span>
														    <span style="width:45px;text-align:center"><font class="fonthead">区域</font></span>
														    <span style="width:50px;text-align:center"><font class="fonthead">类型</font></span>
														</li>
														<s:iterator value="#data.recommendSbList">
																<li style=" border-bottom: 0px;">
																	<span style="width:100px;text-align:left"><a href="javascript:tosecondBd('<s:property value="id"/>','3')" title="<s:property value='respDistrict'/>"><s:property value="respDistrict"/></a></span>
																    <span style="width:45px;text-align:center"><font class="fontcolor3"><s:property value="disname"/></font></span>
																    <span style="width:50px;text-align:center" class="prominentfont"><estateTag:format value='${price}'></estateTag:format></span>
																</li>
														</s:iterator>
											     </ul>
							</div>
							
			</div>
   			
   			<img width="100%" height="100px" style="margin-top: 15px;"/>
   			 <div id="p_center" >
											<div id="xylHead" class="title_news "><font class="headtitle">&nbsp;&nbsp;商铺需求</font></div>
											<div class="h240">
											<div id="atBody" align="center">
									   <ul>
									 <s:iterator value="#data.shopNeedList" status="sta">
											<li id="atBody_t<s:property value="#sta.index"/>">
												<span style="width:90px;text-align:left">&nbsp;<a href="javascript:showNeed('<s:property value="id"/>','1')">
									                    &#8226;&nbsp;<s:property value="title"/>
								     </a></span>
											</li>
									</s:iterator>
								</ul>
							</div>
							</div>
			</div>
   		</div>
   	</div>
  </body>
</html>
