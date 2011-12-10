<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>梦房园</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="resource/css/whole.css" type="text/css"></link>
	<link rel="stylesheet" type="text/css" href="resource/css/specials.css">
	<script type="text/javascript" src="resource/js/jquery-1.4.2.js" charset="utf-8"></script>
	<script type="text/javascript" src="resource/js/whole.js"></script>
	<script type="text/javascript" src="resource/js/special.js"></script>
  </head>
  
  <body>
  	<jsp:include page="head.jsp"/>
   	<div style="width: 100%;margin-top: 15px;" align="center">
   		<div class="whole_width">
   			<div class="head_top"></div>
   			<div class="head_body whole_body" align="center">
   			<h1><span class="xm_te">本期团购：</span>【${buliding.name }】${special.descr }</h1>
   			</div>
   			<div class="whole_body">
				<table width="956px" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td align="left" width="50%">
							<div class="info_left">
								<div class="info_left1">
									<span id="end_Time">距离报名结束时间还有：</span><br/>
									<span id="str_time"></span><br/><br/>
									<div class="specials2">${special.specialsMes }
									<a href="javascript:onjointuan();"><span class="specials_can"></span></a>
									</div>
									<div class="specials_zw">
									</div>
									团购专线: ${special.line }<br/>
									已有${special.joinCount }人参加,数量有限<br/>
								</div>
								<div class="info_left2">
								市场参考起价: ${special.avgPrice }元/平米 <br/>
								折后参考起价: ${special.minPrice }元/平米 <br/>
								梦房园专享折扣: ${special.specials }+梦房园会会员优惠
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
									<p><img src="resource/images/tuan/big-dou_te.jpg"/>&nbsp;${special.bulidDesc }</p>
								</div>
							</td>
						</tr>
				</table>   			
   			</div>
   			<div class="head_bottom"></div>
   			<div class="whole_width h_split ">
   				<div class="left_width">
   					<div class="left_width1 border_te">
   						<h3 align="left">最新动态</h3>
   					</div>
					<div class="left_width2 h_split border_te" align="left">
						<h5 align="center">除了最低折扣，还有梦房园网独家的优惠和无限的贴心服务！</h5>
						${special.information }
					</div>
   				</div>
   				<div class="right_width">
   					<div class="right_width">
   						<div class="right_width_title right_wt_te"><s:property value="#request.buliding.name"/></div>
   						<div class="right_width_title1 border_te" align="left">
   						开盘时间：<s:date name="#request.buliding.openDate" format="yyyy-MM-dd"/><br/>
						交房时间：<s:date name="#request.buliding.checkDate" format="yyyy-MM-dd"/><br/>
						绿 化 率：<s:property value="#request.buliding.greenRate"/>%<br/>
						容 积 率：<s:property value="#request.buliding.capacityRate"/><br/>
						开 发 商：<s:property value="#request.buliding.businessDevelopment"/><br/>
						装修情况：<s:property value="#request.buliding.fitConditionValue"/><br/>
						所在区域：<s:property value="#request.buliding.disname"/><br/>
						楼盘地址：<s:property value="#request.buliding.address"/><br/>
   						</div>
   					</div>
   					
   					<div class="right_width h_split" style="display: none">
   						<div class="right_width_title">往期团购<a href="#" class="right_margin1">更多</a></div>
   						<div class="right_width_title1" align="left">
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
   			<div style="margin-top: 10px;float:left;">
				<jsp:include page="copyright.jsp" />
		    </div>
   		</div>
   	</div>
  </body>
    <script type="text/javascript">
  var endTimes = '${special.endTime}';
  var flag = false;
  if(endTimes.length>0){
  	endTimes = replaceAll(endTimes,'-','/');
  	endTimes = replaceAll(endTimes,' ',',');
  }
  function show_time(){
	 var endtime=new Date(endTimes.substring(0,19));
	 var nowtime = new Date();
	 var leftsecond=parseInt((endtime.getTime()-nowtime.getTime())/1000);
	 d=parseInt(leftsecond/3600/24);
	 h=parseInt((leftsecond/3600)%24);
	 m=parseInt((leftsecond/60)%60);
	 s=parseInt(leftsecond%60);
	var c=new Date();
	// var q=((c.getMilliseconds())%10);
	 document.getElementById("str_time").innerHTML=d+"天"+h+"小时"+m+"分"+s+"秒";
	 if(leftsecond<=0){
	 	 flag = true;
	 	 document.getElementById("end_Time").style.display='none';
		 document.getElementById("str_time").innerHTML="很遗憾，活动已经结束啦！";
		 clearInterval(vod_show);
	 }  
 } 
	show_time();
	var vod_show;
	vod_show=setInterval(show_time,1000);
	function onjointuan(){
		if(flag)
		alert('活动已经结束啦！');
		else
		window.location.href="jointuan.shtml?id="+${special.id}+"&bid="+${buliding.id}+"&menuIndex=6";
	}
  </script>
</html>
