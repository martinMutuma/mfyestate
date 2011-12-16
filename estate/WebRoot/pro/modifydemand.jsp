<%@ page language="java" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>写字楼需求修改</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" href="../resource/css/global.css"
			type="text/css"></link>
	     <link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/default/easyui.css"></link>
		<script type="text/javascript" src="<%=basePath%>/resource/js/jquery-1.4.2.js"></script>
			
	     <script type="text/javascript" src="<%=basePath%>/resource/js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="../resource/js/global.js"></script>
	      <script type="text/javascript" src="../resource/js/whole.js"></script>
	    <link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>s
		<script type="text/javascript" src="<%=basePath%>pro/modifydemand.js"></script>
		<script type="text/javascript" src="../resource/js/kindeditor/kindeditor.js"></script>
		<link rel="stylesheet" type="text/css" href="../resource/js/kindeditor/skins/default.css"></link>
		<link rel="stylesheet" href="../resource/css/memberCenter/info.css" type="text/css"></link> 
	</head>

	<body>
		 <jsp:include page="../head.jsp"></jsp:include>
      <div style="width: 100%;margin-top: 10px;" align="center">
			<table width="100%" class="layoutTab">
				<tr>
					<td width="20%" align="left" valign="top"><jsp:include page="../left.jsp"></jsp:include></td>
					<td valign="top">
									<form name="form" method="post"
										action="../officeneed/addNeed.shtml"
										onsubmit="return checkmodify()">
					 <div class="position" align="left"><label>您所在的位置：</label><a href="../home.shtml">梦房园</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="../mem/baseinfo_mainPage.shtml">会员中心</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="../pro/managerequirements.jsp?menuCls=11">写字楼需求管理</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;修改需求</div>
					<div class="info_top"></div>
					<div class="info_mid">
										<table width="100%" border="0" cellpadding="1" cellspacing="1">
											<tr>
												<td align="center" colspan="2">
													<b>修改写字楼需求信息 （<font color="red">*</font> 为必填项）</b>
												</td>
											</tr>

											<tr>
												<td align="right" width="16%">
														<font color="red">*</font>租售:
 												</td>
												<td align="left">
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
												<td align="left">
												        <input   value="${need.disname}" id="showdistrict" style="width: 150px;"/>
														<input id="district" type="hidden" name="need.district"   style="width: 150px;" ></input>
														<input type="hidden" name="need.disname" id="disname"/>
														
												</td>
											</tr>
											<tr>
												<td align="right">
														地址:
												</td>
												<td align="left">
														<input type="text" name="need.address" size="30"
															value="${need.address}" />
														临近
														<input name="need.nearAddress" value="${need.nearAddress}"
															type="text" size="30" />
												</td>
											</tr>
											<tr>
												<td align="right">
														建筑面积:
												</td>
												<td align="left">
														<input type="text" size="10" name="need.minArea"
															id="minArea" value="${need.minArea}" />
														-
														<input type="text" id="maxArea" name="need.maxArea"
															value="${need.maxArea}" size="10" />
														㎡
												</td>
											</tr>
											<tr>
												<td align="right">
														年租金:
												</td>
												<td align="left">
														<input type="text" size="10" name="need.minPrice"
															id="minPrice" value="${need.minPrice}" />
														-
														<input type="text" name="need.maxPrice"
															value="${need.maxPrice}" id="maxPrice" size="10" />
														万元/年
												</td>
											</tr>
											<tr>
												<td align="right">
														<font color="red">*</font>需求标题:
												</td>
												<td align="left">
														<input type="text" name="need.title" id="title" size="40"
															value="${need.title}">
												</td>
											</tr>
											<tr>
												<td align="right">
														需求描述：
												</td>
												<td align="left">
														<textarea cols="60" rows="20" id="content"  name="need.descr">
                      ${need.descr}
                  </textarea>
												</td>
											</tr>

											<tr>
												<td colspan="2" align="center">
													<input type="hidden" name="need.needType" value="1">
													<input type="hidden" name="id" value="${need.id}">
													<input type="hidden" name="need.auditing" value="0">
													<!-- 审核状态 未审核 -->

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
			<script language="javascript">
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
   		$("#disname").val(node.text)
   		$("#district").val(node.id);  

   	}
 })
		      
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
			
				
		
		
		</script>
	</body>
</html>
