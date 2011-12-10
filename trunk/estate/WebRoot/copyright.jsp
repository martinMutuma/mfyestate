<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<center>
	<table>
		<tr>
			<td>
				<div class="footer1" align="center" style="margin-top: 0px;">
					<ul>
						<li>
							<a target="_self"
								href="<%=basePath%>imprint/imprint_to.shtml?imprintFlag=5">关于我们</a>
							|
							<a target="_self"
								href="<%=basePath%>imprint/imprint_to.shtml?imprintFlag=7">人才招聘</a>
							|
							<a target="_self"
								href="<%=basePath%>imprint/imprint_to.shtml?imprintFlag=8">联系我们</a>
							|
							<a target="_self"
								href="<%=basePath%>imprint/imprint_to.shtml?imprintFlag=9">用户协议</a>
							|
							<a target="_self"
								href="<%=basePath%>imprint/imprint_to.shtml?imprintFlag=10">版权声明</a>
							|
							<a target="_self"
								href="<%=basePath%>imprint/imprint_to.shtml?imprintFlag=11">免责声明</a>
							|
							<a target="_self"
								href="<%=basePath%>imprint/imprint_to.shtml?imprintFlag=1">使用帮助</a>
							|
							<a target="_self"
								href="<%=basePath%>imprint/imprint_to.shtml?imprintFlag=12">投诉与建议</a>
							|
							<a target="_self"
								href="<%=basePath%>imprint/imprint_to.shtml?imprintFlag=13">友情链接</a>
						</li>
						<li>
							Copyright &copy; 2010.
							<a href="#">www.mymfy.com</a> All Rights Reserved
							<a href="#" target="_blank">沪ICP备000000000号</a>
						</li>
					</ul>
				</div>
			</td>
		</tr>
	</table>
</center>
