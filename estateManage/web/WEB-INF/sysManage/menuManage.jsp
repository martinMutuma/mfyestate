<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>

		<title>会员菜单管理</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
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
	</head>

	<body>
		<table cellspacing="1" cellpadding="3" width="95%" align="center"
			bgcolor="#6ab6b6" border="0">
			<thead>

				<tr>
					<th colspan="5" height="24">
						【会员菜单管理】
						<div id="proinfodiv" />
						</div>
					</th>
					<th>
						<a href="menu_toMenuInfo.shtml?flag=1">添加</a>
					</th>
				</tr>
				<tr>
					<th width="10%" height="24">
						菜单名
					</th>
					<th width="30%" height="24">
						菜单路径
					</th>
					<th width="10%" height="24">
						序号
					</th>
					<th width="20%" height="24">
						描述
					</th>
					<th width="15%" height="24">
						是否主菜单
					</th>
					<th width="15%" height="24">
						操作
					</th>
				</tr>
			</thead>
			<tbody id="contentList">
				<s:iterator value="menuList">
					<tr style="background-color: #eafefe">
						<td>
							<s:if test="mainMenu==0">
								<s:property value="name" />
							</s:if>
							<s:if test="mainMenu==1">
								<B> <s:property value="name" /> </B>
							</s:if>
						</td>
						<td>
							<s:property value="url" />
						</td>
						<td>
							<s:property value="orderNum" />
						</td>
						<td>
							<s:property value="descr" />
						</td>
						<td>
							<s:if test="mainMenu==0">
								  否
					    </s:if>
							<s:if test="mainMenu==1">
								  是
								 </s:if>
						</td>
						<td>
							<a
								href="menu_toMenuInfo.shtml?id=<s:property value='id'/>&flag=2">查看</a>|
							<a
								href="menu_toMenuInfo.shtml?id=<s:property value='id'/>&flag=3">修改</a>|
							<a href="menu_delMenu.shtml?id=<s:property value='id'/>">删除</a>
						</td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</body>
</html>
