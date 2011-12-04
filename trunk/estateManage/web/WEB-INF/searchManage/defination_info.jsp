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
  <form name="form1" action="dictional_save.shtml" method="post">
   <table cellspacing="1" cellpadding="3" width="95%" align="center"
			bgcolor="#6ab6b6" border="0">
			<tbody>
				<tr>
					<th colspan="" height="24">
						【码表添加】
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
						<s:hidden name="defination.id"></s:hidden>
						<input name="defination.name" value="<s:property value="defination.name"/>"/>
					</td>
				</tr>
				<tr>
					<td class="forumrow" height="24">
						编码：
					</td>
					<td class="forumrowhighlight" height="24">
						<input name="defination.code" value="<s:property value="defination.code"/>"/>
						如果码表类型为项目搜索码表，则该属性为搜索字段+'#'+字段类型,1:varchar 
					</td>
				</tr>
				<tr>
					<td class="forumrow" height="24">
						搜索类型：
					</td>
					<td class="forumrowhighlight" height="24">
						<s:select list="#{'1':'<','2':'>','3':'<=','4':'>=','5':'=','6':'!=','7':'between','8':'like'}" name="defination.searchType"></s:select>
					</td>
				</tr>
				<tr>
					<td class="forumrow" height="24">
						码表类型：
					</td>
					<td class="forumrowhighlight" height="24">
						<s:select list="#{'01':'项目搜索码表','99':'公用码表'}" name="defination.category" id="category"></s:select>
					</td>
				</tr>
				<tr>
					<td class="forumrow" height="24">
						描述：
					</td>
					<td class="forumrowhighlight" height="24" id="descrContainer">
						<input id="descr" name="defination.descr" value="<s:property value="defination.descr"/>"/>
					</td>
				</tr>
			</tbody>
		</table>
		</form>
  </body>
</html>
