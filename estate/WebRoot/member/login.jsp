<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String username = request.getParameter("username");
if(null==username)username="";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>用户登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<%=basePath %>resource/css/jqueryui/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>resource/css/jqueryui/icon.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>member/css/login.css">
	<!-- jquery base and plugin -->
	<script type="text/javascript" src="<%=basePath %>resource/js/jquery-1.4.2.js" charset="utf-8"></script>
	<script type="text/javascript" src="<%=basePath %>resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>resource/js/jquery.tip.js"></script>
	<!-- head css -->
	<script type="text/javascript" src="<%=basePath %>resource/js/whole.js"></script>
	<link rel="stylesheet" href="<%=basePath %>resource/css/whole.css" type="text/css"></link>
	<style type="text/css">
		html,body{
			text-align: center;
		}
	</style>
  </head>
  
  <body onload="init();">
  <jsp:include page="../head.jsp"></jsp:include>
  	<div class="panel" align="center">
    <div class="stand_width">
    	<table width="100%" cellpadding="0" cellspacing="0" class="login-table" border="0">
    		<tr>
    		<td class="login_split" align="center" valign="middle">
    				<h3>打造全国第一房产平台</h3>
					<div class="right-top" align="center" >
						<p class="why">为什么要成为注册用户？</p>
						<p class="reason"><img src="<%=basePath %>member/images/login1.jpg" align="absmiddle"/>&nbsp;&nbsp;免费发布房源信息.</p>
						<p class="reason"><img src="<%=basePath %>member/images/login2.jpg" align="absmiddle"/>&nbsp;&nbsp;了解最新房源信息.</p>
						<p class="reason"><img src="<%=basePath %>member/images/login3.jpg" align="absmiddle"/>&nbsp;&nbsp;了解最新的房产政策.</p>
						<p class="reason"><img src="<%=basePath %>member/images/login4.jpg" align="absmiddle"/>&nbsp;&nbsp;掌握最快的投资渠道.</p>
					</div>
					<div class="right-foot" style="margin-top: 20px;width: 100%" align="center">
						<p class="register">还未注册为地产会员？赶快去<a href="javascript:register();" >注册</a>吧！</p>
					</div>
    			</td>
    			<td valign="middle" width="50%">
    				<img style="margin-left: 15px;" src="<%=basePath %>member/images/login-title.png" />
    				<br/><br/>
					<div class="user-login" align="left">
						<table width="100%" cellpadding="0" cellspacing="0" border="0">
							<tr><td align="left" width="14%" valign="middle">用户名</td>
							<td valign="middle"><input name="username" id="username" class="easyui-validatebox" missingMessage="请输入用户名" required="true" type="text" onkeydown="javascript:enterPress(event,this);"/></td></tr>
							<tr><td valign="middle">密&emsp;码</td>
							<td valign="middle"><input class="easyui-validatebox"  required="true" name="password" id="password" missingMessage="请输入密码" class="text" type="password" maxlength="32" onkeydown="javascript:enterPress(event,this);"/></td></tr>
							<tr><td valign="middle">验证码</td>
							<td valign="middle"><input type="text" style="width:120px;" name="imgchk" id="imgchk" maxlength="4" size="4" onkeydown="javascript:enterPress(event,this);"/>&nbsp;&nbsp;&nbsp;&nbsp;<img id="pic" src="<%=basePath%>member/yanzhengma.jsp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:changePicture();">换一张</a></td></tr>
							<tr><td>&nbsp;</td><td align="left" valign="middle"><a href="javascript:login();" id="btn"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.location.href='findPassword.jsp'">忘记密码</a></td></tr>
						</table>
					</div>
    			</td>
    			
    		</tr>
    	</table>
		<div class="split_height">
		</div>
		</div>
		<jsp:include page="../copyright.jsp" />
  </body>
  <script type="text/javascript">
  $("#username").val('<%=username%>');
    $("#imgchk").tip({height:'25px',width:'100px','font-size':'13px','line-height':'25px'},"<font style='color:black'>请输入验证码</font>","2");
     $('#btn').linkbutton({
   			id:'ad',
   			disabled:false,
   			plain: false,
   			text:'登&nbsp;&nbsp;&nbsp;&nbsp;陆',
   			iconCls:'icon-ok login_btn'
   		});
   		
    function init(){
    	if($("#username").val()==''){
		  $("#username").focus();
		  $("#logo_span").hide();
	   	}else if($("#password").val()==''){
	   	  $("#password").focus();
	   	}
  	}
  	function enterPress(e,obj) { 
		if (e.keyCode == 13) { 
			login(); 
			$(obj).blur();
		} 
	}
   function login(){
   		$("#btn").blur();
		var username = $("#username").val();
		var password = $("#password").val();
		var imgchk = $("#imgchk").val();
		if(username==''){$("#username").focus();return;}
		if(password==''){$("#password").focus();return;}
		if(imgchk==''){$("#imgchk").focus();return;}
		var time_second = $("#time_second option:selected").val();
		var url = "<%=basePath%>mem/baseinfo_loginMember.shtml?username="+username+"&password="+password+"&imgchk="+imgchk+"&time_second="+time_second+"&time="+(new Date().getTime().toString(36));
		$.get(url,function(mes){
			if(mes=="1"){
				window.location.href="<%=basePath%>mem/baseinfo_mainPage.shtml";
			}else if(mes=="2"){
				$.messager.alert('警告','验证码错误','info',function(){
					window.location.href="<%=basePath%>member/login.jsp?username="+username;
				})
			}else{
				$.messager.alert('警告','用户名或者密码错误','info',function(){
					window.location.href="<%=basePath%>member/login.jsp?username="+username;
				})
			}
		})
	}
	function register(){
		window.location.href="<%=basePath%>member/register.jsp"
	}
	/*换验证码*/
 function  changePicture(){
     document.getElementById("pic").src="<%=basePath%>member/yanzhengma.jsp?date="+new Date();
 }
  </script>
</html>
