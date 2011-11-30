<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>密码修改</title>
    
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
	<script type="text/javascript" src="../resource/js/global.js"></script>
	<script type="text/javascript" src="<%=basePath%>member/register.js" charset="utf-8"></script>
	  <script type="text/javascript" src="../resource/js/whole.js"></script>
	    <link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>

  </head>
  <body>
  	 <jsp:include page="../head.jsp"></jsp:include>
		<div style="width: 100%; margin-top: 10px;" align="center">
  <!-- 3.添加class="layoutTab"  -->
    <table class="layoutTab" style="border: 0px red solid;">
    	<tr>
    	<td width="20%" align="left"><jsp:include page="../left.jsp"></jsp:include></td>
    		<td valign="top">
<form id="sysAgentBean" name="sysAgentBean" onsubmit="return true;" action="<%=basePath%>mem/baseinfo_saveNewPassMember.shtml" method="post">
	   <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
	        <tr >
	        	<td class="tdT tdB tdL tdR" height="30" colspan="2" align="center"  background="../member/images/ttbg_g_3.jpg"  bgcolor="#CCCCCC"><strong>密&nbsp;&nbsp;码&nbsp;&nbsp;修&nbsp;&nbsp;改 </strong></td>
	        </tr>
	        <tr>
	        	<td class="tdL tdR" width="20%" height="30" align="right" bgcolor="#FFFFFF">用户名：</td>
	        	<td class="tdR" style="padding-left: 2px;" bgcolor="#FFFFFF"><input type="hidden" readonly="readonly" name="tb.username" value="<s:property value="tb.username"/>"/><s:property value="tb.username"/></td>
	        </tr>
			<tr>
				<td class="tdL tdR" height="30" align="right" bgcolor="#FFFFFF">旧密码：</td>
				<td class="tdR" style="padding-left: 2px;" bgcolor="#FFFFFF"><input type="password" name="tb.password"  size="25"  maxlength="20" id="oldPwd" class="easyui-validatebox" missingMessage="请输入旧密码" required="true"/>
				</td>
			</tr>
			<tr>
				<td class="tdL tdR"  height="30" align="right" bgcolor="#FFFFFF">新密码：</td>
				<td class="tdR" style="padding-left: 2px;" bgcolor="#FFFFFF" align="left"><input type="password" name="userPwd" size="25" maxlength="20" class="easyui-validatebox" missingMessage="请输入新密码,最小为6位" validType="length[6,20]"  invalidMessage="长度最小为6位" required="true"/>
				</td>
			</tr>
			<tr>
				<td class="tdL tdR tdB" height="30" align="right" bgcolor="#FFFFFF">确认新密码：</td>
				<td class="tdR tdB" style="padding-left: 2px;" bgcolor="#FFFFFF" align="left"><input type="password" name="repwd" size="25"  maxlength="20" class="easyui-validatebox" missingMessage="请再次输入新密码，确保两次输入的密码相同" required="true"/>
				</td>
			</tr>
	  </table>
		<p align="center">
		  <label>
	     <a href="#" id="btn" onclick="return checkform()"></a>
	      </label>
	     </p>
	  </form>

    		</td>
    	</tr>
    </table>
  </div>
  							<div style="margin-top: 10px;">
			<center>
			     <input name="menuCls" type="hidden" id="menuCls" value="${menuCls}"/>
				<jsp:include page="../copyright.jsp" />
			</center>
		</div>
  </body>
  <script type="text/javascript">
  $('#btn').linkbutton({
   			id:'ad',
   			disabled:false,
   			plain: false,
   			text:'<font color=black>提&nbsp;&nbsp;&nbsp;&nbsp;交</font>',
   			iconCls:'icon-ok login_btn'
   		});
  if($("#reLogin").val()=='0'){
  		$.messager.show({
   			showType:'slide',
   			showSpeed:1000,
   			width:300,
   			height:150,
   			msg:'旧密码错误',
   			title:'密码修改失败',
   			timeout:5000
   		});
  	}
  function checkform(){
    var oldpwd=document.sysAgentBean.oldPwd;
    var password = document.sysAgentBean.userPwd;
    var repwd = document.sysAgentBean.repwd;
    if(!checkNull(oldpwd)){
      _Alert(oldpwd,"请输入用户旧密码");
      return false;
    }
    if(!checkNull(password)){
      _Alert(password,"请输入用户新密码");
      return false;
    }else{
       if(password.value.length<6){
	      _Alert(password,"输入用户新密码长度最小为6位");
	      return false;
       }
    }
    
    if(!checkNull(repwd)){
      _Alert(repwd,"请输入确认新密码");
      return false;
    }else{
      if(password.value!=repwd.value){
      	  document.sysAgentBean.repwd.value='';
	      _Alert(repwd,"确认新密码输入不正确");
	      return false;
      }
    }
    document.sysAgentBean.submit();
    return true;
  }
  
  </script>
</html>
