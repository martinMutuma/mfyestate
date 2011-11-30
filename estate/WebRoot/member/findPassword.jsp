<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>找回密码</title>
    
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
	<link rel="stylesheet" type="text/css" href="css/findPass.css"></link>
    <script type="text/javascript" src="../resource/js/jquery-1.4.2.js" charset="utf-8"></script>
	<script type="text/javascript" src="thickbox_plus.js"></script>
	<script type="text/javascript" src="../resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>resource/js/jquery.tip.js"></script>
	<script type="text/javascript" src="../resource/js/global.js"></script>
	<script type="text/javascript" src="findPassword.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
       <script type="text/javascript" src="../resource/js/whole.js"></script>
	    <link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>
  </head>  
  <body>
  <jsp:include page="../head.jsp"></jsp:include>
  	<!-- 2.添加div	 -->
  <div align="center">
  <!-- 3.添加class="layoutTab"  -->
    <table class="layoutTab" style="border: 0px red solid;">
    	<tr>
    		<td valign="top">
	    		<span class="findpass log_lo"></span>
	    	</td>
	    	</tr>
	    	<tr>
		    	 <td>
					 <div class="zhmm borde madt findcon">
		            	<!-- <ul>
		                	<li class="findpadd"><span class="findmm fbo14">一、发送密码到手机</span> （需要验证手机）&nbsp;<span id="msg_01" style="color:#F00;"></span></li>
		                    <li class="f_padd">
		                        <form action="" method="post">
		                            请输入用户名：<input name="userName01" id="userName01" type="text" class="h22 madr13" onkeyup="this.value=this.value.replace(/[^\w\u4E00-\u9FA5]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\w\u4E00-\u9FA5]/g,''))"/>
		                            请输入手机号码：<input name="tel" id="tel" type="text" class="h22 madr13" onkeyup="this.value=this.value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
		                            <input type="hidden" name="flag01" id="flag01" value="1" />
		                            <input name="buttel" id="buttel" type="button" class="sendbutt" value="" onclick="return chk_tel();" />
		                        </form>
		                    </li>
		                </ul>
		                 -->
		            	<ul>
		                	<li class="findpadd"><span class="findmm fbo14">发送密码到邮箱</span> （需要验证邮箱）&nbsp;<span id="msg_02" style="color:#F00;"></span></li>
		                    <li class="f_padd">
		                            请输入用户名：<input name="userName02" style="height: 25px;" id="userName02" type="text" onkeyup="this.value=this.value.replace(/[^\w\u4E00-\u9FA5]/g,'')"/>
		                            请输入电子邮箱地址：<input name="email" style="width: 200px;height: 25px;" id="email" type="text" onKeyUp="this.value=this.value.replace(/[^\w@\.]/g,'');"/>
		                            <input type="hidden" name="flag02" id="flag02" value="2" />
		                            <a href="javascript:login();" id="btn"></a>
		                            <input name="butemail" id="butemail" type="button" class="sendbutt" value="" onclick="return chk_email();"/>
		                    </li>
		                </ul>
		    	</div>
    		</td>
    	</tr>
    </table>
    <jsp:include page="../copyright.jsp"></jsp:include>
  </div>
  </body>
  <script type="text/javascript">
  var basePath='<%=basePath %>';
  </script>
</html>
