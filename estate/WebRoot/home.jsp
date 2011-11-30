<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>welcome</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="resource/css/whole.css" type="text/css"></link>
	<link rel="stylesheet" href="resource/css/global.css" type="text/css"></link>
	<link rel="stylesheet" href="<%=basePath%>resource/css/pagination2.css" type="text/css"></link>
	<script type="text/javascript" src="resource/js/jquery-1.4.2.js" charset="utf-8"></script>
	<script type="text/javascript" src="resource/js/global.js"></script>
	<script type="text/javascript" src="resource/js/whole.js"></script>
	<script type="text/javascript" src="resource/js/search.js"></script>
	<script type="text/javascript" src="<%=basePath%>resource/js/pagination2.js"></script>
	<s:if test="#keywordFlag == true">
		<script type="text/javascript" src="<%=basePath%>proPrice.js"></script>
	</s:if>
<%-- 价格区间查询 --%>
	<s:elseif test="#priceSearchFlag == true">
		<script type="text/javascript" src="<%=basePath%>proPrice.js"></script>
	</s:elseif>
	<s:else>
		<script type="text/javascript" src="<%=basePath%>proSearchResult.js"></script>
	</s:else>
	<STYLE type="text/css">
	<!-- 
	#searchPanel ul,#searchPanel li{
		list-style-type:none;
		margin:0;
		padding:0;
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
    <table class="layoutTab" >
    	<tr>
    		<td>
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
    							<div id="searchDiv_<s:property value="#status.index"/>" style="position:absolute;top:-<s:property value="#status.index*40"/>px;width:805px;left:150px;height:200px;
    								<s:if test="#status.index != 0">
    									display:none
    								</s:if>"
    							>
    							<table border="0" cellspacing="0" style="margin-top: 5px;">
    								<tr>
    									<td align="right">输入关键字：</td>
    									<td>
    										<div class="keyWord_div" style="float: left;">
    											<input id="keyword_<s:property value="#status.index"/>" style="width: 300px;height: 25px;"/>&nbsp;&nbsp;<input type="button" onclick="searchKeyWord('<s:property value="#status.index"/>')" value="搜索"/>
    											<label><input id="zj_<s:property value="#status.index"/>" type="checkbox" value="1" checked="checked"/>中介</label>
    											<label><input id="fzj_<s:property value="#status.index"/>" type="checkbox" value="2" checked="checked"/>非中介</label>&nbsp;&nbsp;
    										</div>
    										<div style="float: left;">
    											<!-- <a onclick="searchKeyWord('<s:property value="#status.index"/>')" class="icon-search" href="#" style="width: 100px;*width: 110px;"></a> -->
    										</div>
    									</td>
    								</tr>
    								<s:iterator value="searchList" status="seStatus" var="define">
    									<tr>
    										<td class="search_column_span"><s:property value="name"/>：</td>
    										<td>
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
    								<!-- <div class="pro_need_panel">搜索<s:property value="#proTemp.name"/>需求信息 
    								</div>-->
    							</div>
    							
    						</li>
    					</s:iterator>
    				</ul>
    			</div>
    		</td>
    	</tr>
    	<tr>
    		<td align="center">
    		<s:if test="#homeFlag == true">
    			<jsp:include page="homeResult.jsp"></jsp:include>
    		</s:if>
    		<s:else>
    		<%-- 关键字查询 --%>
    			<s:if test="#keywordFlag == true">
    				<jsp:include page="proKeyWord.jsp"></jsp:include>
    			</s:if>
    		<%-- 价格区间查询 --%>
    			<s:elseif test="#priceSearchFlag == true">
    				<jsp:include page="proPrice.jsp"></jsp:include>
    			</s:elseif>
    			<s:else>
    				<jsp:include page="proSearchResult.jsp"></jsp:include>
    			</s:else>
    		</s:else>
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
</html>
