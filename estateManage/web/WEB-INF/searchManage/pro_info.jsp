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
		<form name="form1" action="pro_saveOrUpdate.shtml" method="post">
			<table cellspacing="1" cellpadding="3" width="95%" align="center"
				bgcolor="#6ab6b6" border="0">
				<tbody>
					<tr>
						<th colspan="" height="24">
							<s:if test="flag==1">
						【项目保存】
					</s:if>
							<s:if test="flag==2">
						【项目详情】
					</s:if>
							<s:if test="flag==3">
						【项目修改】
					</s:if>
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
							项目名：
							<input type="hidden" name="tsPro.id"
								value="<s:property value="tsPro.id"/>" />
						</td>
						<td class="forumrowhighlight" width="60%" height="24">
							<input maxlength="30" name="tsPro.name" value="<s:property value="tsPro.name"/>" />
						</td>
					</tr>
					<tr>
						<td class="forumrow" height="24" align='right'>
							描述：
						</td>
						<td  class="forumrowhighlight" height="24">
							<input maxlength="50" name="tsPro.descr"
								value="<s:property value="tsPro.descr"/>" />
						</td>
					</tr>
					<tr>
						<td class="forumrow" height="24" align='right'>
							序号：
						</td>
						<td class="forumrowhighlight" height="24">
							<input maxlength="3" onkeyup="this.value=this.value.replace(/\D/g,'')"
								name="tsPro.orderNum"
								value="<s:property value="tsPro.orderNum"/>" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
	<script type="text/javascript">
  	      if(${flag}==2){
  	     var instr=document.getElementsByTagName("input"); 
             for(var i=0;i<instr.length;i++)
              {
                   instr[i].style.border="0px";
                   instr[i].style.backgroundColor="#E0FEFE";
              } 
  	      }
  </script>

</html>
