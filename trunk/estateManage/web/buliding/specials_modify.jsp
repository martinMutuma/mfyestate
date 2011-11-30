<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page import="com.estate.util.comm.RequestUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%String id = RequestUtil.getParam(request,"id",""); %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<link rel="stylesheet" type="text/css" href="../resource/whole.css"/>
<link rel="stylesheet" type="text/css" href="../scripts/kindeditor/skins/default.css"></link>
<script type="text/javascript" src="../scripts/kindeditor/kindeditor.js"></script>
<script type="text/javascript" src="../scripts/jquery-1.4.2.js"></script>
<script type="text/javascript" src="../buliding/specials.js"></script>
<script type="text/javascript"
			src="../scripts/My97DatePicker/WdatePicker.js" /></script>	
</head>
<body>
	<table border="0" width="100%" height="100%" cellpadding="0" cellspacing="0" style="overflow: hidden;">
		<tr>
			<td width="40%" class="borderL" valign="top">
			<form action="../special/saveSpecial.shtml" method="post" target="if1">
				<s:hidden name="special.joinCount"></s:hidden>
				<s:hidden name="special.id"></s:hidden>
				<s:hidden name="special.flag"></s:hidden>
				<iframe name="if1" style="display: none"></iframe>
				<table border="0" width="99%">
					<tr>
						<td width="110px" valign="top" align="right">信息简述：</td><td valign="top"><textarea name="special.descr" style="width: 100%;height: 50px;"><s:property value="special.descr"/></textarea></td>
					</tr>
					<tr>
						<td valign="top" align="right">开始时间：</td><td valign="top"><input id="startTime" name="special.startTime" value="<s:date name="special.startTime" format="yyyy-MM-dd"/>" style="width: 120px;" class="Wdate" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
					</tr>
					<tr>
						<td valign="top" align="right">截止时间：</td><td valign="top"><input id="endTime" name="special.endTime" value="<s:date name="special.endTime" format="yyyy-MM-dd"/>" style="width: 120px;" class="Wdate" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
					</tr>
					<tr>
						<td valign="top" align="right">优惠信息：</td><td valign="top"><input name="special.specialsMes" value="${special.specialsMes }" style="width: 150px;"/></td>
					</tr>
					<tr>
						<td valign="top" align="right">专线：</td><td valign="top"><input value="${special.line }" name="special.line" style="width: 150px;"/></td>
					</tr>
					<tr>
						<td valign="top" align="right">楼盘简述：</td><td valign="top"><textarea name="special.bulidDesc"  style="width: 100%;height: 50px;"><s:property value="special.bulidDesc" escape="false"/></textarea></td>
					</tr>
					<tr>
						<td valign="top" align="right">市场参考均价：</td><td valign="top"><input onkeydown="onlyNum()" name="special.avgPrice" style="width: 150px;" value="<s:property value="special.avgPrice"/>"/></td>
					</tr>
					<tr>
						<td valign="top" align="right">折后参考起价：</td><td valign="top"><input onkeydown="onlyNum()" name="special.minPrice" style="width: 150px;" value="<s:property value="special.minPrice"/>"/></td>
					</tr>
					<tr>
						<td valign="top" align="right">享受折扣：</td><td valign="top"><input name="special.specials" style="width: 150px;" value="<s:property value="special.specials"/>"/></td>
					</tr>
					<tr>
						<td valign="top" align="right">详细信息：</td><td><textarea name="special.information" style="width: 100%;height: 300px;" id="introduction"><s:property value="special.information"/></textarea></td>
					</tr>
				</table>
				</form>
			</td>
		</tr>
		<tr>
			<td align="center">
				<input type="button" onclick="document.forms[0].submit();" value="提交"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" onclick="openUrl('修改图片','../special/toImgModify.shtml?id=<%=id %>','<%=id %>_img')" value="修改图片"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" onclick="closeTab('<%=id %>')" value="返回"/>
			</td>
		</tr>
	</table>
	
</body>
<script type="text/javascript">
  function  operate(mes){
  	if(mes == "1"){
  		alert("保存成功");
  		parent.closeTab('<%=id %>');
  	}
  }
</script>
</html>