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
		<title>投诉与建议信息</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link rel="stylesheet" href="../resource/css/global.css"
			type="text/css"></link>
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>css/jqueryui/default/easyui.css">
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>css/jqueryui/icon.css">
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>css/jqueryui/icon.css">
		<script type="text/javascript"
			src="<%=basePath%>scripts/jquery-1.4.2.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>scripts/jquery.easyui.min.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>scripts/suggetionManage/suggetion_info.js"></script>
	</head>
	<STYLE type="text/css">
html,body,div,span,td,font {
	font-family: Helvetica, Arial, sans-serif;
	font-size: 12px;
	color: black;
	font-style: normal;
	font-variant: normal;
	font-weight: normal;
	line-height: normal;
}
</STYLE>
	<script LANGUAGE="JavaScript">
  function init(){
  	$("#tbtype").focus();
  	$("#tipspan").hide();
  	$("#register_btn").hide();
  }




</script>
	<body onload="init();">
		<div style="width: 100%; height: 100%;" align="center">
			<table width="70%" style="border: 0px #FF8080 solid;" align="center"
				class="layoutTab">

				<tr align="center">
					<td>
						<form id="sysAgentBean" name="sysAgentBean"
							onsubmit="return true;" action="suggestion_saveOrUpdate.shtml"
							method="post">
							<table width="100%" border="0" cellpadding="0" cellspacing="1"
								bgcolor="#CCCCCC">
								<tr>
									<td height="30" colspan="2" align="center" bgcolor="#BACEEF"
										class="tostrong">
						【处理信息】

									</td>
								</tr>
								<tr>
									<td width="20%" height="30" align="right" bgcolor="#FFFFFF">
									<input TYPE="hidden" name="tpSuggestion.id" value='<s:property value="tpSuggestion.id"/>' />
										主 题：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;&nbsp;<s:property value="tpSuggestion.title"/>
									</td> 
								</tr>
								<tr>
									<td width="20%" height="30" align="right" bgcolor="#FFFFFF">
										创建时间：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;&nbsp;<s:date name="tpSuggestion.createtime" format="yyyy-MM-dd hh:mm:ss"/>
									</td>
								</tr>
								<tr>
									<td width="20%" height="30" align="right" bgcolor="#FFFFFF">
										姓 名：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;&nbsp;<s:property value="tpSuggestion.userName"/>
									</td>
								</tr>
								<tr>
									<td width="20%" height="30" align="right" bgcolor="#FFFFFF">
										手 机：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;&nbsp;<s:property value="tpSuggestion.tel"/>
									</td>
								</tr>
									<tr>
									<td width="20%" height="30" align="right" bgcolor="#FFFFFF">
										E-mail：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;&nbsp;<s:property value="tpSuggestion.email"/>
									</td>
								</tr>
									<tr>
									<td width="20%" height="30" align="right" bgcolor="#FFFFFF">
										投诉对象：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;&nbsp;<s:property value="tpSuggestion.comObject"/>
									</td>
								</tr>
									<tr>
									<td width="20%" height="30" align="right" bgcolor="#FFFFFF">
										来 自：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;&nbsp;<s:property value="tpSuggestion.userfrom"/>
									</td>
								</tr>
									<tr>
									<td width="20%" height="30" align="right" bgcolor="#FFFFFF">
										内 容：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;&nbsp;<s:property value="tpSuggestion.content"/>
									</td>
								</tr>
								<tr>
									<td height="30" align="right" bgcolor="#FFFFFF">
										处理状态：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;&nbsp;
										<s:select
											list="#{'0':'未处理','1':'处理中','2':'处理完'}"
											name="tpSuggestion.state" id="state" theme="simple" 
											></s:select>
									</td>
								</tr>
								<tr>
							      <td height="30" align="right" bgcolor="#FFFFFF">
										处理时间：
									</td>
							      <td bgcolor="#FFFFFF">
							         &nbsp;&nbsp;<s:date name="tpSuggestion.completionTime" format="yyyy-MM-dd hh:mm:ss"/>
							      </td>
							    </tr>
							    <tr>
							      <td height="30" align="right" bgcolor="#FFFFFF">
										处理人：
									</td>
							      <td bgcolor="#FFFFFF">
							        &nbsp;&nbsp;<s:property value="tpSuggestion.Handler"/>
							      </td>
							    </tr>
								<tr>
							      <td height="30" align="right" bgcolor="#FFFFFF">
										处理结果：
									</td>
							      <td bgcolor="#FFFFFF">
							      <textarea name="tpSuggestion.results" cols="70%" rows="8"
												id="results"
												onpropertychange="if(value.length>1000) value=value.substr(0,1000)"
												style="overflow: auto"><s:property value="tpSuggestion.results"/></textarea>
							      </td>
							    </tr>
								
								
							</table>

							<p align="center">
								<label>
									<a href="#" id="btn1" onclick="checkform();"></a>&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="javascript:history.go(-1)" id="btn2"></a>
								</label>
							</p>
							<div class="clear">
								&nbsp;
							</div>

						</form>
					</td>
				</tr>
			</table>
		</div>
		<iframe name="test" style="display: none;"></iframe>
	</body>
	<script language="javascript">
$('#btn1').linkbutton({
   			id:'ad',
   			disabled:false,
   			plain: false,
   			text:'保&nbsp;&nbsp;&nbsp;&nbsp;存',
   			iconCls:'icon-ok login_btn'
   		});
 $('#btn2').linkbutton({
   			id:'ad',
   			disabled:false,
   			plain: false,
   			text:'返&nbsp;&nbsp;&nbsp;&nbsp;回',
   			iconCls:'icon-ok login_btn'
   		});
   		

  function checkform(){
    document.sysAgentBean.submit();
    return true;
}

</script>
</html>
