<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title></title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript" src="scripts/jquery-1.4.2.min.js"></script>
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link href="<%=basePath%>images/syscome.files/Admin.css"
			rel=stylesheet />
		<STYLE type=text/css>
.STYLE1 {
	FONT-WEIGHT: bold;
	COLOR: #0099ff
}

.view {
	
}

th {
	border-bottom: 1px solid black;
}
</STYLE>
	</head>
	<script type="text/javascript">
  	function formSub(){
  		document.form1.submit();
  	}
  </script>
	<body>
		<form name="form1" action="user_saveOrUpdate.shtml" method="post">
			<table cellspacing="1" cellpadding="3" width="95%" align="center"
				bgcolor="#6ab6b6" border="0">
				<tbody>
					<tr>
						<th colspan="" height="24">
						【用户修改】
						</th>
						<th colspan="" height="24" align="right">
							<span style="float: right; margin-right: 5px;"> <s:if
									test="flag!=2">
									<a href="javascript:formSub();">保存</a>
								</s:if> <a href="javascript:history.go(-1)">返回</a> </span>
						</th>

					</tr>
					<tr>
						<td class="forumrow" width="40%" height="24" align='right'>
							用户名：
							<input type="hidden" name="user.id"
								value="<s:property value="user.id"/>" />
						</td>
						<td class="forumrowhighlight" width="60%" height="24">
							<input maxlength="30" name="user.username" value="<s:property value="user.username"/>" />
						</td>
					</tr>
					<tr>
						<td class="forumrow" height="24" align='right'>
							姓名：
						</td>
						<td class="forumrowhighlight" height="24">
							<input maxlength="10" name="user.name"
								value="<s:property value="user.name"/>" />
						</td>
					</tr>
					<tr>
						<td class="forumrow" height="24" align='right'>
							状态：
						</td>
						<td class="forumrowhighlight" height="24">
						<s:select list="#{'0':'正常','1':'禁用'}" name="user.state" theme="simple" headerKey="" headerValue="--请选择--"></s:select>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>

</html>
