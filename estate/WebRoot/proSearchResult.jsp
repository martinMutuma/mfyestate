<%@ page language="java"  pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="estateTag" prefix="estateTag" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
	   		 </div>	
   		</div>
   			<div class="search_result_ad">
	   		   			<img width="100%" height="100px" src="resource/images/dican.gif"/>
			   			  <div class="p_center" >
										<div class="title_news"><font class="headtitle">&nbsp;&nbsp;<estateTag:convertCode codeType="置业类型" code="${searchPro}"></estateTag:convertCode>需求</font></div>
										<div class="atBody" align="center" >
															<ul>
															        <li style=" border-bottom: 0px; ">
																		<span style="width:100px;"><font class="fonthead">标题</font></span>
																	    <span style="width:45px;text-align:center"><font class="fonthead">区域</font></span>
																	    <span style="width:50px;text-align:center"><font class="fonthead">类型</font></span>
																	</li>
																	<s:iterator value="needList">
																			<li style=" border-bottom: 0px;">
																				<span style="width:100px;text-align:left"><a href="javascript:showNeed('<s:property value="id"/>','0')" title="<s:property value='title'/>"><s:property value="title"/></a></span>
																			    <span style="width:45px;text-align:center"><font class="fontcolor3"><s:property value="disname"/></font></span>
																			    <span style="width:50px;text-align:center" class="prominentfont"><estateTag:convertCode codeType="交易方式" code="${flag}"></estateTag:convertCode></span>
																			</li>
																	</s:iterator>
														     </ul>
										</div>
										
						 </div>
	   			</div>
   	</div>
