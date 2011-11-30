<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.estate.util.comm.RequestUtil"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String menuCls = RequestUtil.getParam(request,"menuCls","");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>身份认证</title>
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
	  <script type="text/javascript" src="../resource/js/whole.js"></script>
	    <link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>

  </head>
  <body>
 <jsp:include page="../head.jsp"></jsp:include>
		<div style="width: 100%;margin-top: 10px;" align="center">
  <!-- 3.添加class="layoutTab"  -->
    <table class="layoutTab" style="border: 0px red solid;">
    	<tr>
    	<td width="20%" align="left" valign="top"><jsp:include page="../left.jsp"></jsp:include></td>
    		<td valign="top">
   <table width="100%" border="0" cellpadding="6" cellspacing="1" bgcolor="#CCCCCC">
      <tr>
        <td height="30" align="center"  background="images/ttbg_g_3.jpg" ><STRONG>身份认证</STRONG></td>
      </tr>
      <tr>
        <td height="100" bgcolor="#FFFFFF">
          <p class="text">请将以下证件复印件传真或E-mail到 <font color="red">地产网：</font></p>
          <p class="text">· 身份证</p>
          <p class="text">· 名片</p>
        </td>
      </tr>
      <tr>
        <td height="30" bgcolor="#FFFFFF"><p class="text">传真号码：<span class="toshow">025-88888888</span></p>
        </td>
      </tr>
      <tr>
        <td height="30" bgcolor="#FFFFFF"><p class="text">E-mail：<span class="toshow">estate@gmail.com</span></p>
        </td>
      </tr>
    </table>
    		</td>
    	</tr>
    </table>
  </div>
     <div style="margin-top: 10px;">
             <input type="hidden" id="menuCls" value="<%=menuCls %>"/>
			<center>
				<jsp:include page="../copyright.jsp" />
			</center>
		</div>
  </body>
  <script type="text/javascript">
  $('#btn').linkbutton({
   			id:'ad',
   			disabled:false,
   			plain: false,
   			text:'返&nbsp;&nbsp;&nbsp;&nbsp;回',
   			iconCls:'icon-ok login_btn'
   		});
   		
  </script>
</html>
