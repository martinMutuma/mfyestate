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
<link rel="stylesheet" href="<%=basePath%>resource/css/pagination2.css" type="text/css"></link>
<script type="text/javascript" src="<%=basePath%>resource/js/jquery-1.4.2.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=basePath%>resource/js/whole.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/js/search.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/js/pagination2.js"></script>
<script type="text/javascript" src="<%=basePath%>bulidPrice.js"></script>
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
   		<div id="searchPanel" align="center">
   			<table cellpadding="0" border="0" cellspacing="0" width="920px">
   				<tr>
   					<td class="search_column_span line" valign="top">
   						<span>楼盘类型：</span>
   					</td>
   					<td valign="top" class="line">
   						<span style="cursor:pointer" id="rc_9_0_0" class="search_column search_column_selected" onclick="search('0','','','',this,'0_0','9')">不限</span>
						<span id="rc_9_0_1" class="search_column" onclick="search('8','0','','building_type',this,'0_1','9')" style="cursor:pointer">住宅</span>
						<span id="rc_9_0_2" class="search_column" onclick="search('8','1','','building_type',this,'0_2','9')" style="cursor:pointer">公寓</span>
						<span id="rc_9_0_3" class="search_column" onclick="search('8','2','','building_type',this,'0_3','9')" style="cursor:pointer">海景房</span>
						<span id="rc_9_0_4" class="search_column" onclick="search('8','3','','building_type',this,'0_4','9')" style="cursor:pointer">别墅</span>
						<span id="rc_9_0_5" class="search_column" onclick="search('8','4','','building_type',this,'0_5','9')" style="cursor:pointer">酒店式公寓</span>
						<span id="rc_9_0_6" class="search_column" onclick="search('8','5','','building_type',this,'0_6','9')" style="cursor:pointer">产权式酒店</span>
   						
   					</td>
   				</tr>
   				<tr>
					<td class="search_column_span line" valign="top"><span>销售单价：</span></td>
					<td valign="top" class="line">
						<span style="cursor:pointer" id="rc_9_1_0" class="search_column search_column_selected" onclick="search('0','','','',this,'1_0','9')">不限</span>
						<span id="rc_9_1_1" class="search_column" onclick="search('3','5000','','average_price',this,'1_1','9')" style="cursor:pointer">5000元以下/㎡</span>
						<span id="rc_9_1_2" class="search_column" onclick="search('7','5000','8000','average_price',this,'1_2','9')" style="cursor:pointer">5000-8000元/㎡</span>
						<span id="rc_9_1_3" class="search_column" onclick="search('7','8000','10000','average_price',this,'1_3','9')" style="cursor:pointer">8000-1万元/㎡</span>
						<span id="rc_9_1_4" class="search_column" onclick="search('7','10000','12000','average_price',this,'1_4','9')" style="cursor:pointer">1万-1.2万元/㎡</span>
						<span id="rc_9_1_5" class="search_column" onclick="search('7','12000','15000','average_price',this,'1_5','9')" style="cursor:pointer">1.2万-1.5万元/㎡</span>
						<span id="rc_9_1_6" class="search_column" onclick="search('7','15000','20000','average_price',this,'1_6','9')" style="cursor:pointer">1.5万-2万元/㎡</span>
						<span id="rc_9_1_7" class="search_column" onclick="search('4','20000','','average_price',this,'1_7','9')" style="cursor:pointer">2万元以上/㎡</span>
					</td>
				</tr>
				<tr>
					<td class="search_column_span line" valign="top"><span>销售状态：</span></td>
					<td valign="top" class="line">
						<span style="cursor:pointer" id="rc_9_2_0" class="search_column search_column_selected" onclick="search('0','','','',this,'2_0','9')">不限</span>
						<span id="rc_9_2_1" class="search_column" onclick="search('5','0','','sales_status',this,'2_1','9')" style="cursor:pointer">待售楼盘</span>
						<span id="rc_9_2_2" class="search_column" onclick="search('5','1','','sales_status',this,'2_2','9')" style="cursor:pointer">预售楼盘</span>
						<span id="rc_9_2_3" class="search_column" onclick="search('5','2','','sales_status',this,'2_3','9')" style="cursor:pointer">在售楼盘</span>
						<span id="rc_9_2_4" class="search_column" onclick="search('5','3','','sales_status',this,'2_4','9')" style="cursor:pointer">尾盘</span>
						<span id="rc_9_2_5" class="search_column" onclick="search('5','4','','sales_status',this,'2_5','9')" style="cursor:pointer">售完楼盘</span>
					</td>
				</tr>
				<tr>
					<td class="search_column_span line" valign="top"><span>装修状况：</span></td>
					<td valign="top" class="line">
						<span style="cursor:pointer" id="rc_9_3_0" class="search_column search_column_selected" onclick="search('0','','','',this,'3_0','9')">不限</span>
						<span id="rc_9_3_1" class="search_column" onclick="search('5','1','','fit_condition',this,'3_1','9')" style="cursor:pointer">毛坯</span>
						<span id="rc_9_3_2" class="search_column" onclick="search('5','2','','fit_condition',this,'3_2','9')" style="cursor:pointer">简单装修</span>
						<span id="rc_9_3_3" class="search_column" onclick="search('5','3','','fit_condition',this,'3_3','9')" style="cursor:pointer">中档装修</span>
						<span id="rc_9_3_4" class="search_column" onclick="search('5','4','','fit_condition',this,'3_4','9')" style="cursor:pointer">精装修</span>
					</td>
				</tr>
				<tr>
					<td class="search_column_span line" valign="top"><span>建筑形式：</span></td>
					<td valign="top" class="line">
						<span style="cursor:pointer" id="rc_9_4_0" class="search_column search_column_selected" onclick="search('0','','','',this,'4_0','9')">不限</span>
						<span id="rc_9_4_1" class="search_column" onclick="search('8','1','','arch_forms',this,'4_1','9')" style="cursor:pointer">多层</span>
						<span id="rc_9_4_2" class="search_column" onclick="search('8','2','','arch_forms',this,'4_2','9')" style="cursor:pointer">高层</span>
						<span id="rc_9_4_3" class="search_column" onclick="search('8','3','','arch_forms',this,'4_3','9')" style="cursor:pointer">低层</span>
					</td>
				</tr>
   			</table>
   		</div>
   		<div id="ts" align="left">
   			楼盘特色：<span id="lpts"><a id="lpts_0" href="javascript:lptsSearch('')">不限</a><a class="" id="lpts_1" href="javascript:lptsSearch('0')">特色别墅</a><a class="" id="lpts_2" href="javascript:lptsSearch('1')">养老居所</a><a class="" id="lpts_3" href="javascript:lptsSearch('2')">高档小区</a><a class="" id="lpts_4" href="javascript:lptsSearch('3')">景观居所</a><a class="" id="lpts_5" href="javascript:lptsSearch('4')">宜居生态</a><a class="" id="lpts_6" href="javascript:lptsSearch('5')">花园洋房</a><a class="" id="lpts_7" href="javascript:lptsSearch('6')">投资地产</a><a class="" id="lpts_8" href="javascript:lptsSearch('7')">创意地产</a><a class="" id="lpts_9" href="javascript:lptsSearch('8')">水景地产</a></span>
   		</div>
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
	   				<input type="hidden" id="minValue" value="<s:property value="#minValue"/>">
	   				<input type="hidden" id="maxValue" value="<s:property value="#maxValue"/>">
	   				<input type="hidden" id="searchType" value="<s:property value="#searchType"/>">
	   				<input type="hidden" id="proType" value="<s:property value="#proType"/>">
			   	<!-- 	共<s:property value="pu.totalRecords"/>条记录,
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
			   		</s:else> -->
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
