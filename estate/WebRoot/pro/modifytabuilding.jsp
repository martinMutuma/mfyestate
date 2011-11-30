<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@taglib uri="estateTag" prefix="estateTag" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>修改楼盘出租</title>
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
	     <script type="text/javascript" src="<%=basePath %>pro/modifytabbuilding.js"></script>
	     <script type="text/javascript" src="<%=basePath %>pro/propertyutil.js"></script>
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
				    <div class="position" align="left" style="width:80%"><label>您所在的位置：</label><a href="../home.shtml">梦房园</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="../mem/baseinfo_mainPage.shtml">会员中心</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="../pro/managerbuid.jsp?menuCls=11">楼盘管理</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;楼盘信息修改</div>
                                      <div class="info_top"></div><div class="info_mid">
				       <table border="0" cellpadding="0" cellspacing="0" width="760px">
					                	<tr>
							             <td valign="top" align="center" >
									<form name="form" method="post"
										action="../building/modifyBuiding.shtml" enctype="multipart/form-data"
										onsubmit="return  checkSave()">

										<table width="710px" border="0" cellpadding="1" id="buildingrent" cellspacing="1">
											<tr>
												<th align="center" colspan="2">
													<b>修改楼盘信息 </b>
												</th>
											</tr>
											<tr>
												<th align="left" colspan="2" class="title_info1">
													一、填写基本信息（<font color="red">*</font> 为必填项）
												</th>
											</tr>
											<tr>
												<td >
													<div align="right" >
														<font color="red">*</font>楼盘类型:
													</div>
												</td>
												<td>
													  <estateTag:checkbox  id="buildingType" value="${tpBulding.buildingType}" name="tpBulding.buildingType" codeType="楼盘类型"/>
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
														<input type="text" id="name" name="tpBulding.name" value="${tpBulding.name}"
															 size="40" maxLength="23" onBlur="getName()"><span id="nameSpan"></span>
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
															<estateTag:select cssStyle="width:80px" value="${tpBulding.salesStatus}" name="tpBulding.salesStatus" id="salesStatus" codeType="销售状态" />
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
													<input   value="${tpBulding.disname}" id="showdistrict" style="width: 150px;"/>
													<input type="hidden" name="tpBulding.disname" id="disname" value="${tpBulding.disname}"/>
													<input type="hidden" name="tpBulding.district" id="district" value="${tpBulding.district}"/>
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
													    <estateTag:checkbox  id="features" value="${tpBulding.features}" name="tpBulding.features" codeType="项目特色"/>
			
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div align="right">
														<font color="red">*</font>楼盘地址:
													</div>
												</td>
												<td >
													<div align="left" >
                                                         <input type="text" id="address" maxLength="48" name="tpBulding.address"  size="40" value="${tpBulding.address}"  id="address"  />
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
													
													<input type="text" name="tpBulding.mainUnit" maxLength="14" id="mainUnit"  value="${tpBulding.mainUnit}"
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
													      <estateTag:select cssStyle="width:80px" value="${tpBulding.isForward}" name="tpBulding.isForward" id="isForward" codeType="现房期房" />
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
														<input type="text" id="buildingCount" name="tpBulding.buildingCount"
															onKeyUp="isNum(this)" maxLength="4" value="${tpBulding.buildingCount}" size="4">
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
														<input type="text" id="area" name="tpBulding.area"
															onKeyUp="isNum(this)" id="area"  maxLength="8" value="${tpBulding.area}"  size="4">
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
														<input type="text" id="constructionArea"  name="tpBulding.constructionArea"   value="${tpBulding.constructionArea}" 
															onKeyUp="isNum(this)" maxLength="8" id="constructionArea" size="4">
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
													 <input type="text"  name="tpBulding.openDate" id="openDate" readOnly="readOnly" value="${tpBulding.dateString}"
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
													 <input type="text" name="tpBulding.minPrice"  maxLength="6" value="${tpBulding.minPrice}" id="minPrice" onKeyUp="isNum(this)"
														 />元/每㎡
													
												 </td>
											</tr>
											
												<tr>
												<td>
													<div align="right" >
														<font color="red">*</font>建筑形式:  
													</div>
												</td>
												<td>
													    <estateTag:checkbox  id="archForms" value="${tpBulding.archForms}" name="tpBulding.archForms" codeType="建筑形式"/>
												</td>
											</tr>
											<tr>
												<td>
													<div align="right" >
														<font color="red">*</font>物业费:
													</div>
												</td>
												<td align="left">
													<input type="text" maxLength="7" name="tpBulding.propertyManagement"  value="${tpBulding.propertyManagement}"  id="propertyManagement"    onKeyUp="isNum(this)"
														 /> 元/㎡·月
												</td>
											</tr>
												<tr>
												<td>
													<div align="right" >
														<font color="red">*</font>全景图:
													</div>
												</td>
												<td align="left">
													<img src="<%=basePath%>${tpBulding.compressUrl}" />&nbsp;&nbsp;&nbsp;<span id="picbtn"><input type="button"  onclick="modifyPic(picbtn)" value="修改"/></span>
												     <div id="modifyPic"></div>
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
													  <estateTag:select cssStyle="width:80px" value="${tpBulding.fitCondition}" name="tpBulding.fitCondition" id="fitCondition" codeType="装修程度" />
									
												</td>
											</tr>
											<tr>
												<td>
													<div align="right" >
														楼盘状况:
													</div>
												</td>
												<td align="left">
													
													<input type="text" id="buildStatus" maxLength="50" name="tpBulding.buildStatus"  value="${tpBulding.buildStatus}"
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
													 <input type="text"  id="checkDate" name="tpBulding.checkDate" 
														 readOnly="readOnly"  value="${tpBulding.checkdataString}"
														onFocus="WdatePicker({firstDayOfWeek:7,dateFmt:'yyyy-MM-dd'})"
																class="Wdate" >
													
												 </td>
											</tr>
											
											<tr>
												<td>
													<div align="right" >
														楼盘均价:
													</div>
												</td>
												<td align="left">
													 <input type="text" maxLength="6"   name="tpBulding.averagePrice" value="${tpBulding.averagePrice==0?'':tpBulding.averagePrice}" id="averagePrice" onKeyUp="isNum(this)"
														 />元/每㎡
													
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
														<input type="text" maxLength="5" id="unitCount" name="tpBulding.unitCount"
															onKeyUp="isNum(this)" id="unitCount" value="${tpBulding.unitCount==0?'':tpBulding.unitCount}"  size="4">
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div align="right" >
														楼盘最高价:
													</div>
												</td>
												<td align="left">
													 <input type="text"  maxLength="6" name="tpBulding.maxPrice" value="${tpBulding.maxPrice==0?'':tpBulding.maxPrice}"  id="maxPrice"  onKeyUp="isNum(this)"
														 />元/每㎡
													
												 </td>
											</tr>
											
											
											
											<tr>
												<td>
													<div align="right" >
														绿化率:
													</div>
												</td>
												<td align="left">
													 <input type="text" maxLength="7" onKeyUp="isNum(this)" id="greenRate" value="${tpBulding.greenRate==0.0?'':tpBulding.greenRate}"  name="tpBulding.greenRate"
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
													 <input type="text" maxLength="7" id="capacityRate" onKeyUp="isNum(this)" value="${tpBulding.capacityRate==0?'':tpBulding.capacityRate}"  name="tpBulding.capacityRate"
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
													 <input type="text" maxLength="24" name="tpBulding.outterWall" id="outterWall"  value="${tpBulding.outterWall}"
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
													 <input type="text"  maxLength="48" name="tpBulding.structure" id="structure" size="40"   value="${tpBulding.structure}"
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
													 <input type="text"  maxLength="22" name="tpBulding.contractors" id="contractors" value="${tpBulding.contractors}"
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
														<input type="text" name="tpBulding.carPat" id="carPat" value="${tpBulding.carPat==0?'':tpBulding.carPat}"
															onKeyUp="isNum(this)" maxLength="4"  size="4">
														㎡
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
													<input type="text" maxLength="30"  name="tpBulding.propertyCompany"   id="propertyCompany" value="${tpBulding.propertyCompany}" 
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
													<input type="text" maxLength="13" name="tpBulding.waterSupply"  id="waterSupply"  value="${tpBulding.waterSupply}"
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
													<input type="text" maxLength="13" name="tpBulding.heatingSupply" id="heatingSupply" value="${tpBulding.heatingSupply}"
														 /> 
												
												</td>
											</tr> 
											
											<tr >
												<td colspan="2">
													<div align="center" >
													     <input  type="hidden" name="id" value="${tpBulding.id}"/>
													  <input  type="hidden" name="type" value="1"/>
														<input  type="submit"  value="保存并继续修改"/>
													</div>
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
		</div>
			<div style="margin-top: 10px;">
			<center>
				<jsp:include page="../copyright.jsp" />
			</center>
		</div>
	</body>		
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
});
		      
		</script> 	 
		 <script type="text/javascript">
		   var basepath="<%=basePath%>";
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