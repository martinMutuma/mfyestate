<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<title>房产资讯顶部</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta http-equiv="keywords" content="房产资讯，连云港房产新闻，南京房产新闻，连云港地产人，南京地产人">
<meta http-equiv="description" content="房产资讯版块头部今日头条、行业动态、项目动态、企业认为、地产金融、评论观察头部信息">
</head>
<body>
<div class="new_nav" id="news_menu">
<div class="new_nav_con">
<ul >
  <li><a class="sPage_off" id="nav" target="_self" href="<%=basePath%>news/news_toNews.shtml">新闻首页</a> </li>
  <li><a class="sPage_off" id="nav" target="_self" href="<%=basePath%>news/news_toNewsType.shtml?type=1">今日头条</a></li>
  <li><a class="sPage_off" id="nav" target="_self" href="<%=basePath%>news/news_toNewsType.shtml?type=2">行业动态</a></li>
  <li><a class="sPage_off" id="nav" target="_self" href="<%=basePath%>news/news_toNewsType.shtml?type=3">项目动态</a></li>
  <li><a class="sPage_off" id="nav" target="_self" href="<%=basePath%>news/news_toNewsType.shtml?type=4">企业人物</a></li>
  <li><a class="sPage_off" id="nav" target="_self" href="<%=basePath%>news/news_toNewsType.shtml?type=5">地产金融</a></li>
  <li><a class="sPage_off" id="nav" target="_self" href="<%=basePath%>news/news_toNewsType.shtml?type=6">评论观察</a></li>
  <li><a class="sPage_off" id="nav" target="_self" href="<%=basePath%>news/news_toNewsType.shtml?type=7">梦房园动态</a></li>
</ul>
</div>
</div>
<div class="topsearch box">
<form id="searchForm" name="searchForm" action="news_toNewsType.shtml" target="_self">
  <div class="title"></div>
  <div id="page_search_left"><input type="hidden" name="count" value="10" /> <input id="searchContent" class="inputText" size="16" name="searchContent" type="text"  value=${searchContent} ></div>
  <div id="page_search_type">
  <s:select	list="#{'1':'今日头条','2':'行业动态','3':'项目动态','4':'企业人物','5':'地产金融','6':'评论观察','7':'梦房园动态'}"
											name="type" id="type" theme="simple"
											headerKey="" headerValue="所有栏目"></s:select>
  </div>
  <div id="page_search_btn"><img border="0" alt="" onclick="searchFormSubmit(1);" src="img/topsearch_submit.gif" /></div>
  <div class="hots"></div>
  <input type="hidden" id="page" name="page" value="1">
  <div id="page_search_right"><script>
		var day="";
		var month="";
		var ampm="";
		var ampmhour="";
		var myweekday="";
		var year="";
		mydate=new Date();
		myweekday=mydate.getDay();
		mymonth=mydate.getMonth()+1;
		myday= mydate.getDate();
		year= mydate.getFullYear();
		if(myweekday == 0)
		weekday=" 星期日 ";
		else if(myweekday == 1)
		weekday=" 星期一 ";
		else if(myweekday == 2)
		weekday=" 星期二 ";
		else if(myweekday == 3)
		weekday=" 星期三 ";
		else if(myweekday == 4)
		weekday=" 星期四 ";
		else if(myweekday == 5)
		weekday=" 星期五 ";
		else if(myweekday == 6)
		weekday=" 星期六 ";
		document.write(year+"年"+mymonth+"月"+myday+"日 "+weekday);
	 </script></div>
</form>
</div> 
</body>
