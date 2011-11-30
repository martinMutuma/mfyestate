<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>房产资讯</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="房产资讯，连云港房产新闻，南京房产新闻，连云港地产人，南京地产人">
		<meta http-equiv="description" content="最新房产资讯，连云港房产动态，南京房产动态，今日头条、行业动态、项目动态、企业认为、地产金融、评论观察房产信息">
		<link rel="stylesheet" href="../resource/css/whole.css"
			type="text/css"></link>
		<link rel="stylesheet" type="text/css" href="css/front.css" />
		<link rel="stylesheet" type="text/css" href="css/whole.css" />
		<link rel="stylesheet" type="text/css" href="css/layout.css" />
		<script type="text/javascript" src="js/jquery.js" charset="utf-8"></script>
		<script type="text/javascript" src="js/showimg.js" charset="utf-8"></script>
		<script type="text/javascript">
		 var basePath = "<%=basePath%>";
		 function hoverLi(m,n,counter){
			for(var i=1;i<=counter;i++){
				g('tb_'+m+i).className='normaltab';
				g('tbc_'+m+i).className='undis';
			}
			g('tbc_'+m+n).className='dis';
			g('tb_'+m+n).className='curr';
		}
		
		
		</script>
		<script type="text/javascript" src="../resource/js/whole.js"></script>
		<script type="text/javascript" src="js/news.js" charset="utf-8"></script>
		<script type="text/javascript" src="js/newsType.js" charset="utf-8"></script>
	
		<style>

	</style>
		
	</head>

	<body>
	<div align="center">
		    <jsp:include page="../head.jsp"/>
			<jsp:include page="newsTop.jsp"></jsp:include>
			<div class="page_row">
				<!--焦点图End-->
				 <div id="jdt">
				    <div class='img-swith-main'>
											<div class="img-switch">
												<ul id="IMG_UL_LIST_1" >
													<li>
														<img src="<%=basePath%>resource/images/1.gif" />
													</li>
													<li>
														<img src="<%=basePath%>resource/images/2.gif" />
													</li>
													<li>
														<img src="<%=basePath%>resource/images/3.gif" />
													</li>
													<li>
														<img src="<%=basePath%>resource/images/4.gif" />
													</li>
												</ul>
											</div>
											<div class='img-switch-index'>
												<ul id="IMG_INDEX_UL_LIST_1">
													<li id="li_index_default" style="background-color: #aaa;">
														01
													</li>
													<li>
														02
													</li>
													<li>
														03
													</li>
													<li>
														04
													</li>
												</ul>
											</div>
											<div class='img-switch-clear'>
											</div>
										</div>
                </div>
				<div class="list hot_news">
					<div id="tb_0" class="btncon" >
						<ul>
							<li onclick="hoverLi(1,1,3)" id="tb_11" class="curr" >
								最新资讯
							</li>
							<li onclick="hoverLi(1,2,3)" id="tb_12" >
								热点关注
							</li>
							<li onclick="hoverLi(1,3,3)" id="tb_13" >
								热门推荐
							</li>
						</ul>
					</div>
					<div class="list_content">
						<div id="tbc_11" class="dis">
							<div class="c1-body">
								<s:iterator value="newestList">
									<div class="it_title" >
										<div class="f-left">
											<img src="img/head-mark3.gif" align="middle" class="img-vm"
												border="0" />
											<a
												href="news_toNewsInfo.shtml?type=<s:property value='columnType'/>&id=<s:property value='id'/>"
												title="<s:property value='title'/>" target="_blank"><span
												style=""><s:property value='title' /> </span>
											</a>
										</div>
										<div class="f-right">
											<s:date name="createTime" format="MM-dd" />
										</div>
										<div class="clear"></div>
									</div>

								</s:iterator>
							</div>
						</div>
						<div id="tbc_12" class="undis">
							<div class="c1-body">
								<div id="hotspotdiv">
									<img src="img/loading.gif" width="50" height="50">
								</div>
							</div>
						</div>
						<div id="tbc_13" class="undis">
							<div class="c1-body">
								<div id="recommenddiv">
									<img src="img/loading.gif" width="50" height="50">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div style="clear: both;"></div>
			</div>
			<!--主体上End-->
			<!--主体下Begin-->
			<div class="page_row">
				<div class="page_main_msg left">
					<div class="cycle_news_row">
						<div class="list cycle_news">
							<div class="list_bar">
								<a href="<%=basePath%>news/news_toNewsType.shtml?type=1"
									target="_blank">今日头条</a>
							</div>
							<div class="list_content h130">
								<div class="c1-body">
									<s:iterator value="todayList">
										<div class="it_title" >
											<div class="f-left">
												&middot;
												<a
													href="news_toNewsInfo.shtml?type=<s:property value='columnType'/>&id=<s:property value='id'/>"
													title="<s:property value='title'/>" target="_blank"><span
													style=""><s:property value='title' />
												</span>
												</a>
											</div>
											<div class="f-right">
												<s:date name="createTime" format="MM-dd" />
											</div>
											<div class="clear"></div>
										</div>
									</s:iterator>
								</div>
							</div>
						</div>
						<div class="list cycle_news">
							<div class="list_bar">
								<a href="<%=basePath%>news/news_toNewsType.shtml?type=2"
									target="_blank">行业动态</a>
							</div>
							<div class="list_content h130">
								<div class="c1-body">
									<s:iterator value="tradeList">

										<div class="it_title">
											<div class="f-left">
												&middot;
												<a
													href="news_toNewsInfo.shtml?type=<s:property value='columnType'/>&id=<s:property value='id'/>"
													title="<s:property value='title'/>" target="_blank"><span
													style=""><s:property value='title' />
												</span>
												</a>
											</div>
											<div class="f-right">
												<s:date name="createTime" format="MM-dd" />
											</div>
											<div class="clear"></div>
										</div>

									</s:iterator>


								</div>
							</div>
						</div>

						<div class="list cycle_news">
							<div class="list_bar">
								<a href="<%=basePath%>news/news_toNewsType.shtml?type=3"
									target="_blank">项目动态</a>
							</div>
							<div class="list_content h130">
								<div class="c1-body">
									<div id="projectdiv">
										<img src="img/loading.gif" width="50" height="50">
									</div>
								</div>
							</div>
						</div>

						<div class="list cycle_news">
							<div class="list_bar">
								<a href="<%=basePath%>news/news_toNewsType.shtml?type=4"
									target="_blank">企业人物</a>
							</div>
							<div class="list_content h130">
								<div class="c1-body">
									<div id="personagediv">
										<img src="img/loading.gif" width="50" height="50">
									</div>
								</div>
							</div>
						</div>

						<div class="list cycle_news">
							<div class="list_bar">
								<a href="<%=basePath%>news/news_toNewsType.shtml?type=5"
									target="_blank">地产金融</a>
							</div>
							<div class="list_content h130">
								<div class="c1-body">
									<div id="landedEstatediv">
										<img src="img/loading.gif" width="50" height="50">
									</div>

								</div>
							</div>
						</div>

						<div class="list cycle_news">
							<div class="list_bar">
								<a href="<%=basePath%>news/news_toNewsType.shtml?type=6"
									target="_blank">评论观察</a>
							</div>
							<div class="list_content h130">
								<div class="c1-body">
									<div id="commentdiv">
										<img src="img/loading.gif" width="50" height="50">
									</div>
								</div>
							</div>
						</div>
						<div style="clear: both;"></div>
					</div>
				</div>
				<div class="page_other_msg right">
					<div class="left_row">
						<div class="list">
							<div class="list_bar">
								精彩图文
							</div>
							<div class="image_content">
								<ul class="left_pic">
									<s:iterator value="imgList">
										<li>
											<a
												href="news_toNewsInfo.shtml?type=<s:property value='columnType'/>&id=<s:property value='id'/>"
												title="<s:property value='title'/>" target="_blank"><img
													src="../../../<s:property value='imgUrl'/>"
													alt="<s:property value='title'/>" />
											</a><a
												href="news_toNewsInfo.shtml?type=<s:property value='columnType'/>&id=<s:property value='id'/>"
												target="_blank"><s:property value='title' />
											</a>
										</li>
									</s:iterator>
								</ul>
							</div>
						</div>
					</div>
					<div class="left_row">
						<div class="list">
							<div class="list_bar">
								热门排行
							</div>
							<div class="hot_content">
								<div class="orderlist">
									<div id="rankingdiv">
										<img src="img/loading.gif" width="50" height="50">
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 
					<div class="left_row">
						<div class="list">
						</div>
					</div>
					 -->
				</div>

				<table class="layoutTab">
					<tr>
						<td align="center">
							<jsp:include page="../copyright.jsp"></jsp:include>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</body>


</html>
