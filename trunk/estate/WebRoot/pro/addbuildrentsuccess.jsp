<%@ page language="java" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>成功页面</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="梦房园">
		<meta http-equiv="description" content="写字楼、商铺、生意转让、工业地产、大型项目、楼盘发布成功后跳到这个页面。">
		<link rel="stylesheet" href="../resource/css/global.css"
			type="text/css"></link>
	    <link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/default/easyui.css"></link>
	    <script type="text/javascript" src="../resource/js/jquery-1.4.2.js"></script>
	     <script type="text/javascript" src="../resource/js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="../resource/js/global.js"></script>
		  <script type="text/javascript" src="../resource/js/whole.js"></script>
	    <link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>
	</head>

	<body>
	<jsp:include page="../head.jsp"></jsp:include>
		<div style="width: 100%;margin-top: 10px;" align="center">
			<table width="100%" class="layoutTab">
				<tr>
					<td width="20%" align="left" valign="top"><jsp:include page="../left.jsp"></jsp:include></td>
					<td valign="top">
						<table border="0" cellpadding="0" cellspacing="0" >
							<tr>
							 <td width="100px" >
							 </td>
								<td valign="top" align="center" >
									<form name="form" method="post" onsubmit="return checkrent()">

										<table width="100%" border="0" cellpadding="1" cellspacing="1" >
											<tr>
												<td width="510" colspan="2" background="../imageFloder/main_prompt.gif" height="310">
												 <br/> <br/> <br/>
													<div align="center">
														您的信息已经成功发布，请等待网站审核
													</div>
												</td>
											</tr>
										</table>
									</form>
								</td>
							</tr>
						</table>
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
