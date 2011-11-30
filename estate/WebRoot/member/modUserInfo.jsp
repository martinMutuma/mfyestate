<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.estate.util.comm.RequestUtil"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String menuCls = RequestUtil.getParam(request,"menuCls","");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

		<title>资料修改</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!-- 1.css添加 -->
		<link rel="stylesheet" href="../resource/css/global.css" type="text/css"></link>
		<link rel="stylesheet" type="text/css" href="css/thickbox.css" />
		<link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/default/easyui.css"></link>
		<link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/icon.css"></link>
		<link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>
		<link rel="stylesheet" href="../resource/css/memberCenter/info.css" type="text/css"></link>
		<script type="text/javascript" src="../resource/js/jquery-1.4.2.js" charset="utf-8"></script>
		<script type="text/javascript" src="thickbox_plus.js"></script>
		<script type="text/javascript" src="../resource/js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="../resource/js/global.js"></script>
		<script type="text/javascript" src="<%=basePath%>member/modUserInfo.js" charset="utf-8"></script>
		<script type="text/javascript" src="../resource/js/whole.js"></script>
	</head>
  <script LANGUAGE="JavaScript">
  	var basePath = '<%=basePath%>';
  </script>
  
  <body>
  	<!-- 2.添加div	 -->
  <div style="width: 100%;" align="center">
 <jsp:include page="../head.jsp"></jsp:include>
  <!-- 3.添加class="layoutTab"  -->
    <table class="layoutTab" style="border: 0px red solid;margin-top: 10px;">
    	<tr>
    	<td width="20%" align="left" valign="top"><jsp:include page="../left.jsp"></jsp:include></td>
    		<td valign="top">
    		<div class="position" align="left"><label>您所在的位置：</label><a href="../home.shtml">梦房园</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="../mem/baseinfo_mainPage.shtml">会员中心</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="<%=basePath%>mem/baseinfo_modUserInfoPage.shtml?menuCls=31">修改资料</a></div>
					<div class="info_top"></div><div class="info_mid">
<form id="sysAgentBean" name="sysAgentBean" onsubmit="return true;" action="<%=basePath%>mem/baseinfo_registerMember.shtml" method="post" enctype="multipart/form-data">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" >
      <tr>
        <td height="30" colspan="2" align="center" background="images/ttbg_g_3.jpg"><strong>资料修改</strong></td>
      </tr>
      <tr>
        <td align="right" >&nbsp;</td>
         <td ><img src="<%=basePath%>imageFloder/<s:property value="tb.headUrl"/>" width="100" height="133" id="picHead" alt="用户头像" style="float:left;margin-right:10px;"/>
        </td>
      </tr>
      <tr>
        <td width="25%" height="30" align="right" >自定义头像：</td>
        <td  >
            <label>
                <input id="img1" type="file" name="imageFile" />
          </label>
        </td>
      </tr>

      <tr>
        <td height="75" align="right" >图片上传说明：</td>
        <td ><p>为保障梦房园的服务质量：</p>
        <p>1. 用户头像应为正面免冠相片，且图象清晰，尺寸为100×133像素</p>
        <p>2. 梦房园保留审核并删除不合格图片的权利</p>
        <p>3. 图片大小不能超过100kB，格式为jpg</p></td>
      </tr>
      <tr>
        <td height="30" align="right" >用&nbsp;户&nbsp;名：</td>
        <td >
        <input type="hidden" name="tb.username" value="<s:property value="tb.username"/>"/><s:property value="tb.username"/>
        </td>
      </tr>
      <tr>
      <td align="right">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;区：</td>
		<td align="left">
			<input type="text" style="width:200px"  value="<s:property value="tb.disname"/>" id="districtShow"/>
			<input type="hidden" name="tb.district" id="district" value="<s:property value="tb.district"/>"/>
			<input type="hidden" name="tb.disname" id="disname" value="<s:property value="tb.disname"/>"/>
		</td>
      </tr>  
     <tr>
	      <td height="30" align="right" > 会员性别：</td>
			<td>
	        <select name="tb.sex" style="width: 120px">
		        <option ${tb.sex eq 1?'selected' :''} value="1">
					男
				</option>
				<option ${tb.sex eq 2?'selected' :''} value="2">
					女
				</option>
	        </select></td>
	    </tr>
      <tr>
        <td height="30" align="right" >公司名称：</td>
        <td >
        <input type="text" name="tb.company" size="25" value="<s:property value="tb.company"/>"/>
        </td>
      </tr>
      <tr>
        <td height="30" align="right" >所属门店：</td>
        <td ><label>
            <input type="text" name="tb.stores" size="25" maxlength="45" value="<s:property value="tb.stores"/>" /></label>
            </td>
      </tr>
      <tr>
        <td height="30" align="right" >电子信箱：</td>
        <td >
            <div style="float: left"><input type="text" name="tb.email" size="25" value="<s:property value="tb.email"/>" id="email" onchange="oncheck('1',this.value);"/></div> 
            <div style="float: left"><input style="display: none;font-size:10px" type=button value="检&nbsp;&nbsp;测" name="editEmail" onclick="return checkMail(this);" id="editEmail" ></div>
            <div style="float: left"><font> <span id="mailid" style="color:red;font-size:13px;"></span></font><font> <span id="mailid1" style="color:green;font-size:13px;"></span></font></div>
        </td>
      </tr>
      <tr>
        <td height="30" align="right" >真实姓名：</td>
        <td >
        <input type="hidden" name="tb.realName" value="<s:property value="tb.realName"/>"/><s:property value="tb.realName"/>
        </td>
      </tr>
      <tr>
        <td height="30" align="right" >手机号码：</td>
        <td >
            <div style="float: left"><input type="text" name="tb.mobile" size="25" maxlength="20"  value="<s:property value="tb.mobile"/>" id="mobile" onchange="oncheck('2',this.value);"/></div>
            <div style="float: left"><input style="display: none;font-size:10px" type=button value="检&nbsp;&nbsp;测" name="editPhone" onclick="return checkPhone(this);" id="editPhone" ></div>
            <div style="float: left"><font> <span id="phoneid" style="color:red;font-size:13px;"></span></font><font> <span id="phoneid1" style="color:green;font-size:13px;"></span></font></div>
        </td>
      </tr>
      <tr>
        <td height="30" align="right" >固定电话：</td>
        <td >
          <input type="text" name="tb.tel" size="25" maxlength="20" value="<s:property value="tb.tel"/>" id="tel"/>
          
           </td>
      </tr>
      <tr>
        <td height="150" align="right" >自我介绍：</td>
        <td >
              <textarea rows="15" cols="60" name="tb.introduction" ><s:property value="tb.introduction"/></textarea>  
            </td>
      </tr>
    <tr>
	  <td align="center" colspan="2">
		  <input type="hidden" name="tb.id" value="<s:property value="tb.id"/>"/>
		  <input type="hidden" name="tb.status" value="<s:property value="tb.status"/>"/>
		  <input type="hidden" name="tb.certification" value="<s:property value="tb.certification"/>"/>
		  <input type="hidden" name="tb.money" value="<s:property value="tb.money"/>"/>
		  <input type="hidden" name="tb.integral" value="<s:property value="tb.integral"/>"/>
		  <input type="hidden" name="tb.mouseWord" value="<s:property value="tb.mouseWord"/>"/>
		  <input type="hidden" name="tb.level" value="<s:property value="tb.level"/>"/>
		  <input type="hidden" name="tb.virtualCurrency" value="<s:property value="tb.virtualCurrency"/>"/>
		  <input type="hidden" name="tb.createTime" value="<s:date name="tb.createTime"/>"/>
		  <input name="menuCls" type="hidden" id="menuCls" value="<%=menuCls%>"/>
		<a href="#" id="btn" onclick="return checkform()"></a>
		</td>
	</tr>
    </table>
   </form>
   	</div>
		<div class="info_bottom"></div>
    		</td>
    	</tr>
    </table>
  </div>
  <div style="margin-top: 10px;">
			<center>
				<jsp:include page="../copyright.jsp" />
			</center>
		</div>
  </body>
</html>
