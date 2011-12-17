<%@ page language="java" pageEncoding="UTF-8" %>
<%@taglib uri="estateTag" prefix="estateTag" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>新房</title>
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
	    <script type="text/javascript" src="../resource/js/My97DatePicker/WdatePicker.js"></script>	
	    <script type="text/javascript" src="../resource/js/whole.js"></script>
	    <link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>
	     <script type="text/javascript" src="tabbuilding.js"></script>
	     <link rel="stylesheet" href="../resource/css/memberCenter/info.css" type="text/css"></link>
	     
	</head>

	<body>
	<jsp:include page="../head.jsp"></jsp:include>
	      <div style="width: 100%; margin-top: 10px;" align="center">
		<table width="100%" class="layoutTab">
			<tr>
				<!-- 1.align -->
				<td width="25%" align="left" valign="top" ><jsp:include page="../left.jsp?selectItem=8"></jsp:include></td>
				<!-- 5.valign -->
				<td valign="top">
				      <div class="position" align="left" style="width:80%"><label>您所在的位置：</label><a href="../home.shtml">梦房园</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="../mem/baseinfo_mainPage.shtml">会员中心</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="managerbuid.jsp?menuCls=11">楼盘管理</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="tabuilding.jsp">发布楼盘信息</a></div>
                                      <div class="info_top"></div><div class="info_mid">
					             <table border="0" cellpadding="0" cellspacing="0" width="760px">
					                	<tr>
							             <td valign="top" align="center" >
									<form name="form" method="post"
										action="../building/addTabuiding.shtml" 
										onsubmit="return  checkSave()" enctype="multipart/form-data">
                                     
                                      
										<table width="710px;" border="0" cellpadding="1" id="buildingrent"  cellspacing="1">
											<tr>
												<th align="center" colspan="2">
													<b>发布楼盘信息 </b>
												</th>
											</tr>
											<tr>
												<th  colspan="2" align="left" class="title_info1">
													一、填写基本信息（<font color="red">*</font> 为必填项）
												</th>
											</tr>
											<tr>
												<td width="16%">
													<div align="right">
														<font color="red">*</font>楼盘类型:
													</div>
												</td>
												<td>
													<div align="left" >
													    <estateTag:checkbox   id="buildingType"  name="tpBulding.buildingType" codeType="楼盘类型"/>
				
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div align="right">
														<font color="red">*</font>楼盘名称:
													</div>
												</td>
												<td>
													<div align="left">
														<input type="text" id="name" name="tpBulding.name" 
															 size="40" onblur="getName()" maxLength="23" class="easyui-validatebox" required="true" missingMessage="楼盘名称必填" ><span id="nameSpan"></span>
															 
													</div>
												</td>
											</tr>
												<tr>
												<td>
													<div align="right">
														<font color="red">*</font>销售状态:
													</div>
												</td>
												<td>
													<div align="left">
														<estateTag:select cssStyle="width:80px" value="0" name="tpBulding.salesStatus" id="salesStatus" codeType="销售状态" />
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div align="right">
														<font color="red">*</font>所在区域:
													</div>
												</td>
												<td>
													<div align="left">
																<select id="district" name="tpBulding.district"  style="width: 150px;"></select> 
																<input type="hidden" name="tpBulding.disname" id="disname"/>
													</div>
												
												</td>
											</tr>
											 <tr>
												<td>
													<div align="right">
														<font color="red">*</font>项目特色:
													</div>
												</td>
												<td>
													<div align="left">
													    <estateTag:checkbox  id="features" value="0" name="tpBulding.features" codeType="项目特色"/>
			
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div align="right">
														<font color="red">*</font>楼盘地址:
													</div>
												</td>
												<td>
													<div align="left" >
                                                         <input type="text" name="tpBulding.address"  class="easyui-validatebox" required="true" missingMessage="楼盘地址必填" id="address" maxLength="48" size="40"/>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div align="right" >
														<font color="red">*</font>主力户型:
													</div>
												</td>
												<td align="left">
													
													<input type="text" name="tpBulding.mainUnit"  class="easyui-validatebox" required="true" missingMessage="主力户型必填"  maxLength="14" id="mainUnit"  
														 />
												   </td>
											</tr>
										    <tr>
												<td>
													<div align="right" >
														<font color="red">*</font>现房期房:
													</div>
												</td>
												<td>
													<div align="left">
													      <estateTag:select cssStyle="width:80px" value="1" name="tpBulding.isForward" id="isForward" codeType="现房期房" />
													</div>
												</td>
											</tr>
											 <tr>
												<td>
													<div align="right" >
														<font color="red">*</font>总栋数:
													</div>
												</td>
												<td>
													<div align="left">
														<input type="text"  class="easyui-validatebox" required="true" missingMessage="总栋数必填" name="tpBulding.buildingCount"
															onKeyUp="isNum(this)" id="buildingCount" maxLength="4"  size="4">
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div align="right" >
														<font color="red">*</font>占地面积:
													</div>
												</td>
												<td>
													<div align="left">
														<input type="text" name="tpBulding.area"
															onKeyUp="isNum(this)" class="easyui-validatebox" required="true" missingMessage="占地面积必填" maxLength="8" id="area" size="4">
														㎡
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div align="right" >
														<font color="red">*</font>建筑面积:
													</div>
												</td>
												<td>
													<div align="left">
														<input type="text" name="tpBulding.constructionArea"
															onKeyUp="isNum(this)" maxLength="8" class="easyui-validatebox" required="true" missingMessage="建筑面积必填" id="constructionArea" size="4">
														㎡
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div align="right" >
														<font color="red">*</font>开盘日期:
													</div>
												</td>
												<td align="left">
													 <input type="text" id="opendate" class="easyui-validatebox" required="true" missingMessage="开盘日期必填" name="tpBulding.openDate" readOnly="readOnly"
														onFocus="WdatePicker({firstDayOfWeek:7,dateFmt:'yyyy-MM-dd'})"
																class="Wdate" >
													
												 </td>
											</tr>
											<tr>
												<td>
													<div align="right" >
														<font color="red">*</font>楼盘起价:
													</div>
												</td>
												<td align="left">
													 <input type="text" name="tpBulding.minPrice" maxLength="6" class="easyui-validatebox" required="true" missingMessage="楼盘起价必填" size="8"  id="minPrice" onKeyUp="isNum(this)"
														 />元/㎡
													
												 </td>
											</tr>
											<tr>
												<td>
													<div align="right" >
													<font color="red">*</font>	楼盘均价:
													</div>
												</td>
												<td align="left">
													 <input type="text" maxLength="6" name="tpBulding.averagePrice" size="8" class="easyui-validatebox" required="true" missingMessage="楼盘均价必填" id="averagePrice" onKeyUp="isNum(this)"
														 />元/㎡
													
												 </td>
											</tr>
											<tr>
												<td>
													<div align="right" >
														<font color="red">*</font>建筑形式:
													</div>
												</td>
												<td>
													<div align="left">
														     <estateTag:checkbox  id="archForms"  value="0" name="tpBulding.archForms" codeType="建筑形式"/>
																
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div align="right" >
														<font color="red">*</font>物业费:
													</div>
												</td>
												<td align="left">
													<input type="text" size="8" maxLength="7"  class="easyui-validatebox" required="true" missingMessage="物业费必填" name="tpBulding.propertyManagement"  id="propertyManagement"    onKeyUp="isNum(this)"
														 /> 元/㎡·月
												</td>
											</tr>
											<tr>
											<tr>
												<td>
													<div align="right" >
														<font color="red">*</font>楼盘全景图:
													</div>
												</td>
												<td align="left">
													<input type="file" name="imgcomp" id="img"
														 /> 
												
												</td>
											</tr>
											<tr>
												<th align="left" colspan="2" class="title_info1" valign="bottom">
													二、填写楼盘详细信息
												</th>
											</tr>
											<tr>
												<td>
													<div align="right" >
														装修状况:
													</div>
												</td>
												<td align="left">
												   <estateTag:select cssStyle="width:80px" value="1" name="tpBulding.fitCondition" id="fitCondition" codeType="装修程度" />
											
		
												</td>
											</tr>
											<tr>
												<td>
													<div align="right" >
														楼盘状况:
													</div>
												</td>
												<td align="left">
													
													<input type="text" id="buildStatus" maxLength="50" name="tpBulding.buildStatus"  
														 />
												</td>
											</tr>
											
											<tr>
												<td>
													<div align="right" >
														入住日期:
													</div>
												</td>
												<td align="left">
													 <input type="text"  name="tpBulding.checkDate" 
														 readOnly="readOnly"
														onFocus="WdatePicker({firstDayOfWeek:7,dateFmt:'yyyy-MM-dd'})"
																class="Wdate" >
													
												 </td>
											</tr>
											
											
											<tr>
												<td>
													<div align="right" >
														楼盘最高价:
													</div>
												</td>
												<td align="left">
													 <input type="text"  maxLength="6" name="tpBulding.maxPrice" id="maxPrice"  onKeyUp="isNum(this)"
														 />元/㎡
													
												 </td>
											</tr>
											
											
											 <tr>
												<td>
													<div align="right" >
													总套数:
													</div>
												</td>
												<td>
													<div align="left">
														<input type="text" name="tpBulding.unitCount"
															onKeyUp="isNum(this)" maxLength="5" id="unitCount"  size="4">
													</div>
												</td>
											</tr>
											
											<tr>
												<td>
													<div align="right" >
														绿化率:
													</div>
												</td>
												<td align="left">
													 <input type="text" onKeyUp="isNum(this)" size="5" maxLength="7"  id="greenRate" name="tpBulding.greenRate"
														 />%
													
												 </td>
											</tr>
											<tr>
												<td>
													<div align="right" >
														容积率:
													</div>
												</td>
												<td align="left">
													 <input type="text" id="capacityRate" size="5" maxLength="7"  onKeyUp="isNum(this)" name="tpBulding.capacityRate"
														 />%
													
												 </td>
											</tr>
											<tr>
												<td>
													<div align="right" >
														外墙:
													</div>
												</td>
												<td align="left">
													 <input type="text" id="outterWall" maxLength="24"   name="tpBulding.outterWall" 
														 />
													
												 </td>
											</tr>
											<tr>
												<td>
													<div align="right" >
														结构:
													</div>
												</td>
												<td align="left">
													 <input type="text" id="structure" size="40"  maxLength="48" name="tpBulding.structure"  
														 />
													
												 </td>
											</tr>
											<tr>
												<td>
													<div align="right" >
														承建商:
													</div>
												</td>
												<td align="left">
													 <input type="text" id="contractors" maxLength="22" name="tpBulding.contractors"  
														 />
													
												 </td>
											</tr>
											
											<tr>
												<td>
													<div align="right" >
														车位:
													</div>
												</td>
												<td>
													<div align="left">
														<input type="text" name="tpBulding.carPat"
															onKeyUp="isNum(this)" maxLength="4" id="carPat" size="4">
														
													</div>
												</td>
											</tr>
											
											<tr>
												<td>
													<div align="right" >
														物业公司:
													</div>
												</td>
												<td align="left">
													<input type="text" id="propertyCompany" maxLength="30" size="40" name="tpBulding.propertyCompany"     
														 /> 
												</td>
											</tr>
											<tr>
												<td>
													<div align="right" >
														供水:
													</div>
												</td>
												<td align="left">
													<input type="text" id="waterSupply"  maxLength="13" name="tpBulding.waterSupply"  
														 /> 
												</td>
											</tr>
											<tr>
												<td>
													<div align="right" >
														供暖:
													</div>
												</td>
												<td align="left">
													<input type="text" maxLength="23" id="heatingSupply" name="tpBulding.heatingSupply" 
														 /> 
												
												</td>
											</tr>
											
											<tr >
												<td colspan="2">
													<div align="center" >
													   
													    <input  type="hidden" name="type" value="1"/>
														<input  type="submit"  value="保存并继续填写"/>
													</div>
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
		</div>
		   				<div style="margin-top: 10px;">
			<center>
				<jsp:include page="../copyright.jsp" />
			</center>
		</div>
	</body>		
  <script language="javascript">
    var basepath="<%=basePath%>";
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
     function  getName(){
  
    var  name=document.getElementById("name");
   
    if(checkNull(name)){
     var url1 =basepath+"building/checkName.shtml";
           $.ajax({
                   url: url1,
                   data: "name="+encodeURI(encodeURI(name.value)),
                   cache:false,
                  success: function(msg){
                       
                     var obj=eval('('+msg+')');
                     var result=obj[0]["message"];
                 
                      if(result=="yes"){
                          document.getElementById("nameSpan").innerHTML="<font color=red>名字要唯一</font>";;
                          return
                      }else{
                          document.getElementById("nameSpan").innerHTML="";
                      }  
                 }
                });
                }
}
		      
		</script> 	 
		
</html>