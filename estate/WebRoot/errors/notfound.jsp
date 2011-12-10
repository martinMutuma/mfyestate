<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>梦房园 - 抱歉，没有找到该网页</title>
		<meta http-equiv="keywords" content="楼盘,买房">
		<meta http-equiv="description"
			content="梦房园是买卖、租赁房屋平台，它提供新房、二手房买卖租赁信息,也提供地产投资、海景房、旅游地产以及房产资讯">
		<link rel="stylesheet" href="../resource/css/whole.css"
			type="text/css"></link>
		<link rel="stylesheet" href="css/error.css" type="text/css"></link>
		<script type="text/javascript" src="../resource/js/jquery-1.4.2.js"
			charset="utf-8"></script>
		<script type="text/javascript" src="../resource/js/whole.js"></script>
	</head>
	<body>
		<jsp:include page="../head.jsp"></jsp:include>
		<table width="100%"  style="margin-top: 30px;">
			<tr>
				<td align="center" valign="middle">
					<table width="600px" height="200px">
						<tr>
							<td width="20%" align="right" valign="top">
								<div class="tipImg">
									<span class="errorCode">404</span>
								</div>
							</td>
							<td valign="top" style="padding-left: 10px;">
								<h4>
									很抱歉，您查看的页面不存在，可能已删除或者被转移。
								</h4>
								<h5>您可以</h5>
								<ul>
									<li>
										1.检查刚才的输入
									</li>
									<li>
										2.<a href="home.shtml">返回首页</a>
									</li>
								</ul>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<jsp:include page="../copyright.jsp"></jsp:include>
	</body>
</html>