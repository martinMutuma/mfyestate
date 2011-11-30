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
	<!-- 1.css添加 -->
	<link rel="stylesheet" href="../resource/css/global.css" type="text/css"></link>
    <link rel="stylesheet" type="text/css" href="css/thickbox.css"/>
    <link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/default/easyui.css"></link>
	<link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/icon.css"></link>
    <script type="text/javascript" src="../resource/js/jquery-1.4.2.js" charset="utf-8"></script>
	<script type="text/javascript" src="thickbox_plus.js"></script>
	<script type="text/javascript" src="../resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../resource/js/global.js"></script>
	<script type="text/javascript" src="<%=basePath%>member/register.js" charset="utf-8"></script>
	<script type="text/javascript" src="../resource/js/whole.js"></script>
	<link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>
    <script type="text/javascript" src="../resource/js/easyui-lang-zh_CN.js"></script></head>

  <body>
   <jsp:include page="../head.jsp"></jsp:include>
  	<!-- 2.添加div	 -->
  <div style="width: 100%;margin-top: 10px;" align="center">
  <!-- 3.添加class="layoutTab"  -->
    <table class="layoutTab" style="border: 0px red solid;">
    	<tr>
    	<td width="20%" align="left"><jsp:include page="../left.jsp"></jsp:include></td>
    		<td valign="top">
    				<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
    				  <tr bgcolor="#F1F1F1" >
				         <td colspan="6" height="30" background="../member/images/ttbg_g_3.jpg"  align="center"> 
				           <input name="menuCls" type="hidden" id="menuCls" value="${menuCls}"/>
				          <STRONG>  所有<s:if test='#flag == "2"'>站内信</s:if><s:else>留言</s:else></STRONG>
				         </td>
				        </tr>
			<tr height="25">
				<td align="center" bgcolor="#F9F9F9" width="20%">
					标&nbsp;&nbsp;&nbsp;&nbsp;题
				</td>
				<td height="25"  width="12%" align="center" bgcolor="#FFFFFF">
					<s:if test='#flag == "2"'>发信人</s:if>
					<s:else>留言人</s:else>
				</td>
				<td align="center" width="15%" bgcolor="#FFFFFF">
					联系电话
				</td>
				<td align="center" width="15%" bgcolor="#FFFFFF">
					电子邮件
				</td>
				<td align="center" width="20%" bgcolor="#FFFFFF">
					<s:if test='#flag == "2"'>发信</s:if><s:else>留言</s:else>时间
				</td>
				<td align="center" width="15%" bgcolor="#FFFFFF">
					操作
				</td>
			</tr>
			<s:iterator value="pu.list">
				<tr align="center"  bgcolor="#FFFFFF" height="25px;">
					<td><a href="<%=basePath%>message/message_readMessage.shtml?id=<s:property value="id"/>"><s:property value="messageTitle"/></a></td>
					<td><s:property value="fromUserName"/></td>
					<td><s:property value="phone"/></td>
					<td><s:property value="email"/></td>
					<td><s:date name="createTime" format="yyyy-MM-dd HH:mm:ss"></s:date></td>
					<td align="center">
					<!--  <A href="<%=basePath%>message/message_replayMessage.shtml?id=<s:property value="id"/>">回复</a>  
					<nobr/>-->
					<a href="#" onclick="ondel('<s:property value="id"/>')"><font style="cursor:pointer;color:blue;">删除</font></a>
					</td>
				</tr>
			</s:iterator>
		</table>
		<input type="hidden" id="menuCls" value="${menuCls }"/>
    		</td>
    	</tr>
    </table>
    <div id="pagenation">
	   				<input type="hidden" id="totalRecords" value="<s:property value="pu.totalRecords"/>"/>
	   				<input type="hidden" id="pageNo" value="<s:property value="pu.pageNo"/>"/>
	   				<input type="hidden" id="limit" value="10"/>
	   				<input type="hidden" id="uri" value=""/>
			   		共<s:property value="pu.totalRecords"/>条记录,
			   		当前显示第<s:property value="pu.pageNo"/>页，共<s:property value="pu.totalPages"/>页,
			   		<s:if test="pu.pageNo==1">
			   			第一页
			   		</s:if>
			   		<s:else>
			   			<a href="javascript:bulid('1')">第一页</a>
			   		</s:else>
			   		<s:if test="pu.pageNo==1">
			   			上一页
			   		</s:if>
			   		<s:else>
			   			<a href="javascript:bulid('<s:property value="pu.pageNo-1"/>')">上一页</a>
			   		</s:else>
			   		<s:if test="pu.pageNo==pu.totalPages">
			   			下一页
			   		</s:if>
			   		<s:else>
			   			<a href="javascript:bulid('<s:property value="pu.pageNo+1"/>')">下一页</a>
			   		</s:else>
			   		<s:if test="pu.pageNo==pu.totalPages">
			   			最后页
			   		</s:if>
			   		<s:else>
			   			<a href="javascript:bulid('<s:property value="pu.totalPages"/>')">最后页</a>
			   		</s:else>
			   	</div>
  </div>
		<div style="margin-top: 10px;">
			<center>
				<jsp:include page="../copyright.jsp" />
			</center>
		</div>
		<input type="hidden" name="loginId" value="${loginId}" id="loginId"/>
		<input type="hidden" name="flag" value="${flag}" id="flag"/>
  </body>
  <script type="text/javascript">
  	function ondel(id){
  	$.messager.confirm('删除记录', '请确认要删除该记录吗?', function(btn) {
		if (btn) {
  			window.location.href="<%=basePath%>message/message_deleteMessage.shtml?menuCls=33&id="+id+"&flag="+$("#flag").val();
  		}
  		});
  	}
   function pageQuery(count,page,totalPages){
     if(count<=0){
        alert('没有记录');
        return ;
     }
     if(count>0){
         if(page<=0){
            alert('当前已经是第一页了');
            return ;
         }
         if(page>totalPages){
            alert('当前已经是最后一页了');
            return ;
         }
     }
     var menuCls;
		if($("#flag").val()==1) menuCls=35;
		if($("#flag").val()==2) menuCls=33;
     window.location.href="<%=basePath%>message/message_showMessage.shtml?flag=1&pageNo="+page+"&pageSize=2"+'&menuCls='+menuCls;
     // window.location.href="../activitySelect/getAllActivity.action?pageNo="+page+"&pageSize=10";
  	
}
function bulid(pageno){
		var menuCls;
		if($("#flag").val()==1) menuCls=35;
		if($("#flag").val()==2) menuCls=33;
  		window.searchForm.action = '<%=basePath%>message/message_showMessage.shtml?flag='+$("#flag").val()+'&pageNo='+pageno+'&menuCls='+menuCls;
  		window.searchForm.method="post";
  		window.searchForm.submit();
  		return;
  	}
  </script>
</html>
