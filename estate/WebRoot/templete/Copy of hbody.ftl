<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>365聚会,欢迎您</title>
<link rel="stylesheet" href="resources/css/examples.css"
			type="text/css"></link>
<link rel="stylesheet" href="global/css/stage.css"
			type="text/css"></link>
<script type="text/javascript" src="scripts/jquery-1.3.2.min.js" charset="utf-8"></script>
<script type="text/javascript" src="scripts/jquery.corner.js" charset="utf-8"></script>
<script type="text/javascript" src="scripts/district.js"></script>
<script type="text/javascript"
			src="scripts/jquery-impromptu.3.1.min.js"></script>
<script type="text/javascript"
			src="global/scripts/stage.js"></script>
<style type="text/css">
</style>
<script>
	var date = new Date();
</script>
</head>

<body><div style="width: 100%;height: 100%" align="center">
	<div class="global" align="center">
		<!-- 顶部 -->
		<div style="margin-top: 0px;background:url(resources/image/stage/top.gif);height:209px;width:100%;border:1px solid white">
			<div style="width:100%;text-align:left;margin-top:12px;color:red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;今天是&nbsp;&nbsp;<script>document.write(date.getYear())</script>年&nbsp;&nbsp;<script>document.write(date.getMonth()+1)</script>月&nbsp;&nbsp;<script>document.write(date.getDate())</script>日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;欢迎您进入365聚会网</div>
		</div>
		
		<!-- 菜单栏 -->
		<div id="menuDiv" class="menuDiv">
			<div style="float: left" class="menu_left">
				
			</div>
			<div style="float: left" class="menu">
				<table width="100%" height="100%" cellpadding="0" cellspacing="0">
					<tr>
						<td width="60%">
							<div style="width: 100%;margin-top: 5px;height: 26px;">
							<span onclick="to_go('home.html')">首页</span>
							<span onclick="to_go('about.html')">关于我们</span>
						<!--	<span>搜&nbsp;&nbsp;&nbsp;&nbsp;索</span>
							<span>分类展示</span>
							<span>会&nbsp;&nbsp;&nbsp;&nbsp;员</span>
							<span>商&nbsp;&nbsp;&nbsp;&nbsp;家</span>
							<span>聚会照片</span>-->
							</div>
						</td>
						<td width="30%">
							<input id="keyWord" style="color: gray;height: 15px;width:90%" value="请输入关键字" onblur="search_blur(this)" onfocus="search_focus(this)"/>
						</td>
					
						<td width="10%">
							<input type="button" class="button_sty1" onclick="search('2')" value="站内搜索"/>
						</td>
					</tr>
				</table>
				
			</div>
			<div style="float: left"  class="menu_right">
			</div>
		</div>
		
		<!-- 活动块 -->
		<div id="activity" style="width: 100%">
			<table width="100%" >
				<tr>
					<td width="50%" align="left">
						<div class="city_change">
						<div class="city_change_title">
							<span class="span_div" style="margin-left: 50px;font-size: 18px;color: #C90406;font-weight: bold;line-height: 34px;">城市切换</span>
						</div>
						<div id="city_change_div">
						<br/><br/>
							<!--<span class="city_span city_span_bold">省级分站:</span><span class="city_otr_span">&nbsp;&nbsp;<a href="#">北京</a>&nbsp;&nbsp;|</span><span class="city_otr_span">&nbsp;&nbsp;<a href="#">广东</a>&nbsp;&nbsp;|</span><span class="city_otr_span">&nbsp;&nbsp;<a href="#">海南</a>&nbsp;&nbsp;|</span><span class="city_otr_span">&nbsp;&nbsp;<a href="#">香港</a>&nbsp;&nbsp;|</span><span class="city_otr_span">&nbsp;&nbsp;<a href="#">江苏</a>&nbsp;&nbsp;</span><br/><br/>-->
							<span class="city_span city_span_bold">城市分站:</span><span class="city_otr_span">&nbsp;&nbsp;<a href="home1@1.html">东城</a>&nbsp;&nbsp;|</span><span class="city_otr_span">&nbsp;&nbsp;<a href="home1@2.html">西城</a>&nbsp;&nbsp;|</span><span class="city_otr_span">&nbsp;&nbsp;<a href="home1@3.html">崇文</a>&nbsp;&nbsp;|</span><span class="city_otr_span">&nbsp;&nbsp;<a href="home1@4.html">宣武</a>&nbsp;&nbsp;|</span><span class="city_otr_span">&nbsp;&nbsp;<a href="home1@5.html">朝阳</a>&nbsp;&nbsp;</span><br/><br/>
							
						</div>
						</div>
					</td><td>
							<div style="height:382px;width: 475px">
							<div class="activity_back_view">
							<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td  width="20%" align="right" valign="bottom">
										<span class="activity_tit_span" style="width: 80px;text-align: center">活&nbsp;动&nbsp;回&nbsp;顾</span>
									</td>
									<td>
									<span class="more" onclick="window.location.href='thread_0.html'" title="显示更过活动">更多</span>
									</td>
								</tr>
							</table>
								
							</div>
							<div class="activity_back_view_border" style="height: 346px">
								<table cellpadding="0" cellspacing="0" border="0" width="100%">
									<@s.iterator value="indexDto.activityList.old" status="count">
										<@s.if test="#count.index%4==0">
											<tr>
										</@s.if>
											<td><div>
												<img src="<@s.property value="poster"/>" width="100px" height="120px" style="cursor:pointer;" onclick="window.location.href='thread_<@s.property value="id"/>.html'"/>
												<br/>
												<a href="thread_<@s.property value="id"/>.html"><@s.property value="name"/></a>
											</div>
											</td>
										<@s.if test="#count.index>0&&#count.index%3==0">
											</tr>
										</@s.if>
									</@s.iterator>
								</table>
							</div>
						</div>
					
					</td>
				</tr>
			</table>
		</div>
		
		<!--  -->
		<table width="100%" border="0" cellpadding="0" cellspacing="5" style="margin-top: 10px">
			<tr>
				<td width="32%">
						<div class="" style="width: 99%">
							<div class="left_span_title">
								<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td width="40%" align="left" valign="bottom">
											<span class="activity_tit_span" style="width: 80px;text-align: center;margin-left: 10px">聚&nbsp;会&nbsp;搜&nbsp;索</span>
										</td>
										<td>
										<span class="more" onclick="window.location.href='thread_0.html'" title="显示更过活动"></span>
										</td>
									</tr>
								</table>
							</div>
							<div class="activity_back_view_border left_content_width" style="height: 190px;" align="center">
								<table id="searchTab" width="80%" border="0">
									<tr>
										<td align="right" width="35%">关键字：</td><td align="left" width="65%"><input id="content"/></td>
									</tr>
									<tr>
										<td align="right">发布人：</td><td align="left"><input id="memberName"/></td>
									</tr>
									<tr>
										<td align="right">省&nbsp;&nbsp;&nbsp;&nbsp;份：</td><td align="left"><select id="pro"></select></td>
									</tr>
									<tr>
										<td align="right">城&nbsp;&nbsp;&nbsp;&nbsp;市：</td><td align="left"><select id="city"></select></td>
									</tr>
									<tr>
										<td colspan="2" align="center">
											<br/>
											<div style="background:url('resources/image/stage/search_btn.gif') no-repeat;width: 98px;height: 29px;border: 0px solid black;cursor: pointer;" onclick="search('1');"><span style="float: left;font-size: 14px;margin-left: 25px;margin-top: 10px;font-weight: bold;color: white;border: 0px solid blue" >立即搜索</span></div>
										</td>
									</tr>
									<tr>
										<td colspan="2" align="right">
											<a href="javascript:search('1')" style="display:none">高级查询&gt;&gt;</a>
										</td>
									</tr>
								</table>
							</div>
						</div>
						
						
						<div class="" style="width: 99%;margin-top: 15px;">
							<div class="left_span_title">
								<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td width="40%" align="left" valign="bottom">
											<span class="activity_tit_span" style="width: 80px;text-align: center;margin-left: 10px">最&nbsp;新&nbsp;日&nbsp;志</span>
										</td>
										<td>
										<span class="more" onclick="window.location.href='thread_0.html'" title="显示更多日志"></span>
										</td>
									</tr>
								</table>
							</div>
							<div class="activity_back_view_border left_content_width" style="height: 190px;" align="center">
								<table width="100%">
								<@s.iterator value="indexDto.assessList" status="count">
									<tr><td align="left" width="70%"><a href="article_<@s.property value="id"/>.html"><nobr><@s.property value="title"/><nobr/></a></td><td align="right"><@s.date name="createTime" format="yyyy-MM-dd"/></td></tr>
								</@s.iterator>
								</table>
							</div>
						</div>
						
						<div class="" style="width: 99%;margin-top: 15px;">
							<div class="left_span_title">
								<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td width="40%" align="left" valign="bottom">
											<span class="activity_tit_span" style="width: 80px;text-align: center;margin-left: 10px">最&nbsp;新&nbsp;商&nbsp;铺</span>
										</td>
										<td>
										<span class="more" onclick="window.location.href='thread_0.html'" title="显示更多日志"></span>
										</td>
									</tr>
								</table>
							</div>
							<div class="activity_back_view_border left_content_width" style="height: 190px" align="center">
								<table width="100%">
								<@s.iterator value="indexDto.shopList" status="count">
									<tr><td align="left" width="70%"><a href="shopThread_<@s.property value="id"/>.html"><nobr><@s.property value="name"/><nobr/></a></td><td align="right"><@s.date name="createdatime" format="yyyy-MM-dd"/></td></tr>
								</@s.iterator>
								</table>
							</div>
						</div>
						
						<div class="" style="width: 99%;margin-top: 15px;">
							<div class="left_span_title">
								<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td width="40%" align="left" valign="bottom">
											<span class="activity_tit_span" style="width: 80px;text-align: center;margin-left: 10px">活&nbsp;动&nbsp;推&nbsp;荐</span>
										</td>
										<td>
										<span class="more" onclick="window.location.href='thread_0.html'" title="显示更多日志"></span>
										</td>
									</tr>
								</table>
							</div>
							<div class="activity_back_view_border left_content_width" style="height: 190px" align="center">
								<table width="100%">
								<@s.iterator value="indexDto.activityList.hot" status="count">
									<tr><td align="left" width="70%"><a href="thread_<@s.property value="id"/>.html"><nobr><@s.property value="name"/><nobr/></a></td><td align="right"><@s.date name="create_date" format="yyyy-MM-dd"/></td></tr>
								</@s.iterator>
								</table>
							</div>
						</div>
				</td>
				<td width="41%" valign="top">
						<div class="" style="width: 99%;">
							<div class="middle_span_title">
								<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td width="40%" align="left" valign="bottom">
											<span class="activity_tit_span" style="width: 80px;text-align: center;margin-left: 10px;font-weight: bold;font-size: 16px">聚&nbsp;餐</span>
										</td>
										<td>
										<span class="more" onclick="window.location.href='thread_0.html'" title="显示更多日志"></span>
										</td>
									</tr>
								</table>
							</div>
							<div class="activity_back_view_border middle_content_width" style="height: 135px" align="center">
							<@s.property value="indexDto.activityList.1"/>
								<table cellpadding="0" cellspacing="0" border="0" width="100%">
									<@s.iterator value="indexDto.activityList.jc" status="count">
										<@s.if test="#count.index%4==0">
											<tr>
										</@s.if>
											<td><div>
												<img src="<@s.property value="poster"/>" width="80px" height="100px" style="cursor:pointer;" onclick="window.location.href='thread_<@s.property value="id"/>.html'"/>
												<br/>
												<a href="thread_<@s.property value="id"/>.html"><@s.property value="name"/></a>
											</div>
											</td>
										<@s.if test="#count.index>0&&#count.index%3==0">
											</tr>
										</@s.if>
									</@s.iterator>
								</table>
							</div>
						</div>
						
						<div class="" style="width: 99%;margin-top: 15px;">
							<div class="middle_span_title">
								<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td width="40%" align="left" valign="bottom">
											<span class="activity_tit_span" style="width: 80px;text-align: center;margin-left: 10px;font-weight: bold;font-size: 16px">P酒K歌</span>
										</td>
										<td>
										<span class="more" onclick="window.location.href='thread_0.html'" title="显示更多日志"></span>
										</td>
									</tr>
								</table>
							</div>
							<div class="activity_back_view_border middle_content_width" style="height: 135px" align="center">
								<table cellpadding="0" cellspacing="0" border="0" width="100%">
									<@s.iterator value="indexDto.activityList.pk" status="count">
										<@s.if test="#count.index%4==0">
											<tr>
										</@s.if>
											<td><div>
												<img src="<@s.property value="poster"/>" width="80px" height="100px"  style="cursor:pointer;" onclick="window.location.href='thread_<@s.property value="id"/>.html'"/>
												<br/>
												<a href="thread_<@s.property value="id"/>.html"><@s.property value="name"/></a>
											</div>
											</td>
										<@s.if test="#count.index>0&&#count.index%3==0">
											</tr>
										</@s.if>
									</@s.iterator>
								</table>
							</div>
						</div>
						
						<div class="" style="width: 99%;margin-top: 15px;">
							<div class="middle_span_title">
								<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td width="40%" align="left" valign="bottom">
											<span class="activity_tit_span" style="width: 80px;text-align: center;margin-left: 10px;font-weight: bold;font-size: 16px">公益事业</span>
										</td>
										<td>
										<span class="more" onclick="window.location.href='thread_0.html'" title="显示更多日志"></span>
										</td>
									</tr>
								</table>
							</div>
							<div class="activity_back_view_border middle_content_width" style="height: 135px" align="center">
								<table cellpadding="0" cellspacing="0" border="0" width="100%">
									<@s.iterator value="indexDto.activityList.gy" status="count">
										<@s.if test="#count.index%4==0">
											<tr>
										</@s.if>
											<td><div>
												<img src="<@s.property value="poster"/>" width="80px" height="100px"  style="cursor:pointer;" onclick="window.location.href='thread_<@s.property value="id"/>.html'"/>
												<br/>
												<a href="thread_<@s.property value="id"/>.html"><@s.property value="name"/></a>
											</div>
											</td>
										<@s.if test="#count.index>0&&#count.index%3==0">
											</tr>
										</@s.if>
									</@s.iterator>
								</table>
							</div>
						</div>
						
						<div class="" style="width: 99%;margin-top: 15px;">
							<div class="middle_span_title">
								<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td width="40%" align="left" valign="bottom">
											<span class="activity_tit_span" style="width: 80px;text-align: center;margin-left: 10px;font-weight: bold;font-size: 16px">户行天下</span>
										</td>
										<td>
										<span class="more" onclick="window.location.href='thread_0.html'" title="显示更多日志"></span>
										</td>
									</tr>
								</table>
							</div>
							<div class="activity_back_view_border middle_content_width" style="height: 135px" align="center">
								<table cellpadding="0" cellspacing="0" border="0" width="100%">
									<@s.iterator value="indexDto.activityList.hx" status="count">
										<@s.if test="#count.index%4==0">
											<tr>
										</@s.if>
											<td><div>
												<img src="<@s.property value="poster"/>" width="80px" height="100px"  style="cursor:pointer;" onclick="window.location.href='thread_<@s.property value="id"/>.html'"/>
												<br/>
												<a href="thread_<@s.property value="id"/>.html"><@s.property value="name"/></a>
											</div>
											</td>
										<@s.if test="#count.index>0&&#count.index%3==0">
											</tr>
										</@s.if>
									</@s.iterator>
								</table>
							</div>
						</div>
						
						<div class="" style="width: 99%;margin-top: 15px;">
							<div class="middle_span_title">
								<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td width="40%" align="left" valign="bottom">
											<span class="activity_tit_span" style="width: 80px;text-align: center;margin-left: 10px;font-weight: bold;font-size: 16px">其他活动</span>
										</td>
										<td>
										<span class="more" onclick="window.location.href='thread_0.html'" title="显示更多日志"></span>
										</td>
									</tr>
								</table>
							</div>
							<div class="activity_back_view_border middle_content_width" style="height: 140px" align="center">
								<table cellpadding="0" cellspacing="0" border="0" width="100%">
									<@s.iterator value="indexDto.activityList.other" status="count">
										<@s.if test="#count.index%4==0">
											<tr>
										</@s.if>
											<td><div>
												<img src="<@s.property value="poster"/>" width="80px" height="100px"  style="cursor:pointer;" onclick="window.location.href='thread_<@s.property value="id"/>.html'"/>
												<br/>
												<a href="thread_<@s.property value="id"/>.html"><@s.property value="name"/></a>
											</div>
											</td>
										<@s.if test="#count.index>0&&#count.index%3==0">
											</tr>
										</@s.if>
									</@s.iterator>
								</table>
							</div>
						</div>
				</td>
				<td  align="right">
					<div style="margin-top: 10px;">
							<table id="loginTab" width="100%" height="100%" cellspacing="10">
								<tr>
									<td width="35%" align="right">用户名：</td><td width="65%" align="left"><input class="x-input" name="username" id="username"/></td>
								</tr>
								<tr>
									<td align="right">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td><td align="left"><input class="x-input" name="password" id="password" type="password"/></td>
								</tr>
								<tr>
									<td align="right">有效期：</td><td align="left"><select id="time_second">
										<option value="0" selected="selected">浏览器进程</option>
										<option value="3600">一个小时</option>
										<option value="86400">一天</option>
										<option value="2592000">一个月</option>
										<option value="315360000">永久</option>
									</select></td>
								</tr>
								<tr>
									<td colspan="2" align="center">
										<input id="memLogin" type="button" class="button_sty1" value="登陆"/>
									</td>
								</tr>
							</table>
							<table id="logSusTab" width="100%" height="140px" border="0" style="display: none">
								<tr>
									<td width="50%" align="center">欢迎回来：</td><td width="50%" align="left"><span style="color: blue" id="uName"></span></td>
								</tr>
								<tr>
									<td align="center">【<a href="base/showSpace.action">个人主页</a>】</td><td align="center">【<a href="memberlogin/exitSystem.action">退出登录</a>】</td>
								</tr>
							</table>
						</div>
						<div style="height:35px;background:url('resources/image/stage/change_city_bottom.jpg') no-repeat;text-align:center;" align="center">
							<span style="float: left;font-size: 15px;margin: 12px 60px;font-weight: bold;color:white;cursor:pointer" id="registerSpan">马上免费注册会员</span>
						</div>
						<div style="margin-top: 20px;height: 56px" id="fourDiv">
							<div style="float: left;width: 55px;height: 55px;background-color: #F0A93A" align="center"><span class="span_div" style="font-weight: bold;font-size: 30px;color: white;line-height: 55px" onclick="window.location.href='searchA_5.html'">吃</span></div>
							<div style="float: left;width: 55px;height: 55px;background-color: #3CB4F0;margin-left: 10px" align="center"><span class="span_div" onclick="window.location.href='searchA_6.html'">喝</span></div>
							<div style="float: left;width: 55px;height: 55px;background-color: #FF2A3B;margin-left: 10px" align="center"><span class="span_div" onclick="window.location.href='searchA_7.html'">玩</span></div>
							<div style="float: left;width: 55px;height: 55px;background-color: #74CA68;margin-left: 10px" align="center"><span class="span_div" onclick="window.location.href='searchA_8.html'">乐</span></div>
						</div>
						<div style="margin-top: 20px;" align="left">
							<table width="100%">
								<tr>
									<td>&nbsp;</td>
								</tr>
							</table>
						</div>
						
						<div class="" style="width: 100%;margin-top: 20px;">
							<div class="left_span_title1">
								<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td width="40%" align="left" valign="bottom">
											<span class="activity_tit_span" style="width: 80px;text-align: center;margin-left: 10px">最&nbsp;新&nbsp;动&nbsp;态</span>
										</td>
										<td>
										<span class="more" onclick="window.location.href='thread_0.html'" title="显示更多日志"></span>
										</td>
									</tr>
								</table>
							</div>
							<div class="activity_back_view_border right_content_width" style="height: 265px" align="center">
								<table width="99%">
								<@s.iterator value="indexDto.trendList" status="count">
									<tr><td align="left" width="70%"><a href="trend_<@s.property value="id"/>.html"><nobr><@s.property value="title"/><nobr/></a></td><td align="right"><@s.date name="createdate" format="yyyy-MM-dd"/></td></tr>
								</@s.iterator>
								</table>
							</div>
						</div>
						
						<div class="" style="width: 100%;margin-top: 20px;">
							<div class="left_span_title1">
								<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td width="40%" align="left" valign="bottom">
											<span class="activity_tit_span" style="width: 80px;text-align: center;margin-left: 10px">最&nbsp;新&nbsp;会&nbsp;员</span>
										</td>
										<td>
										<span class="more" onclick="window.location.href='thread_0.html'" title="显示更多日志"></span>
										</td>
									</tr>
								</table>
							</div>
							<div class="activity_back_view_border right_content_width" style="height: 265px" align="center">
								<table width="99%">
								<@s.iterator value="indexDto.memberList" status="count">
									<tr><td align="left" width="70%"><a href="javascript:parent.window.location.href='base/showSpace.action?id=<@s.property value='id'/>'"><@s.property value="username"/></a></td><td align="right"><@s.date name="createDate" format="yyyy-MM-dd"/></td></tr>
								</@s.iterator>
								</table>
							</div>
						</div>
				</td>
			</tr>
		</table>
		<div id="copyright" style="width: 100%;">
			${copyRight}
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
$(function(){
	$("#memLogin").click(function(){
		var username = $("#username").val();
		var password = $("#password").val();
		var time_second = $("#time_second option:selected").val();
		var url = "memberlogin/login.action?username="+username+"&password="+password+"&time_second="+time_second+"&time="+(new Date().getTime().toString(36));
		$.get(url,function(mes){
			if(mes=="1"){
				$.prompt("登陆成功", {
					submit:loginSuccess,
					buttons : {
						Ok : true
					}
				});
			}
			else{
				$.prompt("<font style='color:red'>用户名或密码错误！登录失败！</font>", {
					buttons : {
						Ok : true
					}
				});
			}
		})
	})

$("#registerSpan").click(function(){
   window.location.href = "register/toRegister.action"  
})

$.getJSON("city.jsp?t="+(new Date().getTime().toString(36)),function(data){
		var str = "";
		var num = 1;
		$.each(data,function(idx,item){
				var cityListData = item.children;
				if(idx>0){
					for(var key in cityListData){
							if(num%7==0&&num!=0){
								str += '<span class="city_otr_span"><a href="home'+item.code+'@'+key+'.html">'+cityListData[key]+'</a>&nbsp;&nbsp;|</span>';
								str += "<br/><br/>";
							}
							else if(num%7==1)
								str += '<span class="city_span"><a href="home'+item.code+'@'+key+'.html">'+cityListData[key]+'</a>&nbsp;&nbsp;|</span>';
							else
								str += '<span class="city_otr_span"><a href="home'+item.code+'@'+key+'.html">'+cityListData[key]+'</a>&nbsp;&nbsp;|</span>';
							num++;
					}
				}
		})
		$("#city_change_div").html($("#city_change_div").html()+str);
	})
initDistrict("pro","city","",'','')
})

function loginSuccess(){
	$("#registerSpan,#loginTab").css("display","none");
	<#if Session.userInfo?exists>
      $("#uName").html("${userInfo.username}");
      <#else>
       $("#uName").html($("#username").val());
	</#if> 
	
		
	$("#logSusTab").css("display","block");
}

<#if Session.userInfo?exists>
       loginSuccess();
</#if> 


function search(type){
if(type=="1")
	var content = $("#content").val();
else{
	var content = $("#keyWord").val();
	if("请输入关键字"==content)
		content = "";
}
	var name = $("#memberName").val();
	var pro = $("#pro").val();
	var city = $("#city").val();
	var url = 'search.jsp?content='+encodeURIComponent(content)+'&name='+encodeURIComponent(name)+'&pro='+encodeURIComponent(pro)+'&city='+encodeURIComponent(city);
	window.location.href=url;
}
</script>
</html>