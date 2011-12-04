<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>码表维护</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link href="<%=basePath%>images/syscome.files/Admin.css"
			rel=stylesheet />
		<SCRIPT type="text/javascript"
			src="<%=basePath%>scripts/jquery-1.4.2.js"></SCRIPT>
		<SCRIPT type="text/javascript" src="<%=basePath%>scripts/global.js"></SCRIPT>
		<STYLE type=text/css>
.STYLE1 {
	FONT-WEIGHT: bold;
	COLOR: #0099ff
}

th {
	border-bottom: 1px solid black;
}
</STYLE>
		<SCRIPT type="text/javascript">
	function modify(){
		var objs = document.getElementsByName("checkbox");
		var num = 0;
		var obj = null;
		for(var i = 0; i < objs.length; i++){
			if(objs[i].checked){
				num++;
				obj = objs[i];
			}
		}
		if(num>1){
			alert("每次只能修改一条数据!");
			return;
		}else if(num ==0){
			alert("请选择一条要修改的数据!");
			return;
		}
		else{
			window.location.href='dictional_toDefinationInfo.shtml?id='+obj.value;
		}
	}
	
	function del(){
		var objs = document.getElementsByName("checkbox");
		var num = 0;
		var ids = "0";
		for(var i = 0; i < objs.length; i++){
			if(objs[i].checked){
				num++;
				ids += ","+objs[i].value;
			}
		}
		if(num ==0){
			alert("请选择一条要删除的数据!");
			return;
		}
		else{
			window.location.href='dictional_delete.shtml?ids='+ids;
		}
	}
	
	function maintenance(){
		var objs = document.getElementsByName("checkbox");
		var num = 0;
		var obj = null;
		for(var i = 0; i < objs.length; i++){
			if(objs[i].checked){
				num++;
				obj = objs[i];
			}
		}
		if(num>1){
			alert("每次只能维护一条数据!");
			return;
		}else if(num ==0){
			alert("请选择一条要维护的数据!");
			return;
		}
		else{
			window.location.href='dictional_dataManage.shtml?pid='+obj.value+'&defName='+encodeURIComponent(obj.alt);
		}
	}
	
	function formatSearchType(value){
		if(value!=undefined&&value!=null)
			switch(parseInt(value)){
				case 1 : return "<";break;
				case 2 : return ">";break;
				case 3 : return "<=";break;
				case 4 : return ">=";break;
				case 5 : return "=";break;
				case 6 : return "!=";break;
				case 7 : return "between";break;
				case 8 : return "like";break;
			}
	}
	
	function formatSearchCategory(value){
		if(value!=undefined&&value!=null)
		switch(value){
				case "01" : return "项目搜索码表";break;
				case "99" : return "其他";break;
				default:return "其他"
			}
	}
	</SCRIPT>
	</head>

	<body>
		<table cellspacing="1" cellpadding="3" width="95%" align="center"
			bgcolor="#6ab6b6" border="0">
			<thead>
				<tr>
					<th colspan="5" height="24">
						【码表维护】
					</th>
					<th>
						<a href="dictional_toDefinationInfo.shtml">添加</a>|
						<a href="javascript:modify();">修改</a>|
						<a href="javascript:del();">删除</a>|
						<a href="javascript:maintenance();">维护</a>
					</th>
				</tr>
				<tr>
					<th height="24" width="5%"
						style="padding-left: 0px; text-align: center;" align="center">
						<input id="checkAll" name="checkbox" type="checkbox" />
					</th>
					<th height="24" width="15%">
						名称
					</th>
					<th height="24" width="15%">
						编码
					</th>
					<th height="24" width="15%">
						搜索类型
					</th>
					<th height="24" width="15%">
						码表类型
					</th>
					<th height="24" width="55%">
						描述
					</th>
				</tr>
			</thead>
			<tbody id="contentList">
				<s:iterator value="definationList">
					<tr style="background-color: #eafefe">
						<td align="center">
							<input name="checkbox" type="checkbox" alt="<s:property value="name" />"
								value="<s:property value="id"/>" />
						</td>
						<td height="24">
							<s:property value="name" />
						</td>
						<td>
							<s:property value="code" />
						</td>
						<td>
							<script>
							document.write(formatSearchType('<s:property value="searchType" />'));
							</script>
						</td>
						<td>
							<script>
							document.write(formatSearchCategory('<s:property value="category" />'));
							</script>
						</td>
						<td>
							<s:property value="descr" />
						</td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</body>
</html>
