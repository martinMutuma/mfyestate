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
		<title>修改密码</title>

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
  	   var flag = true;
  	    if(document.getElementById("oldpassword").value !=  document.getElementById("oldpassword2").value )
  	    {  
  	       flag = false;
  	       alert("原始密码不正确，请重新输入！");
  	    }
  	    if(document.getElementById("newpassword").value !=  document.getElementById("newpassword2").value )
  	    {  
  	       flag = false;
  	       alert("两次密码输入不正确，请重新输入！");
  	    }
  	    if(flag == true){
  		   document.form1.submit();
  		}
  	}
  </script>
	<body>
		<form name="form1" action="user_updatePassword.shtml" method="post">
			<table cellspacing="1" cellpadding="3" width="95%" align="center"
				bgcolor="#6ab6b6" border="0">
				<tbody>
					<tr>
						<th colspan="" height="24">
							【修改密码】
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
							原始密码：
						</td>
						<td class="forumrowhighlight" width="60%" height="24">
							<input id="oldpassword" type="text" value="">
							<input id="oldpassword2" type="hidden"
								value="<s:property value="#session.userinfo.password"/>" />
						</td>
					</tr>
					<tr>
						<td class="forumrow" height="24" align='right'>
							新密码：
						</td>
						<td class="forumrowhighlight" height="24">
							<input id="newpassword" value="" />
						</td>
					</tr>
					<tr>
						<td class="forumrow" height="24" align='right'>
							再次确认：
						</td>
						<td class="forumrowhighlight" height="24">
							<input id="newpassword2" name="newPassword" value="" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
	<script type="text/javascript">
  </script>

</html>
