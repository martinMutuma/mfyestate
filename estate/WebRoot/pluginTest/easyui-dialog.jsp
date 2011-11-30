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
	<style type="text/css">
		
	</style>
  </head>
  	
  <body>
   	<div id="dd" title="My Dialog" style="width:400px;height:200px;">
    Dialog Content.
	</div>
	<a href="javascript:open()" id="btn" iconCls="icon-search">easyui</a>
	<a href="#" id="btn1" iconCls="icon-search">easyui</a>
   	
   	<script type="text/javascript">
   		function open(){
   			$('#dd').dialog('open');
   		}
   	
   	//按钮
   		var toolbar = $('#btn').linkbutton({
   			id:'ad',
   			disabled:false,
   			plain:false,
   			text:'按钮内容',
   			iconCls:''
   		});
   		var toolbar1 = $('#btn1').linkbutton({
   			id:'ad1',
   			disabled:false,
   			plain:true,
   			text:'按钮内容',
   			iconCls:''
   		});
   		//对话框
   		$('#dd').dialog({
   			title:'标题',
   			collapsible:true,//收缩
   			minimizable:true,//最小化   默认为false
   			maximizable:true,//最大化  默认为false
   			resizable:true,//可变大小  默认为false
   			toolbar:[{
					text:'Ok',
					iconCls:'icon-ok',
					handler:function(){
						alert('ok');
					}
				}],
   			buttons:[{
					text:'Ok',
					iconCls:'icon-ok',
					handler:function(){
						alert('ok');
					}
				},{
					text:'Cancel',
					handler:function(){
						$('#dd').dialog('close');
					}
				}]
   		});

   	</script>
  </body>
</html>
