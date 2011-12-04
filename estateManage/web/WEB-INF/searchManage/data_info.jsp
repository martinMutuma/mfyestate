<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
  <form name="form1" action="dictional_dataSave.shtml" method="post">
   <table cellspacing="1" cellpadding="3" width="95%" align="center"
			bgcolor="#6ab6b6" border="0">
			<tbody>
				<tr>
					<th colspan="" height="24">
						【码表维护】
					</th>
					<th colspan="" height="24" align="right">
						<span style="float: right;margin-right: 5px;"><a href="javascript:formSub();">保存</a>
						<a href="javascript:history.go(-1)">返回</a></span>
					</th>
				</tr>
				<tr>
					<td class="forumrow" width="40%" height="24">
						名称：
					</td>
					<td class="forumrowhighlight" width="60%" height="24">
						<s:hidden name="data.id"></s:hidden>
						<input name="data.pid" value="<s:property value="pid"/>" type="hidden">
						<s:hidden name="pid"></s:hidden>
						<s:hidden name="defName"></s:hidden>
						<input name="data.name" value="<s:property value="data.name"/>"/>
					</td>
				</tr>
				<tr>
					<td class="forumrow" height="24">
						编码：
					</td>
					<td class="forumrowhighlight" height="24">
						<input name="data.code" value="<s:property value="data.code"/>"/>
					</td>
				</tr>
				<tr>
					<td class="forumrow" height="24">
						最小值：
					</td>
					<td class="forumrowhighlight" height="24">
						<input name="data.minvalue" value="<s:property value="data.minvalue"/>"/>
					</td>
				</tr>
				<tr>
					<td class="forumrow" height="24">
						最大值：
					</td>
					<td class="forumrowhighlight" height="24">
						<input name="data.maxvalue" value="<s:property value="data.maxvalue"/>"/>
					</td>
				</tr>
				<tr>
					<td class="forumrow" height="24">
						描述：
					</td>
					<td class="forumrowhighlight" height="24">
						<input name="data.descr" value="<s:property value="data.descr"/>"/>
					</td>
				</tr>
			</tbody>
		</table>
		</form>
  </body>
</html>
