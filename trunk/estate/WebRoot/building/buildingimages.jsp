<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>图片看房</title>

		<link href="css/index.css" rel="stylesheet" type="text/css" />
		<link href="css/house.css" rel="stylesheet" type="text/css" />
		<link href="css/style.css" type="text/css" rel="stylesheet" />
		<link href="css/ymPrompt.css" rel="stylesheet" type="text/css" />
		<link href="css/common.css" type="text/css" rel="stylesheet" />
		<link href="css/cpdlg.css" type="text/css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="../news/css/front.css" />
		<link rel="stylesheet" href="../resource/css/whole.css"
			type="text/css"></link>
		<script type="text/javascript" src="../resource/js/whole.js"></script>
		<script src="js/jquery-1.4a2.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="js/menu.js"></script>
		<script type="text/javascript" src="js/ymPrompt.js"></script>
		<script type="text/javascript" src="js/cpdlg.js"></script>
		<script type="text/javascript" src="js/building.js"></script>
		<script type="text/javascript" language="javascript">
function hv(Str){document.getElementById(Str).style.visibility="visible"}
function hh(Str){document.getElementById(Str).style.visibility="hidden"}
</script>
		<script type="text/javascript" src="js/swith.js"></script>
		<script type="text/javascript" language="javascript"
			src="js/common_top.js"></script>
	</head>
	<body onload="changcss(<s:property value='type'/>)">
	<center>
    <!--主导航结束-->
  <!--head end-->
  <jsp:include page="../head.jsp"></jsp:include>
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
  <!--楼盘导航-->
    <div class="w960 tL">
            <div class="hh_left bdfa">
            	<!--图片看房-->
                <dl class="picsee mad_L19 w669">
            	<dt>
                	<ul id="imgTitle">
                                        	<li class='kkOff' id="li9"><a href="buildingimages.shtml?pid=<s:property value="tpBulding.id"/>&page=0&type=9">全部户型图(<s:property value="categoryNum"/>)</a></li>  
                                        	<li class="kkOff" id="li1"><a href="buildingimages.shtml?pid=<s:property value="tpBulding.id"/>&page=0&type=1">效果图(<s:property value="effectNum"/>)</a></li>                   
                                        	<li class="kkOff" id="li2"><a href="buildingimages.shtml?pid=<s:property value="tpBulding.id"/>&page=0&type=2">实景图(<s:property value="liveActionNum"/>)</a></li>                   
                                        	<li class="kkOff" id="li3"><a href="buildingimages.shtml?pid=<s:property value="tpBulding.id"/>&page=0&type=3">周边配套(<s:property value="regionalMatchingNum"/>)</a></li>                  
                                        	<li class="kkOff" id="li4"><a href="buildingimages.shtml?pid=<s:property value="tpBulding.id"/>&page=0&type=4">样板间(<s:property value="prototypeRoomNum"/>)</a></li>              
                                        	<li class="kkOff" id="li6"><a href="buildingimages.shtml?pid=<s:property value="tpBulding.id"/>&page=0&type=6">其他(<s:property value="otherNum"/>)</a></li>                 
                    </ul>
                </dt>
                <dd>
                	<div class="pic_se" id="seehcon1" > <!--全部图片-->
                        <ul>
                          <s:iterator value="selectedUnitList">
                            <li>
                                <span class="hosee_pic"><a href="showimage.shtml?pid=<s:property value='tpBulding.id'/>&type=9&imgid=<s:property value='id'/>" target="_blank" title="<s:property value='imgName'/>"><img src="../<s:property value='imgUrl'/>" title="<s:property value='imgName'/>" alt="<s:property value='imgName'/>"/></a></span>
                                <span class="hsee_tit"><a href="showimage.shtml?pid=<s:property value='tpBulding.id'/>&type=9&imgid=<s:property value='id'/>" target="_blank" title="<s:property value='imgName'/>"> <s:property value="imgName" /></a></span>
                                <span class="clear"></span>
                            </li>
                            </s:iterator>
                                </ul>
                        <div class="manu mard32"> 	<div class="pg-3">
									共&nbsp;
									<s:property value="total" />
									&nbsp;条&nbsp;&nbsp;
									<s:property value="page" />
									/
									<s:property value='lastPage' />
									&nbsp;页 &nbsp;&nbsp;&nbsp;

									<s:if test="page==1">
										<a>上一页</a>
									</s:if>
									<s:else>
										<a	href="javascript:searchFormSubmit(<s:property value='page-1'/>)">上一页</a>
									</s:else>
									<s:if test="page==lastPage">
										<a>下一页</a>
									</s:if>
									<s:else>
										<a
											href="javascript:searchFormSubmit(<s:property value='page+1'/>)">下一页</a>
									</s:else>



								</div>          </div>
                    </div>  <!--全部图片-->                    
                    
                </dd>
            </dl>
              	<!--图片看房-->
                <!--报名-->


<div class="h_hR"></div>
<dl class="apply" id="tuan1">
    <dt>
        <div class="ap_t fbo14" id="tuan">
            <span class="fp_left"> <s:property value="tpBulding.name"/> 免费看房团</span>
            <span class="fp_right"></span>
        </div>
        <span class="tuan_j"></span>
    </dt>
    <dd>
    <div class="join_buy">
            <div class="jan"><img src="images/lis.gif" /> 大家一起组团旅游看房</div>
            <form id="showingsForm" name="showingsForm" action="showings.shtml" method="post" class="j_form" target="tempF">
                <div class="div"><label><font class="C0">*</font> 姓名：</label><input id="tname" name="tpShowings.name" type="text" class="j_butt01" /> <input name="tpShowings.sex" type="radio" checked="checked" value="1"/> 先生 <input name="tpShowings.sex" type="radio" value="2"/> 女士 <span id="joinTuanTips_name" style="color:red; font-weight:bold;"></span></div>
                <div class="div"><label><font class="C0">*</font> 手机号码：</label><input id="ttel" name="tpShowings.tel" type="text" class="j_butt" /> <font class="c66"><span id="joinTuanTips_tel" style="color:red; font-weight:bold;">(请填写真实手机，方便置业顾问联系您)</span></font></div>
                <div class="div">
                    <div class="left"><label>电子邮箱：</label><input id="temail" type="text" class="j_butt" /><br /><span id="joinTuanTips_email" style="color:red; font-weight:bold;"></span><span id="submitBt"><input id="joinTuanBt" name="" type="button" class="j_bu" onclick="joinTuan($('#tname').val(),$('#ttel').val(),$('#temail').val())" value =""/></span></div>
                     <input type="hidden" name="tpShowings.pid" value='<s:property value="tpBulding.id"/>'/>
                     <input type="hidden" name="tpShowings.pname" value='<s:property value="tpBulding.name"/>'/>
                     <input type="hidden" id="newshowingsnum" value='<s:property value="tpBulding.showingsnum"/>'/>
                    <div class="left tit">更多优惠及服务请致电置业顾问<br />
                    <span>
                    ----------</span></div>
                </div>
            </form>
            <div id="joinTuanTips" style="padding-left:20px; color:#F00; font-weight:bold;"></div>
        </div>
        <div class="hui_con">
            <p class="hcn_tit C0">梦房园服务：</p>
            <p>置业顾问专业服务</p>
            <p>免费专车接机</p>
            <p>免费旅游看房</p>
            <p class="pad_t23"><font class="C0 f30"><span id= "showingsnum3"><s:property value="tpBulding.showingsnum"/></span></font>人报名</p>
        </div>
    </dd>
  </dl>

<div class="h_hR"></div>
<div class="yqts_box" id="tuan2" style="clear: both; display: none;">
	<h3>参加看房团成功</h3>
    <div class="yqts all366C f14">
		<span class="tit"><img src="images/accept.png" />谢谢您的参与，您已成功报名参加了<span style="color:#F30"><s:property value="tpBulding.name"/></span>的免费看房团！置业顾问将在第一时间内和您联系。</span>
        <div class="h_hR"></div>
        <div class="pad_t"><input type="button" value=" 关 闭 " class="cur" onclick="checkTuan()"/></div>
		<div class="ts_gb"><a class="cf30" style="cursor:pointer" onclick="checkTuan()">X关闭</a></div>
  	</div>
</div>
           <!--报名-->
 
            </div>
            <div class="hh_right madt">
              <ul class="bdfa hhrig_li">
                    <li class="hh_f04 all366C"><a href="attention.shtml?id=<s:property value='tpBulding.id'/>&attentioncount=<s:property value="tpBulding.attentionNum"/>" title="关注楼盘" rel="nofollow"  target="tempF">关注这个楼盘</a>  <iframe name="tempF" style="display: none"></iframe></li>
            </ul>
            <div class="bdfa hhrig_t madt">
                    <span class="hot_sale hk_bg"></span>
                    <div><font class="C0 f30"><s:property value="tpBulding.showingsnum"/></font>人报名&nbsp;&nbsp;&nbsp;&nbsp;<a href="#tuan"><img src="images/jia_tuan.gif" /></a></div>
                </div>            
           
      <!--浏览过楼盘结束-->
  
            </div>
          <div class="clear"></div>
	</div>
</div>
 <div style="padding-top: 15px;text-algin:center;">
		<jsp:include page="../copyright.jsp"/>
		</div>
     </center>      
</body>
</html>
