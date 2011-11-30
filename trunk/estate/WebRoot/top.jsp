<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

	<div class="top" >
		<div class="logo" >
			<table width="100%" height="100%" >
				<tr>
					<td>
						<div style="float: left">当前城市:江苏 南京 [<a href="#">切换城市</a>]</div><div style="float: left"><span>江苏</span><span>山东</span><span>浙江</span></div>
					</td>
					<td valign="bottom" align="right" id="logo_span">
						<span id="tipspan">如果您还不是会员？请</span><a id="register_btn" href="member/register.jsp">注册&nbsp;|</a>&nbsp;<a id="login_btn" href="<%=basePath %>member/login.jsp">登录</a>
						<span id="welcomeTipSpan" style="display: none">欢迎回来&nbsp;&nbsp;:&nbsp;&nbsp;<a id="unameLabel" href="member/login.jsp"></a></span>
					</td>
				</tr>
			</table>
		</div>
		<div id="menu" class="menu_bg" align="center">
			<span class="menu_span" title="首页" url="<%=basePath %>home.shtml">首&nbsp;&nbsp;&nbsp;&nbsp;页</span>
			<span class="menu_span" title="写字楼" url="<%=basePath %>search.shtml?searchPro=0">写字楼</span>
			<span class="menu_span" title="商铺" url="<%=basePath %>search.shtml?searchPro=1">商&nbsp;&nbsp;&nbsp;&nbsp;铺</span>
			<span class="menu_span" title="生意转让" url="<%=basePath %>search.shtml?searchPro=2">生意转让</span>
			<span class="menu_span" title="工业地产" url="<%=basePath %>search.shtml?searchPro=3">工业地产</span>
			<span class="menu_span" title="大型项目" url="<%=basePath %>search.shtml?searchPro=4">大型项目</span>
			<span class="menu_span" title="经纪人" url="<%=basePath %>search.shtml?searchPro=5">经纪人</span>
			<span class="menu_span" title="新闻" url="<%=basePath %>news/news_toNews.shtml">新&nbsp;&nbsp;&nbsp;&nbsp;闻</span>
			<span class="menu_span" title="会员中心" url='<%=basePath %>mem/baseinfo_mainPage.shtml'>会员中心</span>
		</div>
	</div>
	<script type="text/javascript">
		try{
			if('${sessionScope.userinfo}'!=''){
				$("#tipspan,#register_btn,#login_btn").hide();
				$("#welcomeTipSpan").show();
				$("#unameLabel").html('${sessionScope.userinfo.username}');
			}
		}catch(e){
		}
	</script>
