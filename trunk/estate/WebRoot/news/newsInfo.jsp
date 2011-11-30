<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>房产资讯内容</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
	    <meta http-equiv="keywords" content="房产资讯，连云港房产新闻，南京房产新闻，连云港地产人，南京地产人">
        <meta http-equiv="description" content="今日头条、行业动态、项目动态、企业认为、地产金融、评论观察中具体新闻内容">
		<link rel="stylesheet" href="../resource/css/global.css"
			type="text/css"></link>
		<link rel="stylesheet" type="text/css" href="css/front.css" />
		<link rel="stylesheet" type="text/css" href="css/whole.css" />
		<link rel="stylesheet" type="text/css" href="css/layout.css" />
		<link rel="stylesheet" href="../resource/css/whole.css"
			type="text/css"></link>
		<script type="text/javascript">
		 var basePath = "<%=basePath%>";
		</script>
		<script type="text/javascript" src="js/jquery.js" charset="utf-8"></script>
		<script type="text/javascript" src="js/news.js" charset="utf-8"></script>
		<script type="text/javascript" src="../resource/js/whole.js"></script>
	</head>

	<body>
  <div style="width: 100%;height: 100%;" align="center">
    			<jsp:include page="../head.jsp"/>
    <jsp:include page="newsTop.jsp"></jsp:include>
    <div class="page_row">
    <div class="page_main_msg left">
    <div class="left_row left">
    <div class="list pic_news ">
    <div class="list_bar text-left"><a href="<%=basePath%>news/news_toNews.shtml">首页</a> &gt; <a href="<%=basePath%>news/news_toNewsType.shtml?type=<s:property value='type'/>">
    				<s:if test="type==1">
						今日头条
					</s:if>
					<s:if test="type==2">
						行业动态
					</s:if>
					<s:if test="type==3">
						项目动态
					</s:if>
					<s:if test="type==4">
					      企业人物
					</s:if>
					<s:if test="type==5">
						地产金融
					</s:if>
					<s:if test="type==6">
						评论观察
					</s:if>
					<s:if test="type==7">
						梦房园动态
					</s:if>
    
    </a>  &gt; 正文
    <!--  
    <div style="float:right; margin:5px"><script type="text/javascript">document.write('<iframe allowTransparency="true" frameborder="0" scrolling="no" src="http://hits.sinajs.cn/A1/weiboshare.html?url=%url%&appkey=&type=6" width="86" height="16"></iframe>'.replace(/%url%/,encodeURIComponent(location.href)));</script></div>
    -->
    
    </div>
   
   
    <div class="ctitle ctitle1"><s:property value="news.title"/></div>
    <div class="ctitleinfo"><a href="/">梦房园房产新闻网</a>&nbsp;&nbsp;&nbsp;发布日期：<s:date name="news.createTime" format="yyyy-MM-dd hh:mm:ss"/>&nbsp;&nbsp;&nbsp;来源:<s:property value="news.source"/>&nbsp;&nbsp;&nbsp;</div>
    <div class="intr text-left"><span class="intr_front ">摘 要：</span><s:property value="news.summary"/></div>
    <div class="pbox"><s:property value="news.content"  escape="false"/></div>
    <div class="page_no"><div class="pg-3">
</div></div>
    </div>
    </div>
    </div>
    <div class="page_other_msg right"><div class="left_row">
<div class="list">
<div class="list_bar">精彩图文</div>
	<div class="image_content">
<ul class="left_pic">
<s:iterator value="imgList">
 <li><a href="news_toNewsInfo.shtml?type=<s:property value='columnType'/>&id=<s:property value='id'/>" title="<s:property value='title'/>" target="_blank"><img src="../../../<s:property value='imgUrl'/>" alt="<s:property value='title'/>" /></a><a href="news_toNewsInfo.shtml?type=<s:property value='columnType'/>&id=<s:property value='id'/>" target="_blank"><s:property value='title'/></a></li>
</s:iterator>
</ul>
</div>
</div>
</div>
<div class="left_row">
<div class="list">
<div class="list_bar">热门排行</div>
<div class="hot_content">
<div class="orderlist">
     <div id = "rankingdiv">
        <img src ="img/loading.gif" width="50" height="50">
     </div>
</div>

</div>
</div>
</div>
<!--  
    <div class="left_row">
    <div class="list">111</div>
    </div> 
    -->
    </div>
    
    <table class="layoutTab" >
    	<tr>
    		<td align="center">
    			<jsp:include page="../copyright.jsp"></jsp:include>
    		</td>
    	</tr>
    </table>
</div>
  </body>
 
</html>
