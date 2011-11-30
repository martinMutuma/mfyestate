<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>房友最关注的楼盘</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 1.css添加 -->
	<link rel="stylesheet" href="../resource/css/global.css" type="text/css"></link>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>member/css/thickbox.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>dynamic/css/css1.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>dynamic/css/css2.css"/>
    <link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>
    <link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/default/easyui.css"></link>
	<link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/icon.css"></link>
    <script type="text/javascript" src="../resource/js/jquery-1.4.2.js" charset="utf-8"></script>
	<script type="text/javascript" src="../resource/js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="../resource/js/whole.js"></script>
	<script type="text/javascript" src="<%=basePath%>dynamic/js/compare.js"></script>
	<script type="text/javascript" src="<%=basePath %>resource/js/jquery.easyui.min.js"></script>

  </head>
  <body>
	<jsp:include page="../head.jsp"></jsp:include>
		<div style="width: 100%; margin-top: 10px;" align="center"> 
    <table class="layoutTab" style="border: 0px red solid;">
    	<tr>
    	<td width="20%" align="left" valign="top"><jsp:include page="../left.jsp?selectItem=7"></jsp:include></td>
    		<td valign="top">
   <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
      <tr>
        <td height="30" align="left" bgcolor="#9EC4ED" ><STRONG><font size="3px">&nbsp;房友最关注的楼盘</font></STRONG> </td>
      </tr>
      <tr>
        <td height="100" bgcolor="#FFFFFF">
                  <s:iterator value="tbuildingList" status="st" id="item">
		              <div class="estateout" id="building_<s:property value="id"/>">
		              <div class="tex"><input name="buildingCheck" type="checkbox" value="<s:property value="id"/>" id="checkbox_<s:property value="id"/>"/></div>
		              <div class="esborder">
	                      <a href="<%=basePath%>building/toBuidingInfo.shtml?id=<s:property value="id"/>" title="<s:property value="name"/>"><img src="<%=basePath%><s:property value="compressUrl"/>" title="<s:property value="name"/>" /></a>
	                      <!-- <p><a href="#" title="住宅">住宅</a></p> -->
		              </div>
		              <div class="left w548" style="border: 0px red solid;">
		                  <div class="right" style="border: 0px red solid; width: 228px;">
		                      <p class="all366C padr_1" style="border: 0px black solid;">
		                      <s:if test='#item.isChoose=="1"'>
		                      	<s:if test='#item.isAttention=="1"'>
		                          <img src="<%=basePath%>dynamic/img/white.gif"/><img src="<%=basePath%>dynamic/img/white.gif" />
		                        </s:if>
		                        <s:else>
		                        	<img src="<%=basePath%>dynamic/img/white.gif" /><a href="#" style="cursor:pointer" onclick="setState('<s:property value="id"/>','2')" title="加入关注" rel="nofollow"><img src="<%=basePath%>dynamic/img/attention.gif" id="pic_attention_<s:property value="id"/>"/></a>
		                        </s:else>
		                      </s:if>
		                      <s:else>
	                      		<s:if test='#item.isAttention=="1"'>
	                              <img src="<%=basePath%>dynamic/img/white.gif" /><a href="#" style="cursor:pointer" onclick="setState('<s:property value="id"/>','4')" title="加入备选" rel="nofollow"><img src="<%=basePath%>dynamic/img/choose.gif" id="pic_choose_<s:property value="id"/>"/></a>
		                        </s:if>
		                        <s:else>
		                        	<a href="#" style="cursor:pointer" onclick="setState('<s:property value="id"/>','4')" title="加入备选" rel="nofollow"><img src="<%=basePath%>dynamic/img/choose.gif" id="pic_choose_<s:property value="id"/>"/></a> <a href="#" style="cursor:pointer" onclick="setState('<s:property value="id"/>','2')" title="加入关注" rel="nofollow"><img src="<%=basePath%>dynamic/img/attention.gif" id="pic_attention_<s:property value="id"/>"/></a>
		                        </s:else>
                              </s:else>
	                              <input type="button" value="对 比" onclick="openCompare('<s:property value="name"/>','<s:property value="id"/>','<%=basePath%><s:property value="compressUrl"/>',1)" />                                    
	                              <span class="clear"></span>
		                       </p>
		                       <p class="jun_jj" style="border: 0px black solid;">均价：<s:property value="averagePrice"/> 元/㎡</p>
		                       <p class="tR" style="border: 0px black solid;">开盘时间：<s:date name="openDate" format="yyyy-MM-dd"/> </p>
		                   </div>
		                   <p style="border: 0px black solid;">
		                      	<a href="#" style="cursor:pointer"><h2 class="left"><font color="black"><s:property value="name"/></font></h2></a>
		                        &nbsp;&nbsp;&nbsp;&nbsp;<img src="<%=basePath %>building/images/<s:property value="salesStatus"/>.gif"/>
		                        <!--  <a href="#" title="优惠楼盘" rel="nofollow"><img src="<%=basePath%>dynamic/img/ic2.gif" /></a>
		                        <a href="#" title="购房送大礼" rel="nofollow"><img src="<%=basePath%>dynamic/img/ic3.gif" /></a>
		                        -->
		                   </p>
	                       <p><span>所在区域：</span><s:property value="disname"/></p>
	                       <p><span>最新动态：</span>暂无资料</p>
	                       <p><span>关注人数：</span><s:property value="attentionNum"/> </p>
	                       <p><span>开 发 商：</span><s:property value="businessDevelopment"/></p>
	                       <p><span>地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：</span><s:property value="address"/> </p>
		                </div>
		                <div class="unit" style="width: 100%;float: left;">
		                    <!--  <p class="left L26 all366C">
		                         <a href="#" title='动态'>动态<span>(6)</span></a>
		                         <a href="#" title='资讯'>资讯<span>(0)</span></a>
		                         <a href="#" title='户型图'>户型图<span>(5)</span></a>
		                         <a href="#" title='视频'>视频<span>(0)</span></a>
		                         <a href="#" title='团购'>团购<span>(23)</span></a>
		                      </p>
		                   <p class="right madt5 all366C">
		                          <span class="send_mo left"><a href="javascript:void(0)" onclick="showBg('send_mobile_dlg',0,'四季春城温泉谷 / 澄迈县金马大道西侧  / 房价待定    / 咨询电话：<->19201<->四季春城温泉谷<->30527');" title="发送到我的手机" rel="nofollow">发送到我的手机</a></span><span class="send_mail left"><a href="javascript:void(0)" onClick="showBg('send_email_dlg',1,'19201<->四季春城温泉谷<->30527')" title="发送到我的邮箱" rel="nofollow">发送到我的邮箱</a></span>
		                          <span class="clear"></span>
		                       </p>
		                  -->
	                  </div>
	                  </div>
                  </s:iterator>
        </td>
      </tr>
    </table>
	                  <input id="menuCls" type="hidden" value="${menuCls}">
            <!-- 浮动窗 -->
<div id="cDlg" class="dbx_box">
<div class="tit"><strong id="sTitle">楼盘对比</strong><a onclick="closeDiv()" style="cursor: pointer;">x</a></div>
<div id="ttttt"></div>
<div class="tit02"><a href="javascript:void();" onclick="compareDatat();">对比</a> <span><a href="javascript:void();" onclick="delAll();">清空</a></span></div>
</div>
<div class="manu" style="margin-top: 10px;text-align: right;"><span class="eg"><input id="compareButton" name="对比选中" type="button" value="对比选中" class="contrast" onClick="compareBuildings();"/></span>
第${currentPage}页 共${rowCount}页
<s:if test="%{currentPage!=1}">
	<a href="<%=basePath%>proInfo/proInfo_showMoreAttentionBuilding.shtml?page=1">首页</a>
</s:if>
<s:else>
	<font disabled="true">首页</font>
</s:else>
<s:if test="%{currentPage<rowCount}">
	<a href="<%=basePath%>proInfo/proInfo_showMoreAttentionBuilding.shtml?page=${currentPage+1}">下一页</a>
</s:if>
<s:else>
	<font disabled="true">下一页</font>
</s:else>
<s:if test="%{currentPage!=1}">
	<a href="<%=basePath%>proInfo/proInfo_showMoreAttentionBuilding.shtml?page=${currentPage-1}">上一页</a>
</s:if>
<s:else>
	<font disabled="true">上一页</font>
</s:else>
<s:if test="%{currentPage<rowCount}">
<a href="<%=basePath%>proInfo/proInfo_showMoreAttentionBuilding.shtml?page=${rowCount}">尾页</a>
</s:if>
<s:else>
	<font disabled="true">尾页</font>
</s:else>
转到第:<input type="text" id="gotoPage" name="page" size="8"/> 页 <input type="button" onclick="gotoPage();" value="GO" name="cndok" <s:if test="%{rowCount==1}"> disabled="true" </s:if>/>
</div>
</td></tr></table>
</div>
				<div style="margin-top: 10px;">
			<center>
				<jsp:include page="../copyright.jsp" />
			</center>
		</div>
  </body>
  <script type="text/javascript">
  var basePath = '<%=basePath%>';
	  function gotoPage(){
	  	if($("#gotoPage").val()>${rowCount}){
		  	$.messager.alert('提示','输入页数大于总页数','warning',function(){
			});
	  		return false;
	  	}
	  	if($("#gotoPage").val()<1){
	  		$.messager.alert('提示','输入页数非法','warning',function(){
			});
	  		return false;
	  	}
	  	window.location.href="<%=basePath%>proInfo/proInfo_showMoreAttentionBuilding.shtml?page="+$("#gotoPage").val();
	  }
     function compareBuildings(){
      $("#compareButton").blur();
	  var buildingboxs = document.getElementsByName("buildingCheck");
	  var ids = '';
	  for(var i=0;i<buildingboxs.length;i++){
	  	if($("#checkbox_"+buildingboxs[i].value).attr("checked")==true){
	  		if(ids=='')
	  			ids += $("#checkbox_"+buildingboxs[i].value).val();
	  		else
	  			ids +=','+ $("#checkbox_"+buildingboxs[i].value).val();
	  	}
	  }
	  if(ids.split(',').length<2||ids.split(',').length>4){
	  	$.messager.alert('提示','请选择2-4个楼盘进行比较','warning',function(){
		});
		return false;
	  }
	 window.location.href="<%=basePath%>proInfo/proInfo_compareBuildings.shtml?ids="+ids;
  }
  function setState(id,optype){
	  if(optype=='4'){
		  	$("#pic_choose_"+id).attr("src","<%=basePath%>dynamic/img/white.gif");
		  	$.messager.alert('提示','已成功加入备选','info',function(){
			});
	   }else{
		  	$("#pic_attention_"+id).attr("src","<%=basePath%>dynamic/img/white.gif");
		  	$.messager.alert('提示','已成功加入关注','info',function(){
			});
	   }
		// window.location.href="<%=basePath%>proInfo/proInfo_createproInfo.shtml?operateType=2&operateToType=4&proId="+id;
	   $.get("<%=basePath%>proInfo/proInfo_createproInfo.shtml?operateType=1&proType=6&operateToType="+optype+"&proId="+id+"&time="+(new Date().getTime().toString(36)),function(obj){
	   });
   }
  </script>
</html>
