<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//String menuCls = RequestUtil.getParam(request,"menuCls","");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>会员中心</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=basePath%>resource/css/global.css" type="text/css"></link>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/css/jqueryui/default/easyui.css"></link>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>resource/css/jqueryui/icon.css"></link>
	    <link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>
    <script type="text/javascript" src="<%=basePath%>resource/js/jquery-1.4.2.js" charset="utf-8"></script>
	<script type="text/javascript" src="<%=basePath%>resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>resource/js/global.js"></script>
	  <script type="text/javascript" src="<%=basePath%>resource/js/whole.js"></script>
	  <!-- 
<style type="text/css">
	a:link {color: #0066CC;text-decoration: none;}     /* unvisited link */
	a:visited {color: #D20805;text-decoration: none;}  /* visited link */
	a:hover {color: #FFA028;text-decoration: none;}   /* mouse over link */
	a:active {color: #FFA028;text-decoration: none;}   /* selected link */
	.img{
		width:106px;
		height:139px;
		padding-top:2px;
		background: #F2F2F2;
		border: 1px solid #CECECE;
	}
</style>
 -->
  </head>
  <body>
<jsp:include page="../head.jsp"></jsp:include>
  <div style="width: 100%;margin-top: 10px;" align="center">
    <table class="layoutTab" style="border: 0px red solid;">
    	<tr>
    		<td width="20%" align="left" valign="top"><jsp:include page="../left.jsp"></jsp:include></td>
    		<td valign="top">
    		<!-- 会员信息 start -->
    		<div id="rightbox" style="border: 0px red solid;width: 760px;margin-left: 8px;">
			<!-- 个人信息start -->
			<div style="width: 115px;height: auto;float: left;margin-top: 5px;" align="center">
				<img
					src="<%=basePath%>imageFloder/<s:property value="tb.headUrl"/>"
					alt="用户形象" width="100" height="133"  />
			</div>
			<table width="550" border="0" cellpadding="0" cellspacing="0" style="display: inline;margin-top: 10px;margin-left: 20px;" >
				<tr>
					<td width="100px" height="30px" align="right">
						姓&nbsp;&nbsp;&nbsp;&nbsp;名：
					</td>
					<td width="200px">&nbsp;
						<s:property value="tb.realName"/>
						&nbsp;&nbsp;<a href="<%=basePath%>mem/baseinfo_modUserInfoPage.shtml?menuCls=31" title="点击修改个人资料"><font color="blue">修改资料</font></a>
					</td>
					<td width="100px" align="right">
						邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：
					</td>
					<td width="150px">&nbsp;
					<s:property value="tb.email"/>
					</td>
				</tr>
				<tr>
					<td height="30" align="right">
						金&nbsp;&nbsp;&nbsp;&nbsp;币：
					</td>
					<td>&nbsp;
						<s:property value="tb.money"/>
					</td>
					<td align="right">
						手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：
					</td>
					<td>&nbsp;
						<s:property value="tb.mobile"/>
					</td>
				</tr>
				<tr>
					<td height="30" align="right">
						积&nbsp;&nbsp;&nbsp;&nbsp;分：
					</td>	
					<td>&nbsp;
						<s:property value="tb.integral"/>
					</td>
					<td align="right">
						等&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级：
					</td>
					<td>&nbsp;
						<s:property value="tb.honorTypeString"/>
						&nbsp;&nbsp;<a href="<%=basePath%>member/modHonorType.jsp?menuCls=31" title="点击修改头衔"><font color="blue">修改头衔</font></a>
					</td>
				</tr>
				<tr>
					<td height="30" align="right">
						口&nbsp;&nbsp;&nbsp;&nbsp;碑：
					</td>
					<td>&nbsp;
						<s:property value="tb.mouseWord"/>
					</td>
					<td align="right">
						用户类型：
					</td>
					<td>&nbsp;
						<s:if test='%{tb.type == "1"}'>经纪人</s:if>
						<s:elseif test='%{tb.type == "2"}'>个人业主</s:elseif>
						<s:elseif test='%{tb.type == "3"}'>公司业主</s:elseif>
						<s:elseif test='%{tb.type == "4"}'>开发商</s:elseif>
						<s:elseif test='%{tb.type == "5"}'>客户(需求方)</s:elseif>
						<s:elseif test='%{tb.type == "6"}'>银行</s:elseif>
						<s:elseif test='%{tb.type == "7"}'>贷款中介</s:elseif>
						<s:elseif test='%{tb.type == "8"}'>评估公司</s:elseif>
						<s:elseif test='%{tb.type == "9"}'>研究机构</s:elseif>
						<s:elseif test='%{tb.type == "10"}'>连锁企业</s:elseif>
						<s:else>其他</s:else>
					</td>
				</tr>
				<tr>
					<td align="right">
						店&nbsp;&nbsp;&nbsp;&nbsp;铺：
					</td>
					<td>&nbsp;
						<a href="<%=basePath%>mem/baseinfo_toMyStore.shtml?authorId=<s:property value="tb.id"/>&type=office" title="点击进去我的店铺">我的店铺>></a>
					</td>
						<td height="30" align="right" >所属公司：</td>
					<td>&nbsp;
					<s:if test="tb.company.length()>9"><s:property value="tb.company.substring(0,9)"/>...</s:if><s:else><s:property value="tb.company"/></s:else>
					</td>
				</tr>
			</table>
    <!-- 个人信息end -->
    <!-- 房源信息start -->
		<p>
			<img src="<%=basePath%>member/images/ts.jpg" style="margin-top:5px" width="760" >
		</p>
		<table width="760" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
			<tr height="30">
				<td align="center" bgcolor="#F9F9F9" width="20%">
					案源类型
				</td>
				<td align="center" bgcolor="#F9F9F9" width="20%">
					出租案源数
				</td>
				<td align="center" bgcolor="#F9F9F9" width="20%">
					出售案源数
				</td>
				<td align="center" bgcolor="#F9F9F9" width="20%">
					审核通过数
				</td>
				<td align="center" bgcolor="#F9F9F9" width="20%">
					合计发布案源数
				</td>
			</tr>
			<tr>
				<td height="30" align="center" bgcolor="#FFFFFF">
					住宅
				</td>
				<td align="center" bgcolor="#FFFFFF">
					${svo.col1 }
				</td>
				<td align="center" bgcolor="#FFFFFF">
					${svo.col2 }
				</td>
				<td align="center" bgcolor="#FFFFFF">
					${svo.col3 }
				</td>
				<td align="center" bgcolor="#FFFFFF">
					${svo.col4 }
				</td>
			</tr>
			<tr>
				<td height="30" align="center" bgcolor="#FFFFFF">
					写字楼
				</td>
				<td align="center" bgcolor="#FFFFFF">
					${svo.col5 }
				</td>
				<td align="center" bgcolor="#FFFFFF">
					${svo.col6 }
				</td>
				<td align="center" bgcolor="#FFFFFF">${svo.col7 }</td>
			
				<td align="center" bgcolor="#FFFFFF">${svo.col8 }</td>
			</tr>
			<tr>
				<td height="30" align="center" bgcolor="#FFFFFF">
					商铺
				</td>
				<td align="center" bgcolor="#FFFFFF">
					${svo.col9 }
				</td>
				<td align="center" bgcolor="#FFFFFF">
					${svo.col10 }
				</td>
				<td align="center" bgcolor="#FFFFFF">${svo.col11 }</td>
				
				<td align="center" bgcolor="#FFFFFF">${svo.col12 }</td>
			</tr>
			<tr>
				<td height="30" align="center" bgcolor="#FFFFFF">
					生意转让
				</td>
				<td align="center" bgcolor="#FFFFFF">
					${svo.col13 }
				</td>
				<td align="center" bgcolor="#FFFFFF">
					${svo.col14 }
				</td>
				<td align="center" bgcolor="#FFFFFF">${svo.col15 }</td>
				
				<td align="center" bgcolor="#FFFFFF">${svo.col16 }</td>
			</tr>
			<tr>
				<td height="30" align="center" bgcolor="#FFFFFF">
					工业地产
				</td>
				<td align="center" bgcolor="#FFFFFF">
					${svo.col17 }
				</td>
				<td align="center" bgcolor="#FFFFFF">
					${svo.col18 }
				</td>
				<td align="center" bgcolor="#FFFFFF">${svo.col19 }</td>
				
				<td align="center" bgcolor="#FFFFFF">${svo.col20 }</td>
			</tr>
			<tr>
				<td height="30" align="center" bgcolor="#FFFFFF">
					大型项目
				</td>
				<td align="center" bgcolor="#FFFFFF">
					${svo.col21 }
				</td>
				<td align="center" bgcolor="#FFFFFF">
					${svo.col22 }
				</td>
				<td align="center" bgcolor="#FFFFFF">${svo.col23 }</td>
			
				<td align="center" bgcolor="#FFFFFF">${svo.col24 }</td>
			</tr>

			<tr>
				<td height="30" align="center" bgcolor="#FFFFFF">
					合计
				</td>
				<td align="center" bgcolor="#FFFFFF">
					${svo.col25 }
				</td>
				<td height="35" align="center" bgcolor="#FFFFFF">${svo.col26 }</td>
				<td height="35" align="center" bgcolor="#FFFFFF">${svo.col27 }</td>
				<td height="35" align="center" bgcolor="#FFFFFF">${svo.col28 }</td>
			</tr>
		</table>
<!-- 房源信息start -->
		<div id="cover" onclick="adhref()" style="cursor: pointer">
			<script type='text/javascript' src='http://cbjs.baidu.com/js/s.js'></script>
		</div>
		
		<table width="760" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC" style="margin-top: 40px;">
			<tr height="25" background="images/ttbg_g_2.jpg">
				<td align="left" colspan="3" bgcolor="#F9F9F9" width="20%">
				    <input name="menuCls" type="hidden" id="menuCls" value="${menuCls}"/>
					<div style="border: 0px red solid;float: left;width: 90%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;留&nbsp;&nbsp;&nbsp;&nbsp;言</div>
					<div style="text-align: right;float: left;border: 0px red solid;"><a href="#" onclick="window.location.href='<%=basePath%>message/message_showMessage.shtml?flag=1'"><font color="blue">更&nbsp;&nbsp;多>></font></a></div>
				</td>
			</tr>
			
			<tr background="images/ttbg_g.jpg">
				<td height="25" align="left" bgcolor="#FFFFFF" >
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;标&nbsp;&nbsp;&nbsp;&nbsp;题
				</td>
				<td align="center" width="15%" bgcolor="#FFFFFF" >
					留&nbsp;&nbsp;言&nbsp;&nbsp;人
				</td>
				<td align="center" width="20%" bgcolor="#FFFFFF" >
					时&nbsp;&nbsp;&nbsp;&nbsp;间
				</td>
			</tr>
			<s:iterator value="pu.list">
				<tr>
					<td height="25" align="left" bgcolor="#FFFFFF">
						<a href="<%=basePath%>message/message_readMessage.shtml?id=<s:property value="id"/>"><s:property value="messageTitle"/></a>
					</td>
					<td align="center" bgcolor="#FFFFFF">
						<s:property value="fromUserName"/>
					</td>
					<td align="center" bgcolor="#FFFFFF">
						<s:date name="createTime" format="yyyy-MM-dd HH:mm:ss"></s:date>
					</td>
				</tr>
			</s:iterator>
		</table>
		<!-- 房源信息end -->
	</div>
	<!-- 会员信息 end -->
    		</td>
    	</tr>
    </table>
    <input type="hidden" name="loginId" value="<s:property value="tb.id"/>" id="loginId"/>
     <input type="hidden" value="${reLogin}" name="reLogin" id="reLogin"/>
  <!--  <c:if test="${reLogin!=9}">
		<a href="<%=basePath %>member/ShowLogin.html?height=200;width=450" style="margin-left: 100px" title="登陆" class="thickbox" >登陆</a>
	</c:if> 
 -->
  </div>
  <div style="margin-top: 10px;">
			<center>
				<jsp:include page="../copyright.jsp" />
			</center>
		</div>
  </body>
  <script type="text/javascript">
  //$("#logo_span").hide();
  	if($("#reLogin").val()=='9'){
  		$.messager.show({
   			showType:'slide',
   			showSpeed:1000,
   			width:300,
   			height:150,
   			msg:'经验值+5',
   			title:'登陆成功',
   			timeout:5000
   		});
  	}else if($("#reLogin").val()=='8'){
	  	$.messager.show({
	   			showType:'slide',
	   			showSpeed:1000,
	   			width:300,
	   			height:150,
	   			msg:'恭喜您，密码修改成功，定期更换密码可提高账号安全性。',
	   			title:'密码修改成功',
	   			timeout:5000
	   		});
  	}
  	function caseQuery(){
       var t = document.caseSearch.caseType.value;
       var id=document.caseSearch.case_Id;
       //alert(t); 
       //alert(id.value);
       if(!checkNull(id)){
           MyAlert(id,"请输入案源编号。");
           return false;
       }else{
          if(!isUnsignedInteger(id)){
                MyAlert(id,"输入案源编号格式不正确，请输入数字");
                return false;
          }
       }
       if(t==""){
        alert("请至少选择一个搜索条件！")
        return false;
       }else if(t==11){
         document.caseSearch.action="/shop/webSearchShopRent.kemp";
         document.caseSearch.submit();
       }else if(t==12){
         document.caseSearch.action="/shop/webSearchShopSale.kemp";
         document.caseSearch.submit();
       }else if(t==21){
         document.caseSearch.action="/office/webSearchOfficeRent.kemp";
         document.caseSearch.submit();
       }else if(t==22){
         document.caseSearch.action="/office/webSearchOfficeSale.kemp";
         document.caseSearch.submit();
       }else if(t==31){
         document.caseSearch.action="/industry/webSearchIndustryRent.kemp";
         document.caseSearch.submit();
       }else if(t==32){
         document.caseSearch.action="/industry/webSearchIndustrySale.kemp";
         document.caseSearch.submit();
       }else if(t==4){
         document.caseSearch.action="/project/webSearchProject.kemp";
         document.caseSearch.submit();
       }else{
         document.caseSearch.action="/transfer/webSearchTransfer.kemp";
         document.caseSearch.submit();
       }
     }
     function adhref(){
	    adclick('');
	 }
     function changeColor(){   
          var color1="#0000ff";   
	      var color2="#ff0000";   
	      var timer=600;   
	      var obj=document.getElementsByName("color");
	      for(i=0;i<obj.length;i++){
          if(obj[i].style.color==color1){
        	obj[i].style.color=color2;   
          }else{
            obj[i].style.color=color1;   
          }
      	 }
      setTimeout("changeColor()",timer);
    }
    window.onload=changeColor; 
  </script>
</html>
