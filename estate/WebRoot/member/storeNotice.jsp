<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>店铺公告</title>
    
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
	a:link {color: #0066CC;text-decoration: none;}     /* unvisited link */
	a:visited {color: #D20805;text-decoration: none;}  /* visited link */
	a:hover {color: #FFA028;text-decoration: none;}   /* mouse over link */
	a:active {color: #FFA028;text-decoration: none;}   /* selected link */
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
<form id="stroreNoticeForm" name="stroreNoticeForm" onsubmit="return true;" action="<%=basePath%>message/message_addNotice.shtml" method="post">
    <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
      <tr>
        <td height="30" background="/images/ttbg_g_3.jpg">
        <p align="center"><b><s:property value="tb.realName"/></b> 的店铺公告</p>
        <input type="hidden" name="agentId" value="99979494" id="agentId"/></td>
      </tr>
	  <tr>
        <td height="170" align="center" bgcolor="#FFFFFF"><label>
          <textarea name="message" cols="70" rows="10" id="message"></textarea>
          </label>
        </td>
      </tr>
    </table>
    <p align="center">
	  <label>
      <a href="javascript:onsubmit();" id="btn"></a>
      </label>
     </p>
   </form>
    		</td>
    	</tr>
    </table>
  </div>
   <input type="hidden" name="loginId" value="${loginId}" id="loginId"/>
  </body>
  <SCRIPT type="text/javascript">
     $('#btn').linkbutton({
   			id:'ad',
   			disabled:false,
   			plain: false,
   			text:'确&nbsp;&nbsp;&nbsp;&nbsp;定',
   			iconCls:'icon-ok login_btn'
   		});
   function onsubmit(){
		if($("#message").val()==''){$("#message").focus();return;}
	document.stroreNoticeForm.submit();
	// document.forms[0].action.submit();
	return false;
  }
  </SCRIPT>
</html>
