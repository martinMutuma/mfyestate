<%@ page language="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    <title>修改图片信息</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
	    <link rel="stylesheet" href="../resource/css/global.css" type="text/css"></link>
		<!-- 1.css -->
		<link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/default/easyui.css"></link>
		<script type="text/javascript" src="../resource/js/jquery-1.4.2.js"></script>
	    <!-- 2.js -->
	    <script type="text/javascript" src="../resource/js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="../resource/js/global.js"></script>
		  <script type="text/javascript" src="../resource/js/whole.js"></script>
	    <link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>
	    <link rel="stylesheet" href="../resource/css/memberCenter/info.css" type="text/css"></link>	
		<script type="text/javascript" src="addpropic.js"></script>
		<script type="text/javascript">
		    function  goback(){
		        window.location.href="<%=basePath%>largePro/getPic.shtml?id=${pro.id}";
		    }
		</script>
	</head>

	<body>
	 <jsp:include page="../head.jsp"></jsp:include>
		<div style="width: 100%; margin-top: 10px;" align="center">
		<table width="100%" class="layoutTab">
			<tr>
				<td width="20%" align="left" valign="top"><jsp:include page="../left.jsp"></jsp:include></td>
				<td valign="top">
				    <form name="form" method="post"  action="../building/modifyUpload.shtml" 	 enctype="multipart/form-data" >
					<div class="position" align="left" style="width:80%"><label>您所在的位置：</label><a href="../home.shtml">梦房园</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="../mem/baseinfo_mainPage.shtml">会员中心</a>&nbsp;&nbsp;&gt;<a href="../pro/managerbuid.jsp?menuCls=11">楼盘管理</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;图片修改</div>
                    <div class="info_top"></div>
                    <div class="info_mid" style= "text-align   :center ">	
                   	
				     <div style="margin-left: 30px;clear:both;">
				       <input type="hidden"  name="modifpic" value="1"/>
					  <table  cellpadding="1"  border="0"  cellspacing="1" width="710px;" id="buildingrent" >
					                    
					                      <s:iterator value="#imagelist"   id="img">
					                          <s:if test="#img.imgUrl!=null">
					                           <tr>
					                              <td>
					                              已传图片： <img src="../${img.imgUrl}" width="80" height="80"/><br>
					                                <div align="center">

														&nbsp;&nbsp;图片名称:


                                                         
                                                         <input type="hidden" name="imageid"  value="${tpImage.id}"/>
                                                         <input type="hidden"  name="pid" value="${tpImage.pid}"/>
														<input type="text" name="tpImage.imgName" value="${img.imgName}" id="imgName1" />

														<select name="tpImage.category" value="${img.category}">
															<option value="1">
																效果图
															</option>
															<option value="2">
																实景图
															</option>
															<option value="3">
																周边配套
															</option>
															<option value="4">
																样板间
															</option>
															<option value="5">
																户型
															</option>
															<option value="6">
																其他
															</option>
														</select>

														<select name="tpImage.imgType" value="${img.imgType}">
															<option value="0">
																一居
															</option>
															<option value="1">
																二居
															</option>
															<option value="2">
																三居
															</option>
														</select>

														<input type="file" name="img" />
													</div>
					                              </td>
					                           </tr>
					                           </s:if>

					                      </s:iterator>
					                       <s:if test="#imagelist.size==0">
					                         <tr>
					                            <th>
					                             暂无图片,请上传
					                            </th>
					                         </tr>
					                          <tr>
												<td colspan="2">
													<div align="right">
                                                         <input type="hidden" name="pid" value="${pid}" />
												    	&nbsp;&nbsp;图片名称:
														<input type="text" name="imgName" id="imgName" />
														<select name="category">
															<option value="1">
																效果图
															</option>
															<option value="2">
																实景图
															</option>
															<option value="3">
																周边配套
															</option>
															<option value="4">
																样板间
															</option>
															<option value="5">
																户型
															</option>
															<option value="6">
																其他
															</option>
														</select>

														<select name="imgType">
															<option value="0">
																一居
															</option>
															<option value="1">
																二居
															</option>
															<option value="2">
																三居
															</option>
														</select>

														<input type="file" name="img" />
														<input type="button" value="继续添加" onclick="addPic()" />
													</div>
													
												</td>
											</tr>
											<tr>
											<td colspan="2" align="center" id="picdiv" style="display:none">
											  
											</td>
											</tr>
					                          
					                       </s:if>
									       
											<tr>
												<td colspan="4" align="center">
													<input type="submit" value="保 存"/>&nbsp;&nbsp;
													<input type="reset"  value="重  置"/>&nbsp;&nbsp;
												</td>
											</tr>
					</table>
					
					</div>
					</form>
				
					 <div class="info_bottom">&nbsp;</div>
				
				</td>
			</tr>
		</table>
		<script type="text/javascript">
		   $("#buildingrent td").addClass("info_td1");
		 $("#buildingrent tr").find("td:even").addClass("title_info2");
		 $("#buildingrent tr").find("td:odd").css("padding-left","5px");
		 function  addPic(){
        $("#picdiv").show();
               var  pic='图片名称:<input type="text" name="imgName" id="imgName" />&nbsp;<select name="category"><option value="1">效果图</option><option value="2">实景图</option><option value="3">周边配套</option><option value="4">样板间</option><option value="5">户型</option><option value="6">其他</option></select> &nbsp;<select name="imgType"><option value="0">一居</option><option value="1">二居</option><option value="2">三居</option></select> <input type="file" id="img" name="img" /><br>';
          $("#picdiv").append(pic);

   
   
      }
		</script>
		</div>
							<div style="margin-top: 10px;">
			<center>
				<jsp:include page="../copyright.jsp" />
			</center>
		</div>		
	</body>
</html>
				