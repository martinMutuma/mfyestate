<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>留言</title>
    
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
  <!-- 3.添加class="layoutTab"  -->
    <table class="layoutTab" style="border: 0px red solid;">
    	<tr>
    		<td colspan="2" align="center">
    			<jsp:include page="../head.jsp"></jsp:include>
    		</td>
    	</tr>
    	<tr>
    	<td width="25%" align="left"><jsp:include page="../left.jsp"></jsp:include></td>
    		<td valign="top">
    		<table style="border: #99BBE8 1px double;font-size: 9pt;margin-top:30px;" width="95%" align="center">
		  <tr style="font-weight:bold;text-align:center;"> 
			<td height="30" width="100%">留言标题:<s:property value="ts.messageTitle"/>
		  </tr>
		</table>
		<br/>
	    <table width="95%" style="border: #99BBE8 1px double;font-size: 9pt;" align="center">
			<tr>
			    <td align="left"><b>留言内容:</b></td><td colspan="3">&nbsp;</td>
			</tr>
			<tr><td colspan="4" id="content" align="center" style="vertical-align: top;text-indent:1.5em;line-height: 25px;"><div style="width:90%;text-align: left;"><s:property value="ts.messageContent"/> </div></td></tr>
			<tr>
			<s:if test='%{ts.flag=="1"}'>
			    <td width="15%" align="right"><b>留言人:<s:property value="ts.flag"/></b></td>
			</s:if>
			<s:else>
			    <td width="15%"align="right"><b>发信人:</b></td>
			</s:else>
			    <td width="35%" ><s:property value="ts.fromUserName"/> </td>
			    <td width="15%" align="right"><b>联系电话:</b></td>
			    <td width="35%" ><s:property value="ts.phone"/></td>
			</tr>
			<tr>
			    <td width="15%" align="right"><b>留言时间</b></td>
			    <td width="35%" ><s:date name="ts.createTime" format="yyyy-MM-dd HH:mm:ss"/> </td>
			    <td width="15%" align="right"><b>电子邮件:</b></td>
			    <td width="35%" ><s:property value="ts.email"/></td>
			</tr>
			<tr>
			    <td align="center" colspan="4"><br/><br/>
			    <a href="javascript:history.go(-1);" id="btn"></a>
			    </td>
			</tr>	
	   </table>
    		</td>
    	</tr>
    </table>
  </div>
   <input type="hidden" name="loginId" value="${loginId}" id="loginId"/>
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
