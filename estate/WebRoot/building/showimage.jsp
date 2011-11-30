<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
	<head>
		<title>图片查看</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="css/index.css" rel="stylesheet" type="text/css" />
		<link href="css/house.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="../resource/css/whole.css"
			type="text/css"></link>
		<script type="text/javascript" src="../resource/js/whole.js"></script>
		<script src="js/jquery-1.4a2.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="js/menu.js"></script>
		<script type="text/javascript" src="js/ymPrompt.js"></script>
		<script type="text/javascript" src="js/cpdlg.js"></script>
		<script type="text/javascript" src="js/jquery-1.2.6.pack.js"></script>
		<script type="text/javascript" src="js/detailImg.js"></script>
		<script type="text/javascript" src="js/building.js"></script>
		<script type="text/javascript" src="js/swith.js"></script>
		<script type="text/javascript" language="javascript">
function hv(Str){document.getElementById(Str).style.visibility="visible"}
function hh(Str){document.getElementById(Str).style.visibility="hidden"}
</script>
		
		<script type="text/javascript" language="javascript"
			src="js/common_top.js"></script>
		<!--[if ie 6]>
<style>
dl.kk_right{width:669px; float:left; margin-top:16px; text-align:left; overflow:hidden;}
</style>
<![endif]-->
		<style type="text/css">
.con {
	height: 430px;
	overflow: hidden;
	position: relative;
}

.con_list {
	position: relative
}
</style>

	</head>
	<body onload="changcss(<s:property value='type'/>);beginimg(1,'con_list','<s:property value='tpImage.id'/>');">
	<center>
    <!--主导航结束-->
    <jsp:include page="../head.jsp"></jsp:include>
  <!--head end-->
  <div class="l_loca">
    	<span class="left lo_le">您当前的位置：<a href="#">梦房园</a> <a href="#">楼盘信息</a> <s:property value="tpBulding.name"/></span>
        <span class="clear"></span>
    </div>
    <!--位置-->
    <!--楼盘信息-->
<div class="house_x">
    <div class="house_x_dt">
                <div class="xxxx_top">
                    <div class="left hs_tit">
                        <h1><s:property value="tpBulding.name"/></h1>
                        <p class="ico_xx">
                          <img src="images/ic2.gif" alt="优惠" title="优惠楼盘" />             </p>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="house_nav">
                    <div id="house_nav">
                        <a href="toBuidingInfo.shtml?id=<s:property value='tpBulding.id'/>" >楼盘主页</a> 
                        <a href="toBuidingInfo.shtml?id=<s:property value='tpBulding.id'/>#news" >最新动态</a> 
                        <a href="buildingimages.shtml?pid=<s:property value="tpBulding.id"/>&page=0&type=9"     class="nav_housOn" >图片看房</a> 
                        <a href="housetype.shtml?pid=<s:property value="tpBulding.id"/>&page=0"  >户型</a> 
                        <a href="toBuidingInfo.shtml?id=<s:property value='tpBulding.id'/>#knav1"  >楼盘详情</a> 
                        <a href="toBuidingInfo.shtml?id=<s:property value='tpBulding.id'/>#kn1" >生活配套</a> 
                    </div>
                </div>
       		 </div>
    <div class="w960">
            <!--图片看房-->
            <dl class="picsee w958 seep">
            	<dt class="w915">
                	<ul id="imgTitle">        
                	                        <s:if test='#categoryNum !=0'>
                                        	<li class='kkOff' id="li9"><a href="showimage.shtml?pid=<s:property value='tpBulding.id'/>&type=9">全部户型图(<s:property value="categoryNum"/>)</a></li>  
                                        	</s:if>
                                        	<s:if test='#effectNum ==0'>
                                        	<li class="kkOff" id="li1"><a href="showimage.shtml?pid=<s:property value='tpBulding.id'/>&type=1">效果图(<s:property value="effectNum"/>)</a></li>    
                                        	</s:if>   
                                        	<s:if test='#liveActionNum ==0'>            
                                        	<li class="kkOff" id="li2"><a href="showimage.shtml?pid=<s:property value='tpBulding.id'/>&type=2">实景图(<s:property value="liveActionNum"/>)</a></li>                   
                                        	</s:if>
                                        	<s:if test='#regionalMatchingNum ==0'>    
                                        	<li class="kkOff" id="li3"><a href="showimage.shtml?pid=<s:property value='tpBulding.id'/>&type=3">周边配套(<s:property value="regionalMatchingNum"/>)</a></li>                  
                                        	</s:if>
                                        	<s:if test='#prototypeRoomNum ==0'>   
                                        	<li class="kkOff" id="li4"><a href="showimage.shtml?pid=<s:property value='tpBulding.id'/>&type=4">样板间(<s:property value="prototypeRoomNum"/>)</a></li>              
                                        	</s:if>
                                        	<s:if test='#otherNum ==0'>   
                                        	<li class="kkOff" id="li6"><a href="showimage.shtml?pid=<s:property value='tpBulding.id'/>&type=6">其他(<s:property value="otherNum"/>)</a></li>                 
                                            </s:if>
                    </ul>
               </dt>
                <dd class="w915">
                
                	<div class="pic_se" id="#seehcon1">
                       <s:iterator value="selectedUnitList" status="sta">
                         <div class="left w660" id="aimg<s:property value='#sta.index'/>1" >
                        	<div class="xsee_pic xx_bott"><img src="../<s:property value='imgUrl'/>" title="<s:property value='imgName'/>" alt="<s:property value='imgName'/>"/></div>
                            <div class="sce_see tL left">
                                <h3 class="f14 padl18">图片说明：</h3>
                                <p class="l20 c66">&nbsp;&nbsp;&nbsp;&nbsp;<s:property value='desr'/></p>
                            </div>                          
                        </div> 
                         </s:iterator>   
                         <s:if test="null!=tpImage">
                          <div class="left w660" id="aimg"  >
                          <div class="xsee_pic xx_bott" ><img src="../<s:property value='tpImage.imgUrl'/>" title="<s:property value='tpImage.imgName'/>" alt="<s:property value='tpImage.imgName'/>"/></div>
                            <div class="sce_see tL left">
                                <h3 class="f14 padl18">图片说明：</h3>
                                <p class="l20 c66">&nbsp;&nbsp;&nbsp;&nbsp;<s:property value='tpImage.desr'/></p>
                            </div>   
                          </div>  
                          </s:if>  
                        <div class="right w224">
                        	<span class="see_top" id="prev" style="cursor:pointer" onclick="prev('con','con_list')"><img src="images/see_top.gif"/></span>
                            <div class="con" id="con">
                                <div class="con_list" id="con_list">
                                 <ul class="see_img">
                                 <s:iterator value="selectedUnitList" status="sta">
                                    <li><a href="javascript:changeImg(1,<s:property value='#sta.index'/>,'con_list')" ><img src="../<s:property value='imgUrl'/>" title="<s:property value='imgName'/>" alt="<s:property value='imgName'/>"/></a></li>
                                  </s:iterator>
                                </ul>
                                </div>
                            </div>
                            
                            <span class="see_top" id="next" style="cursor:default;" onclick="next('con','con_list')"><img src="images/see_foot01.gif" /></span>
                        </div>
                        <span class="clear"></span>
                    </div>
                </dd>
            </dl>
	</div>
</div>
    			<div style="padding-top: 15px;text-algin:center;">
		<jsp:include page="../copyright.jsp"/>
		</div>
</center>  
</body>
</html>
