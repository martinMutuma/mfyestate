<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>新增楼盘</title>

		<style type="text/css">
input {
	height: 21px;
}
</style>
		<link rel="stylesheet" type="text/css"
			href="../resource/css/jqueryui/default/easyui.css">
		<link rel="stylesheet" type="text/css"
			href="../resource/css/jqueryui/icon.css">
		<link rel="stylesheet" href="<%=basePath%>resource/css/global.css"
			type="text/css"></link>

		<script type="text/javascript" src="../resource/js/jquery-1.4.2.js"
			charset="utf-8"></script>
		<script type="text/javascript"
			src="../resource/js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="floor.js"></script>
		<script type="text/javascript"
			src="../resource/js/kindeditor/kindeditor.js"></script>
		<link rel="stylesheet" type="text/css"
			href="../resource/js/kindeditor/skins/default.css"></link>
		<script type="text/javascript" src="../resource/js/whole.js"></script>
		<link rel="stylesheet" href="../resource/css/memberCenter/info.css"
			type="text/css"></link>
		<link rel="stylesheet" href="../resource/css/whole.css"
			type="text/css"></link>

	</head>

	<body>
		<center>
			<div style="width:100%; height: 100%;" align="center">
				<table width="60%" align="center" border="0" class="layoutTab">
					<tr>
						<td align="center" valign="top">
							<form action="../floor/addFloor.shtml"
								enctype="multipart/form-data" method="post"
								onsubmit="return checkFloor()">
						<div class="info_top"></div><div class="info_mid">		
								<table width="750" border="0">
									<tr>
										<td align="center" colspan="4">
											<b>新增楼盘信息 （<font color="red">*</font> 为必填项）</b>
										</td>
									</tr>
									<tr>
										<td align="center" colspan="4">
											<font color="red">一、填写基本信息</font>
										</td>
									</tr>
									<tr>
										<td width="15%" align="right">
											<font color="red">*</font>楼盘名称:
										</td>
										<td  width="35%" align="left">
											<input  type="text" name="floor.name" id="name" size="40"  />
										</td>
										<td width="15%" align="right">
											<font color="red">*</font>拼音缩写:
										</td>
										<td width="35%" align="left">
											<input type="text" name="floor.pinyin"
												onKeyUp="this.value=this.value.replace(/^[0-9\u4e00-\u9faf]+$/,'')"  onfocus="checkLength('楼盘名称','name',25)"
												id="pinyin" size="11" /><font color='red'>如:楼盘拼音为loupai,缩写为lp</font>
										</td>
									</tr>

									<tr>
										<td width="15%" align="right">
											<font color="red">*</font>地址:
										</td>
										<td  width="35%" align="left">
											<input type="text" size="40" name="floor.address"
												id="address" onfocus="checkLength('拼音缩写','pinyin',25)" />
										</td>
										<td width="15%" align="right">
											<font color="red">*</font>所属城市/区:
										</td>
										<td  width="35%" align="left">
											<input type="text" id="discode" name="floor.district"
												style="width: 200px;">
											<input type="hidden" name="floor.disname" id="disname" />
										</td>
									</tr>
									<tr>
										<td width="15%" align="right">
											物业公司：
										</td>
										<td  width="35%" align="left">
											<input type="text" size="31" id="propertyCompany" name="floor.propertyCompany">
										</td>
										<td width="15%" align="right">
											物业开发商：
										</td>
										<td  width="35%" align="left">
											<input name="floor.propertyDevelopers" id="propertyDevelopers" type="text" size="31">
										</td>
									</tr>
									<tr>
										<td width="15%" align="right">
											车位租金：
										</td>
										<td  width="35%" align="left">
											<input type="text" name="floor.packingRent" id="packingRent"
												size="11" onKeyUp="isNum(this)">
											元
										</td>
										<td width="15%" align="right">
											车位数量：
										</td>
									     <td  width="35%" align="left">
											<input type="text" name="floor.packingCount"
												id="packingCount" size="11"
												onKeyUp="this.value=this.value.replace(/\D/g,'')" >
										</td>
									</tr>
									<tr>
										<td width="15%" align="right">
											<font color="red">*</font> 物业管理费：
										</td>
										<td  width="35%" align="left">
											<input type="text" size="11" name="floor.propertyFees"
												id="propertyFees" onKeyUp="isNum(this)">
											元/㎡/月
										</td>
										<td width="15%" align="right">
											物业级别：
										</td>
										<td  width="35%" align="left">
											<select name="floor.propertyLevel">
												<option value="1">
													甲级
												</option>
												<option value="2">
													乙级
												</option>
												<option value="3">
													其他
												</option>
											</select>
										</td>
									</tr>
									<tr>
										<td width="15%" align="right">
											客梯数量：
										</td>
										<td  width="35%" align="left">
											<input type="text" name="floor.customElevator" size="11"
											 	onKeyUp="this.value=this.value.replace(/\D/g,'')">
										</td>
										<td width="15%" align="right">
											消防电梯数量：
										</td>
										<td  width="35%" align="left">
											<input type="text" size="11" name="floor.fireElevator"
												onKeyUp="this.value=this.value.replace(/\D/g,'')">
										</td>
									</tr>
									<tr>
										<td width="15%" align="right">
											总建筑面积：
										</td>
										<td  width="35%" align="left">
											<input type="text" size="11" id="totalArea" name="floor.totalArea"
												onKeyUp="isNum(this)">
										</td>
										<td width="15%" align="right">
											标准层面积：
										</td>
										<td  width="35%" align="left">
											<input type="text" size="11" id="standardArea" name="floor.standardArea"
												onKeyUp="isNum(this)">
										</td>
									</tr>
									<tr>
										<td width="15%" align="right">
											总层数：
										</td>
										<td  width="35%" align="left">
											<input type="text" size="11" name="floor.floorCount"
												onKeyUp="this.value=this.value.replace(/\D/g,'')">
										</td>
										<td width="15%" align="right">
											地上/地下层数：
										</td>
										<td  width="35%" align="left">
											<input type="text" size="11" name="floor.groundFloor"
												onKeyUp="this.value=this.value.replace(/\D/g,'')">
											/
											<input type="text" name="floor.undergroundFloor" size="12"
												onKeyUp="this.value=this.value.replace(/\D/g,'')">
										</td>
									</tr>
									<tr>
										<td width="15%" align="right">
											交通状况：
										</td>
										<td colspan="3" width="85%" align="left">
											<input type="text" name="floor.traffic" id="traffic" size="93">
										</td>

									</tr>
									<tr>
										<td width="15%" align="right">
											物业描述：
										</td>
										<td colspan="3" width="85%" align="left">
											<textarea cols="70" rows="10" name="floor.propertyDesc"
												id="content"></textarea>
										</td>
									</tr>
									<tr>
										<td colspan="4" align="center">
											<font color="red">二、上传案源图片<br />说明：单张图片不大于500k,如果大于500k请修改后上传。</font>
										</td>
									</tr>
									<tr>
										<td width="15%" align="right">
											1.图片名称:
										</td>
										<td align="left">
											<input type="text" name="floor.imgName1" id="imgName1" size="25"/>
											<select name="floor.imgType1">
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
										</td>
										<td colspan="2" align="left">
											<input id="img1" type="file" name="imageFile1" size="25"/>
										</td>

									</tr>
									<tr>
										<td width="15%" align="right">
											2.图片名称:
										</td>
										<td align="left">
											<input type="text" name="floor.imgName2" id="imgName2" size="25"/>
											<select name="floor.imgType2">
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
										</td>
										<td colspan="2" align="left">
											<input id="img2" type="file" name="imageFile2" size="25"/>
										</td>

									</tr>
									<tr>
										<td width="15%" align="right">
											3.图片名称:
										</td>
										<td align="left">
											<input type="text" name="floor.imgName3" id="imgName3" size="25"/>
											<select name="floor.imgType3">
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
										</td>
										<td colspan="2" align="left">
											<input id="img3" name="imageFile3" type="file" size="25"/>
										</td>

									</tr>
									<tr>
										<td width="15%" align="right">
											4.图片名称:
										</td>
										<td align="left">
											<input type="text" name="floor.imgName4" id="imgName4" size="25"/>
											<select name="floor.imgType4">
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
										</td>
										<td colspan="2" align="left">
											<input id="img4" type="file" name="imageFile4" size="25"/>
										</td>

									</tr>
									<tr>
										<td width="15%" align="right">
											5.图片名称:
										</td>
										<td align="left">
											<input type="text" name="floor.imgName5" id="imgName5" size="25"/>
											<select name="floor.imgType5">
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
										</td>
										<td colspan="2" align="left">
											<input id="img5" type="file" name="imageFile5" size="25"/>
										</td>

									</tr>
									<tr>
										<td colspan="4" align="center">
											<input type="hidden" name="office.flag" value="1">
											<input type="submit" value="提交发布">
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
		</center>
		<script language="javascript">
 $("#discode").combotree({
    url:'',
    animate:true,
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
			
				
		
		
		</script>
	</body>
</html>