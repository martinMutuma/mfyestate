<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=basePath %>resource/css/whole.css" type="text/css"></link>
	<link rel="stylesheet" type="text/css" href="<%=basePath %>resource/css/specials.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>resource/css/common.css">
	<script type="text/javascript" src="<%=basePath %>resource/js/jquery-1.4.2.js" charset="utf-8"></script>
	<script type="text/javascript" src="<%=basePath %>resource/js/whole.js"></script>
	<script type="text/javascript" src="<%=basePath %>resource/js/special.js"></script>
  </head>

  <body>
  	<jsp:include page="head.jsp"/>
   	<div style="width: 100%;margin-top: 15px;" align="center">
   		<div class="whole_width">
   			<!--位置-->
    <div class="cusjo_wz">
    	<div class="left tuanwz c66 all666">您当前的位置：<a href="#">梦房园</a> > <a href="#">新盘团购</a></div>
    </div>

    <!--位置-->
    <div class="w960" style="border: 0px black solid;">
    	<div class="new-appli" style="float: left;border: 0px red solid;width: 700">
        	<div class="custo-mers">
            	
                <div class="cus-form">
                	<div class="form-top"></div>
                    <div class="form-cen">
                    	 恭喜您，成功参团
                    </div>
                    <div class="form-bottom"></div>
                </div>
            </div>
        </div>
        <div style="float: right;border: 0px green solid;width: 225">
			
           
        </div>
        <div class="clear"></div>
    </div>
   		</div>
   	 <jsp:include page="copyright.jsp"></jsp:include>
   	</div>
  </body>
</html>
