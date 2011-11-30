<%@ page language="java"  pageEncoding="utf-8" import="com.estate.domain.pro.Shop" contentType="text/html; charset=utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    <title>修改商铺图片信息</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
	    <link rel="stylesheet" href="../resource/css/global.css" type="text/css"></link>
		<!-- 1.css -->
		<link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/default/easyui.css"></link>
		<script type="text/javascript" src="../resource/js/jquery-1.4.2.js"></script>
	    <script type="text/javascript" src="../resource/js/jquery.dataGridTip.js"></script>
	    <!-- 2.js -->
	    <script type="text/javascript" src="../resource/js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="../resource/js/global.js"></script>
	
		<script type="text/javascript">
		     function  addpic(){
		          window.location.href="../pro/addshoppic.jsp";
		     }
		     function  deletePic(id,name,url,type){
		       window.location.href="../shop/delPic.shtml?id="+id+"&name="+name+"&url="+url+"&type="+type;
		     }
		</script>   
		   <script type="text/javascript" src="../resource/js/whole.js"></script>
	    <link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>
	    <link rel="stylesheet" href="../resource/css/memberCenter/info.css" type="text/css"></link>	
	</head>

	<body>
	<jsp:include page="../head.jsp"></jsp:include>
		<div style="width: 100%; margin-top: 10px;" align="center">
		<table width="100%" class="layoutTab">
			<tr>
				<td width="20%" align="left" valign="top"><jsp:include page="../left.jsp"></jsp:include></td>
				<td valign="top">
				 <div class="position" align="left" style="width:80%"><label>您所在的位置：</label><a href="../home.shtml">梦房园</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="../mem/baseinfo_mainPage.shtml">会员中心</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;商铺管理&nbsp;&nbsp;&gt;&nbsp;&nbsp;图片修改</div>
                    <div class="info_top"></div><div class="info_mid" style= "text-align   :center ">	
                    <div style="margin-left: 40px;margin-bottom: 10px;margin-top: 10px;float:left"> 
								  商铺案源名称:${sp.title}     &nbsp;  &nbsp; &nbsp; &nbsp;   <input type="button" value="新增图片" onclick="addpic()"/>
				    </div>
					  <div style="margin-left: 30px;clear:both;">
					   <table  cellpadding="2"  border="0" bgcolor="#CCCCCC" cellspacing="1" width="90%">
						<tr align="center"><td  bgcolor="#F4F8FB"> 缩略图片 </td>  <td  bgcolor="#F4F8FB">图片名称  </td> <td  bgcolor="#F4F8FB">操作 </td></tr>	
					   <%
					          Shop shop=(Shop)session.getAttribute("sp");
					          if(null!=shop.getImgUrl1()){
					    %>
					   	<tr align="center" ><td  bgcolor="#FFFFFF"><img height="50"  width="50" src="../imageFloder/${sp.imgUrl1}"></td><td  bgcolor="#FFFFFF">${sp.imgName1}</td><td  bgcolor="#FFFFFF"><input type="button" value="删  除"  onclick="deletePic(${sp.id},'imgUrl1','${sp.imgUrl1}',${sp.flag})"></td></tr>
					   	<% } %>
					   	<%
					   	    if(null!=shop.getImgUrl2()){
					   	 %>
					   	 	<tr align="center" ><td  bgcolor="#FFFFFF"><img height="50"  width="50" src="../imageFloder/${sp.imgUrl2}"></td><td  bgcolor="#FFFFFF">${sp.imgName2}</td><td  bgcolor="#FFFFFF"><input type="button" value="删  除"  onclick="deletePic(${sp.id},'imgUrl2','${sp.imgUrl2}',${sp.flag})"></td></tr>
					   	 <%
					   	    }
					   	  %>
					   	 	<%
					   	    if(null!=shop.getImgUrl3()){
					   	 %>
					   	 	<tr align="center" ><td  bgcolor="#FFFFFF"><img height="50"  width="50" src="../imageFloder/${sp.imgUrl3}"></td><td  bgcolor="#FFFFFF">${sp.imgName3}</td><td  bgcolor="#FFFFFF"><input type="button" value="删  除"  onclick="deletePic(${sp.id},'imgUrl3','${sp.imgUrl3}',${sp.flag})"></td></tr>
					   	 <%
					   	    }
					   	  %> 
					   	 	<%
					   	    if(null!=shop.getImgUrl4()){
					   	 %>
					   	 	<tr align="center" ><td  bgcolor="#FFFFFF"><img height="50"  width="50" src="../imageFloder/${sp.imgUrl4}"></td><td  bgcolor="#FFFFFF">${sp.imgName4}</td><td  bgcolor="#FFFFFF"><input type="button" value="删  除"  onclick="deletePic(${sp.id},'imgUrl4','${sp.imgUrl4}',${sp.flag})"></td></tr>
					   	 <%
					   	    }
					   	  %> 
					   	 	<%
					   	    if(null!=shop.getImgUrl5()){
					   	 %>
					   	 	<tr align="center" ><td  bgcolor="#FFFFFF"><img height="50"  width="50" src="../imageFloder/${sp.imgUrl5}"></td><td  bgcolor="#FFFFFF">${sp.imgName5}</td><td  bgcolor="#FFFFFF"><input type="button" value="删  除"  onclick="deletePic(${sp.id},'imgUrl5','${sp.imgUrl5}',${sp.flag})"></td></tr>
					   	 <%
					   	    }
					   	  %>
	</table>
					   	</div>
					   	</div>
					   <div class="info_bottom">&nbsp;</div>
				    </td>
				    </tr>
					</table>
		</div>
							<div style="margin-top: 10px;">
			<center>
				<jsp:include page="../copyright.jsp" />
			</center>
		</div>
	</body>
</html>

