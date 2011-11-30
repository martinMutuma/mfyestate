<%@ page language="java" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>生意转让管理</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" href="../resource/css/global.css" type="text/css"></link>
		<link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/icon.css">
		<script type="text/javascript" src="../resource/js/jquery-1.4.2.js"></script>
		<script type="text/javascript" src="../resource/js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="manageMessage.js"></script>
		<script type="text/javascript" src="../resource/js/global.js"></script>
		<script type="text/javascript"	src="../resource/js/easyui-lang-zh_CN.js"></script>
        <script type="text/javascript" src="../resource/js/whole.js"></script>
	    <link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>
	</head>

	<body>
	<jsp:include page="../head.jsp"></jsp:include>
		<div style="width: 100%;margin-top: 10px;" align="center">
			<table width="100%" class="layoutTab">
				<tr>
					<td width="20%" align="left" valign="top"><jsp:include page="../left.jsp?selectItem=3"></jsp:include></td>
					<td valign="top">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td valign="top" align="left">
									<form name="form" method="post">
										<table width="100%" border="0" cellpadding="1" cellspacing="1">
											<tr>
												<td>
												 <div  class="searchhead" ></div>
												     <div  class="searchcenter h25" >
													<div align="left"  style="width:735px;float: left">
														<div class="searchline">
														<img src="../resource/images/searchline.gif" align="middle"/>
														地区：<select id="discode" name="discode"  style="width: 150px;"></select>
														<img src="../resource/images/searchline.gif" align="middle"/>
														状态：
														<select name="auditingState" id="auditingState">
															<option value="-1">
																全部
															</option>
															<option value="0">
																未审核
															</option>
															<option value="1">
																已审核
															</option>
															<option value="4">
																申请成交
															</option>
															<option value="3">
																审核驳回
															</option>
															<option value="5">
																成交通过
															</option>
															<option value="7">
																成交驳回
															</option>
														</select>
														<img src="../resource/images/searchline.gif" align="middle"/>
														转让价格：														
														<select name="price1" id="price1">
															<option value="-1">
																
															</option>
															<option value="5">
																5
															</option>
															<option value="20">
																20
															</option>
															<option value="50">
																50
															</option>
															<option value="100">
																100
															</option>
															<option value="200">
																200
															</option>
															<option value="500">
																500
															</option>
														</select>
														至
														<select name="price2" id="price2">
															<option value="-1">
																
															</option>
															<option value="5">
																5
															</option>
															<option value="20">
																20
															</option>
															<option value="50">
																50
															</option>
															<option value="100">
																100
															</option>
															<option value="200">
																200
															</option>
															<option value="500">
																500
															</option>
														</select>
														万元
														<img src="../resource/images/searchline.gif" align="middle"/>
														</div>
														<div class="searchline">
														<img src="../resource/images/searchline.gif" align="middle"/>
														案源名称：
														<input type="text" name="name" id="name" size="18" />
														<img src="../resource/images/searchline.gif" align="middle"/>
														行业：
														<select id="category">
															<option value="-1">
																全部
															</option>
															<option value="1">
																餐饮美食
															</option>
															<option value="2">
																娱乐休闲
															</option>
															<option value="3">
																百货零售
															</option>
															<option value="4">
																公司工厂
															</option>
															<option value="5">
																其它服务业
															</option>
														</select>
														<img src="../resource/images/searchline.gif" align="middle"/>
														 <a id="searchid" href="javascript:onSearch()"></a>
													    <img src="../resource/images/searchline.gif" align="middle"/>
														</div>
														</div>
													 <div style="clear:both;"></div>
													</div>
													 <div  class="searchfloot" ></div>
												</td>
											</tr>
											<tr>
												<td valign="top">
													<table id="messagegrid">
													</table>
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
	<div style="margin-top: 10px;">
			<center>
				<jsp:include page="../copyright.jsp" />
			</center>
		</div>		
		   <script language="javascript">
 $("#discode").combotree({
    url:'',
    animate:false,
    onShowPanel:function(){
    	var dataUrl = '<%=basePath%>district/bulidDistrictTree.shtml?level=5&districtCode=0000000000&t='+(new Date()).getTime().toString(36);
    	if($("#discode").combotree("options").url==""){
    		$.messager.show({
	   			showType:null,
	   			showSpeed:1000,
	   			width:150,
	   			height:70,
	   			msg:'地区信息加载中... ...',
	   			title:'提示',
	   			timeout:2000
	   		});
    		$("#discode").combotree("options").url=dataUrl;
	    	$.get(dataUrl,function(data){
				var json = "";
				try{
					json = eval('('+data+')');
				}catch(e){
					json = data;
				}
				$("#discode").combotree("loadData",json);
	    	})
    	}
    },
   	onLoadSuccess:function(){
   	if($("#discode").combotree("options").url!="")
   		$.messager.show({
   			showType:'slide',
   			showSpeed:1000,
   			width:150,
   			height:70,
   			msg:'地区信息加载完成',
   			title:'提示',
   			timeout:3000
   		})
   	}
});
		      
		</script>
	</body>
</html>
