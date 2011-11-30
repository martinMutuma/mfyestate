<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'easyui-grid.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/icon.css">
	<script type="text/javascript" src="../resource/js/jquery-1.4.2.js"></script>
	<script type="text/javascript" src="../resource/js/jquery.easyui.min.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <body>
    <div id="tt" style="width:500px;height:250px;">
    <div title="Tab1" style="padding:20px;display:none;">
        tab1
    </div>
    <div title="Tab2" closable="true" style="overflow:auto;padding:20px;display:none;">
        tab2
    </div>
    <div title="Tab3" iconCls="icon-reload" closable="true" style="padding:20px;display:none;">
        tab3
    </div>
</div>

  </body>
  <script type="text/javascript">
 $('#tt').tabs({
 	plain:true
 });
	
  </script>
</html>
