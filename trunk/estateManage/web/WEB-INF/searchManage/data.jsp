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
			window.location.href='dictional_toDataInfo.shtml?id='+obj.value+'&pid='+'<s:property value="pid"/>'+'&defName='+encodeURIComponent('<s:property value="defName"/>');
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
		window.location.href='dictional_dataDelete.shtml?ids='+ids+'&pid='+'<s:property value="pid"/>'+'&defName='+encodeURIComponent('<s:property value="defName"/>');
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
						【码表-<s:property value="defName"/>-维护】
					</th>
					<th>
						<a href="dictional_toDataInfo.shtml?pid=<s:property value="pid"/>&defName=<s:property value="defName"/>">添加</a>|
						<a href="javascript:modify();">修改</a>|
						<a href="javascript:del();">删除</a>|
						<a href="dictional_toDefinationManage.shtml">返回码表列表</a>
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
						最小值
					</th>
					<th height="24" width="15%">
						最大值
					</th>
					<th height="24" width="55%">
						描述
					</th>
				</tr>
			</thead>
			<tbody id="contentList">
				<s:iterator value="dataList">
					<tr style="background-color: #eafefe">
						<td align="center">
							<input name="checkbox" type="checkbox"
								value="<s:property value="id"/>" />
						</td>
						<td height="24">
							<s:property value="name" />
						</td>
						<td>
							<s:property value="code" />
						</td>
						<td>
							<s:property value="minvalue" />
						</td>
						<td>
							<s:property value="maxvalue" />
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
