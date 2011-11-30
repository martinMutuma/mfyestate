	<div class="top_tip" align="center">
		<div><span style="float: left">您好，欢迎来梦房园！&nbsp;&nbsp;<a id="loginBtn" href="member/login.jsp">请登录</a>&nbsp;&nbsp;<a id="registerBtn" href="member/register.jsp">免费注册</a><a id="memberBtn" style="display: none" href="mem/baseinfo_mainPage.shtml">会员中心</a>&nbsp;&nbsp;&nbsp;&nbsp;<a id="exitBtn" style="display: none" href="exit.shtml">安全退出</a></span><span id="changeArea" style="float: right;display: none">您现在的位置：【<font color="#CC3333" id="aname">淮安</font>】&nbsp;&nbsp;<a href="javascript:void(0)" onclick="showArea();">切换地区</a></span></div>
		<div id="charea" align="left"><span>南京</span></div>
	</div>
	<div class="panel" align="center">
		<div class="layout">
			<div id="large_ad">&nbsp;</div>
			<table width="100%" cellpadding="0" cellspacing="0" border="0"> 
				<tr>
					<td width="40%"><div id="logo">&nbsp;</div></td>
					<td>
						<div id="search" align="right">
							<div align="left" id="ser_type">
								<span class="pro pro_selected">住宅</span><span class="pro">写字楼</span><span class="pro">商铺</span><span class="pro"></span>
							</div>
							<div id="ser_input">
								<table width="100%" height="32px" cellpadding="0" cellspacing="0" border="0">
									<tr><td width="330px" align="center"><span id="ser1"><input id="keywordField"></span></td>
										<td width="75px" align="center" valign="top"><span id="ser_btn" onclick="keyWordSearch()">搜&nbsp;索</span></td>
										<td width="70px" align="center" valign="top"><span id="ser_senior" onclick="go('seniorSearch.shtml')">高级搜索</span></td>
										<td align="center" valign="top"><span id="ser_help">帮助中心</span></td>
									</tr>
								</table>
							</div>
							<div id="hot_tag" align="left"><b>热门标签：</b><span id="rmbq"><a href="javascript:searchHot('0_3','building_type~8~2~','9','0','')">海景房</a><a href="javascript:searchHot('','','9','0','4')">宜居生态</a><a href="javascript:searchHot('','','9','0','2')">高档小区</a><a href="javascript:searchHot('0_5','building_type~8~4~','9','0','')">酒店式公寓</a><a href="javascript:searchHot('','','9','0','5')">花园洋房</a></span></div>
						</div>
					</td>
				</tr>
			</table>
			<div id="menu" align="left">
				<span id="menu_index" onclick="go('home.shtml')" class="menu_selected">首页</span><span onclick="go('bulid.shtml')" id="menu_bulid" class="">网上售楼处</span><span onclick="go('bus.shtml')" id="menu_bus" class="">商业地产</span><span onclick="alert('建设中... ...')" id="menu_bus" class="">二手房买卖</span><span onclick="alert('建设中... ...')" id="menu_bus" class="">租房</span><span id="menu_mem" class="" onclick="alert('建设中... ...')">团购</span><span id="menu_mem" class="" onclick="alert('建设中... ...')">特价1套</span><span id="menu_mem" class="" onclick="go('news/news_toNews.shtml')">房产资讯</span><span id="menu_mem" class="" onclick="alert('建设中... ...')">引力窝</span>
			</div>
			<input type="hidden" id="menuIndex" value="${menuIndex }">
		</div>
	</div>
<script type="text/javascript">
	<#if session.userinfo?exists>
     			if('${sessionScope.userinfo}' != ''){
					$("#loginBtn,#registerBtn").hide();
					$("#memberBtn,#exitBtn").show();
				}
	</#if> 

	var project_root_path = '';
	var isFF=navigator.userAgent.toLowerCase().indexOf('firefox');
	var isChrome=navigator.userAgent.toLowerCase().indexOf('chrome');
	var isOpera=navigator.userAgent.toLowerCase().indexOf('opera');
	var isIE=navigator.userAgent.toLowerCase().indexOf('msie');
	headLoad();
</script>
