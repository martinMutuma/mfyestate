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
   	<div style="background:#fafafa;padding:10px;width:300px;height:300px;">
    <form id="ff" method="post">
        <div>
            <label for="name">Name:</label>
            <input id="name" class="easyui-validatebox" type="text" name="name" missingMessage="此项必填" required="true"></input>
        </div>
        <div>
            <label for="email">Email:</label>
            <input class="easyui-validatebox" type="text" name="email" required="true" invalidMessage="邮件格式错误" validType="email"></input>
        </div>
        <div>
            <label for="subject">Subject:</label>
            <input class="easyui-validatebox" type="text" name="subject" required="true"></input>
        </div>
        <div>
            <label for="message">Message:</label>
            <textarea name="message" style="height:60px;"></textarea>
        </div>
        <div>
            <input type="submit" value="Submit">
        </div>
    </form>
</div>
   	
   	<script type="text/javascript">
   	</script>
  </body>
</html>
