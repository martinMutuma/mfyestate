<%@ page language="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>修改工业地产信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
     <link rel="stylesheet" href="<%=basePath%>resource/css/global.css" type="text/css"></link>
	<script type="text/javascript" src="<%=basePath%>pro/modifyindustrydemand.js"></script>
	<link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/default/easyui.css">
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
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td valign="top" align="left">
							  <div class="position" align="left"><label>您所在的位置：</label><a href="../home.shtml">梦房园</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="../mem/baseinfo_mainPage.shtml">会员中心</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a href="../pro/manageindustrydemand.jsp?menuCls=14">工业地产需求管理</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;修改需求</div>
					<div class="info_top"></div>
					<div class="info_mid">
							 <table border="0" cellpadding="0" cellspacing="0" width="760px">
					                	<tr>
							             <td valign="top" align="center" >
		  <form name="form" method="post" action="../officeneed/addNeed.shtml" onsubmit="return checkneed()">
		  
            <table width="710px;" id="buildingrent" border="0" cellpadding="1" cellspacing="1" >
            <tr><td align="center" colspan="2"><b>修改工业地产需求信息 </b></td></tr>
                <tr>
												<th align="left" colspan="2" class="title_info1">
													一、填写基本信息（<font color="red">*</font> 为必填项）
												</th>
						</tr>
              <tr>
                <td align="right" ><font color="red" >*</font>租售:</td>
                <td>
                    <select name="need.flag">
                       <option value="2" ${need.flag eq 2?'selected' :''}>求购</option>
                       <option value="1" ${need.flag eq 1?'selected' :''}>求租</option>
                    </select>
                </td>
              </tr>
              <tr>
                <td align="right"><font color="red">*</font>省/市/区县:</td>
               <td align="left">
					<input   value="${need.disname}" id="showdistrict" style="width: 150px;"/>
					<input type="hidden" name="need.disname" id="disname" value="${need.disname}"/>
					<input type="hidden" name="need.district" id="district" value="${need.district}"/>
				</td>
              </tr>
                <tr>
                 <td align="right"> <font color="red">*</font>建筑面积:</td>
                <td >
                   <input type="text"  name="need.minArea" id="minArea" value="${need.minArea==0.0?'':need.minArea}" onkeyup="isNum(this)" size="10"/>-<input  id="maxArea" onkeyup="isNum(this)" name="need.maxArea" value="${need.maxArea==0.0?'':need.maxArea}"  type="text" size="10"/>㎡
                </td>
              </tr>
              <tr>
                <td align="right"><font color="red">*</font>年租金:</td>
                <td>
                      <input type="text" name="need.minPrice" id="minPrice"  value="${need.minPrice==0.0?'':need.minPrice}" onkeyup="isNum(this)"  size="10"/>-<input  name="need.maxPrice" id="maxPrice"  onkeyup="isNum(this)" value="${need.maxPrice==0.0?'':need.maxPrice}"  type="text" size="10"/>万元/年
                </td>
              </tr>
              <tr>
                <td align="right"><font color="red" >*</font>需求标题:</td>
                <td >
                  <input  type="text" name="need.title" value="${need.title}" id="title" size="40">
               </td>
              </tr>
              <tr>
											<th align="left" colspan="2" class="title_info1" valign="bottom">
													二、填写楼盘详细信息
												</th>
												</tr>
                <tr>
                <td align="right">种类:</td>
                <td >
                    <select name="need.category"><option ${need.category eq 1?'selected' :''} value="1">厂房</option>
                      <option value="2" ${need.category eq 2?'selected' :''}>仓库</option>
                      <option value="3" ${need.category eq 3?'selected' :''}>土地</option>
                      <option value="4" ${need.category eq 4?'selected' :''}>研发大楼</option>
                        <option value="5" ${need.category eq 5?'selected' :''}>其他</option>
                    </select>
                </td>
              </tr>
              <tr>
												<td align="right">
														地址:
												</td>
												<td>
														<input type="text" name="need.address"
															value="${need.address}" id="address" size="35" />
														&nbsp;临近&nbsp;
														<input name="need.nearAddress" id="nearAddress"  value="${need.nearAddress}"
															type="text" size="35" />
												</td>
											</tr>
              
              <tr>
                <td align="right">需求描述:</td>
                <td id="filter_ke" >
                  <textarea  cols="60" rows="20" name="need.descr" id="content">
                     ${need.descr}
                  </textarea>
                </td>
              </tr>
           
              <tr><td colspan="2" align="center"><input type="submit" value="提交审核">
               <input type="hidden" name="need.needType" value="3"><!--  工业地产需求 -->
                <input type="hidden" name="need.id" value="${need.id}"> 
                <input type="hidden"  name="type" value="3"/>
               <input type="hidden" name="need.auditing" value="0"><!-- 审核状态 未审核 -->
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
   		$("#disname").val(node.text)
   	    $("#district").val(node.id);
   	}
});
				
		 $("#buildingrent td").not($("#filter_ke td")).addClass("info_td1");
		$("#buildingrent tr").find("td:even").not($("#filter_ke td")).addClass("title_info2");
		$("#buildingrent tr").find("td:odd").not($("#filter_ke td")).css("padding-left","5px");    
		
		</script>
</html>

