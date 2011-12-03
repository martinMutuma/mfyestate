<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>用户注册</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/icon.css">
	<link rel="stylesheet" href="<%=basePath%>resource/css/global.css" type="text/css"></link>
    <link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>
    <link rel="stylesheet" href="css/registerskip.css" type="text/css"></link>
	<script type="text/javascript" src="<%=basePath %>resource/js/jquery-1.4.2.js" charset="utf-8"></script>
	<script type="text/javascript" src="<%=basePath %>resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>resource/js/jquery.tip.js"></script>
	<script type="text/javascript" src="<%=basePath %>member/register.js" charset="utf-8"></script>
	<script type="text/javascript" src="../resource/js/whole.js"></script>
  </head>
  
  <script LANGUAGE="JavaScript">
  	var basePath = '<%=basePath%>';
</script>
  <body>
  <div id="fade" class="black_overlay"></div>
  <jsp:include page="../head.jsp"></jsp:include>
  <div style="width:100%;" align="center">
  	<div style="width:100%;margin-top: 15px;" id="regi">
		<form id="sysAgentBean" name="sysAgentBean" onsubmit="" action="<%=basePath%>mem/baseinfo_registerMember.shtml" method="post" target="test">
		  <table width="960" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
		    <tr>
		      <td height="30" colspan="2" align="center" bgcolor="#D0121B" class="tostrong"><font style="color: #FFFFFF">会 员 注 册 </font>
		      </td>
		    </tr>
		    <tr>
		      <td height="30" colspan="2" align="center" class="tostrong" bgcolor="#FFFFFF"><span class="impt"> </span>
		      </td>
		    </tr>
		    <tr>
		      <td height="30" align="right" bgcolor="#FFFFFF" ><span style="color:#FF0000;"> </span>会员类别：</td>
		      <td bgcolor="#FFFFFF" >&nbsp;
		        <select name="tb.type" id="tbtype" class="easyui-validatebox" missingMessage="请选择会员类别" required="true" style="width: 120px">
		            <option value="" selected>请选择</option>
		            <option value="1" >经纪人</option>
		            <option value="2" >个人业主</option>
		            <option value="3" >公司业主</option>
					<option value="4" >开发商</option>
					<option value="5" >客户(需求方)</option>
					<option value="6" >银行</option>
					<option value="7" >贷款中介</option>
					<option value="8" >评估公司</option>
					<option value="9" >研究机构</option>
					<option value="10" >连锁企业</option>
					<option value="11" >其他</option>
		        </select></td>
		    </tr>
			<tr>
			      <td height="30" align="right" bgcolor="#FFFFFF" ><span style="color:#FF0000;"> </span>会员性别：</td>
 					<td bgcolor="#FFFFFF" >&nbsp;
			        <select name="tb.sex" id="tbsex" class="easyui-validatebox" missingMessage="请选择会员性别" required="true" style="width: 120px">
			        	<option value="" selected>请选择</option>
			            <option value="1" >男</option>
			            <option value="2" >女</option>
			        </select></td>
			    </tr>
		     <tr>
		       <td height="30" align="right" bgcolor="#FFFFFF" ><span style="color:#FF0000;"> </span>地&nbsp;&nbsp;&nbsp;&nbsp;	区：</td>
				<td bgcolor="#FFFFFF" id="district">&nbsp;
					 <select id="discode" name="tb.discode" class="easyui-validatebox" missingMessage="请选择地区" required="true" style="width: 218px;">
					 </select>
					 <input type="hidden" name="tb.disname" id="disname" />
				</td>
		      </tr>
	
		    <tr>
		      <td width="20%" height="30" align="right" bgcolor="#FFFFFF"><span style="color:#FF0000;"> </span>用 户 名：</td>
		      <td bgcolor="#FFFFFF">&nbsp;
		      <input type="text" name="tb.username" style="width: 220px" maxlength="15" value="" id="username" onchange="return checkUsername(this)" class="easyui-validatebox" missingMessage="5-15个字符(包括英文字母、数字)" required="true" validType="length[5,15]" invalidMessage="长度为5-16"/>
		      <font><span id="checkid" style="color:#FF8080"></span></font><font><span id="checkid1" style="color:green"></span></font></td>
		    </tr>
		    <tr>
		      <td height="30" align="right" bgcolor="#FFFFFF"><span style="color:#FF0000;"> </span>密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
		      <td bgcolor="#FFFFFF" style="anchor:100%">&nbsp;
		      <input type="password" name="tb.password" style="width: 220px" id="password" class="easyui-validatebox" missingMessage="6-16个字符，英文字母加数字的组合密码" required="true" maxlength="12" validType="length[6,12]" invalidMessage="长度为6-12"/>
		      </td>
		    </tr>
		    <tr>
		      <td height="30" align="right" bgcolor="#FFFFFF"><span style="color:#FF0000;"> </span>确认密码：</td>
		      <td bgcolor="#FFFFFF">&nbsp;
		      <input type="password" name="repassword" style="width: 220px" id="repassword" class="easyui-validatebox" missingMessage="请输入确认密码" required="true" maxlength="12" onchange="return chechrepass(this)"/>
		      <font><span id="repasswordid" style="color:#FF8080"></span></font></td>
		    </tr>
			<tr>
		      <td height="30" align="right" bgcolor="#FFFFFF"><span style="color:#FF0000;"> </span>真实姓名：</td>
		      <td bgcolor="#FFFFFF">&nbsp;
		      <input type="text" name="tb.realName" style="width: 220px" value="" id="realName" class="easyui-validatebox" missingMessage="请填写中文姓名" onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,'')" required="true"/>
		      </td>
		    </tr>
		    <tr>
		      <td height="30" align="right" bgcolor="#FFFFFF"><span style="color:#FF0000;"> </span>电子信箱：</td>
		      <td bgcolor="#FFFFFF">&nbsp;
		      <input type="text" name="tb.email" style="width: 220px" value="" id="email" onchange="return checkMail(this)" class="easyui-validatebox" missingMessage="安全验证的邮箱，请正确填写 无需验证，仅用于找回密码" required="true"/>
		      <font> <span id="mailid" style="color:#FF8080"></span></font><font > <span id="mailid1" style="color:green"></span></font></td>
		    </tr>
		  <!--     <tr>
		        <td height="30" align="right" bgcolor="#FFFFFF">所属公司：</td>
		        <td bgcolor="#FFFFFF">&nbsp;<label>
		            <input type="text" name="tb.company" style="width: 220px" maxlength="15" value="" id="company" class="easyui-validatebox" missingMessage="请如实填写,经纪人、公司业主、代理商、开发商，必须填写公司名称" required="false"/>
		            </label>
		        </td>
		      </tr>
		   -->
		    <tr>
		      <td height="30" align="right" bgcolor="#FFFFFF"><span style="color:#FF0000;"> </span>手机号码：</td>
		      <td bgcolor="#FFFFFF">&nbsp;
		      <input type="text" name="tb.mobile" style="width: 220px" value="" id="mobile" onchange="return checkPhone(this)" class="easyui-validatebox" missingMessage="请输入手机号" required="true"/>
		      <font> <span id="phoneid" style="color:#FF8080"></span></font><font> <span id="phoneid1" style="color:green"></span></font>
		      </td>
		    </tr>
		    <tr>
		      <td height="30" align="right" bgcolor="#FFFFFF"><span style="color:#FF0000;"> </span>校 验 码：</td>
		      <td bgcolor="#FFFFFF">&nbsp;
		      	  <input type="text" name="imgchk" id="imgchk" maxlength="4" size="8">
			      <img id="pic" src="<%=basePath%>member/yanzhengma.jsp" align="middle" /> <a href="javascript:changePicture();">换一张</a>
		      </td>
		    </tr>
		    <tr>
		      <td height="45" align="right" bgcolor="#FFFFFF">&nbsp;</td>
		      <td bgcolor="#FFFFFF">&nbsp;<label>
		        <input type="checkbox" name="ck_ok" id="ck_ok"  value="checkbox" checked />
		      我已阅读并接受《<a href="contract.jsp" target="_blank">用户服务协议</a>》</label></td>
		    </tr>
		  </table>
		  <p align="center">
		    <a href="#" id="btn" onclick="checkform();"></a>
		  </p>
		  <input type="hidden" name="tb.integral" value="10"/>
		  <input type="hidden" name="tb.level" value="1"/>
		  <input type="hidden" name="tb.honorType" value="1"/>
		  <input type="hidden" name="tb.headUrl" value="default_head.jpg"/>
		</form>
		</div>
		<div id="light" class="white_content">
      		  <!-- <div class="close" style="margin-top: 5px;margin-right: 5px;"><a href="javascript:void(0)" onclick="hide('light')"><font color="black"> </font></a></div> -->
		      <div style="text-align:center;margin-top: 10px;margin-bottom: 10px;font-size: 15px;">注册成功 &nbsp;&nbsp;&nbsp;&nbsp;  <br/><br/>
	   			<span id="dd">5</span> 秒后自动跳转到会员中心
	   			<a href="javascript:goDoFullInfoPage();" style="font-size: 18px;">完善个人信息</a> &nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:goMainPage();" style="font-size: 18px;">直接跳过下次再说</a></div>
		</div>
    	<jsp:include page="../copyright.jsp"></jsp:include>
    </div>
    <iframe name="test" style="display: none;"></iframe>
  </body>
</html>
