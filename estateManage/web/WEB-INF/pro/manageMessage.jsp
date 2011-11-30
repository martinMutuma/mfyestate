<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<title>生意转让管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/jqueryui/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/jqueryui/icon.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/jqueryui/icon.css">
	<script type="text/javascript" src="<%=basePath%>scripts/jquery-1.4.2.js"></script>
	<script type="text/javascript" src="<%=basePath%>scripts/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../scripts/pro/manageMessage.js"></script>
	<style type="text/css">
		<!--
		td {
			font-size: 10pt;
			color: #000000;
		}
		-->
	</style>
	</head>

	<body>
			<table width="100%" border="0" cellpadding="1" cellspacing="1">
				<tr>
					<td>
						地区：<input id="discode" name="discode" value="全  国"  style="width: 150px;"/>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;案源状态：
						<select name="auditingState" id="auditingState">
							<option value=""selected> 全部 </option>
							<option value="0"> 未审核 </option>
							<option value="1"> 已审核 </option>
							<option value="4"> 申请成交 </option>
							<option value="3"> 审核驳回 </option>
							<option value="5"> 成交通过 </option>
							<option value="7"> 成交驳回 </option>
						</select>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;会员类别：
				        <select name="tb.type" id="tbtype"  style="width: 120px">
				        	<option value=""selected> 全部 </option>
				            <option value="1" >经纪人</option>
				            <option value="2" >个人业主</option>
				            <option value="3" >公司业主</option>
							<option value="4" >开发商</option>
							<option value="5" >客户(需求方)</option>
							<option value="6" >银行</option>
							<option value="7" >贷款中介</option>
							<option value="8" >评估公司</option>
							<option value="9" >研究机构</option>
							<option value="10" >连锁企业</option>
							<option value="11" >其他</option>
				        </select>
				        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a id="searchid" href="javascript:onSearch()">查询</a>
				    </td>
				</tr>
				<tr>
					<td valign="top">
						<table id="rentgrid"></table>
					</td>
				</tr>
			</table>
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
   	},onClick:function(node){
   		$("#disname").val(node.text)
   	}
});
		</script>
	</body>
</html>
