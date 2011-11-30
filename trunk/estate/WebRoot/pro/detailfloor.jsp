<%@ page language="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>物业详细信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="../resource/css/global.css"type="text/css"></link>
	  <script type="text/javascript" src="../resource/js/whole.js"></script>
	    <link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>		
  </head>
  
  <body>
         <div style="width: 100%;height: 100%;" align="center">
		<table width="100%" class="layoutTab">
			<tr>
				<td colspan="2" align="center">
					<jsp:include page="../head.jsp"></jsp:include>
				</td>
			</tr>
			<tr>
				<td align="center">
				    楼盘详细信息
				</td>
			</tr>
		</table>
		</div>
	</body>
</html>
