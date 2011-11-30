<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
<link rel="stylesheet" href="resource/css/whole.css" type="text/css"></link>
<link rel="stylesheet" href="resource/css/hbody.css" type="text/css"></link>
<link rel="stylesheet" href="resource/css/global.css" type="text/css"></link>
<link rel="stylesheet" href="resource/css/listShow.css" type="text/css"></link>
<link rel="stylesheet" href="resource/css/pagination2.css" type="text/css"></link>
<script type="text/javascript" src="resource/js/jquery-1.4.2.js" charset="utf-8"></script>
<script type="text/javascript" src="resource/js/whole.js"></script>
<script type="text/javascript" src="resource/js/search.js"></script>
<script type="text/javascript" src="resource/js/pagination2.js"></script>
<script type="text/javascript" src="rentHouse.js"></script>
<STYLE type="text/css">
	#searchPanel{
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
   	<div class="second_left">
   		<s:if test="#tsbList != null || #tsbList.size()>0">
   		<div class="secondBulidAdDiv">
	   		<s:iterator value="#tsbList" status="sta">
	   			<img class="secondBulidAd1" id="adBulid_img_<s:property value="#sta.index"/>_big" <s:if test="#sta.index>0">style="display:none"</s:if> src="<s:property value="sourceUrl"/>"/>
	   		</s:iterator>
	   		<div class="rentBulidAd" >
	   						<table id="imgAdT" cellspacing="0" cellpadding="10" width="710px" border="0" height="300px">
	   							<tr>
	   								<td height="95px" style="padding-left: 400px;" valign="bottom">
	   								<s:iterator value="#tsbList" status="sta">
	   								<div id="adBulid_img_<s:property value="#sta.index"/>_title" <s:if test="#sta.index>0">style="display:none"</s:if>>
	   									<s:property value="respDistrict"/>
	   								</div>
	   								</s:iterator>
	   								</td>
	   							</tr>
	   							<tr>
	   								<td height="68px" style="padding-left: 350px;" valign="bottom">
	   								<s:iterator value="#tsbList" status="sta">
	   								<div id="adBulid_img_<s:property value="#sta.index"/>_content" <s:if test="#sta.index>0">style="display:none"</s:if>>
	   									<s:property value="introduction"/>
	   								</div>
	   								</s:iterator>
	   								</td>
	   							</tr>
				   				<tr>
				   					<td valign="bottom" align="right">
					   					<s:iterator value="#tsbList" status="sta">
					   						<div class="second_ad_img " align="center" id="adBulid_img_<s:property value="#sta.index"/>">
								   			<img  src="<s:property value="compressUrl"/>"/>
								   			<a><s:property value="respDistrict"/></a>
								   			</div>
								   		</s:iterator>
				   					</td>
				   				</tr>
				   			</table>
   			</div>
   		</div>
   		</s:if>
   		<div id="searchPanel_" style="width: 710px;" align="center">
   			<table cellpadding="0" border="0" cellspacing="0" width="710px">
   				<tr>
   					<td class="search_column_span line" valign="top">
   						<span>面积：</span>
   					</td>
   					<td valign="top" class="line">
   						<span style="cursor:pointer" id="rc_11_0_0" class="search_column search_column_selected" onclick="search('0','','','',this,'0_0','10')">不限</span>
						<span id="rc_11_0_1" class="search_column" onclick="search('3','50','','consArea',this,'0_1','10')" style="cursor:pointer">50㎡以内</span>
						<span id="rc_11_0_2" class="search_column" onclick="search('7','50','70','consArea',this,'0_2','10')" style="cursor:pointer">50-70㎡</span>
						<span id="rc_11_0_3" class="search_column" onclick="search('7','70','100','consArea',this,'0_3','10')" style="cursor:pointer">70-100㎡</span>
						<span id="rc_11_0_4" class="search_column" onclick="search('7','100','130','consArea',this,'0_4','10')" style="cursor:pointer">100-130㎡</span>
						<span id="rc_11_0_5" class="search_column" onclick="search('7','130','160','consArea',this,'0_5','10')" style="cursor:pointer">130-160㎡</span>
						<span id="rc_11_0_6" class="search_column" onclick="search('7','160','200','consArea',this,'0_6','10')" style="cursor:pointer">160-200㎡</span>
						<span id="rc_11_0_7" class="search_column" onclick="search('4','200','','consArea',this,'0_7','10')" style="cursor:pointer">200㎡以上</span>
   					</td>
   				</tr>
   				<tr>
					<td class="search_column_span line" valign="top"><span>售价：</span></td>
					<td valign="top" class="line">
   						<span style="cursor:pointer" id="rc_11_1_0" class="search_column search_column_selected" onclick="search('0','','','',this,'1_0','10')">不限</span>
						<span id="rc_11_1_1" class="search_column" onclick="search('3','50','','price',this,'1_1','10')" style="cursor:pointer">50万内</span>
						<span id="rc_11_1_2" class="search_column" onclick="search('7','50','70','price',this,'1_2','10')" style="cursor:pointer">50-70万</span>
						<span id="rc_11_1_3" class="search_column" onclick="search('7','70','100','price',this,'1_3','10')" style="cursor:pointer">70-100万</span>
						<span id="rc_11_1_4" class="search_column" onclick="search('7','100','130','price',this,'1_4','10')" style="cursor:pointer">100-130万</span>
						<span id="rc_11_1_5" class="search_column" onclick="search('7','130','160','price',this,'1_5','10')" style="cursor:pointer">130-160万</span>
						<span id="rc_11_1_6" class="search_column" onclick="search('7','160','200','price',this,'_6','10')" style="cursor:pointer">160-200万</span>
						<span id="rc_11_1_7" class="search_column" onclick="search('4','200','','price',this,'1_7','10')" style="cursor:pointer">200万以上</span>
   					</td>
				</tr>
				<tr>
					<td class="search_column_span line" valign="top"><span>房型：</span></td>
					<td valign="top" class="line">
						<span style="cursor:pointer" id="rc_11_2_0" class="search_column search_column_selected" onclick="search('0','','','',this,'2_0','10')">不限</span>
						<span id="rc_11_2_1" class="search_column" onclick="search('8','1','','home',this,'2_1','10')" style="cursor:pointer">1居</span>
						<span id="rc_11_2_2" class="search_column" onclick="search('8','2','','home',this,'2_2','10')" style="cursor:pointer">2居</span>
						<span id="rc_11_2_3" class="search_column" onclick="search('8','3','','home',this,'2_3','10')" style="cursor:pointer">3居</span>
						<span id="rc_11_2_4" class="search_column" onclick="search('8','4','','home',this,'2_4','10')" style="cursor:pointer">4居</span>
						<span id="rc_11_2_5" class="search_column" onclick="search('8','5','','home',this,'2_5','10')" style="cursor:pointer">5居</span>
						<span id="rc_11_2_6" class="search_column" onclick="search('8','6','','home',this,'2_6','10')" style="cursor:pointer">5居以上</span>
					</td>
				</tr>
				<tr id="unitPriceQuery" style="display: none">
					<td class="search_column_span line" valign="top"><span>单价：</span></td>
					<td valign="top" class="line">
   						<span style="cursor:pointer" id="rc_11_3_0" class="search_column search_column_selected" onclick="search('0','','','',this,'3_0','10')">不限</span>
						<span id="rc_11_3_1" class="search_column" onclick="search('3','2000','','unitPrice',this,'1_1','10')" style="cursor:pointer">2000元/㎡以内</span>
						<span id="rc_11_3_2" class="search_column" onclick="search('7','2000','4000','unitPrice',this,'1_2','10')" style="cursor:pointer">2000-4000元/㎡</span>
						<span id="rc_11_3_3" class="search_column" onclick="search('7','4000','6000','unitPrice',this,'1_3','10')" style="cursor:pointer">4000-6000元/㎡</span>
						<span id="rc_11_3_4" class="search_column" onclick="search('7','6000','8000','unitPrice',this,'1_4','10')" style="cursor:pointer">6000-8000元/㎡</span><br/>
						<span id="rc_11_3_5" class="search_column" onclick="search('7','8000','10000','unitPrice',this,'1_5','10')" style="cursor:pointer">8000-10000元/㎡</span>
						<span id="rc_11_3_6" class="search_column" onclick="search('7','10000','14000','unitPrice',this,'_6','10')" style="cursor:pointer">10000-14000元/㎡</span>
						<span id="rc_11_3_7" class="search_column" onclick="search('7','14000','20000','unitPrice',this,'1_7','10')" style="cursor:pointer">14000-20000元/㎡</span>
						<span id="rc_11_3_8" class="search_column" onclick="search('7','20000','30000','unitPrice',this,'1_8','10')" style="cursor:pointer">20000-30000元/㎡</span>
						<span id="rc_11_3_9" class="search_column" onclick="search('4','30000','','unitPrice',this,'1_9','10')" style="cursor:pointer">30000元/㎡以上</span>
   					</td>
				</tr>
				<tr id="fitQuery" style="display: none">
					<td class="search_column_span line" valign="top"><span>装修状况：</span></td>
					<td valign="top" class="line">
						<span style="cursor:pointer" id="rc_11_4_0" class="search_column search_column_selected" onclick="search('0','','','',this,'4_0','10')">不限</span>
						<span id="rc_11_4_1" class="search_column" onclick="search('8','0','','fitCondition',this,'4_1','10')" style="cursor:pointer">空值</span>
						<span id="rc_11_4_2" class="search_column" onclick="search('8','1','','fitCondition',this,'4_2','10')" style="cursor:pointer">毛坯</span>
						<span id="rc_11_4_3" class="search_column" onclick="search('8','2','','fitCondition',this,'4_3','10')" style="cursor:pointer">清水</span>
						<span id="rc_11_4_4" class="search_column" onclick="search('8','3','','fitCondition',this,'4_4','10')" style="cursor:pointer">简装</span>
						<span id="rc_11_4_5" class="search_column" onclick="search('8','4','','fitCondition',this,'4_5','10')" style="cursor:pointer">中装</span>
						<span id="rc_11_4_6" class="search_column" onclick="search('8','5','','fitCondition',this,'4_6','10')" style="cursor:pointer">精装</span>
						<span id="rc_11_4_7" class="search_column" onclick="search('8','6','','fitCondition',this,'4_7','10')" style="cursor:pointer">豪装</span>
					</td>
				</tr>
				<tr id="useTypeQuery" style="display: none">
					<td class="search_column_span line" valign="top"><span>用途：</span></td>
					<td valign="top" class="line">
						<span style="cursor:pointer" id="rc_11_5_0" class="search_column search_column_selected" onclick="search('0','','','',this,'5_0','10')">不限</span>
						<span id="rc_11_5_1" class="search_column" onclick="search('8','1','','useType',this,'5_1','10')" style="cursor:pointer">住宅</span>
						<span id="rc_11_5_2" class="search_column" onclick="search('8','2','','useType',this,'5_2','10')" style="cursor:pointer">商住</span>
						<span id="rc_11_5_3" class="search_column" onclick="search('8','3','','useType',this,'5_3','10')" style="cursor:pointer">商铺</span>
						<span id="rc_11_5_4" class="search_column" onclick="search('8','4','','useType',this,'5_4','10')" style="cursor:pointer">别墅</span>
						<span id="rc_11_5_5" class="search_column" onclick="search('8','5','','useType',this,'5_5','10')" style="cursor:pointer">写字楼</span>
						<span id="rc_11_5_6" class="search_column" onclick="search('8','6','','useType',this,'5_6','10')" style="cursor:pointer">厂房</span>
						<span id="rc_11_5_7" class="search_column" onclick="search('8','7','','useType',this,'5_7','10')" style="cursor:pointer">仓库</span>
						<span id="rc_11_5_8" class="search_column" onclick="search('8','8','','useType',this,'5_8','10')" style="cursor:pointer">地皮</span>
						<span id="rc_11_5_9" class="search_column" onclick="search('8','9','','useType',this,'5_9','10')" style="cursor:pointer">车位</span>
						<span id="rc_11_5_10" class="search_column" onclick="search('8','0','','useType',this,'5_10','10')" style="cursor:pointer">其他</span>
					</td>
				</tr>
   			</table>
   		</div>
   		<div class="querySx" align="center"><span id="showMoreQuery">显示更多查询条件</span></div>
   		<div id="resultPanel">
   			<div class="list_re" id="bulidListDiv">
   				<s:iterator value="pu.list" status="sta">
   				<table border="0" width="100%" style="<s:if test="%{#sta.index>0}">margin-top: 10px;</s:if>border-bottom: 1px dotted #CACACA;">
   					<tr>
   						<td width="20%" align="center">
   							<div class="list_img_div" align="center">
   								<div class="img_div">
   									<img onclick="showSBuliding('<s:property value="id"/>')" src="<s:property value="compressUrl"/>">
   									<div style="margin-top: 4px"><s:property value="fitConditionValue"/></div>
   								</div>
   							</div>
   						</td>
   						<td width="50%">
   							<table width="100%" height="100%" cellpadding="0" border="0" cellspacing="5px">
   								<tr class="font2">
   									<td colspan="2"><a href="secondBd/showBuliding.shtml?tpsId=<s:property value="id"/>&menuIndex=4" target="_blank"><s:property value="title"/></a></td>
   								</tr>
   								<tr>
   									<td width="60%">小区：<s:property value="respDistrict"/></td><td>用途：<s:property value="useTypeValue"/></td>
   								</tr>
   								<tr>
   									<td>户型：<s:property value="homeValue"/></td><td>面积：<s:property value="consArea"/></td>
   								</tr>
   								<tr>
   									<td colspan="2">地址：<s:property value="address"/></td>
   								</tr>
   								<tr>
   									<td colspan="2">发布时间：<s:date name="createDate" format="yyyy-MM-dd kk:mm"/></td>
   								</tr>
   							</table>
   						</td>
   						<td>
   							<span class="list_price"><s:property value='price'/>万</span>
   							<span class="list_content"><s:property value='price/consArea'/>万/㎡</span>
   						</td>
   					</tr>
   				</table>
   				</s:iterator>
	   			<div id="pagenation">
	   				<input type="hidden" id="totalRecords" value="<s:property value="pu.totalRecords"/>"/>
	   				<input type="hidden" id="pageNo" value="<s:property value="pu.pageNo"/>"/>
	   				<input type="hidden" id="limit" value="20"/>
	   				<input type="hidden" id="uri" value=""/>
	   				<input type="hidden" id="keyword" value="<s:property value="#keyword"/>"/>
	   				<input type="hidden" id="proIndex" value="<s:property value="#proIndex"/>"/>
			<!--    		共<s:property value="pu.totalRecords"/>条记录,
			   		当前显示第<s:property value="pu.pageNo"/>页，共<s:property value="pu.totalPages"/>页,
			   		<s:if test="pu.pageNo==1">
			   			第一页
			   		</s:if>
			   		<s:else>
			   			<a href="javascript:keyWord('<s:property value="#keyword"/>','<s:property value="#proIndex"/>','1')">第一页</a>
			   		</s:else>
			   		<s:if test="pu.pageNo==1">
			   			上一页
			   		</s:if>
			   		<s:else>
			   			<a href="javascript:keyWord('<s:property value="#keyword"/>','<s:property value="#proIndex"/>','<s:property value="pu.pageNo-1"/>')">上一页</a>
			   		</s:else>
			   		<s:if test="pu.pageNo==pu.totalPages">
			   			下一页
			   		</s:if>
			   		<s:else>
			   			<a href="javascript:keyWord('<s:property value="#keyword"/>','<s:property value="#proIndex"/>','<s:property value="pu.pageNo+1"/>')">下一页</a>
			   		</s:else>
			   		<s:if test="pu.pageNo==pu.totalPages">
			   			最后页
			   		</s:if>
			   		<s:else>
			   			<a href="javascript:keyWord('<s:property value="#keyword"/>','<s:property value="#proIndex"/>','<s:property value="pu.totalPages"/>')">最后页</a>
			   		</s:else> -->
			   	</div>
   			</div>
   		</div>
   		</div>
   		<div class="second_right">
   				 	<div class="small_div w250" >
								<div class="title_news"><font class="headtitle">&nbsp;&nbsp;出租房</font></div>
								<div class="atBody "  >
									<ul style="width:210px;  padding-left:6px;">
									        <li style=" border-bottom: 0px;width:210px;">
												<span style="width:90px;"><font class="fonthead">小区</font></span>
											    <span style="width:45px;text-align:center;"><font class="fonthead">区域</font></span>
											    <span style="width:50px;text-align:center;"><font class="fonthead">元/月</font></span>
											</li>
											<s:iterator value="#data.recommendSbList">
													<li style=" border-bottom: 0px;width:210px;">
														<span style="width:90px;text-align:left"><a href="javascript:tosecondBd('<s:property value="id"/>','3')" title="<s:property value='respDistrict'/>"><s:property value="respDistrict"/></a></span>
													    <span style="width:45px;text-align:center"><s:property value="disname"/></span>
													    <span style="width:50px;text-align:center" class="prominentfont"><s:property value="price"/></span>
													</li>
											</s:iterator>
								     </ul>
								</div>
						</div>
   				<div class="small_div h500" >
											<div class="title_news "><font class="headtitle">&nbsp;&nbsp;经纪人信息</font></div>
											<div class="h480">
											<div id="marquee" style="margin-top: 10px; overflow: hidden; margin: -2px 0 4px 0;
									            padding: 0; height: 100%; width: 100%; border: 0px; padding: 0px;" align="left">
									            <div style="border: 0px; padding: 0px">
									                <!-- Marquee Body Head -->
									              	<s:iterator value="#data.baseinfoList" status="status">
									                <div style="height: 1162x; margin:11px 3px 3px 3px; border: 1px dotted #c0c0c0; overflow: hidden;">
									                   <table>
									                      <tr>
									                        <td width="80px" height="105px">
									                        <img style="width:80px;height:105px;border:0px;cursor: pointer;" title="点击进入该经纪人商铺" onclick="toMyStore('<s:property value="id"/>')"  src="imageFloder/<s:property value="headUrl"/>" alt="点击进入该经纪人商铺" />
									                        </td>
									                        <td class="news_title" valign="top">
									                        <br/>
															 <a href="javascript:toMyStore('<s:property value="id"/>')" ><span title="点击进入<s:property value="realName"/>的商铺"><font class="fontcolor3"><b><s:property value="realName"/></b><font></span><br/></a>
															<span title="<s:property value="company"/>"><font class="fontcolor3">公司名：<s:property value="company"/></font></span><br/>
															<span title="<s:property value="disname"/>"><font class="fontcolor3">区域：<s:property value="disname"/></font></span><br/>
															</td>
									                      </tr>
									                   </table>
									                </div>
									               </s:iterator>
									               <s:if test="#data.baseinfoList.size==0">
									                  <input type="hidden" id="listnull" value="0">
									               </s:if>
									               <s:else>
									                  <input type="hidden" id="listnull" value="1">
									               </s:else>
									                <!-- Marquee Body Bottom -->
									          </div>
									      </div>
									</div>
					      </div>
   		</div>
   	</div>
   		<jsp:include page="copyright.jsp"/>
   	</div>
   
  </body>
</html>
