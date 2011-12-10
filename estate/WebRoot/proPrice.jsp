<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

   	<div class="search_result">
   		<div class="search_result_list">
   			<div class="search_title_bg" align="left">
		   		<span class="search_title_tab 
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
		   					<img style="position: absolute;" src="<%=basePath %><s:property value="compressurl"/>" onclick="show('<s:property value="id"/>','<s:property value="searchPro"/>')" height="60px" width="80px"/>
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
		   								<s:property value="pm"/>元/平方米·天<br/>
		   								<s:property value="area"/>平方米
		   							</td>
		   							<td align="center" width="25%">
		   								<s:if test='searchPro == "1"'>
		   									<font class="price_month"><s:property value="price"/></font>元/月
		   								</s:if>
		   								<s:else>
		   									<font class="price_month"><s:property value="price"/></font>万元/年
		   								</s:else>
		   							</td>
		   							<td align="center" width="15%">
		   								<s:property value="realname"/><br/>
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
	   				<input type="hidden" id="minValue" value="<s:property value="#minValue"/>">
	   				<input type="hidden" id="maxValue" value="<s:property value="#maxValue"/>">
	   				<input type="hidden" id="searchType" value="<s:property value="#searchType"/>">
	   				<input type="hidden" id="proType" value="<s:property value="#proType"/>">
		   		<!-- 共<s:property value="pu.totalRecords"/>条记录,
			   		当前显示第<s:property value="pu.pageNo"/>页，共<s:property value="pu.totalPages"/>页,
			   		<s:if test="pu.pageNo==1">
			   			第一页
			   		</s:if>
			   		<s:else>
			   			<a href="javascript:searchByPrice('<s:property value="#minValue"/>','<s:property value="#maxValue"/>','<s:property value="#searchType"/>','<s:property value="#proType"/>','1')">第一页</a>
			   		</s:else>
			   		<s:if test="pu.pageNo==1">
			   			上一页
			   		</s:if>
			   		<s:else>
			   			<a href="javascript:searchByPrice('<s:property value="#minValue"/>','<s:property value="#maxValue"/>','<s:property value="#searchType"/>','<s:property value="#proType"/>','<s:property value="pu.pageNo-1"/>')">上一页</a>
			   		</s:else>
			   		<s:if test="pu.pageNo==pu.totalPages">
			   			下一页
			   		</s:if>
			   		<s:else>
			   			<a href="javascript:searchByPrice('<s:property value="#minValue"/>','<s:property value="#maxValue"/>','<s:property value="#searchType"/>','<s:property value="#proType"/>','<s:property value="pu.pageNo+1"/>')">下一页</a>
			   		</s:else>
			   		<s:if test="pu.pageNo==pu.totalPages">
			   			最后页
			   		</s:if>
			   		<s:else>
			   			<a href="javascript:searchByPrice('<s:property value="#minValue"/>','<s:property value="#maxValue"/>','<s:property value="#searchType"/>','<s:property value="#proType"/>','<s:property value="pu.totalPages"/>')">最后页</a>
			   		</s:else>
			   		 -->
		   	</div>
   		</div>
   		<div class="search_result_ad">
   			<img width="100%" height="100px"/>
   			<div class="office_need">
   				<div class="need_title">
   					<s:if test='searchPro=="0"'>
   						写字楼
   					</s:if>
   					<s:elseif test='searchPro=="1"'>
   						商铺
   					</s:elseif>
   					<s:elseif test='searchPro=="2"'>
   						生意转让
   					</s:elseif>
   					<s:elseif test='searchPro=="3"'>
   						工业地产
   					</s:elseif>
   					<s:elseif test='searchPro=="4"'>
   						大型项目
   					</s:elseif>
   					<s:elseif test='searchPro=="5"'>
   						经纪人
   					</s:elseif>
   					需求
   				</div>
   				<div class="need_content">
   					<table width="95%">
					<s:iterator value="needList">
						<tr>
							<td height="28" align="left" class="btmborder" style="line-height:28px;overflow:hidden; text-overflow:ellipsis;white-space:nowrap;">
								<a href="javascript:showNeed('<s:property value="id"/>','<s:property value="searchPro"/>')">
									&#8226;&nbsp;<s:property value="title"/>
								</a>
							</td>
						</tr>
					</s:iterator>
					</table>
   				</div>
   			</div>
   		</div>
   	</div>
