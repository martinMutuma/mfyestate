
<%@ page language="java"  pageEncoding="UTF-8"%>
<%@page import="com.estate.util.comm.RequestUtil"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String selectItem = RequestUtil.getParam(request,"selectItem","1");
%>
<div style="" class="menu_container">
  <div title="常用操作" align="left" class="menu_category">常用操作</div>
  <div id="leftMenu" class="easyui-accordion"  style="">
    <div id="office" title="写字楼">
	    <a href="../pro/buildingrent.jsp">发布出租</a><br/>
	    <a href="../pro/managerent.jsp">管理出租</a><br/>
	    <a href="../pro/releasesale.jsp">发布出售</a><br/>
	    <a href="../pro/managesale.jsp">管理出售</a><br/>
	    <a href="../pro/releasedemand.jsp">发布需求</a><br/>
	    <a href="../pro/managerequirements.jsp">管理需求</a><br/>
    </div>
    <div id="shop" title="商铺">
	    <a href="../pro/shoprent.jsp">发布出租</a><br/>
	    <a href="../pro/manageshoprent.jsp">管理出租</a><br/>
	    <a href="../pro/shopsale.jsp">发布出售</a><br/>
	    <a href="../pro/manageshopsale.jsp">管理出售</a><br/>
	    <a href="../pro/shopdemand.jsp">发布需求</a><br/>
	    <a href="../pro/manageshopdemand.jsp">管理需求</a><br/>
    </div>
    <div id="business" title="生意转让">
	    <a href="../pro/sendMessage.jsp">发布信息</a><br/>
	    <a href="../pro/manageMessage.jsp">管理信息</a><br/>
    </div>
    <div id="industry" title="工业地产">
	    <a href="../pro/industryrent.jsp">发布出租</a><br/>
	    <a href="../pro/manageindustryrent.jsp">管理出租</a><br/>
	    <a href="../pro/industrysale.jsp">发布出售</a><br/>
	    <a href="../pro/manageindustrysale.jsp">管理出售</a><br/>
	    <a href="../pro/industrydemand.jsp">发布需求</a><br/>
	    <a href="../pro/manageindustrydemand.jsp">管理需求</a><br/>
    </div>
    <div id="largepro" title="大型项目">
	    <a href="../pro/projectrelease.jsp">发布项目</a><br/>
	    <a href="../pro/manageproject.jsp">管理项目</a><br/>
	    <a href="../pro/mgprodemand.jsp">发布需求</a><br/>
	    <a href="../pro/manageprodemand.jsp">管理需求</a><br/>
    </div>
    <div id="floor" title="楼盘">
	    <a href="#" onclick="gototo('25');">发布楼盘</a><br/>
	    <a href="#" onclick="gototo('26');">管理楼盘</a><br/>
	    <a href="#" onclick="gototo('27');">发布二手房信息</a><br/>
	    <a href="#" onclick="gototo('28');">发布二手房管理</a><br/>
    </div>
    <div id="myMove" title="我的动态">
	    <a href="#" onclick="javascript:gototo('20');">我关注的楼盘</a><br/>
	    <a href="#" onclick="javascript:gototo('21');">我浏览过的楼盘</a><br/>
	    <a href="#" onclick="javascript:gototo('22');">我的备选楼盘</a><br/>
	    <a href="#" onclick="javascript:gototo('23');">房友最关注楼盘</a><br/>
	    <a href="#" onclick="javascript:gototo('24');">最新开盘</a><br/>
    </div>
   </div>
   <div title="个人信息管理" align="left" class="menu_category">个人信息管理</div>
   <div style="width: 100%;" align="left">
   		<ul class="leftNav">
	      <li><a href="#" onclick="javascript:gototo('1');">·中心首页</a></li>
		 <!-- <li><a href="#" onclick="javascript:gototo('2');">·我的积分</a></li>
		  <li><a href="#" onclick="javascript:gototo('3');">·账户充值</a></li>
		  <li><a href="#" onclick="javascript:gototo('4');">·购买服务</a></li>
		  <li><a href="#" onclick="javascript:gototo('5');">·消费记录</a></li>
		  --> 
		  <li><a href="#" onclick="javascript:gototo('6');">·站 内 信</a></li>
		  <li><a href="#" onclick="javascript:gototo('7');">·店铺公告</a></li>
		  <li><a href="#" onclick="javascript:gototo('8');">·留言管理</a></li>
		  <li class="title" >下载中心</li>
	      <li><a href="#" onclick="javascript:gototo('9');">·培训教材</a></li>
		  <li><a href="#" onclick="javascript:gototo('10');">·合同文本</a></li>
		  <li><a href="#" onclick="javascript:gototo('11');">·研究报告</a></li>
		  <!--
		  <li><a href="#" target="_blank">·客户资料</a></li>
		  -->
		  <li class="title">收藏夹</li>
		  <li><a href="#" onclick="javascript:gototo('12');">·房源收藏</a></li>
		  <li class="title">我的资料</li>
		  <li><a href="#" onclick="javascript:gototo('13');">·资料修改</a></li>
	      <li><a href="#" onclick="javascript:gototo('14');">·身份认证</a></li>
		  <li><a href="#" onclick="javascript:gototo('15');">·执业认证</a></li>
		  <li><a href="#" onclick="javascript:gototo('16');">·密码修改</a></li>
		</ul>
	</div>
</div>
<script type="text/javascript">
  var selectItem = '<%=selectItem%>';
  function gototo(type){
  	if(type=='1')
  		window.location.href='<%=basePath%>mem/baseinfo_mainPage.shtml';
  	if(type=='6')
  		window.location.href='<%=basePath%>message/message_showMessage.shtml?flag=2';
  	if(type=='7')
  		window.location.href='<%=basePath%>message/message_showNotice.shtml?flag=3';
  	if(type=='8')
  		window.location.href='<%=basePath%>message/message_showMessage.shtml?flag=1';
	if(type=='9')
  		window.location.href='<%=basePath%>message/message_fileDownLoad.shtml?type=1';
	if(type=='10')
  		window.location.href='<%=basePath%>message/message_fileDownLoad.shtml?type=2';
	if(type=='11')
  		window.location.href='<%=basePath%>message/message_fileDownLoad.shtml?type=3';
	if(type=='12')
  		window.location.href='<%=basePath%>message/message_showCollect.shtml';
  	if(type=='13')
  		window.location.href='<%=basePath%>mem/baseinfo_modUserInfoPage.shtml';
	if(type=='14')
  		window.location.href='<%=basePath%>member/identityAuth.jsp';
  	if(type=='15')
  		window.location.href='<%=basePath%>member/jobAuth.jsp';
 	if(type=='16')
  		window.location.href='<%=basePath%>mem/baseinfo_changePassMember.shtml';
 	if(type=='20')
  		window.location.href='<%=basePath%>proInfo/proInfo_showProInfo.shtml?operateType=2&page=1';
 	if(type=='21')
  		window.location.href='<%=basePath%>proInfo/proInfo_showProInfo.shtml?operateType=1&page=1';
 	if(type=='22')
  		window.location.href='<%=basePath%>proInfo/proInfo_showProInfo.shtml?operateType=4&page=1';
 	if(type=='23')
  		window.location.href='<%=basePath%>proInfo/proInfo_showMoreAttentionBuilding.shtml?page=1';
 	if(type=='24')
  		window.location.href='<%=basePath%>proInfo/proInfo_showNewBuilding.shtml?page=1';
  	if(type=='25')
  		window.location.href='<%=basePath%>pro/tabuilding.jsp';
  	if(type=='26')
  		window.location.href='<%=basePath%>pro/managerbuid.jsp';
  	if(type=='27')
  		window.location.href='<%=basePath%>pro/secondBuilding_info.jsp';
  	if(type=='28')
  		window.location.href='<%=basePath%>pro/secondBuliding_manage.jsp';
  }
  </script>