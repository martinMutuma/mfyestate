<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>注册成功</title>
    
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
	<table border="0" cellpadding="1" bordercolor="#111111" width="100%">
    		<tr><td>
	   			<div style="text-align:center;margin-top: 100px;">注册成功 &nbsp;&nbsp;&nbsp;&nbsp;  <br/><br/>
	   			<span id="dd">5</span> 秒后自动跳转到会员中心
	   			<a href="javascript:goDoFullInfoPage();">完善个人信息</a> &nbsp;&nbsp;&nbsp;&nbsp;  <a href="javascript:goMainPage();">直接跳过下次再说</a></div>
    		</td>
    		</tr>
    		</table>
    		</td>
    	</tr>
    </table>
    </div>
    <input type="hidden" name="tb.id" value="<s:property value="tb.id"/>" id ="id"/>
  </body>
<script language="javascript">
  function init(){
  	$("#logo_span").hide();
  }
function goDoFullInfoPage(){
//	window.location.href="<%=basePath%>mem/baseinfo_mainPage.shtml?type=fullInfo";
window.location.href="<%=basePath%>mem/baseinfo_modUserInfoPage.shtml";
}

function goMainPage(){
	window.location.href="<%=basePath%>mem/baseinfo_mainPage.shtml?type=main";
}
function run(){
	var s = $("#dd");
	if(s.innerHTML == 0){
		goMainPage();
		return false;
	}
	s.innerHTML = s.innerHTML  - 1;
}
// window.setInterval("run();", 1000);
</script>
</html>
