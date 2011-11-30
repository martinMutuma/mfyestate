<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<#assign s=JspTaglibs["/WEB-INF/struts-tags.tld"] />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<link rel="stylesheet" href="resource/css/whole.css" type="text/css"></link>
<link rel="stylesheet" href="resource/css/hbody.css" type="text/css"></link>
<script type="text/javascript" src="resource/js/jquery-1.4.2.js" charset="utf-8"></script>
<script type="text/javascript" src="resource/js/whole.js"></script>
<script type="text/javascript" src="resource/js/hbody.js"></script>
</head>
<body>
	<#include "head.ftl" />
	<div class="panel" align="center" style="margin-top: 15px;">
		<div class="layout">
			<table width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td width="270px" valign="top"><!-- left start -->
						<div id="left1">
							<div id="categoryNav">
								<div id="cnHead">类别导航</div>
								<div id="cnBody" align="center">
								<ul>
									<li><span>住宅</span>
									<div class="dhlist">
										<@s.iterator value="#data.dhMap.a" var="dd" status="sta">
											<span onclick="searchByPrice('<@s.property value="dd"/>','1')">&gt;<@s.property value="dd"/></span>
										</@s.iterator>
									</div>
									</li>
									<li><span>公寓</span>
									<div>
										<@s.iterator value="#data.dhMap.b" var="dd" status="sta">
											<span onclick="searchByPrice('<@s.property value="dd"/>','2')">&gt;<@s.property value="dd"/></span>
										</@s.iterator>
									</div>
									</li>
									<li><span>海景房</span>
									<div>
										<@s.iterator value="#data.dhMap.c" var="dd" status="sta">
											<span onclick="searchByPrice('<@s.property value="dd"/>','3')">&gt;<@s.property value="dd"/></span>
										</@s.iterator>
									</div>
									</li>
									<li><span>别墅</span>
									<div>
										<@s.iterator value="#data.dhMap.d" var="dd" status="sta">
											<span onclick="searchByPrice('<@s.property value="dd"/>','4')">&gt;<@s.property value="dd"/></span>
										</@s.iterator>
									</div>
									</li>
									<li><span>酒店式公寓</span>
									<div>
										<@s.iterator value="#data.dhMap.e" var="dd" status="sta">
											<span onclick="searchByPrice('<@s.property value="dd"/>','5')">&gt;<@s.property value="dd"/></span>
										</@s.iterator>
									</div>
									</li>
									<li><span>产权式酒店</span>
									<div>
										<@s.iterator value="#data.dhMap.f" var="dd" status="sta">
											<span onclick="searchByPrice('<@s.property value="dd"/>','6')">&gt;<@s.property value="dd"/></span>
										</@s.iterator>
									</div>
									</li>
									<li><span>写字楼</span>
									<div>
										<@s.iterator value="#data.dhMap.g" var="dd" status="sta">
											<span onclick="searchByPrice('<@s.property value="dd"/>','7')">&gt;<@s.property value="dd"/></span>
										</@s.iterator>
									</div>
									</li>
									<li style="border: 0px"><span>商铺</span>
									<div>
										<@s.iterator value="#data.dhMap.h" var="dd" status="sta">
											<span onclick="searchByPrice('<@s.property value="dd"/>','8')">&gt;<@s.property value="dd"/></span>
										</@s.iterator>
									</div>
									</li>
								</ul>
								</div>
							</div>
							<div id="attention">
								<div id="atHead">最受关注楼盘</div>
								<div id="atBody" align="center">
								<ul>
									<@s.iterator value="#data.attentionBulidList" status="sta">
										<@s.if test="#sta.index == 0">
											<li id="atBody_s<@s.property value="#sta.index"/>" style="height: 75px;line-height: 75px;padding-left: 10px;">
												<table width="100%" height="75px" cellpadding="0" cellspacing="0" border="0">
													<tr>
														<td align="left"><font color="#FF0000" size="5px"><@s.property value="#sta.index+1"/></font></td>
														<td>
														<img onclick="showBulid('<@s.property value="id"/>')" src="<@s.property value="compressUrl"/>" width="70px" height="60px"/>
														</td>
														<td>
															<span class="info_span"><nobr><a class="bulidTile" href="javascript:showBulid('<@s.property value="id"/>')"><@s.property value="name"/></a></nobr></span><br/>
															<span class="info_span"><nobr>地址：<@s.property value="address"/></nobr></span><br/>
															<span class="info_span"><nobr>起价：<@s.property value="minPrice"/>元/㎡ </nobr></span><br/>
														</td>
													</tr>
												</table>
											</li>
											<li id="atBody_t<@s.property value="#sta.index"/>" class="selected_li">
												<span><font color="#FF0000" size="3px"><@s.property value="#sta.index+1"/></font>&nbsp;<a href="#"><@s.property value="name"/>(<@s.property value="attentionNum"/>)</a></span>
											</li>
										</@s.if>
										<@s.else>
											<li id="atBody_s<@s.property value="#sta.index"/>" class="selected_li" style="height: 75px;line-height: 75px;padding-left: 10px;">
												<table   width="100%" height="75px" cellpadding="0" cellspacing="0">
													<tr>
														<td align="left"><font color="#FF0000" size="5px"><@s.property value="#sta.index+1"/></font></td>
														<td>
														<img src="<@s.property value="compressUrl"/>" width="70px" height="60px"/>
														</td>
														<td>
															<span><nobr><a class="bulidTile" href="javascript:showBulid('<@s.property value="id"/>')"><@s.property value="name"/></a></nobr></span><br/>
															<span><nobr>地址：<@s.property value="address"/></nobr></span><br/>
															<span><nobr>起价：<@s.property value="minPrice"/>元/㎡ </nobr></span><br/>
														</td>
													</tr>
												</table>
											</li>
											<li id="atBody_t<@s.property value="#sta.index"/>">
												<span><font color="#FF0000" size="3px"><@s.property value="#sta.index+1"/></font>&nbsp;<a href="#"><@s.property value="name"/>(<@s.property value="attentionNum"/>)</a></span>
											</li>
										</@s.else>
									</@s.iterator>
								</ul>
								</div>
							</div>
							
							<div id="trend">
								<div id="tdHead">地产动态</div>
								<div id="tdBody" align="center">
								<ul>
									<li><span>住宅</span></li>
									<li><span>公寓</span></li>
									<li><span>海景房</span></li>
									<li><span>别墅</span></li>
									<li><span>酒店式公寓</span></li>
									<li><span>产权式酒店</span></li>
									<li><span>写字楼</span></li>
									<li style="border: 0px"><span>商铺</span></li>
								</ul>
								</div>
							</div>
							</div>
					<!-- left end -->
					</td>
					<td valign="top">
						<!-- center start -->
						<div id="centerPanel">
							<table width="100%" cellpadding="0" border="0" cellspacing="0">
								<tr>
									<td width="490px" valign="top">
									<div>
										<div class='img-swith-main'>
											<div class="img-switch">
												<ul id="IMG_UL_LIST_1" >
													<li>
														<img src="resource/images/01.bmp" />
													</li>
													<li>
														<img src="resource/images/02.bmp" />
													</li>
													<li>
														<img src="resource/images/03.bmp" />
													</li>
													<li>
														<img src="resource/images/04.bmp" />
													</li>
												</ul>
											</div>
											<div class='img-switch-index'>
												<ul id="IMG_INDEX_UL_LIST_1">
													<li id="li_index_default" style="background-color: #aaa;">
														01
													</li>
													<li>
														02
													</li>
													<li>
														03
													</li>
													<li>
														04
													</li>
												</ul>
											</div>
											<div class='img-switch-clear'>
											</div>
										</div>
									</div>
									<div id="jjr">
										<div id="jjrHead">经纪人信息</div>
										<div id="jjrBody" align="left">
											<@s.iterator value="#data.baseinfoList" status="status">
												<table class="jjrtable<@s.if test='#status.index % 2 != 0'> jjrt_split</@s.if><@s.if test='#status.index > 1'> jjrt_top</@s.if>" border="0" cellpadding="0" cellspacing="0">
													<tr>
														<td class="td_img"><img src="imageFloder/<@s.property value="headUrl"/>" /></td>
														<td class="td_info" valign="top">
														<span title="<@s.property value="realName"/>"><b><@s.property value="realName"/></b></span><br/>
														<span title="<@s.property value="company"/>"><nobr>公司名：<@s.property value="company"/></nobr></span><br/>
														<span title="<@s.property value="discode"/>">区域：<@s.property value="discode"/></span><br/>
														</td>
													</tr>
												</table>
											</@s.iterator>
										</div>
									</div>
									</td>
									<td valign="top" align="right">
										<div id="xylTrend">
											<div id="xylHead" class="title_bg">梦房园动态</div>
											<div id="xylBody">
											
											</div>
										</div>	
										<div id="tjBulid" align="right">
											<div id="tjHead" class="title_bg">最新写字楼需求</div>
											<div id="tjBody">
												<@s.iterator value="#data.officeNeedList">
													<div class="list_div">
														<a href="javascript:showNeed('<@s.property value="id"/>','1')">
															&#8226;&nbsp;<@s.property value="title"/>
														</a>
													</div>
												</@s.iterator>
											</div>
										</div>
										<div id="tjShop" align="right">
											<div class="title_bg">最新商铺需求</div>
											<div id="tjBody1">
												<@s.iterator value="#data.shopNeedList">
													<div class="list_div">
														<a href="javascript:showNeed('<@s.property value="id"/>','1')">
															&#8226;&nbsp;<@s.property value="title"/>
														</a>
													</div>
												</@s.iterator>
											</div>
										</div>		
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<div id="bulidInfo" align="right">
											<div id="biHead" class="biTitle">最新楼盘信息</div>
											<div id="biBody" align="left">
												<@s.iterator value="#data.bulidList" status="status">
												<table border="0" class="bitable<@s.if test='#status.index % 3 != 0'> bi_split</@s.if><@s.if test='#status.index > 2'> jjrt_top</@s.if>" cellpadding="0" cellspacing="0">
													<tr>
														<td class="bi_img"><img onclick="showBulid('<@s.property value="id"/>')" src="<@s.property  value="compressUrl"/>" /></td>
													</tr>
													<tr>
														<td>
														<span><nobr>[<@s.property  value="disname"/>]<a class="bulidTile" href="javascript:showBulid('<@s.property value="id"/>')"><@s.property  value="name"/></a></nobr></span>
														<hr/>
														<span><nobr>起价：<@s.property value="minPrice"/>元/㎡ </nobr></span><br/>
														<span><nobr>地址：<@s.property value="address"/></nobr></span><br/>
														<span><nobr>开盘日期：<@s.date name="openDate" format="yyyy-MM-dd"/></nobr></span><br/>
														</td>
													</tr>
												</table>
												</@s.iterator>
											</div>
										</div>
									</td>
								</tr>
							</table>
						</div>
						<!-- center end -->	
					</td>
			</tr>
			<tr>
				<td colspan="2">
					<div id="estate">
						<div class="search_title_bg" align="left">
					   		<span class="search_title_tab checked_title_tab bg3">写字楼</span>
					   		<span class="search_title_tab bg5" onclick="search_home('1','0')">写字楼出租</span>
					   		<span class="search_title_tab bg5" onclick="search_home('2','0')">写字楼出售</span>
					   	</div>
					   	<div class="search_result_pro">
					   	<@s.iterator value="#data.officeList" status="sta">
					   			<table  border="0" class="home_result_column<@s.if test='#sta.index > 1'> result_split</@s.if>" >
					   				<tr>
					   					<td align="left" width="100px" valign="top">
					   						<img onclick="show('<@s.property value="id"/>','0')" src="<@s.property value="compressUrl"/>" height="75px" alt="案源图片" width="100px">
					   						<img 
					   							<@s.if test='flag=="1"'>
					   								src="resource/images/tag_rent.gif"
					   							</@s.if>
					   							<@s.else>
					   								src="resource/images/tag_resale.gif"
					   							</@s.else>
					   						/>
					   					</td>
					   					<td align="left" width="140px" valign="middle">
			   								<a class="title_a" href="javascript:show('<@s.property value="id"/>','0')"><@s.property value="title"/></a><br/>
			   								<@s.property value="address"/>
			   							</td>
			   							<td align="left" valign="middle">
			   								<@s.property value="propertyManagement"/>元/平方米·天<br/>
			   								<@s.property value="area"/>平方米
			   							</td>
					   				</tr>
					   			</table>
					   	</@s.iterator>
					   	</div>
					   	<div class="search_title_bg search_title_bellow" align="left">
					   		<span class="search_title_tab checked_title_tab bg2">商铺</span>
					   		<span class="search_title_tab bg4" onclick="search_home('1','1')">商铺出租</span>
					   		<span class="search_title_tab bg4" onclick="search_home('2','1')">商铺出售</span>
					   	</div>
					   	<div class="search_result_pro" >
					   		 <@s.iterator value="#data.shopList">
						   			<table border="0" class="home_result_column<@s.if test='#sta.index > 1'> result_split</@s.if>">
						   				<tr>
						   					<td align="left" width="100px" valign="top">
						   						<img onclick="show('<@s.property value="id"/>','1')" src="<@s.property value="compressUrl"/>" height="75px" alt="案源图片" width="100px">
						   						<img 
						   							<@s.if test='flag=="1"'>
						   								src="resource/images/tag_rent.gif"
						   							</@s.if>
						   							<@s.else>
						   								src="resource/images/tag_resale.gif"
						   							</@s.else>
						   						/>
						   					</td>
						   					<td align="left" width="140px" valign="middle">
				   								<a class="title_a" href="javascript:show('<@s.property value="id"/>','1')"><@s.property value="title"/></a><br/>
				   								<@s.property value="address"/>
				   							</td>
				   							<td align="left" valign="middle">
				   								<@s.property value="propertyManagement"/>元/平方米·天<br/>
				   								<@s.property value="area"/>平方米
				   							</td>
						   				</tr>
						   			</table>
						   	</@s.iterator>	
					   	</div>
					</div>
				</td>
			</tr>
		</table>
		
	</div>
	<jsp:include page="copyright.jsp"/>
	<form id="" name="searchForm" action="search.shtml" method="post">
	 	<@s.hidden id="searchStatus" name="searchStatus"></@s.hidden>
	 	<@s.hidden id="searchQuery" name="searchQuery"></@s.hidden>
	 	<@s.hidden id="searchPro" name="searchPro"></@s.hidden>
	 	<@s.hidden id="selectedTab" name="selectedTab"></@s.hidden>
	 </form>
</body>
</html>