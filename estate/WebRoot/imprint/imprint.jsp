<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>梦房园</title>
		<meta http-equiv="keywords" content="楼盘,买房">
		<meta http-equiv="description"
			content="梦房园是买卖、租赁房屋平台，它提供新房、二手房买卖租赁信息,也提供地产投资、海景房、旅游地产以及房产资讯">
		<link rel="stylesheet" href="<%=basePath%>resource/css/whole.css" type="text/css"></link>
		<link rel="stylesheet" href="<%=basePath%>resource/css/hbody.css" type="text/css"></link>
		<script type="text/javascript" src="<%=basePath%>resource/js/jquery-1.4.2.js"
			charset="utf-8"></script>
		<script type="text/javascript" src="<%=basePath%>resource/js/whole.js"></script>
		<script type="text/javascript" src="<%=basePath%>resource/js/hbody.js"></script>
	</head>
	<body>
	    <center>
		<table>
			<tr>
				<td>
					<jsp:include page="../head.jsp" />
				</td>
			</tr>
			<tr>
				<td>
					<div class="center_box">
						<div id="leftbox2">
							<div id="xylHead" class="title_bg2">
								客服中心
							</div>
							<ul class="leftNav">
								<li class="title">
									&nbsp;&nbsp;网站说明
								</li>
								<li>
									&nbsp;&nbsp;
									<a
										href="javascript:window.location.href='imprint/imprint_to.shtml?imprintFlag=5'">·关于我们</a>
								</li>
								<!--  
								<li>
									&nbsp;&nbsp;
									<a
										href="javascript:window.location.href='imprint/imprint_to.shtml?imprintFlag=6'">·合作伙伴</a>
								</li>
								-->
								<li>
									&nbsp;&nbsp;
									<a
										href="javascript:window.location.href='imprint/imprint_to.shtml?imprintFlag=7'">·人才招聘</a>
								</li>
								<li>
									&nbsp;&nbsp;
									<a
										href="javascript:window.location.href='imprint/imprint_to.shtml?imprintFlag=8'">·联系我们</a>
								</li>
								<li>
									&nbsp;&nbsp;
									<a
										href="javascript:window.location.href='imprint/imprint_to.shtml?imprintFlag=9'">·用户协议</a>
								</li>
								<li>
									&nbsp;&nbsp;
									<a
										href="javascript:window.location.href='imprint/imprint_to.shtml?imprintFlag=10'">·版权声明</a>
								</li>
								<li>
									&nbsp;&nbsp;
									<a
										href="javascript:window.location.href='imprint/imprint_to.shtml?imprintFlag=11'">·免责声明</a>
								</li>
								<li>
									&nbsp;&nbsp;
									<a
										href="javascript:window.location.href='imprint/imprint_to.shtml?imprintFlag=12'">·投诉建议</a>
								</li>
								<li>
									&nbsp;&nbsp;
									<a
										href="javascript:window.location.href='imprint/imprint_to.shtml?imprintFlag=13'">·友情链接</a>
								</li>
							</ul>
							<div
								style="clear: both; height: 35px; border-top: 1px solid #EECDCF;">
								&nbsp;
							</div>
						</div>
						<div id="rightbox2">
							<div class="rightHead">
								<s:if test="imprintFlag==5">
						关于我们
					</s:if>
								<s:if test="imprintFlag==6">
						合作伙伴
					</s:if>
								<s:if test="imprintFlag==7">
					   人才招聘
					</s:if>
								<s:if test="imprintFlag==8">
						联系我们
					</s:if>
								<s:if test="imprintFlag==9">
						用户协议
					</s:if>
								<s:if test="imprintFlag==10">
					   版权声明
					</s:if>
								<s:if test="imprintFlag==11">
					   免责声明
					</s:if>
								<s:if test="imprintFlag==12">
					   投诉建议
					</s:if>
								<s:if test="imprintFlag==13">
					   友情链接
					</s:if>
							</div>
							<div>
								<s:if test="imprintFlag==5">
									<jsp:include page="aboutus.jsp" />
								</s:if>
								<s:if test="imprintFlag==6">
									<jsp:include page="flinks.jsp" />
								</s:if>
								<s:if test="imprintFlag==7">
					   <jsp:include page="job.jsp" />
					</s:if>
								<s:if test="imprintFlag==8">
						  <jsp:include page="contact.jsp" />
					</s:if>
								<s:if test="imprintFlag==9">
						<jsp:include page="useragree.jsp" />
					</s:if>
								<s:if test="imprintFlag==10">
					   <jsp:include page="copyrights.jsp" />
					</s:if>
								<s:if test="imprintFlag==11">
					    <jsp:include page="liability.jsp" />
					</s:if>
								<s:if test="imprintFlag==12">
					    <jsp:include page="suggestion.jsp" />
					</s:if>
								<s:if test="imprintFlag==13">
						<jsp:include page="flinks.jsp" />
					</s:if>
							</div>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div style="height: 3px;"></div>
					<jsp:include page="../copyright.jsp" />
				</td>
			</tr>
		</table>
		</center>
	</body>
</html>