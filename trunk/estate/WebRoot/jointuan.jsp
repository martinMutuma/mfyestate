<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="resource/css/whole.css" type="text/css"></link>
	<link rel="stylesheet" type="text/css" href="resource/css/specials.css">
	<link rel="stylesheet" type="text/css" href="resource/css/common.css">
	<script type="text/javascript" src="resource/js/jquery-1.4.2.js" charset="utf-8"></script>
	<script type="text/javascript" src="resource/js/whole.js"></script>
	<script type="text/javascript" src="resource/js/special.js"></script>
  </head>

  <body>
  	<jsp:include page="head.jsp"/>
   	<div style="width: 100%;margin-top: 15px;" align="center">
   		<div class="whole_width">
   			<!--位置-->
    <div class="cusjo_wz">
    	<div class="left tuanwz c66 all666">您当前的位置：<a href="#">梦房园</a> > <a href="#">新盘团购</a></div>
    </div>

    <!--位置-->
    <div class="w960" style="border: 0px black solid;">
    	<div class="new-appli" style="float: left;border: 0px red solid;width: 700">
        	<div class="custo-mers">
            	<div class="bao-bg">
                	<strong class="f24 cf60">立即报名，取得团购资格！<span class="cf0">（免费）</span></strong>
                    <p class="f14">请完整填写以下资料，团购成功后梦房园将发送短信到您的手机上。</p>
                </div>
                <div class="cus-form">
                	<div class="form-top"></div>
                    <div class="form-cen">
                    	<form name="form" id="form" action="tpPerson/saveTpSpe.shtml"  onsubmit="return checform()"  method="post" class="padl79">
                        	<p><label>姓&nbsp;&nbsp;&nbsp;&nbsp;名：</label><input name="tpSpePerson.name"  id="name" type="text" onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,'')"  />&nbsp;&nbsp;<span id="nameTips">请输入您的真实姓名，方便报名确认</span></p>
                            <p><label>性&nbsp;&nbsp;&nbsp;&nbsp;别：</label><span class="left xuan-dan"><input name="tpSpePerson.sex" type="radio" value="1" checked="checked" /> 男 <input name="tpSpePerson.sex" type="radio" value="2" /> 女</span></p>
                            <p class="clear"><label>手机号码：</label><input name="tpSpePerson.mobile" id="mobile" type="text" onkeyup="this.value=this.value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" />&nbsp;&nbsp;<span id="telTips">请输入您的手机号码，方便报名确认</span></p>
                            <p class="f14 padl81 all366C"><input name="ckbox" id="ckbox" type="checkbox"  /> 我已阅读并同意  <a href="tuancontract.jsp" target="_blank">《梦房园团购服务条款》</a></p>
                            <p class="padl81"><input type="image" src="resource/images/li-ji.gif"></p>
                            <p style="height:0px;"><span id="tuanwf" style="color:#F00; padding-left:80px;"></span></p>
                            <input type="hidden"  name="tpSpePerson.pid"  value="${tpSpecials.id}"/>
                              <input type="hidden"  name="tpSpePerson.flag"  value="${tpSpecials.flag}"/>
                            <input  type="hidden"  name="tpSpeActivity.flag" value="1"/>
                          
                        </form>
                    </div>
                    <div class="form-bottom"></div>
                </div>
            </div>
        </div>
        <div style="float: right;border: 0px green solid;width: 225">
			 <!--团购公告-->
             <div >
   						<div class="right_width_title">房源基本信息</div>
   						<div class="right_width_title1" align="left" >
   						开盘时间：<s:date name="#request.tpbuild.openDate" format="yyyy-MM-dd"/><br/>
						交房时间：<s:date name="#request.tpbuild.checkDate" format="yyyy-MM-dd"/><br/>
						绿 化 率：${tpbuild.greenRate}%   <br/>
						容 积 率：${tpbuild.capacityRate}<br/>
						开 发 商：${tpbuild.businessDevelopment}<br/>
						装修情况：${tpbuild.fitCondition}<br/>
						所在区域：${tpbuild.disname}  <br/>
						楼盘地址：<s:property value="#request.tpbuild.address"/><br/>
   						</div>
   					</div>    
            
            <!--团购公告-->
        </div>
        <div class="clear"></div>
    </div>
   		</div>
   	 <jsp:include page="copyright.jsp"></jsp:include>
   	</div>
  </body>
</html>
