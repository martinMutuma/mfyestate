<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../resource/specials.css">
	<script type="text/javascript" src="../scripts/jquery-1.4.2.js"></script>
	<script type="text/javascript" src="../scripts/Groject.ImageSwitch.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		/*图片切换*/
		.img-swith-main {
			position: relative;
			font-family: Arial, Verdana;
			font-size: 12px;
			width: 470px;
			height: 200px;
			background-color: #f3f3f3;
			border: 1px solid #E4E4E4;
			z-index: -9999;
		}
		
		.img-switch {
			width: 100%;
			height: 100%;
			overflow: hidden;
		}
		
		.img-switch ul {
			margin: 0px;
			padding: 0px;
			list-style-type: none;
			overflow: hidden;
			width: 100%;
			height: 100%;
		}
		
		.img-switch ul li {
			float: left;
			width: 100%;
			height: 100%;
			display: none;
		}
		
		.img-switch ul li img {
			width: 100%;
			height: 100%;
			border: 0px;
		}
		
		.img-switch-clear {
			clear: both;
		}
		
		.img-switch-index {
			position: absolute;
			bottom: 6px;
			right: 6px;
			overflow: hidden;
		}
		
		.img-switch-index ul {
			margin: 0px;
			padding: 0px;
			list-style-type: none;
		}
		
		.img-switch-index ul li {
			padding: 2px;
			border: 1px solid #c0c0c0;
			margin-right: 5px;
			float: left;
			font-weight: bold;
			cursor: pointer;
			color: Black;
			padding-left: 6px;
			padding-right: 6px;
		}
		/*图片切换end*/
				
	</style>

  </head>
  
  <body>
   	<div class="whole_width">
   		<div class="whole_width">
   			<div class="head_top"></div>
   			<div class="head_body whole_body" align="center">
   			<h1><span class="xm">本期团购：</span>【${buliding.name }】${special.descr }</h1>
   			</div>
   			<div class="whole_body">
				<table width="956px" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td align="left" width="50%">
							<div class="info_left">
								<div class="info_left1">
									距离报名结束时间还有：<br/>
									天时分秒<br/><br/>
									<div class="specials">${special.specialsMes }
									<span class="specials_can"></span>
									</div>
									<div class="specials_zw">
									</div>
									团购专线: ${special.line }<br/>
									已有${special.joinCount }人参加,数量有限<br/>
								</div>
								<div class="info_left2">
								市场参考起价: ${special.avgPrice }元/平米 <br/>
								折后参考起价: ${special.minPrice }元/平米 <br/>
								我房专享折扣: ${special.specials }+我房会会员优惠
								<input type="hidden" id="imgOne" value="${special.imgOne }" />
								<input type="hidden" id="imgTwo" value="${special.imgTwo }"/>
								<input type="hidden" id="imgThree" value="${special.imgThree }" />
								<input type="hidden" id="imgFour" value="${special.imgFour }" />
								</div>
							</div>
						</td>
							<td valign="top" >
								<div class='img-swith-main'>
											<div class="img-switch">
												<ul id="IMG_UL_LIST_1" >
												</ul>
											</div>
											<div class='img-switch-index'>
												<ul id="IMG_INDEX_UL_LIST_1">
												</ul>
											</div>
											<div class='img-switch-clear'>
											</div>
								</div>
								<div>
									<p><img src="../resource/images/big-dou.jpg"/>&nbsp;${special.bulidDesc }</p>
								</div>
							</td>
						</tr>
				</table>   			
   			</div>
   			<div class="head_bottom"></div>
   			<div class="whole_width h_split">
   				<div class="left_width">
   					<div class="left_width1">
   						<h3>最新报表</h3>
   					</div>
					<div class="left_width2 h_split">
						<h5 align="center">除了最低折扣，还有我房网独家的优惠和无限的贴心服务！</h5>
						${special.information }
					</div>
   				</div>
   				<div class="right_width">
   					<div class="right_width">
   						<div class="right_width_title">sdfs<a href="#" class="right_margin1">楼盘相册</a></div>
   						<div class="right_width_title1">
   						开盘时间：<s:date name="buliding.openDate" format="yyyy-MM-dd"/><br/>
						交房时间：<s:date name="buliding.checkDate" format="yyyy-MM-dd"/><br/>
						绿 化 率：<s:property value="buliding.greenRate"/>%<br/>
						容 积 率：<s:property value="buliding.capacityRate"/><br/>
						开 发 商：<s:property value="buliding.businessDevelopment"/><br/>
						装修情况：<s:property value="buliding.fitConditionValue"/><br/>
						所在区域：<s:property value="buliding.disname"/><br/>
						楼盘地址：<s:property value="buliding.address"/><br/>
   						</div>
   					</div>
   					
   					<div class="right_width h_split">
   						<div class="right_width_title">往期团购<a href="#" class="right_margin1">更多</a></div>
   						<div class="right_width_title1">
   						开盘时间：2010-10-1<br/>
						交房时间：2011-5-30<br/>
						绿 化 率：52%<br/>
						容 积 率：1.5<br/>
						开 发 商：海南大印经典<br/>置业有限公司<br/>
						装修情况：毛坯<br/>
						所在区域：海南-琼海<br/>
						楼盘地址：琼海市嘉积镇<br/>迎宾大道银海<br/>
   						</div>
   					</div>
   				</div>
   			</div>
   		</div>
   	</div>
  </body>
  <script type="text/javascript">
/*  	var imgArea = $("#imgArea");
  	var imgCount = 4;
  	var imgAry;
  	function imgSwitch(index){
  		if(index>imgCount)
  			index = 1;
  		var type;
  		var img;
  		switch(index){
  			case 1:type = "FlyIn";img=imgAry[index];break;
  			case 2:type = "FlipOut";img=imgAry[index];break;
  			case 3:type = "SingleDoor";img=imgAry[index];break;
  			case 4:type = "ScrollIn";img=imgAry[index];break;
  		}
  		imgArea.ImageSwitch({Type:type, NewImage:'../../estate/'+img,Speed: 2000});
  		index++;
  		setTimeout("imgSwitch("+index+")",5000);
  	}
	$.get("../special/getImgList.shtml?id=1&t="+(new Date().getTime().toString(36)),function(mes){
		imgAry = mes.split(",")
		imgCount = imgAry.length;
		for(var i = 0; i<imgCount; i++){
			$("#IMG_UL_LIST_1").append("<li><img src='../../estate/"+imgAry[i]+"'/></li>");
			if(i==0)
				$("#IMG_INDEX_UL_LIST_1").append('<li id="li_index_default" style="background-color: #aaa;">01</li>');
			else
				$("#IMG_INDEX_UL_LIST_1").append('<li>0'+(i+1)+'</li>');
		}
		InitSwitchObj();
	})  	*/
	
function InitSwitchObj() {
	IMGLIST = $("#IMG_UL_LIST_1");
	IMGINDEX = $("#IMG_INDEX_UL_LIST_1");
	MAXINDEX = IMGLIST.find("li").length;
	currIndex = 0;
	currImgIndex = IMGINDEX.find("li:eq(" + currIndex + ")");
	currImgLi = IMGLIST.find("li:eq(" + currIndex + ")");
	currImgLi.show();
	interValTime = 3000;
	fadeInTime = 800;
	fadeOutTime = 1000;
	ImageAutoSwitch();
	ImageManualSwitch();
	ImageStopSwitch();
}
        //執行時間
var interValTime = 0;
        //下一張圖片顯示時間
var fadeInTime = 0;
        //上一張圖片的消失時間
var fadeOutTime = 0;
        //保存當前圖片定時的對象
var imageTimer = null;
        //當前的索引
var currIndex = null;
        //當前圖片的所以
var currImgIndex = null;
        //當前圖片
var currImgLi = null;
        //記錄需要切換的圖片集合
var IMGLIST = null;
        //記錄需要切換的圖片集合的索引。
var IMGINDEX = null;
        //最大圖片個數
var MAXINDEX = null;
        //自動定時切換。
function ImageAutoSwitch() {
	if (imageTimer != null) {
		clearInterval(imageTimer);
	}
	imageTimer = setInterval("IntervalImage()", interValTime);
}
        //手動切換圖片
function ImageManualSwitch() {
	IMGINDEX.find("li").each(function (i) {
		$(this).hover(function () {
			if (imageTimer != null) {
				clearInterval(imageTimer);
			}
			currIndex = i;
			ImageSwitchChange();
		}, function () {
			ImageAutoSwitch();
		});
	});
}
        //鼠標放到圖片上的換，停止切換
function ImageStopSwitch() {
	IMGLIST.find("li").each(function () {
		$(this).hover(function () {
			if (imageTimer != null) {
				clearInterval(imageTimer);
			}
		}, function () {
			ImageAutoSwitch();
		});
	});
}
        //自动切换图片
function IntervalImage() {
	currIndex = parseFloat(currIndex);
	currIndex = currIndex + 1;
            //如果切換到最大數量的時候則從頭開始
	if (currIndex >= MAXINDEX) {
		currIndex = 0;
	}
            //將原來的現實圖片索引的背景透明
	ImageSwitchChange();
}
        //切換圖片的時候，響應的圖片要實現漸變效果
function ImageSwitchChange() {
	if (currImgIndex != null) {
		currImgIndex.css({"background-color":"transparent"});
	}
	currImgIndex = IMGINDEX.find("li:eq(" + currIndex + ")");
	imgLi = IMGLIST.find("li:eq(" + currIndex + ")");
	currImgIndex.css({"background-color":"#999999"});
	if (currImgLi != null) {
		currImgLi.fadeOut(fadeOutTime, function () {
			imgLi.fadeIn(fadeInTime);
		});
	}
	currImgLi = imgLi;
}
	
	
var imgAry;
var imgAll = $("#imgOne").val()+","+$("#imgTwo").val()+","+$("#imgThree").val()+","+$("#imgFour").val();
imgAry = imgAll.split(",");
var imgCount = imgAry.length;
for (var i = 0; i < imgCount; i++) {
	if(""==imgAry[i])
		continue;
	$("#IMG_UL_LIST_1").append("<li><img src='../../estate/" + imgAry[i] + "'/></li>");
	if (i == 0) {
		$("#IMG_INDEX_UL_LIST_1").append("<li id=\"li_index_default\" style=\"background-color: #aaa;\">01</li>");
	} else {
		$("#IMG_INDEX_UL_LIST_1").append("<li>0" + (i + 1) + "</li>");
	}
}
if(",,,"!=imgAll)
	InitSwitchObj();
  </script>
</html>
