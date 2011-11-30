<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>留言中心</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 1.css添加 -->
	<link rel="stylesheet" href="../resource/css/global.css" type="text/css"></link>
    <link rel="stylesheet" type="text/css" href="css/thickbox.css"/>
    <link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/default/easyui.css"></link>
	<link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/icon.css"></link>
    <script type="text/javascript" src="../resource/js/jquery-1.4.2.js" charset="utf-8"></script>
	<script type="text/javascript" src="thickbox_plus.js"></script>
	<script type="text/javascript" src="../resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>resource/js/jquery.tip.js"></script>
	<script type="text/javascript" src="../resource/js/global.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
       <script type="text/javascript" src="../resource/js/whole.js"></script>
	    <link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>
  </head>  
  <style type="text/css">
  .leftNav li {
	padding-left: 15px;
	padding-top: 5px;
	background: #E0ECFF;
	border-bottom: 1px solid #99BBE8;
	line-height: 30px;
	list-style-type:none;
	margin-left: 0px;
	}
	.leftNav li a{color:#333;text-decoration:none;}
	.leftNav li.title{background: #f3f3f3;}
	#rightbox {
	float: left;
	height: auto;
	width: 750px;
	overflow:hidden;
	}
	#rightbox a{color:#333; text-decoration:none;}
	#rightbox2{
	float: left;
	height: auto;
	width: 750px;
	}
  </style>
  <body>
  	<!-- 2.添加div	 -->
  <div style="width: 100%;height: 100%;" align="center">
  <!-- 3.添加class="layoutTab"  -->
    <table class="layoutTab" style="border: 0px red solid;">
    	<tr>
    		<td colspan="2" align="center">
    			<jsp:include page="../head.jsp"></jsp:include>
    		</td>
    	</tr>
    	<tr>
    		<td width="25%" align="center"><jsp:include page="../left.jsp"></jsp:include>
    		</td>
    		<td valign="top">
			<form name="messageAddform" onsubmit="return true;" action="<%=basePath%>message/message_addMessage.shtml" method="post">
	    		<table border="0" cellpadding="1" bordercolor="#111111" width="100%">
					<tr>
						<td align="right" width="25%">留言主题：</td>
						<td align="left"><input type="text" name="ts.messageTitle" size="50" maxlength="50" id="messageTitle" class="easyui-validatebox" missingMessage="请输入留言主题" required="true"/></td>
					</tr>
					<tr>
						<td align="right">留言内容：</td>
						<td vAlign="top" align="left"><textarea name="ts.messageContent" cols="50" rows="8" id="messageContent" class="easyui-validatebox" missingMessage="请输入留言内容" required="true"></textarea></td>
					</tr>
					<tr>
						<td align="right">您的姓名：</td>
						<td align="left"><input type="text" name="ts.fromUserName" size="30" maxlength="20" id="fromUserName" class="easyui-validatebox" missingMessage="请输入您的姓名" required="true"/></td>
					</tr>
					<tr>
						<td align="right">联系电话：</td>
						<td align="left"><input type="text" name="ts.phone" size="30" maxlength="20" id="phone"/></td>
					</tr>
					<tr>
						<td align="right">电子邮件：</td>
						<td align="left"><input type="text" name="ts.email" size="30" maxlength="30" id="email"/></td>
					</tr>
					<tr>
						<td align="right">校验码：</td>
						<td align="left"><input type="text" style="width:120px;" name="imgchk" id="imgchk" maxlength="4" size="4">
				     	<img id="pic" src="<%=basePath%>member/yanzhengma.jsp" align="middle" /> <a href="javascript:changePicture();">换一张</a>
					</tr>
					<tr>
						<td align="center" colSpan="2"><a href="javascript:onsubmit();" id="btn"></a>
						</td>
					</tr>
				</table>
   				<!-- <input type="hidden" name="ts.fromId" value="${loginId}" id="loginId"/> -->
   				<input type="hidden" name="ts.toId" value="2" id="loginId"/>
   				<input type="hidden" name="ts.flag" value="<s:property value="ts.flag"/>" id="loginId"/>
   				<input type="hidden" name="ts.fromId" value="2" id="loginId"/>
			</form>
    		</td>
    	</tr>
    </table>
  </div>
  </body>
  <script type="text/javascript">
  $("#imgchk").tip({height:'20px',width:'80px'},"<font style='color:black'>请输入验证码</font>","1");
   $('#btn').linkbutton({
   			id:'ad',
   			disabled:false,
   			plain: false,
   			text:'确&nbsp;&nbsp;&nbsp;&nbsp;定',
   			iconCls:'icon-ok login_btn'
   		});
   
  function onsubmit(){
		if($("#messageTitle").val()==''){$("#messageTitle").focus();return;}
		if($("#messageContent").val()==''){$("#messageContent").focus();return;}
		if($("#fromUserName").val()==''){$("#fromUserName").focus();return;}
		if($("#imgchk").val()==''){$("#imgchk").focus();return;}
	document.messageAddform.submit();
	// document.forms[0].action.submit();
	return false;
  }
  </script>
</html>
