<%@ page language="java" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>写字楼查看</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" href="<%=basePath%>/resource/css/global.css"
			type="text/css"></link>
		<link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/default/easyui.css"></link>
		<script type="text/javascript"
			src="<%=basePath%>/resource/js/jquery-1.4.2.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>/resource/js/jquery.dataGridTip.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>/pro/modifybuilderent.js"></script>
            <script type="text/javascript" src="../resource/js/whole.js"></script>
	    <link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>
          <script  type="text/javascript" src="../resource/js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="../resource/js/global.js"></script>
        <script type="text/javascript" src="../resource/js/kindeditor/kindeditor.js"></script>
		<link rel="stylesheet" type="text/css" href="../resource/js/kindeditor/skins/default.css"></link>
		<style type="text/css">
<!--
td {
	font-size: 10pt;
	color: #000000;
}
-->
</style>
	</head>

	<body>
		<div style="width: 100%; height: 100%;" align="center">
			<table width="100%" class="layoutTab">
			  <tr>
	    		<td colspan="2" height="10px">
	    			&nbsp;
	    		</td>
	    	   </tr>
				<tr>
					<td valign="top">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td valign="top" align="left">
									<form name="form" method="post"
										action="../office/addSend.shtml" onsubmit="return check()">

										<table width="100%" border="0" cellpadding="1" cellspacing="1">
											<tr>
												<td align="center" colspan="2">
													<b>修改写字楼${office.flagString }信息 （<font color="red">*</font>
														为必填项）</b>
												</td>
											</tr>
											<tr>
												<td align="center" colspan="2">
													<font color="red">一、填写基本信息</font>
												</td>
											</tr>
											<tr>
												<td>
													<div align="left">
														<font color="red">*</font>写字楼类型:
													</div>
												</td>
												<td>
													<div align="left">
														<select name="office.category">
															<option value="1" ${office.category eq 1?'selected' :''}  >
																纯写字楼
															</option>
															<option value="2" ${office.category eq 2?'selected' :''}>
																商住楼
															</option>
															<option value="3" ${office.category eq 3?'selected' :''}>
																酒店式公寓
															</option>
															<option value="4" ${office.category eq 4?'selected' :''}>
																园区办公
															</option>
															<option value="5" ${office.category eq 5?'selected' :''}>
																商务中心
															</option>
															<option value="6" ${office.category eq 6?'selected' :''}>
																其他
															</option>
														</select>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div align="left" style="margin-left: 14px;">
														<font color="red">*</font>楼盘名称:
													</div>
												</td>
												<td>
													<div align="left">
														<input type="text" name="office.name"
															value="${office.name}" id="name" size="30">
														<font color="red">（如：南京，输入nj，然后在列表中选择你要的楼盘）</font>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div align="left" style="margin-left: 20px;">
														楼盘地址:
													</div>
												</td>
												<td>
													<div align="left" id="address">
														${office.address}
														<input type="hidden" name="office.address" id="add1" />
														<input type="hidden" name="office.discode" id="discode"/>
													    <input type="hidden" name="office.disname" id="disname"/>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div align="left" style="margin-left: 6px;">
														物业管理费:
													</div>
												</td>
												<td align="left">
													<span id="propertyFees">
														${office.propertyManagement} </span> 元/㎡·月
													<input type="hidden" id="propertyManagement"
														name="office.propertyManagement" />
												</td>
											</tr>
											<tr>
												<td>
													<div align="left" style="margin-left: 48px;">
														楼层:
													</div>
												</td>
												<td>
													<div align="left">
														<select name="office.floorType">
															<option value="1" ${office.floorType eq 1?'selected' :''}>
																低区
															</option>
															<option value="2" ${office.floorType eq 2?'selected' :''}>
																中区
															</option>
															<option value="3" ${office.floorType eq 3?'selected' :''}>
																高区
															</option>
														</select>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div align="left" style="margin-left: 14px;">
														<font color="red">*</font>租金单价:
													</div>
												</td>
												<td>
													<div align="left">
														<input type="text" name="office.price"
															value="${office.price}" id="price" size="4">
														元/㎡·天
													</div>
												</td>
											</tr>
											<tr>
											<tr>
												<td>
													<div align="left" style="margin-left: 14px;">
														<font color="red">*</font>建筑面积:
													</div>
												</td>
												<td>
													<div align="left">
														<input type="text" name="office.area"
															value="${office.area}" id="area" size="4">
														㎡
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div align="left" style="margin-left: 35px;">
														得房率:
													</div>
												</td>
												<td>
													<div align="left">
														<input type="text" name="office.successPre"
															value="${office.successPre}" id="successPre" size="4">
														%
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div align="left" style="margin-left: 14px;">
														<font color="red">*</font>案源标题:
													</div>
												</td>
												<td>
													<div align="left">
														<input name="office.title" id="title"
															value="${office.title}" type="text" size="30">
													</div>
												</td>
											</tr>
											<tr>
												<td height="10">
													<div align="left" style="margin-left: 16px;">
														案源描述：
													</div>
												</td>
												<td>
												<div align="left">
													<textarea cols="60" rows="20" name="office.content" id="content">
													      ${office.content}
													</textarea>
												</div>
												</td>
											</tr>

											<tr>
												<td colspan="2" align="center">
													<input type="hidden" name="office.flag"
														value="${office.flag}">
													<input type="hidden" name="type" value="${office.flag}">
													<input type="hidden" name="id" value="${office.id}" />
													<input type="hidden" name="office.auditingState" value="0">
												</td>
											</tr>
										</table>
										<br>

									</form>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
	</body>
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
</html>
