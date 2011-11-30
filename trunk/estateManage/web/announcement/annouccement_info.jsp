<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<link rel="stylesheet" type="text/css" href="../resource/whole.css"/>
<link rel="stylesheet" type="text/css" href="../scripts/kindeditor/skins/default.css"></link>
<script type="text/javascript" src="../scripts/kindeditor/kindeditor.js"></script>
<script type="text/javascript" src="../scripts/jquery-1.4.2.js"></script>
<script type="text/javascript"
			src="../scripts/My97DatePicker/WdatePicker.js" /></script>	
</head>
<body>
	<form action="../announcement/save.shtml" target="ajaxframe">
	<table width="100%">
		<tr>
			<td colspan="2"><h3>公告信息设置</h3><input type="hidden" value="${announcement.id }" name="announcement.id"/> </td>
		</tr>
		<tr>
			<td width="120px;">公告标题</td><td><input style="width: 350px;" name="announcement.title" id="title" value="${announcement.title}"/></td>
		</tr>
		<tr>
			<td>公告内容</td><td height="200px"><textarea style="width: 500px;height:200px;" name="announcement.content" id="content">${announcement.content }</textarea></td>
		</tr>
		<tr>
			<td>截止日期</td><td><input name="announcement.invalidTime" value="${announcement.invalidTime }" class="Wdate" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="提交"/>
			</td>
		</tr>
	</table>	
	<iframe name="ajaxframe" style="display: none;"></iframe>
	</form>
</body>
<script type="text/javascript">
	$(function(){
		KE.show({
			id : 'content',
			loadStyleMode : false,
			resizeMode : 0,
			allowUpload:true, //允许上传图片 
			imageUploadJson:'../comutil/upload.shtml',
			shadowMode: true,autoSetDataMode: true,allowPreviewEmoticons: true, 
			items : [
			'fontname', 'fontsize', '|', 'fullscreen','|', 'textcolor', 'bgcolor', 'bold', 'italic', 'underline',
			'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
			'insertunorderedlist', '|','image']
		});
	})
	function operate(obj){
		if(obj == "1"){
			alert("操作成功");
			parent.closeTab('add');
		}
	}
</script>
</html>