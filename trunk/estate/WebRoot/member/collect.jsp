<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>房源收藏</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 1.css添加 -->
	<link rel="stylesheet" href="../resource/css/global.css" type="text/css"></link>
    <link rel="stylesheet" type="text/css" href="css/thickbox.css"/>
    <link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/default/easyui.css"></link>
	<link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/icon.css"></link>
    <script type="text/javascript" src="../resource/js/jquery-1.4.2.js" charset="utf-8"></script>
	<script type="text/javascript" src="thickbox_plus.js"></script>
	<script type="text/javascript" src="../resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../resource/js/global.js"></script>
	<script type="text/javascript" src="<%=basePath%>member/register.js" charset="utf-8"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
      <script type="text/javascript" src="../resource/js/whole.js"></script>
	    <link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>
  </head>
  <style type="text/css">
  .leftNav li {
	padding-left: 15px;
	padding-top: 5px;
	background: #E0ECFF;
	border-bottom: 1px solid #99BBE8;
	line-height: 30px;
	list-style-type:none;
	margin-left: 0px;
	}
	.leftNav li a{color:#333;text-decoration:none;}
	.leftNav li.title{background: #f3f3f3;}
	#rightbox {
	float: left;
	height: auto;
	width: 750px;
	overflow:hidden;
	}
	#rightbox a{color:#333; text-decoration:none;}
	#rightbox2{
	float: left;
	height: auto;
	width: 750px;
	}
	a:link {color: #0066CC;text-decoration: none;}     /* unvisited link */
	a:visited {color: #D20805;text-decoration: none;}  /* visited link */
	a:hover {color: #FFA028;text-decoration: none;}   /* mouse over link */
	a:active {color: #FFA028;text-decoration: none;}   /* selected link */
  </style>
  <body>
  	<!-- 2.添加div	 -->
  <div style="width: 100%;height: 100%;" align="center">
    			<jsp:include page="../head.jsp"></jsp:include>
  <!-- 3.添加class="layoutTab"  -->
    <table class="layoutTab" style="border: 0px red solid;margin-top: 20px;">
    	<tr>
    	<td width="25%" align="left"><jsp:include page="../left.jsp"></jsp:include></td>
    		<td valign="top">
		    <table width="100%" border="0" cellpadding="0" cellspacing="1"  bgcolor="#CCCCCC">
		      <tr>
		        <td width="18%" height="30" align="center" bgcolor="#FFFFFF" background="images/ttbg_g_3.jpg">我的标题</td>
		        <td width="18%" align="center" bgcolor="#FFFFFF" background="images/ttbg_g_3.jpg">案源标题</td>
		        <td width="10%" align="center" bgcolor="#FFFFFF" background="images/ttbg_g_3.jpg">案源类型</td>
		        <td width="7%" align="center" bgcolor="#FFFFFF" background="images/ttbg_g_3.jpg">租售</td>
		        <td width="10%" align="center" bgcolor="#FFFFFF" background="images/ttbg_g_3.jpg">租金/售价<br>(万元)</td>
		        <td width="10%" align="center" bgcolor="#FFFFFF" background="images/ttbg_g_3.jpg">发布者</td>
		        <td width="8%" align="center" bgcolor="#FFFFFF" background="images/ttbg_g_3.jpg">状态</td>
		        <td width="10%" align="center" bgcolor="#FFFFFF" background="images/ttbg_g_3.jpg">发布时间</td>
		        <td align="center" bgcolor="#FFFFFF" background="images/ttbg_g_3.jpg">操作</td>
		      </tr>
				<tr>
					<td align="center" height="30" bgcolor="#FFFFFF">淮海中华大厦 人民路885号淮海东路 黄浦区 人民广场 出租</td>
					<td align="center" bgcolor="#FFFFFF"><a href="#" >淮海中华大厦 人民路885号淮海东路 黄浦区 人民广场 出租</a></td>
					<td align="center" height="30" bgcolor="#FFFFFF">
					写字楼
					</td>
					<td align="center" bgcolor="#FFFFFF">
					出租
					</td>
					<td align="center" bgcolor="#FFFFFF"><p>2.80 元/m<sup>2</sup>·天
		            </p></td>
					<td align="center" bgcolor="#FFFFFF">魏奎宇
					</td>
					<td align="center" bgcolor="#FFFFFF">
					已审核
					</td>
					<td align="center" bgcolor="#FFFFFF">2011-06-15 21:33:30.0</td>
					<td align="center" bgcolor="#FFFFFF">
					<input type="button" name="bt_opt" class="page_button" value="删除"
					onclick='javascript:if (confirm("确实要删除吗？"))location.href="/col/deleteCol.kemp?colId=8148"'/>
					</td>
				</tr>
		    </table>   
    		</td>
    	</tr>
    </table>
  </div>
   <input type="hidden" name="loginId" value="${loginId}" id="loginId"/>
  </body>
</html>
