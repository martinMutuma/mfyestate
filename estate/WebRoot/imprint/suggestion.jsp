<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>    
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>梦房园</title>
<meta http-equiv="keywords" content="楼盘,买房">
<meta http-equiv="description" content="梦房园是买卖、租赁房屋平台，它提供新房、二手房买卖租赁信息,也提供地产投资、海景房、旅游地产以及房产资讯">
</head>
<body>
	<div class="rightContent">
	<p class="text">&nbsp;</p>
	  <p align="center" class="toshow">欢迎您对我们的服务进行监督，也期望您能提出建议让我们能更好的为您和更多人服务，谢谢您！</p>
   			<form id="suggFrom" name="suggFrom" onsubmit="" action="imprint_addSuggestion.shtml" method="post">
			  <table class="suggtable" >
			    <tr>
			      <td class="suggrighttd"><span style="color:#FF0000;">* </span>主&nbsp;题：</td>
			      <td >&nbsp;
			      <input type="text" id="title" name="tpSuggestion.title" style="width: 400px" maxlength="100" value=${tpSuggestion.title}>
			      <font class="warn">投诉或者建议</font>
			     </td>
			    </tr>
				<tr>
			      <td class="suggrighttd">姓&nbsp;名：</td>
			      <td>&nbsp;
			      <input type="text" name="tpSuggestion.userName"  maxlength="10" style="width: 220px"  id="userName"  value=${tpSuggestion.userName}>
			       <font class="warn">请正确填写，以便客服人员和您联系</font></td>
			    </tr>
			    <tr>
			      <td class="suggrighttd">手&nbsp;机：</td>
			      <td>&nbsp;
			      <input type="text" name="tpSuggestion.tel" style="width: 220px" maxlength="20" id="tel" value=${tpSuggestion.tel} >
			       <font class="warn">请正确填写，以便客服人员和您联系</font>
			      </td>
			    </tr>
			    <tr>
			      <td class="suggrighttd">E-mail：</td>
			      <td>&nbsp;
			      <input type="text" name="tpSuggestion.email" style="width: 220px"  maxlength="50" id="email" value=${tpSuggestion.email}>
                  <font class="warn">请正确填写，以便客服人员和您联系</font></td>
			    </tr>
			    <tr>
			      <td class="suggrighttd">投诉对象：</td>
			      <td>&nbsp;
			      <input type="text" name="tpSuggestion.comObject" style="width: 220px"   maxlength="50"  id="comObject" value=${tpSuggestion.comObject}>
			      </td>
			    </tr>
			     <tr>
			      <td class="suggrighttd">来&nbsp;自：</td>
			      <td>&nbsp;
			      <input type="text" name="tpSuggestion.userfrom" style="width: 220px"  maxlength="50"  id="userfrom" value=${tpSuggestion.userfrom} >
			      <font class="warn">例如 江苏南京</font></td>
			    </tr>
			    <tr>
			      <td class="suggrighttd"><span style="color:#FF0000;">* </span>内&nbsp;容：</td>
			      <td>&nbsp;
			      <textarea name="tpSuggestion.content" cols="70%" rows="8"
								id="content"
								onpropertychange="if(value.length>1000) value=value.substr(0,1000)"
								style="overflow: auto">${tpSuggestion.content}</textarea>
								&nbsp;&nbsp;<font class="warn">请认真填写投诉或建议的内容</font>
			      </td>
			    </tr>
			    <tr>
			      <td class="suggrighttd"><span style="color:#FF0000;">* </span>校 验 码：</td>
			      <td>&nbsp;
			      	  <input type="text" name="imgchk" id="imgchk" maxlength="4" size="4">
				      <img id="pic" src="../../member/yanzhengma.jsp" align="middle" /> <a href="javascript:changePicture();">换一张</a>
			      </td>
			    </tr>
			  </table>
			  <p align="center">
			    <label>
			    <input type="submit" name="bt_sumit" value="确认提交" onclick="return checkform()"/>
			    <input type="reset" class="qRtj" value="重新填写" />
			    </label>
			  </p>
			  <div class="clear">&nbsp;</div>
			   <input id="codeFlag" type="hidden" value=${codeFlag}>
			</form>
	</div>
</body>
<script type="text/javascript" src="<%=basePath%>imprint/js/imprint.js" charset="utf-8"></script>
</html>