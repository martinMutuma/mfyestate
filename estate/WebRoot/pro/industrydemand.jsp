<%@ page language="java" pageEncoding="utf-8"%>
<%@taglib uri="estateTag" prefix="estateTag" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>发布工业地产需求</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" href="../resource/css/global.css"
			type="text/css"></link>
		<link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/default/easyui.css"></link>
		<script type="text/javascript" src="industrydemand.js"></script>
		<script type="text/javascript" src="../resource/js/jquery-1.4.2.js"></script>
		 <script type="text/javascript" src="../resource/js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="../resource/js/global.js"></script>
		<script type="text/javascript" src="../resource/js/kindeditor/kindeditor.js"></script>
	    <link rel="stylesheet" type="text/css" href="../resource/js/kindeditor/skins/default.css"></link>
	      <script type="text/javascript" src="../resource/js/whole.js"></script>
	    <link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>
	    <link rel="stylesheet" href="../resource/css/memberCenter/info.css" type="text/css"></link>
	</head>

	<body>
	 <jsp:include page="../head.jsp"></jsp:include>
			<div style="width: 100%;margin-top: 10px;" align="center">
			<table width="100%" class="layoutTab">
				<tr>
					<td width="20%" align="left" valign="top"><jsp:include page="../left.jsp"></jsp:include></td>
					<td valign="top">
					           <div class="position" align="left"><label>您所在的位置：</label><a href="../home.shtml">梦房园</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="../mem/baseinfo_mainPage.shtml">会员中心</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="manageindustrydemand.jsp?menuCls=14">工业地产需求管理</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="industrydemand.jsp">发布需求</a></div>
					<div class="info_top"></div>
									      <table border="0" cellpadding="0" cellspacing="0" width="760px">
					                	<tr>
							             <td valign="top" align="center" >
									<form name="form" method="post"
										action="../officeneed/addNeed.shtml"
										onsubmit="return checkneed()">
				
					<div class="info_mid">
										<table width="710px;" border="0" cellpadding="1" cellspacing="1" id="buildingrent">
											<tr>
												<th align="center" colspan="2">
													<b>发布工业地产需求信息 </b>
												</th>
											</tr>
                                            <tr>
												<th align="left" colspan="2" class="title_info1">
													一、填写基本信息（<font color="red">*</font> 为必填项）
												</th>
											</tr>
											<tr>
												<td width="20%" align="right">
														<font color="red">*</font>租售:
												</td>
												<td>
														<select name="need.flag">
															<option ${need.flag eq 2?'selected' :''} value="2">
																求购
															</option>
															<option value="1" ${need.flag eq 1?'selected' :''}>
																求租
															</option>
														</select>
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>省/市/区县:
												</td>
												<td>
														<input id="district" name="need.district"  style="width: 150px;" ></input>
														<input type="hidden" name="need.disname" id="disname"/>
												</td>
											</tr>
											<tr>
												<td align="right">
													<font color="red">*</font>	建筑面积:
												</td>
												<td>
														<input type="text" size="8" name="need.minArea"
															id="minArea" maxLength="7" onKeyUp="isNum(this)" />
														&nbsp;-&nbsp;
														<input type="text" id="maxArea" name="need.maxArea"
															onKeyUp="isNum(this)" maxLength="7" size="8" />
														㎡
												</td>
											</tr>
											<tr>
												<td align="right">
													<font color="red">*</font>	年租金:
												</td>
												<td>
														<input type="text" size="8" name="need.minPrice"
															id="minPrice" maxLength="5" onKeyUp="isNum(this)" />
														&nbsp;-&nbsp;
														<input type="text" maxLength="5" name="need.maxPrice" id="maxPrice"
															onKeyUp="isNum(this)" size="8" />
														万元/年
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>需求标题:
												</td>
												<td>
														<input type="text" maxLength="40"  name="need.title" id="title" size="40"
															value="${need.title}">
												</td>
											</tr>
											<tr>
											<th align="left" colspan="2" class="title_info1" valign="bottom">
													二、填写楼盘详细信息
												</th>
												</tr>
											<tr>
												<td>
													<div align="right">
														适合行业:
													</div>
												</td>
												<td>
																<div align="left">
																	<estateTag:select cssStyle="width:120px"  name="industry.category" id="category" codeType="工业种类" value="1" />
																</div>
												</td>
											</tr>
											<tr>
												<td align="right">
														地址:
												</td>
												<td>
														<input type="text" name="need.address"
															value="${need.address}" maxLength="40" id="address" size="35" />
														&nbsp;临近&nbsp;
														<input name="need.nearAddress" maxLength="40" id="nearAddress"  value="${need.nearAddress}"
															type="text" size="35" />
												</td>
											</tr>
											
											<tr>
												<td align="right">
														需求描述：
												</td>
												<td id="filter_ke">
														<textarea cols="60" rows="15" name="need.descr" id="content">
                      ${need.descr}
                  </textarea>
												</td>
											</tr>
											<tr>
												<td colspan="2" align="center">
												   <input type="hidden" name="need.needType" value="3">
																<!--  工业地产需求 -->
													<input type="hidden" name="id" value="${need.id}">
													<input type="hidden" name="need.auditing" value="${need.auditing}"/>
													<!-- 审核状态 未审核 -->

													<input type="submit" value="提交审核">
												</td>
												</tr>
										</table>
									</form>
								</td>
						</tr>
					</table>
										
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
		  <script language="javascript">
 $("#district").combotree({
    url:'',
    animate:false,
    onShowPanel:function(){
    	var dataUrl = '<%=basePath%>district/bulidDistrictTree.shtml?level=5&districtCode=0000000000&t='+(new Date()).getTime().toString(36);
    	if($("#district").combotree("options").url==""){
    		$.messager.show({
	   			showType:null,
	   			showSpeed:1000,
	   			width:150,
	   			height:70,
	   			msg:'地区信息加载中... ...',
	   			title:'提示',
	   			timeout:2000
	   		});
    		$("#district").combotree("options").url=dataUrl;
	    	$.get(dataUrl,function(data){
				var json = "";
				try{
					json = eval('('+data+')');
				}catch(e){
					json = data;
				}
				$("#district").combotree("loadData",json);
	    	})
    	}
    },
   	onLoadSuccess:function(){
   	if($("#district").combotree("options").url!="")
   		$.messager.show({
   			showType:'slide',
   			showSpeed:1000,
   			width:150,
   			height:70,
   			msg:'地区信息加载完成',
   			title:'提示',
   			timeout:3000
   		})
   	},
   		onClick:function(node){
   		$("#disname").val(node.text)
   	   
   	}
});
		      
		</script> 
		<script>
			KE.show({
				id : 'content',
				loadStyleMode : false,
				resizeMode : 0,
			    allowUpload:true, //允许上传图片 
				imageUploadJson:'<%=basePath%>/comutil/upload.shtml',    
				items : [
				'fontname', 'fontsize', '|', 'textcolor', 'bgcolor', 'bold', 'italic', 'underline',
				'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
				'insertunorderedlist', '|','image']
			});
			 $("#buildingrent td").not($("#filter_ke td")).addClass("info_td1");
		$("#buildingrent tr").find("td:even").not($("#filter_ke td")).addClass("title_info2");
		$("#buildingrent tr").find("td:odd").not($("#filter_ke td")).css("padding-left","5px");    
		</script>					
	</body>
</html>

