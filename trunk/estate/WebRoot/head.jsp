<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>梦房园顶部</title>
<meta http-equiv="keywords" content="楼盘,买房,房产网,租房,地产投资">
<meta http-equiv="description" content="梦房园是买卖、租赁房屋平台，它提供新房、二手房买卖租赁信息,也提供地产投资、海景房、旅游地产以及房产资讯">
</head>
	<div class="top_tip" align="center">
		<div><span style="float: left">${sessionScope.userinfo.realName} 您好，欢迎来到梦房园！&nbsp;&nbsp;<a id="loginBtn" href="<%=basePath %>member/login.jsp">请登录</a>&nbsp;&nbsp;<a id="registerBtn" href="<%=basePath %>member/register.jsp">免费注册</a><a id="memberBtn" style="display: none" href="<%=basePath %>mem/baseinfo_mainPage.shtml">会员中心</a>&nbsp;&nbsp;&nbsp;&nbsp;<a id="exitBtn" style="display: none" href="<%=basePath %>exit.shtml">安全退出</a></span><span id="changeArea" style="float: right;">您现在的位置：【<font color="#CC3333" id="aname">淮安</font>】&nbsp;&nbsp;<a href="javascript:void(0)" onclick="showArea();">切换地区</a></span></div>
		<div id="charea" align="left"></div><input type="hidden" id="nowAreaCode" value="${sessionScope.sessionDistrict }">
	</div>
	<div class="panel" align="center">
		<div class="layout">
			<table width="100%" cellpadding="0" cellspacing="0" border="0"> 
				<tr>
					<td width="40%"><div id="logo" onclick="go('<%=basePath %>home.shtml')">&nbsp;</div></td>
					<td>
						<div id="search" align="right">
							<div align="left" id="ser_type">
								<span class="pro pro_selected">新房</span><span class="pro">写字楼</span><span class="pro">商铺</span><span class="pro"></span>
							</div>
							<div id="ser_input">
								<table width="100%" height="32px" cellpadding="0" cellspacing="0" border="0">
									<tr><td width="330px" align="center"><span id="ser1"><input id="keywordField"></span></td>
										<td width="75px" align="center" valign="top"><span id="ser_btn" onclick="keyWordSearch()">搜&nbsp;索</span></td>
										<td width="70px" align="center" valign="top"><span id="ser_senior" onclick="go('<%=basePath %>seniorSearch.shtml')">高级搜索</span></td>
										<td align="center" valign="top"><span id="ser_help">帮助中心</span></td>
									</tr>
								</table>
							</div>
							<div id="hot_tag" align="left"><b>热门标签：</b><span id="rmbq"><a href="javascript:searchHot('0_3','YnVpbGRpbmdfdHlwZSMx~8~2~','9','0','')">海景房</a><a href="javascript:searchHot('','','9','0','4')">宜居生态</a><a href="javascript:searchHot('','','9','0','2')">高档小区</a><a href="javascript:searchHot('0_5','YnVpbGRpbmdfdHlwZSMx~8~4~','9','0','')">酒店式公寓</a><a href="javascript:searchHot('','','9','0','5')">花园洋房</a></span></div>
						</div>
					</td>
				</tr>
			</table>
			<div class="advert" >
			              <img src="<%=basePath%>resource/images/xiyinli4.gif" style="height:80px;width:960px">
			</div>
			<div id="menu" align="left">
			    <ul class="head">
	                 <li >
				          <a href="javascript:go('<%=basePath %>home.shtml')" id="menu_index" ><span></span>首&nbsp;页&nbsp;</a>
					 </li>
					 <li>
					    <a href="javascript:go('<%=basePath %>bulid.shtml')" id="menu_bulid"><span></span>网上售楼处&nbsp;</a>
					 </li>
					  <li>
				          <a href="javascript:go('<%=basePath %>bus.shtml')" id="menu_bus" ><span></span>地产行天下&nbsp;</a>
					 </li>
					 <li>
					    <a href="javascript:go('<%=basePath %>secondBulid.shtml')" id="menu_secondBulid"><span></span>二手房买卖&nbsp;</a>
					 </li>
					  <li>
				          <a href="javascript:go('<%=basePath %>rentHouse.shtml')" id="menu_rent" ><span></span>租&nbsp;房&nbsp;</a>
					 </li>
					 <li>
					    <a href="javascript:go('<%=basePath %>tuan.shtml')" id="menu_groupbuy"><span></span>团&nbsp;购&nbsp;</a>
					 </li>
					 <li>
					    <a href="javascript:go('<%=basePath %>special.shtml')" id="menu_one"><span></span>特价1套&nbsp;</a>
					 </li>
					 <li>
					    <a href="javascript:go('<%=basePath %>news/news_toNews.shtml')" id="menu_news"><span></span>房产资讯&nbsp;</a>
					 </li>
				</ul>
			</div>
			<input type="hidden" id="menuIndex" value="${menuIndex }">
		</div>
	</div>
	<form id="" name="searchForm" action="<%=basePath %>search.shtml" method="post">
		<input type="hidden" name="searchStatus" id="searchStatus" value="${searchStatus}"/>
		<input type="hidden" name="searchQuery" id="searchQuery" value="${searchQuery}"/>
		<input type="hidden" name="searchPro" id="searchPro" value="${searchPro}"/>
		<input type="hidden" name="selectedTab" id="selectedTab" value="${selectedTab}"/>
		<input type="hidden" name="keywordValue" id="keywordValue" value="${keywordValue}"/>
		<input type="hidden" name="lptsValue" id="lptsValue" value="${lptsValue}"/>
   </form>
<script type="text/javascript">
	if('${sessionScope.userinfo}' != ''){
		$("#loginBtn,#registerBtn").hide();
		$("#memberBtn,#exitBtn").show();
	}
	var project_root_path = '<%=basePath%>';
	var isFF=navigator.userAgent.toLowerCase().indexOf('firefox');
	var isChrome=navigator.userAgent.toLowerCase().indexOf('chrome');
	var isOpera=navigator.userAgent.toLowerCase().indexOf('opera');
	var isIE=navigator.userAgent.toLowerCase().indexOf('msie');
	headLoad();
</script>
