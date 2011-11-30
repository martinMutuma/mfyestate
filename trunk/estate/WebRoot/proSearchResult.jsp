<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="estateTag" prefix="estateTag" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html><head><link rel="stylesheet" href="resource/css/search.css" type="text/css"></link></head>
  <body>
   	<div class="search_result">
   		<div class="search_result_list">
   			<div class="search_title_bg" align="left">
		   		<span  onclick="searchZj('0')" class="search_title_tab 
		   		<s:if test='selectedTab == "0"'>
		   			checked_title_tab
		   		</s:if>
		   		">全部房源</span>
		   		<span onclick="searchZj('1')"  class="search_title_tab 
		   		<s:if test='selectedTab == "1"'>
		   			checked_title_tab
		   		</s:if>
		   		" >中介房源</span>
		   		<span class="search_title_tab 
		   		<s:if test='selectedTab == "2"'>
		   			checked_title_tab
		   		</s:if>" onclick="searchZj('2')">非中介房源</span>
		   	</div>
		   	<div class="search_result_pro" align="left" id="proResult">
		   		<s:iterator value="pu.list">
		   			<div class="result_column">
		   				<div class="result_column_content">
		   					<div class="result_column_conten_img">
		   					<img style="position: absolute;" src="<%=basePath %><s:property value="compressUrl"/>" onclick="show('<s:property value="id"/>','<s:property value="searchPro"/>')" height="60px" width="80px"/>
		   					<img style="position: absolute;"
		   							<s:if test='flag=="1"'>
		   								src="<%=basePath %>resource/images/tag_rent.gif"
		   							</s:if>
		   							<s:else>
		   								src="<%=basePath %>resource/images/tag_resale.gif"
		   							</s:else>
		   					/>
		   					</div>
		   					<div class="result_column_conten_mes">
		   					<table align="center" border="0" cellpadding="0" height="100%" width="100%">
		   						<tr>
		   							<td align="left" width="35%">
		   								<a class="title_a" href="javascript:show('<s:property value="id"/>','<s:property value="searchPro"/>')"><s:property value="title"/></a><br/>
		   								<s:property value="address"/>
		   							</td>
		   							<td align="center" width="25%">
		   								<estateTag:format value="${pm}"></estateTag:format>元/平方米·天<br/>
		   								<estateTag:format value="${area}"></estateTag:format>平方米
		   							</td>
		   							<td align="center" width="25%">
		   								<s:if test='searchPro == "1"'>
		   									<font class="price_month"><estateTag:format value="${price}"></estateTag:format></font>元/月
		   								</s:if>
		   								<s:else>
		   									<font class="price_month"><estateTag:format value="${price}"></estateTag:format></font>万元/年
		   								</s:else>
		   							</td>
		   							<td align="center" width="15%">
		   								<s:property value="realName"/><br/>
		   								<s:date name="createtime" format="yyyy-MM-dd"/>
		   							</td>
		   						</tr>
		   					</table>
		   					</div>
		   				</div>
		   			</div>
		   		</s:iterator>
		   	</div>
		   	<div id="pagenation">
		   		<input type="hidden" id="totalRecords" value="<s:property value="pu.totalRecords"/>"/>
	   			<input type="hidden" id="pageNo" value="<s:property value="pu.pageNo"/>"/>
	   			<input type="hidden" id="limit" value="20"/>
	   			<input type="hidden" id="uri" value=""/>
		   		<!-- 共<s:property value="pu.totalRecords"/>条记录,
		   		当前显示第<s:property value="pu.pageNo"/>页，共<s:property value="pu.totalPages"/>页,
		   		<s:if test="pu.pageNo==1">
		   			第一页
		   		</s:if>
		   		<s:else>
		   			<a href="javascript:search1('1')">第一页</a>
		   		</s:else>
		   		<s:if test="pu.pageNo==1">
		   			上一页
		   		</s:if>
		   		<s:else>
		   			<a href="javascript:search1('<s:property value="pu.pageNo-1"/>')">上一页</a>
		   		</s:else>
		   		<s:if test="pu.pageNo==pu.totalPages">
		   			下一页
		   		</s:if>
		   		<s:else>
		   			<a href="javascript:search1('<s:property value="pu.pageNo+1"/>')">下一页</a>
		   		</s:else>
		   		<s:if test="pu.pageNo==pu.totalPages">
		   			最后页
		   		</s:if>
		   		<s:else>
		   			<a href="javascript:search1('<s:property value="pu.totalPages"/>')">最后页</a>
		   		</s:else> -->
		   	</div>
   		</div>
   		<div class="search_result_ad">
   			<img width="100%" height="100px"/>
   		<div id="p_center" >
   				<div id="xylHead" class="title_news ">
   					<s:if test='searchPro=="0"'>
   						写字楼需求
   					</s:if>
   					<s:elseif test='searchPro=="1"'>
   						商铺需求
   					</s:elseif>
   					<s:elseif test='searchPro=="2"'>
   						生意转让需求
   					</s:elseif>
   					<s:elseif test='searchPro=="3"'>
   						工业地产需求
   					</s:elseif>
   					<s:elseif test='searchPro=="4"'>
   						大型项目需求
   					</s:elseif>
   					<s:elseif test='searchPro=="5"'>
   						经纪人需求
   					</s:elseif>
   				</div>
   				<div class="h240">
											<div id="atBody" align="center">
									   <ul>
					 <s:iterator value="needList" status="sta">
											<li id="atBody_t<s:property value="#sta.index"/>">
												<span style="width:90px;text-align:left">&nbsp;<a href="javascript:showNeed('<s:property value="id"/>','<s:property value="searchPro"/>')">
									&#8226;&nbsp;<s:property value="title"/>
								</a>
								    </span>
											</li>
									</s:iterator>
								</ul>
   				</div>
   			</div>
   		</div>
   	</div>
  </body>
</html>
