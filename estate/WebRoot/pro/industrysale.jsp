<%@ page language="java" pageEncoding="utf-8"%>
<%@taglib uri="estateTag" prefix="estateTag" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


	<title>工业地产出售</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="../resource/css/global.css" type="text/css"></link>
    <link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/default/easyui.css"></link>
	<script type="text/javascript" src="industrysale.js"></script>
	<script type="text/javascript" src="../resource/js/jquery-1.4.2.js"></script>
   	<script type="text/javascript" src="../resource/js/jquery.easyui.min.js"></script>
  	<script type="text/javascript" src="../resource/js/global.js"></script>
  	<script type="text/javascript" src="../resource/js/kindeditor/kindeditor.js"></script>
	<link rel="stylesheet" type="text/css" href="../resource/js/kindeditor/skins/default.css"></link>
	  <script type="text/javascript" src="../resource/js/whole.js"></script>
	    <link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>
		    <link rel="stylesheet" href="../resource/css/memberCenter/info.css" type="text/css"></link>
		 <script type="text/javascript" src="../resource/js/googlemap.js"></script>
		 <script type="text/javascript" src="industrysale.js"></script>
  </head>
  
  <body  onunload="GUnload()">
	<jsp:include page="../head.jsp"></jsp:include>
		 <div style="width: 100%; margin-top: 10px;" align="center">
    		<table width="100%" class="layoutTab">
			<tr>
				<td width="20%" align="left" valign="top"><jsp:include page="../left.jsp?selectItem=4"></jsp:include></td>
				<td valign="top">
					<table border="0" cellpadding="0" id="industryrentTab" cellspacing="0">
						<tr>
							<td valign="top" align="left">
							     <div class="position" align="left" style="width:80%"><label>您所在的位置：</label><a href="../home.shtml">梦房园</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="../mem/baseinfo_mainPage.shtml">会员中心</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="manageindustrysale.jsp?menuCls=14">工业地产出售管理</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="industrysale.jsp">发布工业地产出售信息</a></div>
                                      <div class="info_top"></div><div class="info_mid">
							      <table border="0" cellpadding="0" cellspacing="0" width="760px">
					                	<tr>
							             <td valign="top" align="center" >
												<form name="form" method="post"
													enctype="multipart/form-data"
													action="../industry/addIndustry.shtml"
													onsubmit="return checksale()">

													<table width="710px" border="0" id="buildingrent" cellpadding="1"
														cellspacing="1">
														<tr>
															<th align="center" colspan="2">
																<b>发布工业地产出售信息 </b>
															</th>
														</tr>
														<tr>
															<th align="left" colspan="2" class="title_info1">
																一、填写基本信息（<font color="red">*</font> 为必填项）
															</th>
														</tr>
														<tr>
															<td align="right" >
																	<font color="red">*</font>省/市/区县:
															</td>
															<td align="left">
																	<select id="district" name="industry.district"  style="width: 150px;"></select>
																	<input type="hidden" name="industry.disname" id="disname"/>
															</td>
														</tr>
														<tr>
															<td align="right">
																	<font color="red">*</font>地址:
															</td>
															<td align="left">
																	<input type="text" maxLength="48" name="industry.address" id="address"
																		size="40">
															</td>
														</tr>
														<tr>
															<td align="right">
																	<font color="red">*</font>建筑面积:
															</td>
															<td align="left">
																	<input type="text" size="10"
																		name="industry.constructionArea" maxLength="5" id="constructionArea"
																		onkeyup="isNum(this)">
																	㎡
															</td>
														</tr>
														<tr>
															<td align="right">
																	<font color="red">*</font>售价:
															</td>
															<td align="left"> 
																	<input type="text" size="10" onkeyup="isNum(this)"
																		id="bursary" maxLength="4" name="industry.bursary">
																	万元
															</td>
														</tr>
														<tr>
															<td align="right">
																	<font color="red">*</font>案源标题:
															</td>
															<td align="left">
																	<input type="text" maxLength="48"  name="industry.title" size="40"
																		id="title">
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
																	<input type="text" id="area" name="industry.area"
																		onkeyup="isNum(this)" maxLength="5" size="10">
																	㎡
															</td>
														</tr>
														<tr>
															<td align="right">
																	空地面积:
															</td>
															<td align="left">
																	<input type="text" maxLength="5"  id="spaceArea" name="industry.spaceArea"
																		onkeyup="isNum(this)" size="10">
																	㎡
															</td>
														</tr>
														<tr>
															<td align="right">
																	容积率:
															</td>
															<td align="left">
																	<input type="text" size="10" maxLength="5"  id="far" name="industry.far"
																		onkeyup="isNum(this)">
																	%
															</td>
														</tr>
														<tr>
															<td align="right">
																	绿化率:
															</td>
															<td align="left">
																	<input type="text" size="10" maxLength="5"  id="greenRate" onkeyup="isNum(this)"
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
															  	<estateTag:select cssStyle="width:120px"  name="industry.industry" id="industry" codeType="工业行业" value="1" />
																
															</td>
														</tr>
														<tr>
															<td align="right">
																	种类:
															</td>
															<td align="left">
															     	<estateTag:select cssStyle="width:120px"  name="industry.category" id="category" codeType="工业种类" value="1" />
																	
															</td>
														</tr>
														<tr>
															<td align="right">
																	类型:
															</td>
															<td align="left">
																<estateTag:select cssStyle="width:120px"  name="industry.type" id="type" codeType="工业类型" value="1" />
										
															</td>
														</tr>
														<tr>
															<td align="right">
																	层高:
															</td>
															<td align="left">
																	<input type="text" maxLength="4"  id="floorHeight" name="industry.floorHeight"
																		onKeyUp="this.value=this.value.replace(/\D/g,'')"
																		size="10" />
															</td>
														</tr>
														<tr>
															<td align="right">
																	行车:
															</td>
															<td align="left">
																	<input type="text" maxLength="9" id="car" name="industry.car" size="30" />
															</td>
														</tr>
														<tr>
															<td align="right">
																	结构:
															</td>
															<td align="left">
																	<input type="text" maxLength="9" id="structure" name="industry.structure" size="30" />
															</td>
														</tr>
														<tr>
															<td align="right">
																	承重:
															</td>
															<td align="left">
																	<input type="text" id="bear" maxLength="9" name="industry.bear" size="30" />
															</td>
														</tr>
														<tr>
															<td align="right">
																	配电功率:
															</td>
															<td align="left">
																	<input type="text" id="power" maxLength="5" onkeyup="isNum(this)"
																		name="industry.power" size="10">
																	千瓦
															</td>
														</tr>
														<tr>
															<td align="right">
																	水:
															</td>
															<td align="left">
																<input type="text" maxLength="3" id="water" onkeyup="isNum(this)"
																		name="industry.water" size="10" />
																	吨
															</td>
														</tr>
														<tr>
															<td align="right">
																	通讯情况:
															</td>
															<td align="left">
																	<input type="text" id="communicate" maxLength="10" name="industry.communicate"
																		 size="10">
																
															</td>
														</tr>
														<tr>
															<td align="right">
																	是否独门独院:
															</td>
															<td align="left">
															     	<estateTag:select cssStyle="width:120px"  name="industry.isSingle" id="isSingle" codeType="是否" value="1" />
																	
															</td>
														</tr>
														<tr>
															<td align="right">
																	配套设施说明:
															</td>
															<td align="left">
																	<input type="text" id="facilities" maxLength="40" name="industry.facilities" size="40">
															</td>
														</tr>
														<tr>
															<td align="right">
																	物业管理费:
															</td>
															<td align="left">
																	<input type="text" id="propertyManagement" maxLength="7" name="industry.propertyManagement"
																		onkeyup="isNum(this)" size="10">
																	元/㎡·月
															</td>
														</tr>
														
														<tr>
															<td align="right">
																	案源描述:
															</td>
															<td align="left" id="filter_ke">
																	<textarea cols="60" rows="20" name="industry.content" id="content"></textarea>
															</td>
														</tr>
														<tr>
															<td align="right">
																	地图坐标:
															</td>
															<td align="left">
																	<input type="text" id="jing" size="20"
																		readonly="readonly" name="industry.positionY">
																	&nbsp;&nbsp;&nbsp;&nbsp;
																	<input id="wei" readonly="readonly" type="text"
																		name="industry.positionX" size="20">
																	<font color="red">(在地图上双击鼠标左键标注案源位置 )</font>
															</td>
														</tr>
														<tr>
														 <td align="right">
																根据地区定位:
															</td>
															<td align="left">
																<input id="addressText" name="industry.addressName" style="width: 290px" type="text"/>
																<input type="button" onclick="goAddress()" value="定位"/>
															</td>
											       </tr>
														<tr>
															<td colspan="2" align="center">
																<div align="center" id="map"
																	style="width: 80%; height: 250px"></div>
															</td>
														</tr>
														<tr>
														
												<th align="left" colspan="2" class="title_info1" valign="bottom">
													三、上传案源图片(<font color="red">说明：单张图片不大于500k,如果大于500k请修改后上传。</font>)
												</th>
											     </tr>
														<tr>
															<td align="right">
																	1.图片名称:
															</td>
															<td align="left">
																	<input type="text" name="industry.imgName1"
																		id="imgName1" />
																	&nbsp; &nbsp; &nbsp;
																	<select name="industry.imgType1" id="imgType1">
																		<option value="1">
																			室内图
																		</option>
																		<option value="2">
																			位置图
																		</option>
																		<option value="3">
																			外观图
																		</option>
																		<option value="4">
																			平面图
																		</option>
																		<option value="5">
																			其他
																		</option>
																	</select>
																	&nbsp; &nbsp; &nbsp;
																	<input id="img1" type="file" name="imageFile1" />
															</td>
														</tr>
														<tr>
															<td align="right">
																	&nbsp;&nbsp;2.图片名称:
															</td>
															<td align="left">
																	<input type="text" name="industry.imgName2"
																		id="imgName2" />
																	&nbsp; &nbsp; &nbsp;
																	<select name="industry.imgType2" id="imgType2">
																		<option value="1">
																			室内图
																		</option>
																		<option value="2">
																			位置图
																		</option>
																		<option value="3">
																			外观图
																		</option>
																		<option value="4">
																			平面图
																		</option>
																		<option value="5">
																			其他
																		</option>
																	</select>
																	&nbsp; &nbsp; &nbsp;
																	<input id="img2" type="file" name="imageFile2" />
															</td>
														</tr>
														<tr>
															<td align="right">
																	&nbsp;&nbsp;3.图片名称:
															</td>
															<td align="left">
																<div align="left">
																	<input type="text" name="industry.imgName3"
																		id="imgName3" />
																	&nbsp; &nbsp; &nbsp;
																	<select name="industry.imgType3" id="imgType3">
																		<option value="1">
																			室内图
																		</option>
																		<option value="2">
																			位置图
																		</option>
																		<option value="3">
																			外观图
																		</option>
																		<option value="4">
																			平面图
																		</option>
																		<option value="5">
																			其他
																		</option>
																	</select>
																	&nbsp; &nbsp; &nbsp;
																	<input id="img3" name="imageFile3" type="file" />
																</div>
															</td>
														</tr>
														<tr>
															<td align="right">
																	&nbsp;&nbsp;4.图片名称:
															</td>
															<td align="left">
																	<input type="text" name="industry.imgName4"
																		id="imgName4" />
																	&nbsp; &nbsp; &nbsp;
																	<select name="industry.imgType4" id="imgType4">
																		<option value="1">
																			室内图
																		</option>
																		<option value="2">
																			位置图
																		</option>
																		<option value="3">
																			外观图
																		</option>
																		<option value="4">
																			平面图
																		</option>
																		<option value="5">
																			其他
																		</option>
																	</select>
																	&nbsp; &nbsp; &nbsp;
																	<input id="img4" type="file" name="imageFile4" />
															</td>
														</tr>
														<tr>
															<td align="right">
																	&nbsp;&nbsp;5.图片名称:
															</td>
															<td align="left">
																<div align="left">
																	<input type="text" name="industry.imgName5"
																		id="imgName5" />
																	&nbsp; &nbsp; &nbsp;
																	<select name="industry.imgType5" id="imgType5">
																		<option value="1">
																			室内图
																		</option>
																		<option value="2">
																			位置图
																		</option>
																		<option value="3">
																			外观图
																		</option>
																		<option value="4">
																			平面图
																		</option>
																		<option value="5">
																			其他
																		</option>
																	</select>
																	&nbsp; &nbsp; &nbsp;
																	<input id="img5" type="file" name="imageFile5" />
																</div>
															</td>
														</tr>
														<tr>
															<td colspan="2" align="center">
																<input type="submit" value="提交发布">
																<input type="hidden" name="industry.auditingState"
																	value="0" />
																<input type="hidden" name="industry.Flag" value="2" />
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
 var map;
 var geocoder = null; 
 var marker;
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
		<script src="http://maps.google.com/maps?file=api&v=2&key=ABQIAAAAC1djgrWT1Mqz3gM4Ge3XlhSchlZ7_IhAROXTdJ5EzY4J4yl1FBSStZmm__B2dywWaRXMSi8G6C5QLw"  type="text/javascript"></script>	
	</body>

</html>