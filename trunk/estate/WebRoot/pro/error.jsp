<%@ page language="java" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>程序出错</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" href="../resource/css/global.css"
			type="text/css"></link>
        <script type="text/javascript" src="../resource/js/whole.js"></script>
	    <link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>
	</head>

	<body>
		<div style="width: 100%; height: 100%;" align="center">
			<table width="100%" class="layoutTab">
				<tr>
					<td colspan="2" align="center">
						<jsp:include page="../head.jsp"></jsp:include>
					</td>
				</tr>
				<tr>
					<td width="25%" align="center" valign="top"><jsp:include page="../left.jsp"></jsp:include></td>
					<td>
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td valign="top" align="left">
									<form name="form" method="post" onsubmit="return checkrent()">

										<table width="100%" border="0" cellpadding="1" cellspacing="1">
											<tr>
												<td colspan="2">
													<div align="center">
														出错啦！
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
	</body>

</html>
