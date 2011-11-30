<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>居住楼盘</title>
		<script type="text/javascript" src="../scripts/jquery-1.4.2.js"></script>
	</head>
	<body>
		<div style="width: 100%;height: 100%;margin-top: 10px;" id="info" align="center">
				<table width="100%" border="0" cellpadding="1" id="buildingrent" cellspacing="1" align="left">
					<tr>
						<td align="center" colspan="2">
							<b>发布楼盘信息 （<font color="red">*</font> 为必填项）</b>
						</td>
					</tr>
					<tr>
						<td align="left" colspan="2" >
							<font color="red">一、填写基本信息</font>
						</td>
					</tr>
					<tr>
						<td width="100px">
							<div align="right">
								<font color="red">*</font>楼盘类型:
							</div>
						</td>
						<td>
							<div align="left" >
							 <script>
							 	var buildingType = '${buliding.buildingType}';
							 	var buildingTypeAry = buildingType.split(",");
							 	for(var i = 0; i < buildingTypeAry.length; i++){
									switch(parseInt(buildingTypeAry[i])){
									    case 0 : document.write('住宅');break;
									    case 1 : document.write('公寓');break;
									    case 2 : document.write('海景房');break;
									    case 3 : document.write('别墅');break;
									    case 4 : document.write('酒店式公寓');break;
									    case 5 : document.write('产权式公寓');break;
									}
									document.write(' , ');
								}
							</script>
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
								<font style="font-weight:bold;font-size:16px;">${buliding.name }</font>
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
								<script>
								 	var salesStatus = '${buliding.salesStatus}';
									switch(parseInt(salesStatus)){
									    case 0 : document.write('待售');break;
									    case 1 : document.write('预售');break;
									    case 2 : document.write('在售');break;
									    case 3 : document.write('尾盘');break;
									    case 4 : document.write('售完');break;
									}
								</script>
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
								${buliding.disname }
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
							<script>
								var features = '${buliding.features}';
							 	var featuresAry = features.split(",");
							 	for(var i = 0; i < buildingTypeAry.length; i++){
									switch(parseInt(featuresAry[i])){
									    case 0 : document.write('特色别墅');break;
									    case 1 : document.write('养老居所');break;
									    case 2 : document.write('高档小区');break;
									    case 3 : document.write('景观居所');break;
									    case 4 : document.write('宜居生态');break;
									    case 5 : document.write('花园洋房');break;
									    case 6 : document.write('投资地产');break;
									    case 7 : document.write('创意地产');break;
									    case 8 : document.write('水景地产');break;
									}
									document.write(' , ');
								}
							</script>
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
								${buliding.address }
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
							${buliding.mainUnit}
						</td>
					</tr>
				
					<tr>
						<td>
							<div align="right" >
								装修状况:
							</div>
						</td>
						<td align="left">
							<script>
							 	var fitCondition = '${buliding.fitCondition}';
								switch(parseInt(fitCondition)){
								    case 1 : document.write('毛坯');break;
								    case 2 : document.write('简单装修');break;
								    case 3 : document.write('中档装修');break;
								    case 4 : document.write('精装修');break;
								}
							</script>
						</td>
					</tr>
					<tr>
						<td>
							<div align="right" >
								楼盘状况:
							</div>
						</td>
						<td align="left">
							${buliding.buildStatus }
						</td>
					</tr>
					<tr>
						<td>
							<div align="right" >
								<font color="red">*</font>开盘日期:
							</div>
						</td>
						<td align="left">
							${buliding.openDate }
						 </td>
					</tr>
					<tr>
						<td>
							<div align="right" >
								入住日期:
							</div>
						</td>
						<td align="left">
							${buliding.checkDate }
						 </td>
					</tr>
					<tr>
						<td>
							<div align="right" >
								<font color="red">*</font>楼盘起价:
							</div>
						</td>
						<td align="left">
							${buliding.minPrice } 元/每平米
						 </td>
					</tr>
					<tr>
						<td>
							<div align="right" >
								楼盘均价:
							</div>
						</td>
						<td align="left">
							${buliding.averagePrice } 元/每平米
							
						 </td>
					</tr>
					<tr>
						<td>
							<div align="right" >
								楼盘最高价:
							</div>
						</td>
						<td align="left">
							${buliding.maxPrice } 元/每平米
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
								<script>
								 	var isForward = '${buliding.isForward}';
									switch(parseInt(isForward)){
									    case 1 : document.write('现房');break;
									    case 2 : document.write('期房');break;
									}
								</script>
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
								${buliding.buildingCount }
							</div>
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
								${buliding.unitCount }
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
								${buliding.area } 平方米
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
								${buliding.constructionArea } 平方米
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
							${buliding.greenRate }%
						 </td>
					</tr>
					<tr>
						<td>
							<div align="right" >
								容积率:
							</div>
						</td>
						<td align="left">
							${buliding.capacityRate }%
						 </td>
					</tr>
					<tr>
						<td>
							<div align="right" >
								外墙:
							</div>
						</td>
						<td align="left">
							${buliding.outterWall }
						 </td>
					</tr>
					<tr>
						<td>
							<div align="right" >
								结构:
							</div>
						</td>
						<td align="left">
							${buliding.structure }
						 </td>
					</tr>
					<tr>
						<td>
							<div align="right" >
								承建商:
							</div>
						</td>
						<td align="left">
							${buliding.contractors }
						 </td>
					</tr>
				</table>
		</div>
	</body>
	<script>
		parent.setHeight($("#info").outerWidth(true));
	</script>
</html>
