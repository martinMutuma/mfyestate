<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>梦房园</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="resource/css/global.css" type="text/css"></link>
	<link rel="stylesheet" href="resource/css/whole.css" type="text/css"></link>
	<script type="text/javascript" src="resource/js/jquery-1.4.2.js" charset="utf-8"></script>
	<script type="text/javascript" src="resource/js/global.js"></script>
	<script type="text/javascript" src="resource/js/whole.js"></script>
	<script type="text/javascript" src="resource/js/search.js"></script>
	<STYLE type="text/css">
	<!-- 
	#searchPanel ul,#searchPanel li{
		list-style-type:none;
		margin:0;
		padding:0;
	}
	#ser_btn{
		*padding-left:40px;
	}
	#ser_senior,#ser_help{
		*padding-left:15px;
		*width:80px;
	}
	#searchPanel{
		height:240px;
		*height: 242px;
	}
	-->
	</STYLE>
  </head>
  	<script type="text/javascript">
  	</script>
  <body>
  <jsp:include page="head.jsp"></jsp:include>
  <div style="width: 100%;height: 100%;" align="center">
  <!-- 3.添加class="layoutTab"  -->
    <table class="layoutTab" border="0" cellpadding="0" cellspacing="0">
    	<tr>
    		<td>
    			  <div class="position">
				  	您当前的位置-&gt;高级搜索
				  </div>
    			<div id="searchPanel">
    			<!-- 
    				<table cellpadding="0" cellspacing="0" width="100%">
    					<s:iterator value="#proList" status="status">
    						<tr>
    							<td width="20%" class="search_pro_bg" align="center"
    							
    							><s:property value="name"/></td>
    							<s:if test="#status.index == 0">
    								<td rowspan="<s:property value="#proList.size()"/>"></td>
    							</s:if>
    						</tr>
    					</s:iterator>
    				</table>
    			 -->
    				<ul style="width: 100%;position: absolute;">
    					<s:iterator value="#proList" status="status" var="proTemp">
    						<li style="clear: none;position: absolute;top:<s:property value="#status.index*40"/>px;">
    							<div class="search_pro_bg" id="pro_<s:property value="#status.index"/>" style=""><s:property value="name"/></div>
    							<div id="searchDiv_<s:property value="#status.index"/>" style="position:absolute;top:-<s:property value="#status.index*40"/>px;width:805px;left:150px;height:320px;
    								<s:if test="#status.index != 0">
    									display:none
    								</s:if>"
    							>	
    							<table border="0" cellspacing="0" style="margin-top: 5px;">
    								<tr>
    									<td align="right">输入关键字：</td>
    									<td>
    										<div class="keyWord_div" style="float: left;">
    											<input id="keyword_<s:property value="#status.index"/>" style="width: 300px;height: 25px;"/>&nbsp;&nbsp;<input onclick="searchKeyWord('<s:property value="#status.index"/>')" type="button" value="搜索"/>
    											<label><input id="zj_<s:property value="#status.index"/>" type="checkbox" value="1" checked="checked"/>中介</label>
    											<label><input id="fzj_<s:property value="#status.index"/>" type="checkbox" value="2" checked="checked"/>非中介</label>&nbsp;&nbsp;
    										</div>
    										<div style="float: left;">
    											<a onclick="searchKeyWord('<s:property value="#status.index"/>')" class="icon-search" href="#" style="width: 100px;*width: 110px;"></a>
    										</div>
    									</td>
    								</tr>
    								<s:iterator value="searchList" status="seStatus" var="define">
    									<tr>
    										<td class="search_column_span" valign="top"><span><s:property value="name"/>：</span></td>
    										<td valign="top">
    											<span style="cursor:pointer" id="rc_<s:property value="#status.index"/>_<s:property value="#seStatus.index"/>_0" class="search_column search_column_selected" onclick="search('0','','','',this,'<s:property value="#seStatus.index"/>_0','<s:property value="#status.index"/>')">不限</span>
    											<s:if test='%{searchType == "7"}'>
	    											<s:iterator value="dataList" status="ssStatus">
	    												<s:if test='maxvalue==null||maxvalue==""'>
	    													<span id="rc_<s:property value="#status.index"/>_<s:property value="#seStatus.index"/>_<s:property value="#ssStatus.index+1"/>" class="search_column" onclick="search('<s:property value="searchType"/>','<s:property value="minvalue"/>','<s:property value="maxvalue"/>','<s:property value="#define.code"/>',this,'<s:property value="#seStatus.index"/>_<s:property value="#ssStatus.index+1"/>','<s:property value="#status.index"/>')" style="cursor:pointer"><s:property value="name"/></span>
	    												</s:if>
	    												<s:elseif test='maxvalue==null||maxvalue==""'>
	    													<span id="rc_<s:property value="#status.index"/>_<s:property value="#seStatus.index"/>_<s:property value="#ssStatus.index+1"/>" class="search_column" onclick="search('<s:property value="searchType"/>','<s:property value="minvalue"/>','<s:property value="maxvalue"/>','<s:property value="#define.code"/>',this,'<s:property value="#seStatus.index"/>_<s:property value="#ssStatus.index+1"/>','<s:property value="#status.index"/>')" style="cursor:pointer"><s:property value="name"/></span>
	    												</s:elseif>
	    												<s:else>
	    													<span id="rc_<s:property value="#status.index"/>_<s:property value="#seStatus.index"/>_<s:property value="#ssStatus.index+1"/>" class="search_column" onclick="search('<s:property value="searchType"/>','<s:property value="minvalue"/>','<s:property value="maxvalue"/>','<s:property value="#define.code"/>',this,'<s:property value="#seStatus.index"/>_<s:property value="#ssStatus.index+1"/>','<s:property value="#status.index"/>')" style="cursor:pointer"><s:property value="name"/></span>
	    												</s:else>
	    											</s:iterator>
	    										</s:if>
	    										<s:else>
	    											<s:iterator value="dataList" status="ssStatus">
	    												<span id="rc_<s:property value="#status.index"/>_<s:property value="#seStatus.index"/>_<s:property value="#ssStatus.index+1"/>" class="search_column" onclick="search('<s:property value="searchType"/>','<s:property value="minvalue"/>','','<s:property value="#define.code"/>',this,'<s:property value="#seStatus.index"/>_<s:property value="#ssStatus.index+1"/>','<s:property value="#status.index"/>')" style="cursor:pointer"><s:property value="name"/></span>
	    											</s:iterator>
	    										</s:else>
    										</td>
    									</tr>
    								</s:iterator>
    								</table>
    							</div>
    							
    						</li>
    					</s:iterator>
    					<li style="clear: none;position: absolute;top:<s:property value="#proList.size()*40"/>px;">
    							<div class="search_pro_bg" id="pro_9" style="">住宅</div>
    							<div id="searchDiv_9" style="position:absolute;top:-<s:property value="#proList.size()*40"/>px;width:805px;left:150px;height:200px;
    									display:none"
    							>	
    							<table border="0" cellspacing="0" style="margin-top: 5px;">
	    								<tr>
	    									<td align="right">输入关键字：</td>
	    									<td>
	    										<div class="keyWord_div" style="float: left;">
	    											<input id="keyword_9" style="width: 300px;height: 25px;"/>&nbsp;&nbsp;<input onclick="searchKeyWord('9')" type="button" value="搜索"/>
	    										</div>
	    										<div style="float: left;">
	    											<a onclick="searchKeyWord('<s:property value="#status.index"/>')" class="icon-search" href="#" style="width: 100px;*width: 110px;"></a>
	    										</div>
	    									</td>
	    								</tr>
    									<tr>
    										<td class="search_column_span" valign="top"><span>楼盘类型：</span></td>
    										<td valign="top">
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
    										<td class="search_column_span" valign="top"><span>销售单价：</span></td>
    										<td valign="top">
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
    										<td class="search_column_span" valign="top"><span>销售状态：</span></td>
    										<td valign="top">
    											<span style="cursor:pointer" id="rc_9_2_0" class="search_column search_column_selected" onclick="search('0','','','',this,'2_0','9')">不限</span>
    											<span id="rc_9_2_1" class="search_column" onclick="search('5','0','','sales_status',this,'2_1','9')" style="cursor:pointer">待售楼盘</span>
    											<span id="rc_9_2_2" class="search_column" onclick="search('5','1','','sales_status',this,'2_2','9')" style="cursor:pointer">预售楼盘</span>
    											<span id="rc_9_2_3" class="search_column" onclick="search('5','2','','sales_status',this,'2_3','9')" style="cursor:pointer">在售楼盘</span>
    											<span id="rc_9_2_4" class="search_column" onclick="search('5','3','','sales_status',this,'2_4','9')" style="cursor:pointer">尾盘</span>
    											<span id="rc_9_2_5" class="search_column" onclick="search('5','4','','sales_status',this,'2_5','9')" style="cursor:pointer">售完楼盘</span>
   											</td>
    									</tr>
    									<tr>
    										<td class="search_column_span" valign="top"><span>装修状况：</span></td>
    										<td valign="top">
    											<span style="cursor:pointer" id="rc_9_3_0" class="search_column search_column_selected" onclick="search('0','','','',this,'3_0','9')">不限</span>
    											<span id="rc_9_3_1" class="search_column" onclick="search('5','1','','fit_condition',this,'3_1','9')" style="cursor:pointer">毛坯</span>
    											<span id="rc_9_3_2" class="search_column" onclick="search('5','2','','fit_condition',this,'3_2','9')" style="cursor:pointer">简单装修</span>
    											<span id="rc_9_3_3" class="search_column" onclick="search('5','3','','fit_condition',this,'3_3','9')" style="cursor:pointer">中档装修</span>
    											<span id="rc_9_3_4" class="search_column" onclick="search('5','4','','fit_condition',this,'3_4','9')" style="cursor:pointer">精装修</span>
   											</td>
    									</tr>
    									<tr>
    										<td class="search_column_span" valign="top"><span>建筑形式：</span></td>
    										<td valign="top">
    											<span style="cursor:pointer" id="rc_9_4_0" class="search_column search_column_selected" onclick="search('0','','','',this,'4_0','9')">不限</span>
    											<span id="rc_9_4_1" class="search_column" onclick="search('8','1','','arch_forms',this,'4_1','9')" style="cursor:pointer">多层</span>
    											<span id="rc_9_4_2" class="search_column" onclick="search('8','2','','arch_forms',this,'4_2','9')" style="cursor:pointer">高层</span>
    											<span id="rc_9_4_3" class="search_column" onclick="search('8','3','','arch_forms',this,'4_3','9')" style="cursor:pointer">低层</span>
   											</td>
    									</tr>
   								</table>
   							</div>
   						</li>
    				</ul>
    			</div>
    		</td>
    	</tr>
    	<tr>
    		<td align="center">
    			<jsp:include page="copyright.jsp"></jsp:include>
    		</td>
    	</tr>
    </table>
  </div>
  </body>
  <SCRIPT type="text/javascript">
  	
  	/*
  	$("#searchPanel a[class*='icon-search']").linkbutton({
		disabled:false,
		plain:false,
		text:'立即搜索',
		iconCls:'icon-search',
		handler:function(){
			$(this).attr("href",'member/login.jsp');
		}
	})*/	
  </SCRIPT>
</html>
