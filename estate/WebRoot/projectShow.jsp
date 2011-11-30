<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>
    <s:if test='dataMap.flag == "1"'>出租</s:if>
					   		<s:else>出售</s:else>
    <s:property value="dataMap.disname"/>&nbsp;&nbsp;<s:property value="dataMap.address"/>&nbsp;&nbsp;<s:property value="dataMap.title"/></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="resource/css/global.css" type="text/css"></link>
	<link rel="stylesheet" href="resource/css/search.css" type="text/css"></link>
	<link rel="stylesheet" href="resource/css/whole.css" type="text/css"></link>
	<script type="text/javascript" src="resource/js/jquery-1.4.2.js" charset="utf-8"></script>
	<script type="text/javascript" src="resource/js/whole.js"></script>
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
    		<td align="center">
    			<div class="search_result">
			   		<div class="search_result_list1">
			   			<div class="pro_show_title" align="left">
					   		<s:if test='dataMap.flag == "1"'>出租</s:if>
					   		<s:else>出售</s:else>
					   		<s:property value="dataMap.disname"/>&nbsp;&nbsp;
					   		<s:property value="dataMap.address"/>&nbsp;&nbsp;
					   		<s:if test='searchPro == "0"'>写字楼</s:if>
					   		<s:elseif test='searchPro == "1"'>商铺</s:elseif>
					   		<s:elseif test='searchPro == "2"'>生意转让</s:elseif>
					   		<s:elseif test='searchPro == "3"'>工业地产</s:elseif>
					   		<s:elseif test='searchPro == "4"'>大型项目</s:elseif>
					   		<s:elseif test='searchPro == "5"'>经纪人</s:elseif>&nbsp;&nbsp;
					   		
					   	</div>
					   	<div class="search_result_pro1" align="left" id="proResult">
					   		<div id="member_info">
					   			<table cellspacing="5px">
					   				<tr>
					   					<td>&nbsp;</td>
					   					<td  align="left">
					   						<img src="<%=basePath %>imageFloder/<s:property value="dataMap.headurl"/>" title="进入<s:property value="realName"/>的商铺" height="130px" alt="经纪人头像" width="100px"><br/>
					   						<br/>
					   						<div style="width: 100%" align="center"><s:property value="dataMap.realname"/></div>
					   					</td>
					   				</tr>
					   				<tr>
					   					<td>所属区域：</td>
					   					<td><s:property value="dataMap.mdisname"/> </td>
					   				</tr>
					   				<tr>
					   					<td>所属公司：</td>
					   					<td><s:property value="dataMap.company"/> </td>
					   				</tr>
					   				<tr>
					   					<td>&nbsp;</td>
					   					<td><a href="#">给我留言</a><br/>
					   						<!-- <a href="#">进入我的店铺</a><br/> -->
					   						<a href="#">分享到微博</a>
					   					</td>
					   				</tr>
					   			</table>
					   		</div>
					   		<div id="pro_info">
					   			<table width="100%"  cellspacing="1px" cellpadding="0">
					   				<tr>
					   					<td colspan="2" style="border-bottom: 2px solid #68A1D9;color: #0066CC;font-size: 15px;font-weight: bold;">
					   						<s:property value="dataMap.title"/>
					   					</td>
					   				</tr>
					   				<tr>
					   					<td width="25%" align="right" class="pro_info_label">
					   						发布时间：
					   					</td>
					   					<td>
					   						<s:date name="dataMap.createtime" format="yyyy-MM-dd"/>
					   					</td>
					   				</tr>
					   				<tr>
					   					<td align="right" class="pro_info_label">
					   						房源编号：
					   					</td>
					   					<td>
					   						<s:property value="dataMap.num"/>
					   					</td>
					   				</tr>
					   				<tr>
					   					<td align="right" class="pro_info_label">
					   						区域：
					   					</td>
					   					<td>
					   						<s:property value="dataMap.disname"/>
					   					</td>
					   				</tr>
					   				<tr>
					   					<td align="right" class="pro_info_label">
					   						地址：
					   					</td>
					   					<td>
					   						<s:property value="dataMap.address"/>
					   					</td>
					   				</tr>
					   				<tr>
					   					<td align="right" class="pro_info_label">
					   						物业管理费：
					   					</td>
					   					<td>
					   						<s:property value="dataMap.pm"/>
					   					</td>
					   				</tr>
					   				<tr>
					   					<td align="right" class="pro_info_label">
					   						联系电话：
					   					</td>
					   					<td>
					   						<s:property value="dataMap.tel"/>
					   					</td>
					   				</tr>
					   			</table>
					   		</div>
					   	</div>
					   	<div id="cxDiv">
					   	 	<strong>诚信声明：</strong>我承诺该房源信息、售价、照片真实有效！
					   	</div>
					   	<div class="pro_info_content">
					   		<span class="content_span">&nbsp;&nbsp;案源详情：</span><br/>
					   		<s:property value="dataMap.content" escape="false"/><br/>
					   		<span class="content_span">&nbsp;&nbsp;地理位置：</span><br/>
					   		<s:if test='searchPro=="0"'>
					   			<span style="font-size:16px;margin-left:20px;"><s:property value="dataMap.disname"/><s:property value="dataMap.address"/></span><br>
					   		</s:if>
					   		<s:else>
					   			<div align="right" id="map"
														style="width: 100%; height: 250px"></div>
					   		</s:else>
					   		<br>
					   		<span class="content_span">&nbsp;&nbsp;案源图片：</span><br/>
					   		<div style="width: 100%" align="center">
					   			<s:if test='dataMap.imgurl1 != null&&dataMap.imgurl1 != ""'>
					   				<img width="80%" src="<%=basePath %>imageFloder/<s:property value="dataMap.imgurl1"/>"><br/>
					   			</s:if>
					   			<s:if test='dataMap.imgurl2 != null&&dataMap.imgurl2 != ""'>
					   				<img width="80%" src="<%=basePath %>imageFloder/<s:property value="dataMap.imgurl2"/>"><br/>
					   			</s:if>
					   			<s:if test='dataMap.imgurl3 != null&&dataMap.imgurl3 != ""'>
					   				<img width="80%" src="<%=basePath %>imageFloder/<s:property value="dataMap.imgurl3"/>"><br/>
					   			</s:if>
					   			<s:if test='dataMap.imgurl4 != null&&dataMap.imgurl4 != ""'>
					   				<img width="80%" src="<%=basePath %>imageFloder/<s:property value="dataMap.imgurl4"/>"><br/>
					   			</s:if>
					   			<s:if test='dataMap.imgurl5 != null&&dataMap.imgurl5 != ""'>
					   				<img width="80%" src="<%=basePath %>imageFloder/<s:property value="dataMap.imgurl5"/>"><br/>
					   			</s:if>
					   		</div>
					   	</div>
			   		</div>
			   		<div class="search_result_ad">
			   			<img width="100%" height="100px"/>
			   			<div class="office_need">
			   				<div class="need_title">
			   					<s:property value="dataMap.realname"/>的
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
			   					需求信息
			   				</div>
			   				<div class="need_content">
			   					<table width="95%" id="needTab">
								</table>
			   				</div>
			   			</div>
			   		</div>
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

  </SCRIPT>
  <s:if test='searchPro!="0"'>
	<script src="http://maps.google.com/maps?file=api&v=2&key=ABQIAAAAC1djgrWT1Mqz3gM4Ge3XlhSchlZ7_IhAROXTdJ5EzY4J4yl1FBSStZmm__B2dywWaRXMSi8G6C5QLw"  type="text/javascript"></script>
	</s:if>
</html>
