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
    <table id="test"></table>
  </body>
  <script type="text/javascript">
  $('#test').datagrid({
				title:'My Title',
				iconCls:'icon-save',
				width:600,
				height:350,
				nowrap: false,
				striped: true,
				collapsible: false,
				url:'../testGrid.shtml',
				sortName: 'code',
				sortOrder: 'desc',
				remoteSort: false,
				idField:'code',
				columns:[[
					{field:'name',title:'Name',width:120},
					{field:'code',title:'Address',width:120,sortable:true,
					formatter:function(){}
					}
				]],
				pagination:true,
				rownumbers:true,
				queryParams:{callback:'1'},
				toolbar:[{
					id:'btnadd',
					text:'Add',
					iconCls:'icon-add',
					handler:function(){
						$('#btnsave').linkbutton('enable');
						alert('add')
					}
				},{
					id:'btncut',
					text:'Cut',
					iconCls:'icon-cut',
					handler:function(){
						$('#btnsave').linkbutton('enable');
						alert('cut')
					}
				},'-',{
					id:'btnsave',
					text:'Save',
					disabled:true,
					iconCls:'icon-save',
					handler:function(){
						$('#btnsave').linkbutton('disable');
						alert('save')
					}
				}]
			});
			var page = $("#test").datagrid("getPager").pagination("options");
			page.beforePageText = '第';
			page.afterPageText = '页,共{pages}页';
			page.displayMsg = '显示从 {from} 至 {to} / {total} 的数据'
			var queryParams =   $('#test').datagrid("options").queryParams;
			queryParams.callback="callback";
			//$('#test').datagrid("reload")
  </script>
</html>
