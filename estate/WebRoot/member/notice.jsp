<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>店铺公告</title>
    
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
			<form id="sysAgentBean" name="notice" onsubmit="return true;" action="<%=basePath%>message/message_addNotice.shtml" method="post">
			    <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
			      <tr>
			        <td height="30" background="../member/images/ttbg_g_3.jpg">
			        <p align="center"><b><s:property value="tb.realName"/></b> 的店铺公告</p>
			        </td>
			      </tr>
				  <tr >
			        <td height="100%" align="center" bgcolor="#FFFFFF"><label>
			          <s:textarea name="ts.messageContent" cols="70" rows="15"></s:textarea>
			           <input name="menuCls" type="hidden" id="menuCls" value="${menuCls}"/>
			          </label>
			          <br />
			            <a href="#" id="btn" onclick="return checkform()"></a>
			             <br />
			        </td>
			      </tr>
			    </table>
			        <input type="hidden" name="ts.id" value="<s:property value="ts.id"/>"/>
			        <input type="hidden" name="ts.toId" value="<s:property value="ts.toId"/>"/>
			        <input type="hidden" name="ts.fromId" value="<s:property value="tb.id"/>"/>
			        <input type="hidden" name="ts.flag" value="3"/>
			   </form>
    		</td>
    	</tr>
    </table>
  </div>
   <input type="hidden" name="loginId" value="${loginId}" id="loginId"/>
   <div style="margin-top: 10px;">
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
   			text:'提&nbsp;&nbsp;&nbsp;&nbsp;交',
   			iconCls:'icon-ok login_btn'
   		});
  function checkform(){
    document.sysAgentBean.submit();
    return true;
  }	
  </script>
</html>
