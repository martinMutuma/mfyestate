<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'specials_image.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../resource/whole.css"/>
	<script type="text/javascript" src="../scripts/jquery-1.4.2.js"></script>
	<link rel="stylesheet" type="text/css" href="../resource/whole.css"/>
	<link rel="stylesheet" type="text/css" href="../css/jqueryui/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../css/jqueryui/icon.css">
	<link rel="stylesheet" type="text/css" href="../resource/specials_image.css"/>
	<script type="text/javascript" src="../scripts/jquery.easyui.min.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <body>
  	<div class="selectArea">
  		<form action="../special/saveImg.shtml" method="post" target="tf1">
  		<div class="title">
  			<table width="80%">
  				<tr>
  					<td align="left">已选择的图片：<input type="hidden" name="id" value="${special.id }"/></td>
  					<td align="right"><input type="submit"  value="保存"/></td>
  				</tr>
  			</table>
  		</div>
  		<div align="center" class="imgBody"><iframe name="if1" style="display: none"></iframe>
  			<img id="img1" src="../../estate/${imgOne }"/><input type="hidden" id="imgOne" name="imgOne" value="${imgOne }"/>
  			<img id="img2" class="img_split" src="../../estate/${imgTwo }"/><input type="hidden" id="imgTwo" name="imgTwo" value="${imgTwo }"/>
  			<img id="img3" class="img_split" src="../../estate/${imgThree }"/><input type="hidden" id="imgThree" name="imgThree" value="${imgThree }"/>
  			<img id="img4" class="img_split" src="../../estate/${imgFour }"/><br/><input type="hidden" id="imgFour" name="imgFour" value="${imgFour }"/>
  			<h4 style="color: red">双击图片删除该图片</h4>
  		</div>
  		</form>
  	</div>
	<div class="easyui-tabs"  plain="true" style="width:960px;height: 200px;margin-top: 10px;">
		<div title="效果图" style="padding:10px;" id="xg"></div>
		<div title="实景图" style="padding:10px;" id="sj"></div>
		<div title="周边配套" style="padding:10px;" id="zb"></div>
		<div title="样板间" style="padding:10px;" id="yb"></div>
		<div title="其他" style="padding:10px;" id="other"></div>
	</div>
  </body>
  <script type="text/javascript">
  var img1 = $("#imgOne").val();
  var img2 = $("#imgTwo").val();
  var img3 = $("#imgThree").val();
  var img4 = $("#imgFour").val(); 
  var imgAll = img1+img2+img3+img4;
  $(function(){
  	$.get("../special/getAllImg.shtml?id=${special.bulidingId}&t="+(new Date().getTime().toString(36)),function(resMes){
  		var ary = resMes.split(",");
  		for(var i = 0; i < ary.length; i++){
  			var temp = ary[i];
  			var tempAry = temp.split(":");
  			if(tempAry.length!=2)
  				continue;
  			var obj;
  			switch(parseInt(tempAry[0],10)){
  				case 1: obj = $("#xg");break;
  				case 2: obj = $("#sj");break;
  				case 3: obj = $("#zb");break;
  				case 4: obj = $("#yb");break;
  				case 6: obj = $("#other");break;
  			}
  			var imgObj = "<div style='width:200px;' align='center'><img width='200px' height='120px' src='../../estate/"+tempAry[1]+"' ";
  			if(i%4!=0)
  				imgObj += " class='img_split' ";
  			imgObj += " /><input onclick='checkImg(this,\""+tempAry[1]+"\")' type='checkbox'";
  			if(imgAll.indexOf(tempAry[1])!=-1)
  				imgObj += " checked='checked' ";
  			imgObj += "></div>";
  			obj.append(imgObj);
  		}
  	})
  })
  function checkImg(obj,url){
  	if(obj.checked == true){
		 if(img1 == ""){
		 	$("#imgOne").val(url);
		 	$("#img1").attr("src","../../estate/"+url);
		 	img1 = url;
		 	imgAll = img1+img2+img3+img4;
		 	return;
		 }
		 if(img2 == ""){
		 	$("#imgTwo").val(url);
		 	$("#img2").attr("src","../../estate/"+url);
		 	img2 = url;
		 	imgAll = img1+img2+img3+img4;
		 	return;
		 }
		 if(img3 == ""){
		 	$("#imgThree").val(url);
		 	$("#img3").attr("src","../../estate/"+url);
		 	img3 = url;
		 	imgAll = img1+img2+img3+img4;
		 	return;
		 }
		 if(img4 == ""){
		 	$("#imgFour").val(url);
		 	$("#img4").attr("src","../../estate/"+url);
		 	img4 = url;
		 	imgAll = img1+img2+img3+img4;
		 	return;
		 }
  	}else{
  		if(imgAll.indexOf(url)!=-1){
  			if(img1 == url){
  				$("#imgOne").val("");
		 		$("#img1").attr("src","");
		 		img1 = "";
			 	imgAll = img1+img2+img3+img4;
			 	return;
  			}
  			if(img2 == url){
  				$("#imgTwo").val("");
		 		$("#img2").attr("src","");
		 		img2 = "";
			 	imgAll = img1+img2+img3+img4;
			 	return;
  			}
  			if(img3 == url){
  				$("#imgThree").val("");
		 		$("#img3").attr("src","");
		 		img3 = "";
			 	imgAll = img1+img2+img3+img4;
			 	return;
  			}
  			if(img4 == url){
  				$("#imgFour").val("");
		 		$("#img4").attr("src","");
		 		img4 = "";
			 	imgAll = img1+img2+img3+img4;
			 	return;
  			}
  		}
  	}
  }
  
  function  operate(mes){
  	if(mes == "1"){
  		alert("保存成功");
  		parent.closeTab('${special.id }_img')
  	}
  }
  </script>
</html>
