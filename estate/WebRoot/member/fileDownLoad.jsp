<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>下载中心</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 1.css添加 -->
	<link rel="stylesheet" href="../resource/css/global.css" type="text/css"></link>
    <link rel="stylesheet" type="text/css" href="css/thickbox.css"/>
    <link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/default/easyui.css"></link>
	<link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/icon.css"></link>
    <script type="text/javascript" src="../resource/js/jquery-1.4.2.js" charset="utf-8"></script>
	<script type="text/javascript" src="thickbox_plus.js"></script>
	<script type="text/javascript" src="../resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../resource/js/global.js"></script>
	<script type="text/javascript" src="<%=basePath%>member/register.js" charset="utf-8"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
      <script type="text/javascript" src="../resource/js/whole.js"></script>
	    <link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>
  </head>
  <style type="text/css">
  .leftNav li {
	padding-left: 15px;
	padding-top: 5px;
	background: #E0ECFF;
	border-bottom: 1px solid #99BBE8;
	line-height: 30px;
	list-style-type:none;
	margin-left: 0px;
	}
	.leftNav li a{color:#333;text-decoration:none;}
	.leftNav li.title{background: #f3f3f3;}
	#rightbox {
	float: left;
	height: auto;
	width: 750px;
	overflow:hidden;
	}
	#rightbox a{color:#333; text-decoration:none;}
	#rightbox2{
	float: left;
	height: auto;
	width: 750px;
	}
	.tdB {
		border-bottom:1px solid #CAD9EA;
	}
	
	.tdL {
		border-left:1px solid #CAD9EA;
	}
	
	.tdR {
		border-right:1px solid #CAD9EA;
	}
	
	.tdT {
		border-top:1px solid #CAD9EA;
	}
	.bg_over {background-color: #C1CCDB;}
	.bg_out {
		border-bottom:solid 1px #333;/* 列表背景鼠标离开变色，取父级对象颜色 */
	}
  </style>
  <body>
  	  	 <jsp:include page="../head.jsp"></jsp:include>
		<div style="width: 100%; margin-top: 10px;" align="center">
  <!-- 3.添加class="layoutTab"  -->
    <table class="layoutTab" style="border: 0px red solid;">
    	<tr>
    	<td width="20%" align="left" valign="top"><jsp:include page="../left.jsp"></jsp:include></td>
    		<td valign="top">
				<form id="webSearchFile" onsubmit="return true;" action="/col/webSearchFile.kemp" method="post">
                                 <div class="searchhead"></div>
													<div class="searchcenter h25">
														<div align="left" style="width:735px;float: left">														<div class="searchline">
														<img src="../resource/images/searchline.gif" align="middle"/>				 
				  文件类型:<select name="fileType" id="fileType">
				       <option value="0">全部</option>
				       <option value="1">培训材料</option>
				   	   <option value="2">合同文本</option>
				       <option value="3">研究报告</option>
				       </select> 
				     <img src="../resource/images/searchline.gif" align="middle"/>	
				    <a href="#" id="btn" onclick="onSearch();"></a>
				   </div>
					</div>
				<div style="clear: both;"></div>
				</div>
				<div class="searchfloot" ></div>
				    <table width="100%" border="0" cellspacing="1" cellpadding="1" style="margin-top: 10px;"  bgcolor="#CCCCCC" >
				      <tr height="30" align="center" background="images/ttbg_g_3.jpg" >
				        <td bgcolor="#F4F8FB" class="tdB" width="38%">文件名称</td>
				        <td bgcolor="#F4F8FB" class="tdB" width="20%" >费用</td>
				        <td bgcolor="#F4F8FB" class="tdB" width="20%" >操作</td>
				      </tr>
					<s:iterator value="filelist">
				      <tr onmouseover="this.className='bg_over'" onmouseout="this.className='bg_out'">
				        <td bgcolor="#ffffff" align="center"  height="30"><s:property value="fileName"/></td>
				        <td bgcolor="#ffffff" align="center"><s:property value="integral"/> 金币</td>
				        <td bgcolor="#ffffff" align="center"><img src="<%=basePath%>member/images/download.gif" width="12" height="12" align="absmiddle" />
				        <a href="javascript:dfile('<s:property value="integral"/>','<s:property value="id"/>')">点击下载</a></td>
				      </tr>
					</s:iterator>
				    </table>   
		   	 	</form>
			
    		</td>
    	</tr>
    </table>
  </div>
    							<div style="margin-top: 10px;">
			<center>
			      <input name="menuCls" type="hidden" id="menuCls" value="${menuCls}"/>
				<jsp:include page="../copyright.jsp" />
			</center>
		</div>
  </body>
  <script type="text/javascript">
  function onSearch(){
  	window.location.href='<%=basePath%>message/message_fileDownLoad.shtml?type='+$("#fileType").val();
  }
  $('#btn').linkbutton({
   			id:'ad',
   			disabled:false,
   			plain: false,
   			text:'<font color=black>搜索</font>',
   			iconCls:''
   		});
   function dfile(coin,fileid){
	      if(confirm("您当前有<s:property value='tb.integral'/>金币，本次下载将消费"+coin+"金币，点确定后请保存下载文件")){
	         location.href="<%=basePath%>message/message_downloadFile.shtml?id="+fileid;
	      }else{
	         return void(0);
	      }
   }
   document.all("fileType").value='${fileType}';
  </script>
</html>
