<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>项目与码表关系维护</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link href="<%=basePath%>images/syscome.files/Admin.css"
			rel=stylesheet />
		<SCRIPT type="text/javascript"
			src="<%=basePath%>scripts/jquery-1.4.2.js"></SCRIPT>
		<SCRIPT type="text/javascript" src="<%=basePath%>scripts/global.js"></SCRIPT>
		<STYLE type=text/css>
.STYLE1 {
	FONT-WEIGHT: bold;
	COLOR: #0099ff
}

th {
	border-bottom: 1px solid black;
}
</STYLE>
		<SCRIPT type="text/javascript">
		
	function showInput(id,obj) {
	    if(obj.checked == true){
	      document.getElementById("orderNum"+id).style.display="block";
	    }
	    else{
	      document.getElementById("orderNum"+id).style.display="none";
	    }
	
   }
   
   	function checkover(){
   	
	var objs = document.getElementsByName("checkbox");
	var num = 0;
	var ids = "0";
	var orderNums = "0";
	for(var i = 0; i < objs.length; i++){
		if(objs[i].checked){
		   if(objs[i].value=="on"){
		     continue;
		   }
			num++;
			ids += ","+objs[i].value;
			var orderN = document.getElementById("orderNum"+objs[i].value).value;
			if(orderN==""){
			  alert("请将所选项的序号填完整！");
			  return;
			}else{
			 orderNums+=","+orderN;
			}
		}
	}
	if(num ==0){
		return;
	}
	else{
	    var proId = document.getElementById("tsProId").value;
		window.location.href='pro_maintain.shtml?ids='+ids+"&orderNums="+orderNums+"&proId="+proId;
	}
   }
   
   
      function ischecked(){
		  var proIds = document.getElementById("proIds").value;
		  var orderNs = document.getElementById("orderNs").value;
		  
		  var count=0;
		  var checkboxlist = document.getElementsByName("checkbox");
		
		  var Stringids = proIds.split(",");
		  var orderNums = orderNs.split(",");
		  for(var i = 1; i < checkboxlist.length; i++){
		  	 	for(var j = 0; j < Stringids.length; j++){
		  			if(checkboxlist[i].value == Stringids[j]){
		  				checkboxlist[i].checked = true;
		  			    document.getElementById("orderNum"+Stringids[j]).style.display="block";
		  			     document.getElementById("orderNum"+Stringids[j]).value=orderNums[j];
		  			}
		  		}
		  } 
		 
		   // 是否全选
		  for(var i = 1; i < checkboxlist.length; i++)
		  {
		  if(checkboxlist[i].checked)
		  {
		   count=count+1;
		  }
		  
		  }
		
		  if(count==checkboxlist.length-1)
		  {
		  document.getElementById("checkAll").checked=true;
		  } 
     }
   
   
	</script>
	</head>

	<body onload="ischecked();">
		<table cellspacing="1" cellpadding="3" width="95%" align="center"
			bgcolor="#6ab6b6" border="0">
			<thead>
				<tr>
					<th colspan="3" height="24">
						项目
						<font color="#aa0000">${tsPro.name}</font> 维护
						<input type="hidden" id="tsProId" value=${tsPro.id}>
						<input type="hidden" id="proIds" value=${proIds}>
						<input type="hidden" id="orderNs" value=${orderNs}>
					</th>
					<th>
						<a href="javascript:checkover()">确认</a>|
						<a href="javascript:history.go(-1)">返回</a>
					</th>
				</tr>
				<tr>
					<th height="24" width="5%"
						style="padding-left: 0px; text-align: center;" align="center">
						<input id="checkAll" name="checkbox" type="checkbox" />
					</th>
					<th height="24" width="35%">
						名称
					</th>
					<th height="24" width="30%">
						编码
					</th>
					<th height="24" width="30%">
						序号
					</th>
				</tr>
			</thead>
			<tbody id="contentList">
				<s:iterator value="definationList">
					<tr style="background-color: #eafefe">
						<td align="center">
							<input name="checkbox" type="checkbox"
								id='checkbox<s:property value="id"/>'
								value="<s:property value='id'/>"
								onclick='showInput("<s:property value="id"/>",this)' />
						</td>
						<td>
							<s:property value="name" />
						</td>
						<td>
							<s:property value="code" />
						</td>
						<td>
							<input maxlength="3" name="orderNum"
								id='orderNum<s:property value="id"/>' value=""
								style="display: none"
								onkeyup="this.value=this.value.replace(/\D/g,'')">
						</td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</body>


</html>
