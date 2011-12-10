<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
<title>梦房园</title>
<link rel="stylesheet" href="resource/css/whole.css" type="text/css"></link>
<link rel="stylesheet" href="resource/css/global.css" type="text/css"></link>
<link rel="stylesheet" href="resource/css/listShow.css" type="text/css"></link>
<script type="text/javascript" src="resource/js/jquery-1.4.2.js" charset="utf-8"></script>
<script type="text/javascript" src="resource/js/whole.js"></script>
<script type="text/javascript" src="resource/js/hbody.js"></script>

<STYLE type="text/css">
	#ser_btn{
		*padding-left:40px;
	}
	#ser_senior,#ser_help{
		*padding-left:15px;
		*width:80px;
	}
	#searchPanel{
		height:180px;
		*height: 180px;
	}
	#searchPanel{
		margin-top: 15px;
		padding-top: 5px;
	}
	#searchPanel td{
		height: 35px;
	}
	.line{
		border-bottom:1px dotted #F1F1F1;
	}
</STYLE>
</head>
  <body>
  	<jsp:include page="head.jsp"/>
  	<div style="width: 100%;" align="center">
   	<div class="layoutTab">
   		<div id="searchPanel" align="center">
   			<table cellpadding="0" border="0" cellspacing="0" width="920px">
   				<tr>
   					<td class="search_column_span line" valign="top">
   						<span>楼盘类型：</span>
   					</td>
   					<td valign="top" class="line">
   						<span style="cursor:pointer" id="rc_9_0_0" class="search_column search_column_selected" onclick="">不限</span>
						<span id="rc_9_0_1" class="search_column" onclick="search('searchType','纯写字楼','','',this,'0_1','9')" style="cursor:pointer">纯写字楼</span>
						<span id="rc_9_0_2" class="search_column" onclick="search('searchType','商住楼','','',this,'0_2','9')" style="cursor:pointer">商住楼</span>
						<span id="rc_9_0_3" class="search_column" onclick="search('searchType','酒店式公寓','','',this,'0_3','9')" style="cursor:pointer">酒店式公寓</span>
						<span id="rc_9_0_4" class="search_column" onclick="search('searchType',园区办公,'','',this,'0_4','9')" style="cursor:pointer">园区办公</span>
						<span id="rc_9_0_5" class="search_column" onclick="search('searchType','商务中心','','',this,'0_5','9')" style="cursor:pointer">商务中心</span>
						<span id="rc_9_0_6" class="search_column" onclick="search('searchType','其他','','',this,'0_6','9')" style="cursor:pointer">其他</span>
   					</td>
   				</tr>
   				<tr>
					<td class="search_column_span line" valign="top"><span>销售单价：</span></td>
					<td valign="top" class="line">
						<span style="cursor:pointer" id="rc_9_1_0" class="search_column search_column_selected" onclick="">不限</span>
						<span id="rc_9_1_1" class="search_column" onclick="search('searchType','5000元以下/㎡','','',this,'1_1','9')" style="cursor:pointer">5000元以下/㎡</span>
						<span id="rc_9_1_2" class="search_column" onclick="search('searchType','5000-8000元/㎡','','',this,'1_2','9')" style="cursor:pointer">5000-8000元/㎡</span>
						<span id="rc_9_1_3" class="search_column" onclick="search('searchType','8000-1万元/㎡','','',this,'1_3','9')" style="cursor:pointer">8000-1万元/㎡</span>
						<span id="rc_9_1_4" class="search_column" onclick="search('searchType','1万-1.2万元/㎡','','',this,'1_4','9')" style="cursor:pointer">1万-1.2万元/㎡</span>
						<span id="rc_9_1_5" class="search_column" onclick="search('searchType','1.2万-1.5万元/㎡','','',this,'1_5','9')" style="cursor:pointer">1.2万-1.5万元/㎡</span>
						<span id="rc_9_1_6" class="search_column" onclick="search('searchType','1.5万-2万元/㎡','','',this,'1_6','9')" style="cursor:pointer">1.5万-2万元/㎡</span>
						<br/><span id="rc_9_1_7" class="search_column" onclick="search('searchType','2万元以上/㎡','','',this,'1_7','9')" style="cursor:pointer">2万元以上/㎡</span>
					</td>
				</tr>
				<tr>
					<td class="search_column_span line" valign="top"><span>销售状态：</span></td>
					<td valign="top" class="line">
						<span style="cursor:pointer" id="rc_9_2_0" class="search_column search_column_selected" onclick="">不限</span>
						<span id="rc_9_2_1" class="search_column" onclick="search('searchType','待售楼盘','','',this,'2_1','9')" style="cursor:pointer">待售楼盘</span>
						<span id="rc_9_2_2" class="search_column" onclick="search('searchType','预售楼盘','','',this,'2_2','9')" style="cursor:pointer">预售楼盘</span>
						<span id="rc_9_2_3" class="search_column" onclick="search('searchType','在售楼盘','','',this,'2_3','9')" style="cursor:pointer">在售楼盘</span>
						<span id="rc_9_2_4" class="search_column" onclick="search('searchType','尾盘','','',this,'2_4','9')" style="cursor:pointer">尾盘</span>
						<span id="rc_9_2_5" class="search_column" onclick="search('searchType','售完楼盘','','',this,'2_5','9')" style="cursor:pointer">售完楼盘</span>
					</td>
				</tr>
				<tr>
					<td class="search_column_span line" valign="top"><span>装修状况：</span></td>
					<td valign="top" class="line">
						<span style="cursor:pointer" id="rc_9_3_0" class="search_column search_column_selected" onclick="">不限</span>
						<span id="rc_9_3_1" class="search_column" onclick="search('searchType','毛坯','','',this,'3_1','9')" style="cursor:pointer">毛坯</span>
						<span id="rc_9_3_2" class="search_column" onclick="search('searchType','简单装修','','',this,'3_2','9')" style="cursor:pointer">简单装修</span>
						<span id="rc_9_3_3" class="search_column" onclick="search('searchType','中档装修','','',this,'3_3','9')" style="cursor:pointer">中档装修</span>
						<span id="rc_9_3_4" class="search_column" onclick="search('searchType','精装修','','',this,'3_4','9')" style="cursor:pointer">精装修</span>
					</td>
				</tr>
				<tr>
					<td class="search_column_span line" valign="top"><span>房&nbsp;&nbsp;&nbsp;&nbsp;型：</span></td>
					<td valign="top" class="line">
						<span style="cursor:pointer" id="rc_9_4_0" class="search_column search_column_selected" onclick="">不限</span>
						<span id="rc_9_4_1" class="search_column" onclick="search('searchType','一居','','',this,'4_1','9')" style="cursor:pointer">一居</span>
						<span id="rc_9_4_2" class="search_column" onclick="search('searchType','二居','','',this,'4_2','9')" style="cursor:pointer">二居</span>
						<span id="rc_9_4_3" class="search_column" onclick="search('searchType','三居','','',this,'4_3','9')" style="cursor:pointer">三居</span>
						<span id="rc_9_4_4" class="search_column" onclick="search('searchType','四居','','',this,'4_4','9')" style="cursor:pointer">四居</span>
						<span id="rc_9_4_5" class="search_column" onclick="search('searchType','五居','','',this,'4_5','9')" style="cursor:pointer">五居</span>
						<span id="rc_9_4_6" class="search_column" onclick="search('searchType','五居以上','','',this,'4_6','9')" style="cursor:pointer">五居以上</span>
					</td>
				</tr>
   			</table>
   		</div>
   <!-- 		<div id="ts" align="left">
   			楼盘特色：<span id="lpts"><a href="#">不限</a><a href="#">特色别墅</a><a href="#">养老居所</a><a href="#">高档小区</a><a href="#">景观居所</a><a href="#">宜居生态</a><a href="#">花园洋房</a><a href="#">投资地产</a><a href="#">创意地产</a><a href="#">水景地产</a></span>
   		</div>
    -->
   		<div id="resultPanel" class="layoutTab">
   			<div class="list_re">
   				<s:iterator value="pu.list">
   				<table border="0" width="100%" style="margin-top: 10px;border-bottom: 1px dotted #CACACA;">
   					<tr>
   						<td width="155px" align="center">
   							<div class="list_img_div" align="center">
   								<div class="img_div">
   									<img src="<s:property value="compressUrl"/>">
   								</div>
   								<s:if test='category=="1"'>纯写字楼</s:if>
   								<s:elseif test='category=="2"'>商住楼</s:elseif>
   								<s:elseif test='category=="3"'>酒店式公寓</s:elseif>
   								<s:elseif test='category=="4"'>园区办公</s:elseif>
   								<s:elseif test='category=="5"'>商务中心</s:elseif>
   								<s:else>其他</s:else>
   							</div>
   						</td>
   						<td width="350px">
   							<span class="list_title"><a href="sdf"><s:property value="name"/></a></span>
   							<span class="list_content">区域：<s:property value="disname"/></span>
   							<span class="list_content">装修：<s:property value="fitCondition"/></span>
   							<span class="list_content">地址：<s:property value="address"/></span>
   						<!-- 	<span class="list_content">特色：<script type="text/javascript">
   							if('<s:property value="features"/>'!=''){
   								var ary = '<s:property value="features"/>'.split(",");
   								for(var i = 0; i < ary.length; i++){
		   							switch(parseInt(ary[i])){
		   								case 0 :document.write('特色别墅&nbsp;&nbsp;');break;
		   								case 1 :document.write('养老居所&nbsp;&nbsp;');break;
		   								case 2 :document.write('高档小区&nbsp;&nbsp;');break;
		   								case 3 :document.write('景观居所&nbsp;&nbsp;');break;
		   								case 4 :document.write('宜居生态&nbsp;&nbsp;');break;
		   								case 5 :document.write('花园洋房&nbsp;&nbsp;');break;
		   								case 6 :document.write('投资地产&nbsp;&nbsp;');break;
		   								case 7 :document.write('创意地产&nbsp;&nbsp;');break;
		   								case 8 :document.write('水景地产&nbsp;&nbsp;');break;
		   							}
	   							}
	   						}
   							</script> </span> 
   					    -->
   							<span class="list_content">开盘日期：<s:date name="openDate" format="yyyy-MM-dd"/>&nbsp;&nbsp;入住日期：<s:date name="checkDate" format="yyyy-MM-dd"/></span>
   						</td>
   						<td>
   							<span class="list_price">起价：<s:property value='minPrice'/></span>
   							<span class="list_content"><a>参加看房团</a></span>
   							<span class="list_content"><a href="#" onclick="setState('<s:property value="id"/>')">添加关注</a></span>
   						</td>
   					</tr>
   				</table>
   				</s:iterator>
	   			<div class="pagenation">
			   		共<s:property value="pu.totalRecords"/>条记录,
			   		当前显示第<s:property value="pu.pageNo"/>页，共<s:property value="pu.totalPages"/>页,
			   		<s:if test="pu.pageNo==1">
			   			第一页
			   		</s:if>
			   		<s:else>
			   			<a href="javascript:search1('1')">第一页</a>
			   		</s:else>
			   		<s:if test="pu.pageNo==1">
			   			上一页
			   		</s:if>
			   		<s:else>
			   			<a href="javascript:search1('<s:property value="pu.pageNo-1"/>')">上一页</a>
			   		</s:else>
			   		<s:if test="pu.pageNo==pu.totalPages">
			   			下一页
			   		</s:if>
			   		<s:else>
			   			<a href="javascript:search1('<s:property value="pu.pageNo+1"/>')">下一页</a>
			   		</s:else>
			   		<s:if test="pu.pageNo==pu.totalPages">
			   			最后页
			   		</s:if>
			   		<s:else>
			   			<a href="javascript:search1('<s:property value="pu.totalPages"/>')">最后页</a>
			   		</s:else>
			   	</div>
   			</div>
   			<div class="list_ri">
   				<div id="attention">
					<div id="atHead">最受关注楼盘</div>
					<div id="atBody" align="center">
					<ul>
						<s:iterator value="#attentionBulidList" status="sta">
							<li><span><font color="#FF0000" size="3px"><s:property value="#sta.index+1"/></font>&nbsp;<a href="#"><s:property value="name"/>(<s:property value="attentionNum"/>)</a></span></li>
						</s:iterator>
					</ul>
					</div>
				</div>
   			</div>
   		</div>
   	</div>
   	</div>
  </body>
  <script type="text/javascript">
	  function setState(id){
	   		$("#pic_"+id).attr("src","<%=basePath%>dynamic/img/white.gif");
	   		$.messager.alert('提示','已成功加入关注','info',function(){
			})
			// window.location.href="<%=basePath%>proInfo/proInfo_createproInfo.shtml?operateType=2&operateToType=4&proId="+id;
			$.get("<%=basePath%>proInfo/proInfo_createproInfo.shtml?proType=1&operateToType=2&proId="+id+"&time="+(new Date().getTime().toString(36)),function(obj){
			});
	   }
   </script>
</html>
