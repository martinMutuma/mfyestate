<%@ page language="java" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<%
			String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
		%>

		<title>修改项目需求</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" href="<%=basePath%>/resource/css/global.css"
			type="text/css"></link>
			<link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/default/easyui.css"></link>
		<script type="text/javascript" src="../resource/js/jquery-1.4.2.js"></script>
		<script type="text/javascript" src="../resource/js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="../resource/js/global.js"></script>
		 <script type="text/javascript" src="../resource/js/kindeditor/kindeditor.js"></script>
	    <link rel="stylesheet" type="text/css" href="../resource/js/kindeditor/skins/default.css"></link>
		<script type="text/javascript"
		 src="<%=basePath%>pro/modifyprodemand.js"></script>
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
									<form name="form" method="post"
										action="../officeneed/addNeed.shtml"
										onsubmit="return  checkmodify()">
									 <div class="position" align="left" style="width:80%"><label>您所在的位置：</label><a href="../home.shtml">梦房园</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="../mem/baseinfo_mainPage.shtml">会员中心</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="../pro/manageprodemand.jsp?menuCls=15">大型项目需求管理</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;大型项目信息修改</div>
                                      <div class="info_top"></div><div class="info_mid">	
										<table width="100%" border="0" cellpadding="1" cellspacing="1">
											<tr>
												<td align="center" colspan="2">
													<b>修改大项目需求信息 （<font color="red">*</font> 为必填项）</b>
												</td>
											</tr>

											<tr>
												<td align="right" width="16%">
														<font color="red">*</font>交易方式:
 												</td>
												<td align="left">
														<select name="need.flag">
															<option value="2" selected="selected">
																求购
															</option>
															<option value="1">
																求租
															</option>
															<option value="3">
																合作
															</option>
														</select>
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>省/市/区县:
												</td>
												<td align="left">
													<input value="${need.disname}" id="showdistrict" style="width: 150px;"/>
													<input type="hidden" name="need.disname" id="disname" value="${need.disname}"/>
										            <input type="hidden" name="need.district" id="district" value="${need.district}"/>
													
												</td>
											</tr>
											<tr>
												<td align="right">
														地址:
												</td>
												<td align="left">
														<input type="text" size="30" id="address" name="need.address"
															value="${need.address}" />
														临近
														<input name="need.nearAddress" id="nearAddress" value="${need.nearAddress}"
															type="text" size="30" />
												</td>
											</tr>
											<tr>
												<td align="right">
													<font color="red">*</font>	年租金:
												</td>
												<td align="left">
														<input type="text" name="need.minPrice" id="minPrice"
															onkeyup="isNum(this)" value="${need.minPrice}" size="10" />
														-
														<input name="need.maxPrice" onkeyup="isNum(this)"
															id="maxPrice" value="${need.maxPrice}" type="text"
															size="10" />
														万元/年
												</td>
											</tr>
											<tr>
												<td align="right" > 
														<font color="red">*</font>需求标题:
												</td>
												<td align="left">
														<input type="text" name="need.title" id="title"
															value="${need.title}" size="40">
												</td>
											</tr>
											<tr>
												<td align="right">
														需求描述:
												</td>
												<td align="left">
														<textarea cols="60" rows="20" id="content"  name="need.descr">
                      ${need.descr}
                  </textarea>
												</td>
											</tr>

											<tr>
												<td colspan="2" align="center">
													<input type="hidden" name="need.needType" value="4">
													<!-- 大型项目 -->
													<input type="hidden" name="id" value="${need.id}">
													<input type="hidden" name="need.auditing" value="${need.auditing}">
													<input type="hidden"  name="type"  value="4"/>
													<input type="submit" value="提交审核">
												</td>
											</tr>
										</table>
										          	</div>
					<div class="info_bottom">&nbsp;</div>
									</form>
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
			
				
			  			 $("#showdistrict").combotree({
    url:'',
    animate:false,
    onShowPanel:function(){
    	var dataUrl = '<%=basePath%>district/bulidDistrictTree.shtml?level=5&districtCode=0000000000&t='+(new Date()).getTime().toString(36);
    	if($("#showdistrict").combotree("options").url==""){
    		$.messager.show({
	   			showType:null,
	   			showSpeed:1000,
	   			width:150,
	   			height:70,
	   			msg:'地区信息加载中... ...',
	   			title:'提示',
	   			timeout:2000
	   		});
    		$("#showdistrict").combotree("options").url=dataUrl;
	    	$.get(dataUrl,function(data){
				var json = "";
				try{
					json = eval('('+data+')');
				}catch(e){
					json = data;
				}
				$("#showdistrict").combotree("loadData",json);
	    	})
    	}
    },
   	onLoadSuccess:function(){
   	if($("#showdistrict").combotree("options").url!="")
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
   		$("#disname").val(node.text);
   	    $("#district").val(node.id);
   	}
});		
				
	
		
		</script>
</html>
