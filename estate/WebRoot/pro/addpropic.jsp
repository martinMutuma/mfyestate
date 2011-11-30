<%@ page language="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    <title>修改图片信息</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
	    <link rel="stylesheet" href="../resource/css/global.css" type="text/css"></link>
		<!-- 1.css -->
		<link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/default/easyui.css"></link>
		<script type="text/javascript" src="../resource/js/jquery-1.4.2.js"></script>
	    <!-- 2.js -->
	    <script type="text/javascript" src="../resource/js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="../resource/js/global.js"></script>
		  <script type="text/javascript" src="../resource/js/whole.js"></script>
	    <link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>
	    <link rel="stylesheet" href="../resource/css/memberCenter/info.css" type="text/css"></link>	
		<script type="text/javascript" src="addpropic.js"></script>
		<script type="text/javascript">
		    function  goback(){
		        window.location.href="<%=basePath%>largePro/getPic.shtml?id=${pro.id}";
		    }
		</script>
	</head>

	<body>
	 <jsp:include page="../head.jsp"></jsp:include>
		<div style="width: 100%; margin-top: 10px;" align="center">
		<table width="100%" class="layoutTab">
			<tr>
				<td width="20%" align="left" valign="top"><jsp:include page="../left.jsp"></jsp:include></td>
				<td valign="top">
				    <form name="form" method="post"  action="../largePro/modifAddPic.shtml" 	 enctype="multipart/form-data" onsubmit="return checkAddImg()">
					<div class="position" align="left" style="width:80%"><label>您所在的位置：</label><a href="../home.shtml">梦房园</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="../mem/baseinfo_mainPage.shtml">会员中心</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;大型项目管理&nbsp;&nbsp;&gt;&nbsp;&nbsp;图片修改</div>
                    <div class="info_top"></div>
                    <div class="info_mid" style= "text-align   :center ">					
					<div style="margin-left: 40px;margin-bottom: 10px;margin-top: 10px;float:left" > 
								  大型项目案源名称：${pro.title} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  案源编号：${pro.num}   
				    </div>
				     <div style="margin-left: 30px;clear:both;">
					  <table  cellpadding="1"  border="0"  cellspacing="1" width="90%" >
					   <tr align="center"><td>序号</td><td>图片名称</td><td>图片类型</td><td>上传图片</td></tr>
					   	<tr>
												<td>
													<div align="left">
														&nbsp;&nbsp;1.图片名称:
													</div>
												</td>
												<td><input type="text" name="largePro.imgName1" id="imgName1" /></td>
												<td>
													<div  align="left">
													  &nbsp; &nbsp; &nbsp;
														<select name="largePro.imgType1">
															<option value="1" selected="selected">
																室内图
															</option>
															<option value="2">
																位置图
															</option>
															<option value="3">
																外观图
															</option>
															<option value="4">
																平面图
															</option>
															<option value="5">
																其他
															</option>
														</select>
														</div>
												   </td>
												 <td>
												  
														<input id="img1" type="file" name="imageFile1" />
													
												</td>
											</tr>
											<tr>
												<td>
													<div align="left">
														&nbsp;&nbsp;2.图片名称:
													</div>
												</td>
												<td>	<input type="text" name="largePro.imgName2" id="imgName2" /></td>
												<td>
													<div align="left">
													
														&nbsp; &nbsp; &nbsp;
														<select name="largePro.imgType2">
															<option value="1">
																室内图
															</option>
															<option value="2" selected="selected">
																位置图
															</option>
															<option value="3">
																外观图
															</option>
															<option value="4">
																平面图
															</option>
															<option value="5">
																其他
															</option>
														</select>
														&nbsp; &nbsp; &nbsp;
														
													</div>
												</td>
												<td>
												   <input id="img2" type="file" name="imageFile2" />
												</td>
											</tr>
											<tr>
												<td>
													<div align="left">
														&nbsp;&nbsp;3.图片名称:
													</div>
												</td>
												<td>
												   <input type="text" name="largePro.imgName3" id="imgName3" />
												</td>
												<td>
													<div align="left">
														
														&nbsp; &nbsp; &nbsp;
														<select name="largePro.imgType3">
															<option value="1">
																室内图
															</option>
															<option value="2">
																位置图
															</option>
															<option value="3" selected="selected">
																外观图
															</option>
															<option value="4">
																平面图
															</option>
															<option value="5">
																其他
															</option>
														</select>
														&nbsp; &nbsp; &nbsp;
													
													</div>
												</td>
												<td>
												   	<input id="img3" name="imageFile3" type="file" />
												</td>
											</tr>
											<tr>
												<td>
													<div align="left">
														&nbsp;&nbsp;4.图片名称:
													</div>
												</td>
												<td>
												  <input type="text" name="largePro.imgName4" id="imgName4" />
												</td>
												<td>
													<div align="left">
													
														&nbsp; &nbsp; &nbsp;
														<select name="largePro.imgType4">
															<option value="1">
																室内图
															</option>
															<option value="2">
																位置图
															</option>
															<option value="3">
																外观图
															</option>
															<option value="4" selected="selected">
																平面图
															</option>
															<option value="5">
																其他
															</option>
														</select>
														&nbsp; &nbsp; &nbsp;
													
													</div>
												</td>
												<td>
												   	<input id="img4" type="file" name="imageFile4" />
												</td>
											</tr>
											<tr>
												<td>
													<div align="left">
														&nbsp;&nbsp;5.图片名称:
													</div>
												</td>
												<td>
												  	<input type="text" name="largePro.imgName5" id="imgName5" />
												</td>
												<td>
													<div align="left">
													
														&nbsp; &nbsp; &nbsp;
														<select name="largePro.imgType5">
															<option value="1">
																室内图
															</option>
															<option value="2">
																位置图
															</option>
															<option value="3">
																外观图
															</option>
															<option value="4">
																平面图
															</option>
															<option value="5" selected="selected">
																其他
															</option>
														</select>
														&nbsp; &nbsp; &nbsp;
														
													</div>
												</td>
												<td>
												   <input id="img5" type="file" name="imageFile5" />
												</td>
											</tr>
											<tr>
												<td colspan="4" align="center">
													<input type="submit" value="新  增"/>&nbsp;&nbsp;
													<input type="reset"  value="重  置"/>&nbsp;&nbsp;
													<input type="button" value="返  回" onclick="goback()"/>&nbsp;&nbsp;
													<input type="hidden"  name="largePro.id" value="${pro.id}"/>
													
												</td>
											</tr>
					</table>
					</div>
					</div>
					 <div class="info_bottom">&nbsp;</div>
					</form>
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
