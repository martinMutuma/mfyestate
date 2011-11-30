<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'searchTip.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="<%=basePath %>resource/js/jquery-1.4.2.js"></script>
	<script type="text/javascript" src="<%=basePath %>resource/js/jquery.dataGridTip.js"></script>
	<script type="text/javascript" src="<%=basePath %>resource/js/jquery.tip.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<input id="test" ><select><option>sdf</option></select><br>
  	<input id="tip"/>
  		<input id="test1" >
  </body>
  <script type="text/javascript">
  function format(value){
  if(value != "3200000000")
  	return "&nbsp;&nbsp;&nbsp;&nbsp;"+value;
  	return value;
  }
  var columnModel = [
  {id:'code',
   width:'100px',
   align:'left',
   header:'编码1',
   dataIndex:'code',
   css:'',
   renderer:format
   },
  {id:'name',
  	width:'80px',
   align:'center',
   header:'名称',
   dataIndex:'name'
  }];
  	$("#test").dataGridTip('test.shtml','',{height:'400px',width:'100px'},{cm:columnModel,tipName:'请选择楼盘',extraColumn:'新增楼盘:<a href=#>clickme</a>'},function(data){$("#test").val(data.name)})
  	$("#test1").dataGridTip('test.shtml','',{height:'400px',width:'600px'},{cm:columnModel,tipName:'请选择楼盘',extraColumn:'新增楼盘:<a href=#>clickme</a>'},function(data){$("#test1").val(data.name)})
 	$("#tip").tip({height:'20px',width:'100px'},"不能为空","2")
  </script>
</html>
