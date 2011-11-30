<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>房产资讯</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		 <meta http-equiv="keywords" content="房产资讯，连云港房产新闻，南京房产新闻，连云港地产人，南京地产人">
		<meta http-equiv="description" content="显示今日头条、行业动态、项目动态、 企业人物、地产金融、评论观察中的一个信息。">
		<link rel="stylesheet" href="../resource/css/global.css"
			type="text/css"></link>
		<script type="text/javascript" src="js/jquery.js" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="css/front.css" />
		<link rel="stylesheet" type="text/css" href="css/whole.css" />
		<link rel="stylesheet" type="text/css" href="css/layout.css" />
		<script type="text/javascript">
		 var basePath = "<%=basePath%>";
		</script>
		  <script type="text/javascript" src="../resource/js/whole.js"></script>
	    <link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>
		<script type="text/javascript" src="js/newsType.js" charset="utf-8"></script>
        <style>
        .left{float:left;}
		.right{float:right;}
        </style>

	</head>

	<body>
		<div style="width: 100%; height: 100%;" align="center">
						<jsp:include page="../head.jsp"></jsp:include>
			<jsp:include page="newsTop.jsp"></jsp:include>
			<div class="page_row">
				<div class="page_main_msg left">
					<div class="left_row left">
						<div class="list pic_news">
							<div class="list_bar text-left">
								<a href="<%=basePath%>news/news_toNews.shtml">首页</a> &gt;
								<a
									href="<%=basePath%>news/news_toNewsType.shtml?type=<s:property value='type'/>">
									<s:if test="type==0">
						所有栏目
					</s:if> <s:if test="type==1">
						今日头条
					</s:if> <s:if test="type==2">
						行业动态
					</s:if> <s:if test="type==3">
						项目动态
					</s:if> <s:if test="type==4">
					      企业人物
					</s:if> <s:if test="type==5">
						地产金融
					</s:if> <s:if test="type==6">
						评论观察
					</s:if><s:if test="type==7">
					    梦房园动态
					</s:if>
					 </a>
							</div>
							<div class="list_content">
								<div class="c1-body">
									<s:iterator value="typeList">
										<div class="c1-bline" style="padding: 7px 0px;">
											<div class="f-left">
												<img src="img/head-mark4.gif" align="middle" class="img-vm"
													border="0" />
												<a
													href="news_toNewsInfo.shtml?type=<s:property value='columnType'/>&id=<s:property value='id'/>"
													title="<s:property value='title'/>"><span style=""><s:property
															value='title' /> </span> </a>
											</div>
											<div class="f-right">
												<s:date name="createTime" format="yyyy-MM-dd" />
											</div>
											<div class="clear"></div>
										</div>
									</s:iterator>
								</div>
								<div class="pg-3">
									共&nbsp;
									<s:property value="total" />
									&nbsp;条&nbsp;&nbsp;
									<s:property value="page" />
									/
									<s:property value='lastPage' />
									&nbsp;页 &nbsp;&nbsp;&nbsp;

									<s:if test="page==1">
										<a>&nbsp;首&nbsp;页&nbsp;</a>
										<a>上一页</a>
									</s:if>
									<s:else>

										<a href="javascript:searchFormSubmit(1)">&nbsp;首&nbsp;页&nbsp;</a>
										<a
											href="javascript:searchFormSubmit(<s:property value='page-1'/>)">上一页</a>
									</s:else>
									<s:if test="page==lastPage">
										<a>下一页</a>
										<a>&nbsp;尾&nbsp;页&nbsp;</a>
									</s:if>
									<s:else>
										<a
											href="javascript:searchFormSubmit(<s:property value='page+1'/>)">下一页</a>
										<a
											href="javascript:searchFormSubmit(<s:property value='lastPage'/>)">
											&nbsp;尾&nbsp;页&nbsp;</a>
									</s:else>



								</div>
							</div>
						</div>
					</div>
					<div style="clear: both;"></div>
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
												alt="<s:property value='title'/>" /> </a><a
											href="news_toNewsInfo.shtml?type=<s:property value='columnType'/>&id=<s:property value='id'/>"
											target="_blank"><s:property value='title' /> </a>
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
							111
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
