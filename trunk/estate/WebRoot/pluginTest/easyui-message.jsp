<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
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
   	
   	<script type="text/javascript">
   	//消息框
   		$.messager.show({
   			showType:'slide',
   			showSpeed:1000,
   			width:300,
   			height:150,
   			msg:'我是消息框',
   			title:'show',
   			timeout:5000
   		});
   	//警告框
   		$.messager.alert('标题','内容','error',function(){alert('我被关闭了')})
   	//确认框
   		$.messager.confirm('标题','内容',function(value){alert(value)})
   	//输入框
   		$.messager.prompt('标题','内容',function(value){alert(value)})
   	</script>
  </body>
</html>
