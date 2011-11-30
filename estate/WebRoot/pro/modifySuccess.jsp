<%@ page language="java"  pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>修改成功</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<% 
	  String url= (String)request.getAttribute("url");
	  String  urlall=basePath+"pro/"+url;
	 %>
	<meta http-equiv= "Refresh" content= '5;url=<%=urlall %>'>
	<meta http-equiv="description" content="This is my page">
  <link rel="stylesheet" href="../resource/css/global.css"
			type="text/css"></link>
	    <link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/default/easyui.css"></link>
	    <script type="text/javascript" src="../resource/js/jquery-1.4.2.js"></script>
	     <script type="text/javascript" src="../resource/js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="../resource/js/global.js"></script>
		  <script type="text/javascript" src="../resource/js/whole.js"></script>
	    <link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>
	    <script>
	        var times=6;
            clock();
            function clock()
             {
               window.setTimeout('clock()',1000);
               times=times-1;
               var time=document.getElementById("time");
               time.innerHTML =times ;
             }


	        
	    </script>
	</head>

	<body>
		<div style="width: 100%; height: 100%;" align="center">
			<table width="100%" class="layoutTab">
				<tr>
					<td colspan="2" align="center">
						<jsp:include page="../head.jsp"></jsp:include>
					</td>
				</tr>
				<tr>
	    		<td colspan="2" height="10px">
	    			&nbsp;
	    		</td>
	    	</tr>
				<tr>
					<td width="20%" align="left" valign="top"><jsp:include page="../left.jsp"></jsp:include></td>
					<td valign="top">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td valign="top" align="left">
									<form name="form" method="post" >

										<table width="100%" border="0" cellpadding="1" cellspacing="1">
											<tr>
												<td colspan="2">
													<div align="center">
													   <span style="display:inline;color:red" id= "time"> 5 </span>秒后跳转管理页面
                                                       <a href="../mem/baseinfo_mainPage.shtml"> 返回</a>
													</div>
												</td>
											</tr>


										</table>
									</form>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
	</body>
  
  
    
  
</html>
