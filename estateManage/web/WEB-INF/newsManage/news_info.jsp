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
		<title>新闻信息</title>
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
					<link rel="stylesheet" type="text/css"
			href="<%=basePath%>css/examples.css">
		<script type="text/javascript"
			src="<%=basePath%>scripts/jquery-1.4.2.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>scripts/jquery.easyui.min.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>scripts/newsManage/news_info.js"></script>
					<script type="text/javascript"
			src="<%=basePath%>scripts/jquery-impromptu.3.1.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>scripts/kindeditor/kindeditor.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>scripts/kindeditor/skins/default.css"></link>
		<script>
			KE.show({
				id : 'content',
				loadStyleMode : false,
				resizeMode : 0,
				allowUpload:true, //允许上传图片 
				imageUploadJson:'<%=basePath%>/comutil/upload.shtml',    
				items : [
				'fontname', 'fontsize', '|', 'textcolor', 'bgcolor', 'bold', 'italic', 'underline',
				'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
				'insertunorderedlist', '|','image']
			});
			
		</script>
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
</script>
	<body onload="showfilediv();">
		<div style="width: 100%; height: 100%;" align="center">
			<table width="90%" style="border: 0px #FF8080 solid;" align="center"
				class="layoutTab">

				<tr align="center">
					<td>
						<form id="sysAgentBean" name="sysAgentBean"
							onsubmit="return checkform()" action="news_saveOrUpdate.shtml"
							method="post">
							<table width="100%" border="0" cellpadding="0" cellspacing="1"
								bgcolor="#CCCCCC">
								<tr>
									<td height="30" colspan="2" align="center" bgcolor="#BACEEF"
										class="tostrong">
										<s:if test="flag==1">
						【新增新闻】
					</s:if>
										<s:if test="flag==2">
						【新闻详情】
					</s:if>
										<s:if test="flag==3">
						【修改新闻】
					</s:if>

									</td>
								</tr>
								<tr>
									<td width="10%" height="30" align="right" bgcolor="#FFFFFF">
										<input TYPE="hidden" name="news.id"
											value='<s:property value="news.id"/>' />
										标题：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;
										<input type="text" name="news.title" style="width: 90%"
											maxlength="100" id="title" class="easyui-validatebox"
											value='<s:property value="news.title"/>' />
									</td>
								</tr>
								<tr>
									<td width="10%" height="30" align="right" bgcolor="#FFFFFF">
										栏目类型：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;
										<s:select
											list="#{'1':'今日头条','2':'行业动态','3':'项目动态','4':'企业动态','5':'地产金融','6':'评论观察','7':'吸引力动态'}"
											name="news.columnType" id="columnType" theme="simple"
											headerKey="1" headerValue="-请选择-"></s:select>
									</td>
								</tr>
								<tr>
									<td width="10%" height="30" align="right" bgcolor="#FFFFFF">
										来源：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;
										<input type="text" name="news.source" style="width: 90%"
											maxlength="100" id="source" class="easyui-validatebox"
											value='<s:property value="news.source"/>' />
									</td>
								</tr>
								<tr>
									<td width="10%" height="30" align="right" bgcolor="#FFFFFF">
										摘要：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;
										<input type="text" name="news.summary" style="width: 90%"
											maxlength="200" id="summary" class="easyui-validatebox"
											value='<s:property value="news.summary"/>' />
									</td>
								</tr>
								<tr>
									<td width="10%" height="30" align="right" bgcolor="#FFFFFF">
										正文：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;
										<textarea cols="100%" rows="10" name="news.content" id="content"><s:property value="news.content" /></textarea>
									</td>
								</tr>
								<tr>
									<td height="30" align="right" bgcolor="#FFFFFF">
										精彩图文：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;
										<s:radio list="#{'0':'是','1':'否'}" name="news.imgFlag"
											id="imgFlag" onclick="showfilediv()" theme="simple" />
										<br>
										<div id="filediv" style="display: none">
											<div id="imgdiv" style="display: none">
												&nbsp;<img id="img" src='<s:property value="news.imgUrl"/>' />
											</div>
											<s:if test="flag!=2">
											&nbsp;
											<input class="button" id="imgBtn" value="上传图片" type="button"/>&emsp;&emsp;
											</s:if>
										</div>
										<input type="hidden" id="imgurl" name="news.imgUrl" value='<s:property value="news.imgUrl"/>'>
									</td>
								</tr>
								<tr>
									<td height="30" align="right" bgcolor="#FFFFFF">
										重点新闻：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;
										<s:radio list="#{'0':'是','1':'否'}" name="news.stressFlag"
											theme="simple" />
									</td>
								</tr>
								<tr>
									<td height="30" align="right" bgcolor="#FFFFFF">
										推荐：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;
										<s:radio list="#{'0':'是','1':'否'}" name="news.recommendFlag"
											theme="simple" />
									</td>
								</tr>
								<tr>
									<td width="10%" height="30" align="right" bgcolor="#FFFFFF">
										点击数：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;
										<input type="text" name="news.clickNum" style="width: 220px"
											maxlength="10" id="clickNum" class="easyui-validatebox"
											onkeyup="this.value=this.value.replace(/\D/g,'')"
											value='<s:property value="news.clickNum"/>' />
									</td>
								</tr>
							</table>

							<p align="center">
								<label>
									<s:if test="flag!=2">
										<a href="#" id="btn1" onclick="checkform();"></a>&nbsp;&nbsp;&nbsp;&nbsp;
										</s:if>
									<a href="javascript:history.go(-1)" id="btn2"></a>
								</label>
							</p>
							<div class="clear">
								&nbsp;
							</div>
							<input type="hidden" name="tb.integral" value="10" />
						</form>
					</td>
				</tr>
			</table>
		</div>
		<iframe name="tempF" style="display: none;"></iframe>
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
   if (!KE.util.isEmpty('content')) document.getElementById("content").value=KE.util.getData('content');
    document.sysAgentBean.submit();
    return true;
}

</script>
</html>
