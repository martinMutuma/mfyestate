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

							<script type="text/javascript">
					var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
					document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
					</script>

							<script type="text/javascript">
					try {
					var pageTracker = _gat._getTracker("UA-9557902-1");
					pageTracker._trackPageview();
					} catch(err) {}</script>
						</li>
					</ul>
				</div>
			</td>
		</tr>
	</table>
</center>
