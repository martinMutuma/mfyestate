<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String username = request.getParameter("username");
if(null==username)username="";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>用户登录</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="<%=basePath %>resource/css/global.css" type="text/css"></link>
	<link rel="stylesheet" type="text/css" href="<%=basePath %>resource/css/jqueryui/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>resource/css/jqueryui/icon.css">
	<link href="<%=basePath %>member/css/index.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath %>member/css/login.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath %>member/css/mystore.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>
	<script type="text/javascript" src="<%=basePath %>resource/js/jquery-1.4.2.js" charset="utf-8"></script>
	<script type="text/javascript" src="<%=basePath %>resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>resource/js/jquery.tip.js"></script>
	<script type="text/javascript" src="<%=basePath %>resource/js/global.js"></script>
	<script type="text/javascript" src="../resource/js/whole.js"></script>
	
  </head>
  <style type="text/css">
  	.house_x{width:100%;}
.house_x_dt{width:960px; background:url(../building/images/house.jpg) no-repeat 0 0;}
.xxxx_top{width:960px; height:89px; overflow:hidden;}
.xxxx_top  h1{ font-size:35px; color:#000; height:60px; line-height:89px; padding-left:29px; float:left;}
.storeNav {
	height: 35px;
	width: 960px;
	background: #AF0000;
	.storeNav ul {margin-left: 20px;}
.storeNav ul li {display: block;float: left;}
.storeNav ul li a:link,
.storeNav ul li a:visited{
	display: block;
	height: 35px;
	width: 95px;
	float:left;
	color: #FFFFFF;
	font-weight: bold;
	text-align: center;
	line-height: 35px;
	text-decoration:none;
	}
.storeNav ul li a#curr {background: url(/images/snbg.gif) no-repeat;color: #000000;}
  </style>
  <body>
  <jsp:include page="../head.jsp"></jsp:include>
    <div style="margin-top:10px;" align="center">
        <div id="menu" align="left" style="width:960px;margin-top: 10px;">
				
				
				<div class="house_x">
    <div class="house_x_dt">
                <div class="xxxx_top">
                    <div class="left hs_tit">
                        <h1>的网上店铺</h1>
                    </div>
                    <div class="clear"></div>
                </div>
                
<div class="storeNav">
      <ul>
       <li><a href="/my/list-298-1-1-1-" >店铺首页</a></li>
           <li><a href="/my/list-o-1-1---298------------" >写字楼</a></li>
           <li><a href="/my/list-s-1-1---298------------" >商铺</a></li>
           <li><a href="/my/list-t-1-1---298--------" >生意转让</a></li>

           <li><a href="/my/list-i-1-1---298-----------0--" >工业地产</a></li>
           <li><a href="/my/list-p-1-1---298-----" >大型项目</a></li>
           <li><a href="/index/myStoreService.kemp?action=service&amp;agentId=298" >服务评价</a></li>
           <li><a href="/index/myStoreIntro.kemp?action=intro&amp;agentId=298" id="curr">给我留言</a></li>    
      </ul>
    </div>
</div>



 <div class="jjr_jieshao">
<form id="/index/doStoreIntro_kemp" name="leavewordBean" onsubmit="return true;" action="/index//index/doStoreIntro.kemp" method="post">
		<table border="0" cellpadding="1" bordercolor="#111111" width="100%">
				<tr class="td1">
					<td align="right" width="25%">留言主题：
					<input type="hidden" name="leaveword.toId" value="zhouliang"/></td>
					<td align="left"><input type="text" name="leaveword.title" size="50" maxlength="50" value="" id="title" class="page_input"/>(必填)</td>
				</tr>
				<tr class="td1">
					<td align="right">留言内容：</td>
					<td vAlign="top" align="left"><textarea name="leaveword.content" cols="50" rows="8" id="content"></textarea>(必填)</td>
				</tr>
				<tr class="td1">
					<td align="right">您的姓名：</td>
					<td align="left"><input type="text" name="leaveword.name" size="30" maxlength="20" value="" id="name" class="page_input"/>(必填)</td>
				</tr>
				<tr class="td1">
					<td align="right">联系电话：</td>

					<td align="left"><input type="text" name="leaveword.telephone" size="30" maxlength="20" value="" id="/index/doStoreIntro_kemp_leaveword_telephone" class="page_input"/></td>
				</tr>
				<tr class="td1">
					<td align="right">电子邮件：</td>
					<td align="left"><input type="text" name="leaveword.email" size="30" maxlength="30" value="" id="/index/doStoreIntro_kemp_leaveword_email" class="page_input"/></td>
				</tr>
				<tr class="td1">
					<td align="right">校验码：</td>
					<td align="left"><input type="text" name="imgchk" size="4" maxlength="4" value="" id="/index/doStoreIntro_kemp_imgchk" class="page_input"/>
					    <img id="imagechk" src="/pages/common/imgchk.jsp" onerror="this.src='/pages/common/imgchk.jsp'">
	                    <a href="javascript:imgchng('')">看不清,换一张&nbsp;<font color="red"></font></td>
				</tr>
				<tr class="td1">
					<td align="center" colSpan="2"><input type="button" name="bt_ok"
						cssClass="page_button" value="确  定" onclick="return checkLeaveword();"/>
					</td>
				</tr>
			</table>
		</form>
  </div>
  <div class="clear"></div>
</div>
  </body>
  <script type="text/javascript">
  	  function gotoPage(){
	  	if($("#gotoPage").val()>${rowCount}){
		  	$.messager.alert('提示','输入页数大于总页数','warning',function(){
			});
	  		return false;
	  	}
	  	if($("#gotoPage").val()<1){
	  		$.messager.alert('提示','输入页数非法','warning',function(){
			});
	  		return false;
	  	}
	  	window.location.href="<%=basePath%>mem/baseinfo_toMyStore.shtml?authorId="+'<s:property value='tb.id'/>'+"&type="+$("#type").val()+"&page="+$("#gotoPage").val();
	  }
  </script>
</html>
