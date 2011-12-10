<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title></title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="楼盘,买房">
		<meta http-equiv="description"
			content="梦房园是买卖、租赁房屋平台，它提供新房、二手房买卖租赁信息,也提供地产投资、海景房、旅游地产以及房产资讯">
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>resource/css/listShow.css" />
		<script type="text/javascript"
			src="<%=basePath%>resource/js/jquery-1.4.2.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>resource/js/jquery_rollScroll.js"></script>
		<STYLE type="text/css">
html,body {
	margin: 0;
	padding: 0;
	overflow: hidden;
}
</STYLE>
	<body>
		<table width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td width="32px">
					<img src="<%=basePath%>resource/images/annoument/speak32.png" />
				</td>
				<td>
					<div id="annoucementArea"
						style="background-color: white; height: 50px; width: 100%;"
						align="left">
						<ul style="width: 90%; margin-top: 13px;">
							<s:iterator value="#contentList">
								<li>
									<A
										href="<%=basePath%>announcementRead.shtml?id=<s:property value="id" />"
										target="_blank"><s:property value="title" />
									</A>
								</li>
							</s:iterator>
						</ul>
					</div>
				</td>
			</tr>
		</table>
	</body>
	<SCRIPT type="text/javascript">
  	 $("#annoucementArea").rollList({ line: 12, speed: 100, timer: 3000,step:1 });
  	</SCRIPT>
</html>
