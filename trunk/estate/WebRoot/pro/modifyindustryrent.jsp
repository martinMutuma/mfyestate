<%@ page language="java" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%@taglib uri="estateTag" prefix="estateTag" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>修改工业地产出租</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" href="../resource/css/global.css"
			type="text/css"></link>
		<script type="text/javascript" src="../resource/js/jquery-1.4.2.js"></script>
		<link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/default/easyui.css">
		<script type="text/javascript" src="../resource/js/jquery.easyui.min.js"></script>	
		<script type="text/javascript" src="../resource/js/kindeditor/kindeditor.js"></script>
	    <link rel="stylesheet" type="text/css" href="../resource/js/kindeditor/skins/default.css"></link>
	      <script type="text/javascript" src="../resource/js/whole.js"></script>
	    <link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>	
 <link rel="stylesheet" href="../resource/css/memberCenter/info.css" type="text/css"></link>
   <script type="text/javascript" src="../resource/js/googlemap.js"></script>
   		<script type="text/javascript" src="<%=basePath%>pro/modifyindustryrent.js"></script>
	</head>

	<body  onunload="GUnload()">
	<jsp:include page="../head.jsp"></jsp:include>
		 <div style="width: 100%; margin-top: 10px;" align="center">
			<table width="100%" class="layoutTab">
				<tr>
					<td width="20%" align="left" valign="top"><jsp:include page="../left.jsp"></jsp:include></td>
					<td valign="top">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td valign="top" align="left">
								<div class="position" align="left" style="width:80%"><label>您所在的位置：</label><a href="../home.shtml">梦房园</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="../mem/baseinfo_mainPage.shtml">会员中心</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="manageindustryrent.jsp?menuCls=14">工业地产出租管理</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;修改出租信息</div>
                                      <div class="info_top"></div><div class="info_mid">
								 <table border="0" cellpadding="0" cellspacing="0" width="760px">
					                	<tr>
							             <td valign="top" align="center" >
							             
												<form name="form" method="post"
													action="../industry/addIndustry.shtml" 
													onsubmit="return checkrent()">

													<table width="710px;" border="0" cellpadding="1"
														cellspacing="1" id="buildingrent">
														<tr>
															<th align="center" colspan="2">
																<b>修改工业地产出租信息 </b>
															</th>
														</tr>
														<tr>
															<th align="left" colspan="2"  class="title_info1">
																一、填写基本信息（<font color="red">*</font> 为必填项）
															</th>
														</tr>
														<tr>
															<td align="right" width="20%">
																	<font color="red">*</font>省/市/区县:
															</td>
															<td align="left">
													<input   value="${industry.disname}" id="showdistrict" style="width: 150px;"/>
													<input type="hidden" name="industry.disname" id="disname" value="${industry.disname}"/>
													<input type="hidden" name="industry.district" id="district" value="${industry.district}"/>
													</td>
														</tr>
														<tr>
															<td align="right">
																	<font color="red">*</font>地址:
															</td>
															<td align="left">
																	<input type="text" name="industry.address" id="address"
																		value="${industry.address}" maxLength="48" size="40">
															</td>
														</tr>
														<tr>
															<td align="right">
																	<font color="red">*</font>建筑面积:
															</td>
															<td align="left">
																	<input type="text" id="constructionArea" size="10"
																		name="industry.constructionArea"
																		value="${industry.constructionArea==0.0?'':industry.constructionArea}"
																		id="constructionArea" maxLength="5" onkeyup="isNum(this)">
																	㎡
															</td>
														</tr>
															<tr>
															<td align="right">
																	<font color="red">*</font>年租金:
															</td>
															<td align="left">
																	<input type="text" size="10" onkeyup="isNum(this)"
																		id="bursary" maxLength="4" value="${industry.bursary==0.0?'':industry.bursary}"
																		name="industry.bursary">
																	万元/年
															</td>
														</tr>
														<tr>
															<td align="right">
																	<font color="red">*</font>案源标题:
															</td>
															<td align="left">
																	<input type="text" name="industry.title" size="40"
																		value="${industry.title}" maxLength="48" id="title">
															</td>
														</tr>
														<tr>
														<th align="left" colspan="2" class="title_info1" valign="bottom">
													           二、填写楼盘详细信息
												         </th>
												         </tr>
														<tr>
															<td align="right">
																	占地面积:
															</td>
															<td align="left">
																	<input type="text" maxLength="5" name="industry.area" id="area"
																		value="${industry.area==0.0?'':industry.area}" onkeyup="isNum(this)"
																		size="10">
																	㎡
															</td>
														</tr>
														<tr>
															<td align="right">
																	空地面积:
															</td>
															<td align="left">
																	<input type="text" maxLength="5" name="industry.spaceArea"
																		id="spaceArea" value="${industry.spaceArea==0.0?'':industry.spaceArea}"
																		onkeyup="isNum(this)" size="10">
																	㎡
															</td>
														</tr>
														<tr>
															<td align="right">
																	容积率:
															</td>
															<td align="left">
																	<input type="text"  maxLength="5" size="10" name="industry.far"
																		id="far" value="${industry.far==0.0?'':industry.far}" onkeyup="isNum(this)">
																	%
															</td>
														</tr>
														<tr>
															<td align="right">
																	绿化率:
															</td>
															<td align="left">
																	<input type="text" size="10" maxLength="5" onkeyup="isNum(this)"
																		value="${industry.greenRate==0.0?'':industry.greenRate}" id="greenRate"
																		name="industry.greenRate">
																	%
															</td>
														</tr>
														<tr>
														<tr>
															<td align="right">
																	行业:
															</td>
															<td align="left">
																	<estateTag:select cssStyle="width:120px"  name="industry.industry" id="industry" codeType="工业行业" value="${industry.industry}" />
															</td>
														</tr>
														<tr>
															<td align="right">
																	种类:
															</td>
															<td align="left">
																		<estateTag:select cssStyle="width:120px"  name="industry.category" id="category" codeType="工业种类" value="${industry.category}" />
															</td>
														</tr>
														<tr>
															<td align="right">
																	类型:
															</td>
															<td align="left">
																	<estateTag:select cssStyle="width:120px"  name="industry.type" id="type" codeType="工业类型" value="${industry.type}" />
															</td>
														</tr>
														<tr>
															<td align="right">
																	层高:
															</td>
															<td align="left">
																	<input type="text" id="floorHeight" maxLength="4" name="industry.floorHeight"
																		value="${industry.floorHeight}"
																		onKeyUp="this.value=this.value.replace(/\D/g,'')"
																		size="10" />
															</td>
														</tr>
														<tr>
															<td align="right">
																	行车:
															</td>
															<td align="left">
																	<input type="text" id="car" maxLength="9" name="industry.car"
																		value="${industry.car}" size="30" />
															</td>
														</tr>
														<tr>
															<td align="right">
																	结构:
															</td>
															<td align="left">
																	<input type="text" id="structure" maxLength="9" name="industry.structure"
																		value="${industry.structure}" size="30" />
															</td>
														</tr>
														<tr>
															<td align="right">
																	承重:
															</td>
															<td align="left">
																<div align="left">
																	<input type="text" id="bear" maxLength="9" name="industry.bear"
																		value="${industry.bear}" size="30" />
																</div>
															</td>
														</tr>
														<tr>
															<td align="right">
																	配电功率:
															</td>
															<td align="left">
																	<input type="text" maxLength="5"  onkeyup="isNum(this)" id="power"
																		name="industry.power" value="${industry.power==0.0?'':industry.power}"
																		size="10">
																	千瓦
															</td>
														</tr>
														<tr>
															<td align="right">
																	水:
															</td>
															<td align="left">
																	<input type="text" onkeyup="isNum(this)"
																		name="industry.water" id="water"
																		value="${industry.water==0.0?'':industry.water}" size="10" />
																	吨
															</td>
														</tr>
														<tr>
															<td align="right">
																	通讯情况:
															</td>
															<td align="left">
																	<input type="text" id="communicate" maxLength="10" name="industry.communicate"
																		value="${industry.communicate}" 
																		size="10">
																
															</td>
														</tr>
														<tr>
															<td align="right">
																	是否独门独院:
															</td>
															<td align="left">
																	<estateTag:select cssStyle="width:120px"  name="industry.isSingle" id="isSingle" codeType="是否" value="${industry.isSingle}" />
															</td>
														</tr>
														<tr>
															<td align="right">
																	配套设施说明:
															</td>
															<td align="left">
																	<input type="text" id="facilities" maxLength="40" name="industry.facilities"
																		value="${industry.facilities}" size="30">
															</td>
														</tr>
														<tr>
															<td align="right">
																	物业管理费:
															</td>
															<td align="left">
																	<input type="text" maxLength="7" name="industry.propertyManagement"
																		id="propertyManagement"
																		value="${industry.propertyManagement==0.0?'':industry.propertyManagement}"
																		onkeyup="isNum(this)" size="10">
																	元/㎡·月
															</td>
														</tr>
													
														<tr>
															<td align="right">
																	案源描述:
															</td>
															<td align="left" id="filter_ke">
																	<textarea cols="60" rows="10" name="industry.content" id="content">
                     ${industry.content}
                  </textarea>
															</td>
														</tr>
														<tr>
															<td align="right">
																	地图坐标:
															</td>
															<td align="left">
																	<input type="text" id="jing" size="20"
																		readonly="readonly" value="${industry.positionY}"
																		name="industry.positionY">
																	&nbsp;&nbsp;&nbsp;&nbsp;
																	<input id="wei" readonly="readonly" type="text"
																		value="${industry.positionX}"
																		name="industry.positionX" size="20">
																	<font color="red">(在地图上双击鼠标左键标注案源位置 )</font>
															</td>
														</tr>
														<tr>
															<td align="right">
																	地理位置:
															</td>
															<td align="left">
																	<input type="text" id="addressText" size="20"
																		value="${industry.addressName}"
																		name="industry.addressName">
																	<input type="button" onclick="goAddress()" value="定位"/>	
															</td>
														</tr>
														<tr>
															<td colspan="2" align="center">
																<div align="center" id="map"
														style="width: 80%; height: 250px">
													  </div>
															</td>
														</tr>
												<tr>
								                 <td  align="center" colspan="4" style="margin-top: 10px;">
								                 <a href="../industry/getPic.shtml?id=${industry.id}&type=${industry.flag}"><font color="red">---&gt;&gt;修改图片信息</font></a>
								                 </td>
								              </tr>
						
														<tr>
															<td colspan="2" align="center">
																<input type="submit" value="提交审核">
																<input type="hidden" name="industry.auditingState"
																	value="0" />
																<input type="hidden" name="id" value="${industry.id}" />
																<input  type="hidden"   name="type"  value="1"/>
																<input type="hidden" name="industry.Flag" value="1" />
																	</td>
																	</tr>
													</table>
									</form>
								</td>
						</tr>
					</table>
					
													 </div>
					<div class="info_bottom">&nbsp;</div>
												
											</td>
										</tr>
									</table>
							</tr>
						</table>
		</div>
		        <div style="margin-top: 10px;">
			<center>
				<jsp:include page="../copyright.jsp" />
			</center>
		</div>
	</body>
	<script src="http://maps.google.com/maps?file=api&v=2&key=ABQIAAAAC1djgrWT1Mqz3gM4Ge3XlhSchlZ7_IhAROXTdJ5EzY4J4yl1FBSStZmm__B2dywWaRXMSi8G6C5QLw"  type="text/javascript"></script>
	<script>
	         var map;
            var geocoder = null; 
            var marker;
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
   		$("#disname").val(node.text)
   	     $("#district").val(node.id);  
   	}
});
				
		
		 $("#buildingrent td").not($("#filter_ke td")).addClass("info_td1");
		$("#buildingrent tr").find("td:even").not($("#filter_ke td")).addClass("title_info2");
		$("#buildingrent tr").find("td:odd").not($("#filter_ke td")).css("padding-left","5px");   	
		
		
		</script>
</html>
