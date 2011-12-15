<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="estateTag" prefix="estateTag" %>
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
	<script type="text/javascript" src="<%=basePath %>resource/js/whole.js"></script>
	
  </head>
  <style type="text/css">
		.house_x{width:100%;}
		.house_x_dt{width:960px; background:url(../building/images/house.jpg) no-repeat 0 0;}
		.xxxx_top{width:960px; height:89px; overflow:hidden;}
		.xxxx_top  h1{ font-size:35px; color:#000; height:60px; line-height:89px; padding-left:29px; float:left;}
		.free_mo{ text-align:left; float:right; margin-right:10px; display:inline;}
		.house_nav{width:960px; height:39px; background:url(../building/images/navhou.gif) no-repeat; text-align:center;}
		.nobgnav{width:960px;  text-align:center; background-position:0px 0px; overflow:hidden;}
		#house_nav{height:39px; font-size:14px; float:left; padding-left:105px;}
		#house_nav a{width:74px; float:left;  line-height:36px; text-align:center; margin-left:15px; display:inline;}
		#house_nav a:hover{color:#fff; background:url(../building/images/hou_na.gif) no-repeat; display:block; font-weight:bold; width:74px; height:39px; text-decoration:none; line-height:34px; text-align:center; margin-left:15px; display:inline;}
		#house_nav a.nav_housOn{color:#fff; background:url(../building/images/hou_na.gif) no-repeat; display:block; font-weight:bold; width:74px; height:39px; text-decoration:none; line-height:34px; text-align:center; margin-left:15px; display:inline;}
		.ico_xx{ padding-top:37px; float:left;}
		.ico_xx img{ padding-right:3px;}
		.house_x_dd{width:958px; height:510px;border:1px #bcccf9 solid; border-top:none; }
		.house_x_dd .hdd_L{ float:left; width:347px; margin-left:8px; display:inline;}
		
		a:link {color: black;text-decoration: none;}     /* unvisited link */
		a:visited {color: black;text-decoration: none;}  /* visited link */
		a:hover {color: black;text-decoration: none;}   /* mouse over link */
		a:active {color: black;text-decoration: none;}   /* selected link */
  </style>
  <body>
  <jsp:include page="../head.jsp"></jsp:include>
    <div style="margin-top:10px;" align="center">

	<div class="house_x">
    <div class="house_x_dt">
               <div class="xxxx_top">
                   <div class="left hs_tit">
                       <h1><s:property value="tb.realName"/>的网上店铺</h1>
                   </div>
                   <div class="clear"></div>
               </div>
               <div class="house_nav">
                   <div id="house_nav">
                   <s:if test="">
                       <a href="<%=basePath%>mem/baseinfo_toMyStore.shtml?authorId=<s:property value='tb.id'/>&type=office" class="nav_housOn">写字楼</a> 
                   </s:if>
                       <a href="<%=basePath%>mem/baseinfo_toMyStore.shtml?authorId=<s:property value='tb.id'/>&type=build">新盘</a> 
                       <a href="<%=basePath%>mem/baseinfo_toMyStore.shtml?authorId=<s:property value='tb.id'/>&type=second">二手房</a> 
                       <a href="<%=basePath%>mem/baseinfo_toMyStore.shtml?authorId=<s:property value='tb.id'/>&type=shop">商铺</a> 
                       <a href="<%=basePath%>mem/baseinfo_toMyStore.shtml?authorId=<s:property value='tb.id'/>&type=business">生意转让</a> 
                       <a href="<%=basePath%>mem/baseinfo_toMyStore.shtml?authorId=<s:property value='tb.id'/>&type=industry">工业地产</a> 
                       <a href="<%=basePath%>mem/baseinfo_toMyStore.shtml?authorId=<s:property value='tb.id'/>&type=lagrepro">大型项目</a> 
                   </div>
               </div>
      		 </div>
				
				
			</div>
    <table style="width:960px" >
    <tr><td align="center">

	 <div class="center_left_box2">
		   <div class="center_left5">
		    
		    <table width="750" border="0" cellspacing="0" cellpadding="0" id="houselist">
		      <tr>
		          <td width="11%" align="center" bgcolor="#f3f3f3" class="toptd" style="border-left: solid 1px #d7d7d7;" height="26">&nbsp;</td>
		          <td width="14%" align="center" bgcolor="#f3f3f3" class="toptd">类型</td>
		          <td width="20%" align="center" bgcolor="#f3f3f3" class="toptd">标题</td>
		          <td width="10%" align="center" bgcolor="#f3f3f3" class="toptd">出租/出售</td>
		          <td width="13%" align="center" bgcolor="#f3f3f3" class="toptd">面积/价格</td>
		          <td width="10%" align="center" bgcolor="#f3f3f3" class="toptd" style="border-right:solid 1px #d7d7d7;">发布人/时间</td>
		       </tr>
		     <s:iterator value="myStorePageList" status="st" id="item">
		      <tr onmouseover="this.className='bg_over'" onmouseout="this.className='bg_out'">
			  	<td  height="86" align="center">
			  		<a href="#" target="_blank">
		        	<img border="0" href="<%=basePath%>building/toBuidingInfo.shtml?id=<s:property value="id"/>" src="<%=basePath%>imageFloder/<s:property value="compressUrl"/>" title="<s:property value="name"/>" width="79" height="59"/></a>
				</td>
		        <td align="center" >
 					<p>
 					 <s:property value="category"/>
			        </p>
			    </td>
		        <td align="left">
			        <p>
			        	<a href="#" target="_blank"><s:property value="name"/>
			        </p>
			        <p><s:property value="disname"/></p>
				</td>
		        <td align="center">
			        	<p><estateTag:convertCode codeType="租售" code="${flag}"></estateTag:convertCode> </p>
		        </td>
		        <td align="center">
		        	<p><s:property value="price"/></p>
		        	<p><s:property value="area"/></p>
		        </td>
		        <td align="center" >
		         <p><s:property value="tb.realName"/></p>
		         <p><s:property value="createTime" /> </p>
		        </td>
		       </tr>
		       </s:iterator>
		    </table>

		</div>
		</div>
    <!-- 浮动窗 -->
	
		<div class="center_right">
		    <div class="right_box1">
			    <div class="right_title">【会员简介】</div>
			    <div class="right_main2">
			      <p align="center"><img src="<%=basePath%>imageFloder/<s:property value="tb.headUrl"/>" alt="用户形象" width="100" height="133"/></p>
			      <table  border="0" style="width: 100%;margin-top: 5px;" cellspacing="0" cellpadding="0">
			      
			        <tr>
			          <td width="40%" height="20" align="right">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
			          <td><s:property value="tb.realName"/></td>
			        </tr> 
			         
			        <tr>
			          <td width="40%" height="20" align="right">联系电话：</td>
			          <td><s:property value="tb.tel"/></td>
			        </tr>
			        <tr>
			          <td height="20" align="right">注册时间：</td>
			          <td><s:date name="tb.createTime" format="yyyy-MM-dd"/></td>
			        </tr>
			        <tr>
			          <td height="20" align="right">积&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;分：</td>
			          <td><s:property value="tb.integral"/></td>
			        </tr>
			        
			        <tr>
			          <td height="20" align="right">所属公司：</td>
			          <td><s:property value="tb.company"/></td>
			        </tr>
			        
			        <tr>
			          <td height="20" align="right">上次登录：</td>
			          <td><s:date name="tb.lastLoginTime" format="yyyy-MM-dd"/></td>
			        </tr>
				      <tr >
			            <td height="20" align="center" colspan="2">
			      	 	  <p id="login_mess_ajax"><a href="#"><img src="../member/images/outline.jpg" height="16px" alt="给我留言" style="border:0;"/></a></p>
				      </td>
				      </tr>	
			      </table>
				</div>
	    	</div>
		    <div class="right_box1">
		    <div class="right_title">【店铺公告】</div>
		    <div class="right_main2">
		    <p><s:property value="ts.messageContent"/>
          	</p></div>
		    </div>
		    <div class="clear">&nbsp;</div>
	   </div>
<input type="hidden" name="type" id="type" value="${type}">
	</td></tr>
</table>
<!-- 分页 -->
<div style="clear: both;float: left;margin-left: 220px;border: 0px red solid;">
		第${currentPage}页 共${pageCount}页
<s:if test="%{currentPage!=1}">
	<a href="<%=basePath%>mem/baseinfo_toMyStore.shtml?authorId=<s:property value='tb.id'/>&type=${type}&page=1">首页</a>
</s:if>
<s:else>
	<font disabled="true">首页</font>
</s:else>
<s:if test="%{currentPage<pageCount}">
	<a href="<%=basePath%>mem/baseinfo_toMyStore.shtml?authorId=<s:property value='tb.id'/>&type=${type}&page=${currentPage+1}">下一页</a>
</s:if>
<s:else>
	<font disabled="true">下一页</font>
</s:else>
<s:if test="%{currentPage!=1}">
	<a href="<%=basePath%>mem/baseinfo_toMyStore.shtml?authorId=<s:property value='tb.id'/>&type=${type}&page=${currentPage-1}">上一页</a>
</s:if>
<s:else>
	<font disabled="true">上一页</font>
</s:else>
<s:if test="%{currentPage<pageCount}">
<a href="<%=basePath%>mem/baseinfo_toMyStore.shtml?authorId=<s:property value='tb.id'/>&type=${type}&page=${pageCount}">尾页</a>
</s:if>
<s:else>
	<font disabled="true">尾页</font>
</s:else>
转到第:<input type="text" id="gotoPage" name="page" size="8"/> 页 <input type="button" onclick="gotoPage();" value="GO" name="cndok" <s:if test="%{pageCount==1}"> disabled="true" </s:if>/>
</div>
<jsp:include page="../copyright.jsp"></jsp:include>
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
